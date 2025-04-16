{
  inputs,
  cell,
}:
{
  macOS = {
    system = "aarch64-darwin";
    bee = {
      system = "aarch64-darwin";
      pkgs = inputs.nixpkgs;
      home = inputs.home-manager;
      darwin = inputs.nix-darwin;
    };

    imports = [
      inputs.cells.core.darwinProfiles.default
      inputs.cells.core.darwinProfiles.optimize
    ];

    home-manager.users.jumang4423 = {
      imports = [
        inputs.cells.core.homeProfiles.default

        inputs.cells.dev.homeProfiles.git
        inputs.cells.dev.homeProfiles.zsh
        inputs.cells.dev.homeProfiles.vim
        # inputs.cells.dev.homeProfiles.google_cloud_sdk
        # inputs.cells.dev.homeProfiles.biome
        # inputs.cells.dev.homeProfiles.graphql

        cell.homeProfiles.default
      ];
    };

    users.users = {
      jumang4423 = {
        createHome = true;
        home = "/Users/jumang4423";
        shell = inputs.nixpkgs.pkgs.zsh;
      };
    };
  };
}
