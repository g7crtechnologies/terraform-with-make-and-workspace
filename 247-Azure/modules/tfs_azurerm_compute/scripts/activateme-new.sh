#!/bin/bash
#
# bootstrap script for Azure compute resources
#
# Debug
# sudo DEBUG=true bash -x /root/activateme.sh
#
# name of this script
AV0="activateme"
 
# U_OSFAMILY=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/instance?api-version=2021-02-01 | python -c 'import sys, json; m=json.loads(sys.stdin.read()); print(m["compute"]["offer"]);')
# L_OSFAMILY=$(echo "${U_OSFAMILY,,}")
# LONG_OSVERSION=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/instance?api-version=2021-02-01 | python -c 'import sys, json; m=json.loads(sys.stdin.read()); print(m["compute"]["version"]);')
# SHORT_OSVERSION=$(echo "$LONG_OSVERSION" | awk '{print substr($0,1,1)}')
# FAMILY=$L_OSFAMILY-$SHORT_OSVERSION
 
# if true, reboot when we're done.
NEED_REBOOT=false
#NEED_REBOOT=true
 
# URL to Azure metadata server
BASE_URL=http://169.254.169.254/metadata/instance/compute?api-version=2021-02-01
##METADATA_URL="$BASE_URL/?api-version=2021-02-01"
 
##ATTRIBUTE_URL=$BASE_URL/instance/guest-attributes
 
IMAGE_URL=$BASE_URL/instance/image
#SAS='?sv=2021-06-08&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=3023-07-03T15:47:59Z&st=2023-03-07T07:47:59Z&spr=https&sig=mWnA7%2Bgo%2BZKWJ4tQ9VVMC%2FfTARGU0cEkRsPkWnKTftE%3D'
IMAGE_PATH=https://tfsstgdevactivitylogs.blob.core.windows.net/activateme
##IMAGE=$(basename "$IMAGE_PATH")
IMAGE=common    #static as of now
FAMILY=centos-7 #static as of now
 
# guest attribute marking first boot finished
####FIRST_BOOT_KEY=activateme/is-first-boot  #managed by cloudinit not req
 
DEBUG=${DEBUG:=false}
#DEBUG=${DEBUG:=true}
 
msg()
{
    echo "$AV0: $*" 1>&2
}
 
dbg()
{
    $DEBUG && msg "DEBUG: $*"
}
 
# output an error message, wait 60 seconds and then reboot.
die()
{
    msg "FATAL: $*"
    # $DEBUG || sleep 60
    # reboot_host
    exit 1
}
 
reboot_host()
{
    if ! $DEBUG; then
        msg "rebooting..."
        reboot
        sleep 10000
    fi
    dbg "we would be rebooting here."
    exit 1
}
# fix yum.conf proxy entry
fixup_yum_proxy()
{
echo -e "proxy=http://10.89.26.7:3128\nproxy_username=squiduser\nproxy_password=P@Us.er721" >> /etc/yum.conf
}
##### this function is only used to get the directory path by calling activateme.sh script ie., gs://tfs-bootstrap-us/bootstrap/scripts
##get_startup_script_url()
##{
##    # No JQ? Use Python!
##    # TODO: check all attribute types, not just project
##    curl -S -s -H "Metadata-Flavor: Google" $METADATA_URL | \
##        python -c 'import sys, json; m=json.loads(sys.stdin.read()); print(m["project"]["attributes"]["startup-script-url"]);'
##}
rebuild_yum_metadata()
{
    # Why do we have to do this!?!
    msg "Clean yum metadata settings"
    yum clean all
    msg "Remove yum cache files"
    rm -rf /var/cache/yum/*
    msg "Rebuild yum cache"
    yum makecache
}
 
# load metadata.  installs 'jq' if it's not already installed, and then
# merges project, instance and .guestAttributes
init_metadata()
{
    dbg "Init metadata"
    if ! type jq > /dev/null 2>&1; then
        msg "jq not installed."
        yum install -y jq || die "Failed to install JQ!"
    fi
 
    # now fetch metadata from azure user data (here merging of instance and project attributes are not required as the merge is been taken care directly by userdata)
    METADATA=$(curl -H Metadata:true $BASE_URL | jq -r '.userData | @base64d | fromjson .attributes')
    [[ $? != 0 || $METADATA == "" ]] && die "Failed to load metadata"
    dbg "metadata:"
    dbg "---------"
    dbg $(echo "$METADATA" | jq .)
    dbg "---------"
}
get_and_extract()
{
    local SRCURI=$1
    local DSTDIR=$2
    local FILE=$3
    #local BLOB_SAS="${FILE}${SAS}"
    msg "Downloading $SRCURI/$FILE"
    #gsutil cp $SRCURI/$FILE $DSTDIR/$FILE
    wget "$SRCURI/$BLOB_URL" -O $DSTDIR/$FILE
    if [ $? != 0 ]; then
        msg "Failed to download $SRCURI/$FILE -- that's okay!"
        return 0
    fi
    msg "Downloaded $SRCURI/$FILE: $(ls -l $DSTDIR/$FILE)"
    if [ -f $DSTDIR/$FILE ]; then
        msg "Extract $DSTDIR/$FILE"
        tar -C / -xzvf $DSTDIR/$FILE || die "Failed to extract $FILE"
    fi
}
 
remove_external_repos()
{
    for f in /etc/yum.repos.d/*.repo; do
      is_tfs_repo=$(egrep -ci 'baseurl.*nexus.infra.cloud.247-inc.net' $f)
      if [ $is_tfs_repo -eq 0 ]; then
        rm -rf $f;
      fi
    done
}
 
setup_bootstrap_files()
{
    # clear yum repos
    remove_external_repos
    # the gs:// URL where the startup script (This!) lives.
    #local STARTUP_SCRIPT=$(get_startup_script_url)
    # base 'directory' of startup script (so we can look for other files)
    local STARTUP_DIR=$IMAGE_PATH
    # try to get extra files for image
    local TMPDIR=/tmp/bootstrap-files
    mkdir -p $TMPDIR
    get_and_extract $STARTUP_DIR $TMPDIR bootstrap-$FAMILY.tgz
    get_and_extract $STARTUP_DIR $TMPDIR bootstrap-$IMAGE.tgz
    rm -rf /tmp/bootstrap-files
    # add Nexus SSL certificate to CA bundle
    update-ca-trust extract
}
 
first_boot()
{
    yum install -y deltarpm || msg "WARNING: Failed to install deltarpm (Continuing)"
    yum update -y || die "Failed to yum update"
    remove_external_repos
    #install_cloud_init
}
main()
{
    if ! type yum > /dev/null 2>&1; then
        msg "Can't find yum. not centos?"
        msg "uname: $(uname -a)"
        NEED_REBOOT=false
        return
    else
 
    # if we've never been here before, do some initial stuff.
        msg "This is first boot."
        fixup_yum_proxy
        setup_bootstrap_files || msg "WARNING: Failed to install bootstrap files"
        rebuild_yum_metadata
        init_metadata
        first_boot
 
    fi
}
msg "Startup (DEBUG=$DEBUG, IMAGE=${IMAGE}, FAMILY=${FAMILY})"
 
if [[ "$IMAGE" == tfs-* ]]; then
    msg "Image already customized, startup script exiting."
    exit 0
fi
 
main
msg "Done. (NEED_REBOOT=$NEED_REBOOT)"
$NEED_REBOOT && reboot_host