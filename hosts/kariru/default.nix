{...}: {
  imports = [
    ./hardware-configuration.nix
    ./services
    ../../modules
  ];

  boot.loader = {
    grub = {
      enable = true;
      configurationLimit = 5;
      device = "/dev/sda";
      useOSProber = false;
    };
  };

  networking = {
    hostName = "kariru";
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  users.users.notoh.openssh.authorizedKeys.keys = [
    ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPmWafzbhah18nm2z1epc6139XVlcKT0ndAI0wbLj+/6 kariru''
  ];
}
