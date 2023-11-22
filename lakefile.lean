import Lake
open Lake DSL

require std from git "https://github.com/leanprover/std4" @ "main"
require socket from git "https://github.com/eviefp/socket.lean" @ "main"

package «todo» { }

lean_lib Network

@[default_target]
lean_exe http_test {
  root := `Main
}
