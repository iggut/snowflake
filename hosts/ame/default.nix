{...}: {
  imports = [
    ./hardware-configuration.nix
    ./services
    ../../modules
    ../../modules/fonts.nix
  ];

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 8;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  programs.river = {
    enable = true;
  };

  networking.hostName = "ame";
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
