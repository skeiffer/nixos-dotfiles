{ ... }:
{
  programs.niri.settings = {
    layer-rules = [
      {
        matches = [
          {
            namespace = "^noctalia-backdrop";
          }
        ];
        place-within-backdrop = true;
      }
    ];
    window-rules = [
      {
        matches = [
          {
            app-id = "dev.noctalia.Noctalia";
          }
        ];
        open-floating = true;
        default-column-width = { fixed = 1080; };
        default-window-height = { fixed = 880; };
      }
      {
        geometry-corner-radius = {
          top-left = 20.0;
          top-right = 20.0;
          bottom-left = 20.0;
          bottom-right = 20.0;
        };
        clip-to-geometry = true;
      }
    ];
    debug = {
      honor-xdg-activation-with-invalid-serial = true;
    };
  };
}