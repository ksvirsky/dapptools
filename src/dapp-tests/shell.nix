{ pkgs ? import ../.. {} }:

let
  ds-test = pkgs.fetchFromGitHub {
    owner = "dapphub";
    repo = "ds-test";
    rev = "eb7148d43c1ca6f9890361e2e2378364af2430ba";
    sha256 = "1phnqjkbcqg18mh62c8jq0v8fcwxs8yc4sa6dca4y8pq2k35938k";
  };
in
  pkgs.mkShell {
    name = "dapp-integration-tests";
    buildInputs = with pkgs; [ gnumake dapp ds-test ];

    shellHook = ''
      make
    '';
  }
