{ pkgs, ... }:
{
  home.packages = with pkgs; [
    atool
    ast-grep
    bandwhich
    borgbackup
    gptfdisk
    iamb
    du-dust
    fd
    ffmpeg_6-full
    file
    fira-code
    fira-code-symbols
    gcc13
    highlight
    imagemagick
    irssi
    liberation_ttf
    nodejs_20
    openvpn
    pinentry
    pkg-config-unwrapped
    powertop
    python312
    ripgrep
    ripgrep-all
    rsync
    rustup
    speedtest-cli
    tokei
    udisks
    unzip
    vifm-full
    wiki-tui
  ];
}
