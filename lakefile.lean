import Lake
open Lake DSL

require socket from git "https://github.com/hargoniX/socket.lean" @ "main"

package «todo» { }

lean_lib Network

@[default_target]
lean_exe http_test {
  root := `Main
}
