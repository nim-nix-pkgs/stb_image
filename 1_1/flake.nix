{
  description = ''A wrapper for stb_image (including stb_image_write).'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-stb_image-1_1.flake = false;
  inputs.src-stb_image-1_1.ref   = "refs/tags/1.1";
  inputs.src-stb_image-1_1.owner = "define-private-public";
  inputs.src-stb_image-1_1.repo  = "stb_image-Nim.git";
  inputs.src-stb_image-1_1.type  = "gitlab";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-stb_image-1_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-stb_image-1_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}