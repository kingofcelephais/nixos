{ pkgs, lib, config, ... }:

{
  options = { theme.enable = lib.mkEnableOption "enables theme support"; };

  config = lib.mkIf config.theme.enable {

    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "adwaita-dark";
      style.package = pkgs.adwaita-qt;
    };

    gtk = {
      enable = true;

      cursorTheme.package = pkgs.bibata-cursors;
      cursorTheme.name = "Bibata-Modern-Ice";

      theme.package = pkgs.adw-gtk3;
      theme.name = "adw-gtk3-dark";

      iconTheme.package = pkgs.adwaita-icon-theme;
      iconTheme.name = "Adwaita";

      gtk4.extraCss =
        ''@import url("file:///home/kuranes/.cache/gtk/my_gtk.css")'';
    };
  };
}
