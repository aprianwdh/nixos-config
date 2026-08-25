{ ... }:

{
  # untuk mengaktifkan pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true; # Ini membuat aplikasi lama mengira masih pakai PulseAudio
  };
  services.pulseaudio.enable = false;
}
