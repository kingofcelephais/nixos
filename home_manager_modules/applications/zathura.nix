{ lib, config, ... }:

{
  options = { zathura.enable = lib.mkEnableOption "enables zathura"; };

  config = lib.mkIf config.zathura.enable {
    programs.zathura = {
      enable = true;
      extraConfig = ''
        set database sqlite
      '';
    };
  };
}
