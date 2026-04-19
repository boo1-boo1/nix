{
  homebrew = {
    enable = true;
    brews = [
      "mas"
    ];

    casks = [
      "kitty"
      "visual-studio-code"
      "obsidian"
      "zen"
      "steam"
      "epic-games"
      "the-unarchiver"
      "qbittorrent"
      "vmware-fusion"
      "protonvpn"
      "whatsapp"
      "vlc"
      "jellyfin"
      "jellyfin-media-player"
      "spotify"
      "session"
      "docker-desktop"
      "a-bar"
    ];

    masApps = {
      # "Xcode" = 497799835;
      "Amphetamine" = 937984704;
    };

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };
}
