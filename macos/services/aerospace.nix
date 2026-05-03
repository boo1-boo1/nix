{
  services.aerospace = {
    enable = true;
    settings = {
      config-version = 2;
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      accordion-padding = 30;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";
      automatically-unhide-macos-hidden-apps = true;
      persistent-workspaces = [
        "1"
        "2"
        "3"
        "4"
      ];

      key-mapping.preset = "dvorak";

      gaps = {
        outer = {
          left = 12;
          bottom = 12;
          top = 12;
          right = 12;
        };
        inner = {
          horizontal = 12;
          vertical = 12;
        };
      };

      mode.main.binding = {
        alt-enter = "exec-and-forget open -b com.mitchellh.ghostty";
        alt-shift-enter = "exec-and-forget open -b app.zen-browser.zen";

        alt-f = "fullscreen";

        alt-tab = "workspace-back-and-forth";

        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
      };

      on-window-detected = [
        {
          "if".app-id = "com.mitchellh.ghostty";
          run = [
            "move-node-to-workspace 1"
            "workspace 1"
          ];
        }
        {
          "if".app-id = "app.zen-browser.zen";
          run = [
            "move-node-to-workspace 2"
            "workspace 2"
          ];
        }
      ];
    };
  };
}
