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

    prime = {
      offload.enable = true;
    };
  };

  hardware.nvidia.prime = {
    amdgpuBusId = "PCI:5:0:0";  # пример
    nvidiaBusId = "PCI:1:0:0";  # пример
  };
  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ];
  hardware.graphics.enable = true;
}
