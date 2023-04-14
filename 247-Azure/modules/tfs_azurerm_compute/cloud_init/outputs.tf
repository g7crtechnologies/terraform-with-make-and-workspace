output "config" {
  // value = data.template_cloudinit_config.config.* 
  value = data.template_cloudinit_config.config.rendered
}
