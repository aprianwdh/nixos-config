{ config, lib, pkgs, ... }:

{
  # --- Firewall ---
  # NixOS defaultnya sudah enable, ini cuma mempertegas + template kalau nanti
  # butuh buka port tertentu (misal buat game/server lokal).
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
  };

  # --- DNS terenkripsi (DNS-over-TLS) ---
  # Biar ISP / orang lain di jaringan yang sama nggak gampang intip domain
  # apa aja yang kamu akses.
  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "1.1.1.1" "9.9.9.9" ];
    dnsovertls = "true";
  };

  # --- Auto-update mingguan ---
  # Cuma nge-build & nyiapin generation baru, TIDAK auto-reboot (allowReboot = false),
  # jadi kamu tetap yang milih kapan mau pindah ke generation terbaru.
  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos";
    flags = [ "--update-input" "nixpkgs" ];
    dates = "weekly";
    allowReboot = false;
  };
}
