{
  default,
  ...
}: {
  systemd.services.systemd-udevd.restartIfChanged = false;
}