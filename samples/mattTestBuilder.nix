(import <nixpkgs> {}).writeShellScriptBin "my-example" ''
         echo My example command is running
         ls -l
       ''