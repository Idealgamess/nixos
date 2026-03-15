{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "eDP-1, 1920x1200@60.00, 0x0, 1"
      ];

      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$browser" = "firefox";
      "$discord" = "discord";
      "$menu" = "wofi -n";
      "$mainMod" = "SUPER";

      exec-once = [
        "waybar"
        "swww-daemon"
        "sleep .5 && swww restore"
        "swaync"
        "pypr"
        "swaync-client -df"
        "pactl set-sink-mute @DEFAULT_SINK@ 0"
      ];

      env = [
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,12"
      ];

      general = {
        gaps_in = 2;
        gaps_out = 10;
        border_size = 0;
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 0.78;
        inactive_opacity = 0.7;
        fullscreen_opacity = 1;
        blur = {
          enabled = true;
          size = 3;
          passes = 5;
          new_optimizations = true;
          ignore_opacity = true;
          xray = false;
          popups = true;
        };
        shadow = {
          enabled = true;
          range = 15;
          render_power = 5;
          color = "rgba(0,0,0,.5)";
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "fluid, 0.15, 0.85, 0.25, 1"
          "snappy, 0.3, 1, 0.4, 1"
        ];
        animation = [
          "windows, 1, 3, fluid, popin 5%"
          "windowsOut, 1, 2.5, snappy"
          "fade, 1, 4, snappy"
          "workspaces, 1, 1.7, snappy, slide"
          "specialWorkspace, 1, 4, fluid, slidefadevert -35%"
          "layers, 1, 2, snappy, popin 70%"
        ];
      };

      dwindle = {
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
        focus_on_activate = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = 0;
      };

      layerrule = [
        "noanim, selection"
      ];

      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, W, killactive"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, B, exec, $browser"
        "$mainMod, D, exec, $discord"
        "$mainMod, V, togglefloating"
        "$mainMod, R, exec, $menu"
        "$mainMod, S, exec, steam"
        "$mainMod, P, pseudo"
        "$mainMod, J, togglesplit"
        "$mainMod, F, fullscreen"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, Z, workspace, e-1"
        "$mainMod SHIFT, X, workspace, e+1"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod SHIFT CTRL, Z, movetoworkspace, e-1"
        "$mainMod SHIFT CTRL, X, movetoworkspace, e+1"
        "ALT, left, movewindow, l"
        "ALT, right, movewindow, r"
        "ALT, up, movewindow, u"
        "ALT, down, movewindow, d"
        "$mainMod SHIFT, S, exec, hyprshot -m region -o ~/Pictures/Screenshots/"
        "$mainMod, M, exit"
        "$mainMod, SPACE, exec, pypr toggle term"
        "$mainMod, G, exec, pypr toggle music"
        "$mainMod, T, exec, pypr toggle taskbar"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
