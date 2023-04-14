location = "westus"
prefix   = "tfs-ilb"
Lbs = {
  hub = {
    id        = "1" #Id of the load balancer use as a suffix of the load balancer name
    env       = "hub"
    pci       = "c2c"
    lb_name   = "tfs-ilb-test-eu-speech"
    vnet_name = "tfs-vnet-dev-cde-eu-speech"
  }
}
LbRules = {
  lbrules1 = {
    env               = "hub"
    pci               = "c2c"
    Id                = "1"   #Id of a the rule within the Load Balancer
    lb_key            = "lb1" #Key of the Load Balancer
    suffix_name       = "apa" #It must equals the Lbs suffix_name
    lb_port           = "80"
    probe_port        = "80"
    backend_port      = "80"
    probe_protocol    = "Http"
    request_path      = "/"
    load_distribution = "SourceIPProtocol"
    skey              = "hub"
  }
  lbrules2 = {
    env               = "hub"
    pci               = "c2c"
    Id                = "2"   #Id of a the rule within the Load Balancer
    lb_key            = "lb2" #Key of the Load Balancer
    suffix_name       = "iis" #It must equals the Lbs suffix_name
    lb_port           = "80"
    probe_port        = "80"
    backend_port      = "80"
    probe_protocol    = "Http"
    request_path      = "/"
    load_distribution = "SourceIPProtocol"
    skey              = "hub"
  }
}
