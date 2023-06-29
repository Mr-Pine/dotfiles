{ inputs, config, pkgs, lib, ... }:
{
  config = {
    boot.tmp.cleanOnBoot = true;

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      sharedModules = [
        ./home/default.nix
      ];
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    networking.hosts = {
      "127.0.0.1" = ["www.youtube.com"];
    };

    nixpkgs = {
      config.allowUnfree = true;
      overlays = [
      ];
    };

    fonts.fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];

    environment = {
      pathsToLink = [ "/share/zsh" ];
      variables ={
        EDITOR = "nvim";
        MYTEST = config.age.secrets.test.path;
      };
      systemPackages = with pkgs; [
        git
        tailscale
      ];
    };

    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
      };
    };

    console.keyMap = "bone";

    users = {
      defaultUserShell = pkgs.zsh;

      users.tornax = {
        isNormalUser = true;
        description = "tornax";
        extraGroups = [ "wheel" "audio" "lp" "video" "netdev"
        "networkmanager"];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC7Xq+9744TurpKZrBz7WpriCne5mcbfYxb4vwwRjVrV openpgp:0x654A6D6C"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILQpLDXEFoPLUzT6a1cEh4j9OEyOpkcVQJ7jVAsQywvz Generated By Termius"
        ];
      };
    };

    security.sudo.extraConfig = "Defaults insults";

    services = {
      openssh.enable = true;
      tailscale.enable = true;
      pcscd.enable = true;
    };

    programs = import ./programs.nix { inherit lib; };

    system.stateVersion = "22.11";
  };
}
