{ ... }:

{
  hardware = {
    bluetooth.enable = true;
    # pulseaudio.enable = true;
  };
  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true;
  };
}
