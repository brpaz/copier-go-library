{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  languages.go.enable = true;
  dotenv.enable = true;

  # https://devenv.sh/packages/
  packages = with pkgs; [
    go-task
    gotestsum
    gomarkdoc
    lefthook
    commitlint-rs
  ];

  enterShell = ''
    lefthook install
    go mod tidy
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
  '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
