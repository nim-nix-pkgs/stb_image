{
  description = ''A wrapper for stb_image (including stb_image_write).'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-stb_image-1_2.flake = false;
  inputs.src-stb_image-1_2.ref   = "refs/tags/1.2";
  inputs.src-stb_image-1_2.owner = "define-private-public";
  inputs.src-stb_image-1_2.repo  = "stb_image-Nim.git";
  inputs.src-stb_image-1_2.type  = "gitlab";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-stb_image-1_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-stb_image-1_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}