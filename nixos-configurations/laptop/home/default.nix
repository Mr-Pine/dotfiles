{ config, pkgs, lib, ... }:
{
  imports = [
    ./i3.nix
    ./i3status-rs.nix
  ];

  config.home.packages = with pkgs; [
    cacert
    font-awesome
    xournalpp
  ];
}
