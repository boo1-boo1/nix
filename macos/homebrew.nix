{
  homebrew = {
    enable = true;
    brews = [
      "mas"
    ];

    casks = [
      "ghostty"
      "zed"
      "obsidian"
      "zen"
      "google-chrome"
      "steam"
      "epic-games"
      "the-unarchiver"
      "qbittorrent"
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
      "Amphetamine" = 937984704;
    };

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };
}
