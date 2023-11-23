import Lake
open Lake DSL

require std from git "https://github.com/leanprover/std4" @ "main"
require socket from git "https://github.com/hargoniX/socket.lean" @ "main"
require Parser from git "https://github.com/fgdorais/lean4-parser" @ "main"
package «todo» { }

lean_lib Network

@[default_target]
lean_exe http_test {
  root := `Main
}
