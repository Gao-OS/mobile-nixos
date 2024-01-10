let
  sha256 = "sha256:54ae7bb00bfc9b48dd525d5749d86c206eac93c9c1077dee5f5cc9628b547899";
  rev = "a518c77148585023ff56022f09c4b2c418a51ef5";
in
builtins.trace "(Using pinned Nixpkgs at ${rev})"
import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  inherit sha256;
})
