{ config, lib, pkgs, ... }: {
  services.supergfxd.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = true;
    };
    nvidiaSettings = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  hardware.nvidia.prime = {
	offload = {
		enable = true;
		enableOffloadCmd = true;
	};

	amdgpuBusId = "PCI:5:0:0";
	nvidiaBusId = "PCI:1:0:0";
  };

  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ];
  hardware.graphics.enable = true;
}
