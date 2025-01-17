{ pkgs, ... }:
let sddmTheme = import ./sddm-theme.nix { inherit pkgs; };

in {
  services.displayManager.sddm = {
    wayland.enable = true;
    enable = true;
    theme = "${sddmTheme}";
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
