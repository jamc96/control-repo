# webserver class
class profile::webserver(
  $primary_vg      = $::volumegroup['primary'],
  $physical_disk   = $::voluemgrop['disk'],
  $create_web_vol  = true,
  $create_opt_vol  = true,
  $logical_volumes = undef,
) {
  include ::base
  if $logical_volumes {
    $lvm_list = $logical_volumes
  } else {
    if $create_web_vol{
      $webvol_hash = {
        'webvol' => { 
          'size'              => '1G',
          'mountpath'         => '/webroot',
          'mountpath_require' => true,
        }
      }
    }
    if $create_opt_vol {
      $optvol_hash  = {
        'colfusionvol' => { 
        'size'              => '1G',
        'mountpath'         => '/opt/coldfusion10',
        'mountpath_require' => true,
        'fs_type'           => 'ext4',
        }
      }
    }
    $lvm_list = $webvol_hash + $optvol_hash
  }
  lvm::volume_group { $primary_vg:
    createonly => true,
    physical_volumes => $physical_disk,
  }

}
