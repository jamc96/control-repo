# webserver class
class profile::webserver(
  $primary_vg      = $::volumegroup['primary'],
  $physical_disk   = $::voluemgrop['disk'],
  $create_web_vol  = true,
  $create_opt_vol  = true,
  $logical_volumes = undef,
) {
  include ::base
  lvm::volume_group { $primary_vg:
    createonly => true,
    physical_volumes => $physical_disk,
    logi
  }
}
