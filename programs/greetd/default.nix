{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
     default_session.command = ''
      ${pkgs.greetd.tuigreet}/bin/tuigreet \
        --time \
        --asterisks \
        --user-menu \
        --cmd Hyperland
    '';
    };
  };

  environment.etc."greetd/environments".text = ''
    Hyperland
  '';
}