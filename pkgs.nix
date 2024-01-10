let
  sha256 = "sha256:0rr6qp2zk1yp3z1sz3zxm1gmqpyy0vnbxs14qgpq9m6977ngjgm3";
  rev = "a518c77148585023ff56022f09c4b2c418a51ef5";
in
builtins.trace "(Using pinned Nixpkgs at ${rev})"
import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  inherit sha256;
})
