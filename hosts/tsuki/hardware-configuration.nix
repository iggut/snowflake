{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7d098aab-1968-4605-a9a7-b1627941c1ff";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/C356-B67C";
    fsType = "vfat";
  };

  fileSystems."/hdd" = {
    device = "/dev/disk/by-uuid/e2e4c4f3-51df-4020-b557-a7cf684de85b";
    fsType = "ext4";
  };

  fileSystems."/ssd" = {
    device = "/dev/disk/by-uuid/9e5a189d-7435-45d7-aef6-cdee4de2428d";
    fsType = "ext4";
  };

  fileSystems."/nas" = {
    device = "192.168.1.71:/volume1/tsuki";
    fsType = "nfs";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/2f5e2c64-99b8-4fa0-943c-c9dd45c84fdc";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
