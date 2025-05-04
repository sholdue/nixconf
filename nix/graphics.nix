{ config, lib, pkgs, ... }: {

  hardware.graphics = {
    enable = true;
  };

  services.supergfxd.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = true;
    };
    nvidiaSettings = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  specialisation = { 
   nvidia.configuration = { 
     # Nvidia Configuration 
     services.xserver.videoDrivers = [ "amdgpu" "nvidia" ]; 
     hardware.graphics.enable = true; 
  
     # Optionally, you may need to select the appropriate driver version for your specific GPU. 
     hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable; 
  
     # nvidia-drm.modeset=1 is required for some wayland compositors, e.g. sway 
     hardware.nvidia.modesetting.enable = true; 
     
     hardware.nvidia.prime = {
       offload = {
		enable = true;
		enableOffloadCmd = true;
       }; 
       # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA 
       nvidiaBusId = "PCI:1:0:0"; 
  
       # Bus ID of the AMD GPU. You can find it using lspci, either under 3D or VGA 
       amdgpuBusId = "PCI:5:0:0"; 
     };
  };
};
}
