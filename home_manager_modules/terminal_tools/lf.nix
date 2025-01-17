{ pkgs, lib, config, ... }:

{
  options = { lf.enable = lib.mkEnableOption "enables lf"; };
  config = lib.mkIf config.lf.enable {
    xdg.configFile."lf/icons".source = ../desktop/icons/icons;
    programs.lf = {
      enable = true;
      commands = {
        editor-open = "$$EDITOR $f";
        mkdir = ''
          ''${{
            printf "Directory Name: "
            read DIR
            mkdir $DIR
          }}
        '';
      };
      keybindings = {
        c = "mkdir";
        ee = "editor-open";
        V = ''''$${pkgs.bat}/bin/bat --paging=always "$f"'';
      };
      settings = {
        preview = true;
        hidden = true;
        drawbox = true;
        icons = true;
        ignorecase = true;
      };
      previewer = {
        keybinding = "i";
        source = "${pkgs.pistol}/bin/pistol";
      };
    };
  };
}
