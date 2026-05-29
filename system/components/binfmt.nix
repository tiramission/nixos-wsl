{
  boot.binfmt = {
    emulatedSystems = ["aarch64-linux"];
    preferStaticEmulators = true;
  };
  wsl.interop = {
    register = true;
  };
}
