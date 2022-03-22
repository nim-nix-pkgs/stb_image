{
  description = ''A wrapper for stb_image (including stb_image_write & zlib client).'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-stb_image-2_1.flake = false;
  inputs.src-stb_image-2_1.ref   = "refs/tags/2.1";
  inputs.src-stb_image-2_1.owner = "define-private-public";
  inputs.src-stb_image-2_1.repo  = "stb_image-Nim";
  inputs.src-stb_image-2_1.type  = "gitlab";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-stb_image-2_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-stb_image-2_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}