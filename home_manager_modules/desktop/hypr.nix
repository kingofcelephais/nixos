{ pkgs, lib, config, inputs, ... }:

{
  options = { hypr.enable = lib.mkEnableOption "enable hyprland"; };

  config = lib.mkIf config.hypr.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      package =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      systemd.enable = false;
      settings = {
        exec-once = [
          "${pkgs.waybar}/bin/waybar"
          "swww-daemon"
          "${pkgs.copyq}/bin/copyq --start-server"
          "polkit-agent-helper-1"
          "systemctl start --user polkit-gnome-authentication-agent-1"
          "systemctl --user enable --now hypridle.service"
        ];
        "source" = [ "~/.cache/hypr/colors-hyprland.conf" ];
        "monitor" = ",preferred,auto,auto";
        "$mod" = "SUPER";
        "$terminal" = "${pkgs.wezterm}/bin/wezterm";
        "$fileManager" = "${pkgs.xfce.thunar}/bin/thunar";
        "$menu" = "${pkgs.rofi-wayland}/bin/rofi -show drun";
        "$screen" = ''${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)"'';
        "$text" = "${pkgs.xfce.mousepad}/bin/mousepad";
        general = {
          gaps_in = 25;
          gaps_out = 50;
          border_size = 0;
          layout = "dwindle";
          allow_tearing = "true";
          "col.active_border" = "$color5";
          "col.inactive_border" = "$color5";
        };
        # decoration = {
        #   shadow_render_power = 3;
        #   rounding = 0;
        #   drop_shadow = "yes";
        #   shadow_range = 4;
        # };
        bezier = [ "test,0.17,0.85,.355,1" ];
        animation = [ "workspaces,1,8,test" "windows,1,4,test," ];
        bind = [
          "$mod, R, exec, $menu"
          "$mod, E, exec, $fileManager"
          "$mod, V, togglefloating"
          "$mod, M, exit"
          "$mod, Q, exec, $terminal"
          "$mod, C, killactive"
          "$mod, S, exec, $screen"
          "$mod, W, exec, $text"
          "$mod, F, togglespecialworkspace, magic"
          "$mod SHIFT, F, movetoworkspace, special:magic"
          "$mod, mouse_up, workspace, e+1"
          "$mod, mouse_down, workspace, e-1"
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
          "Control_L&Alt_L, DELETE, exec, wlogout"
        ] ++ (builtins.concatLists (builtins.genList (x:
          let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]) 10));
        bindm = [
          # mouse movements
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
          "$mod ALT, mouse:272, resizewindow"
        ];
        env = [ "XCURSOR_THEME, Bibata-Modern-Ice" "XCURSOR_SIZE, 16" ];
      };
    };
  };
}
