{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # ripgrep-all
    ast-grep
    bandwhich
    difftastic
    du-dust
    fd
    ffmpeg_6-full
    file
    fira-code
    fira-code-symbols
    gcc13
    gptfdisk
    highlight
    termusic
    iamb
    imagemagick
    irssi
    liberation_ttf
    magic-wormhole-rs
    mdcat
    nix-index
    nodejs_20
    openvpn
    ouch
    pinentry
    pkg-config-unwrapped
    powertop
    python312
    ripgrep
    rsync
    sd
    rustic-rs
    speedtest-cli
    tokei
    udisks
    yt-dlp
    wormhole-rs
    vifm-full
    wiki-tui
  ];
}
