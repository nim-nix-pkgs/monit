{
  description = ''A simple task runner. Run tasks and watch file changes with custom paths.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-monit-1_0_0.flake = false;
  inputs.src-monit-1_0_0.owner = "jiro4989";
  inputs.src-monit-1_0_0.ref   = "refs/tags/1.0.0";
  inputs.src-monit-1_0_0.repo  = "monit";
  inputs.src-monit-1_0_0.type  = "github";
  
  inputs."yaml".owner = "nim-nix-pkgs";
  inputs."yaml".ref   = "master";
  inputs."yaml".repo  = "yaml";
  inputs."yaml".type  = "github";
  inputs."yaml".inputs.nixpkgs.follows = "nixpkgs";
  inputs."yaml".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."cligen".owner = "nim-nix-pkgs";
  inputs."cligen".ref   = "master";
  inputs."cligen".repo  = "cligen";
  inputs."cligen".type  = "github";
  inputs."cligen".inputs.nixpkgs.follows = "nixpkgs";
  inputs."cligen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-monit-1_0_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-monit-1_0_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}