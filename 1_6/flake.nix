{
  description = ''A wrapper for stb_image (including stb_image_write).'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-stb_image-1_6.flake = false;
  inputs.src-stb_image-1_6.owner = "define-private-public";
  inputs.src-stb_image-1_6.ref   = "1_6";
  inputs.src-stb_image-1_6.repo  = "stb_image-Nim.git";
  inputs.src-stb_image-1_6.type  = "gitlab";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-stb_image-1_6"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-stb_image-1_6";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}