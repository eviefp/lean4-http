import Network.HTTP.Server
import Socket
open Network.HTTP

def handle (_socketAddress: Socket.SockAddr) (_request: String) : IO String := do
  return "HTTP/1.1 404 Not Found"

def main (_args: List String) : IO Unit := do
  let address : Socket.SockAddr4 := .v4 (.mk 127 0 0 1) 1235
  let config : Server.Config :=
      { addressFamily := Socket.AddressFamily.inet
      , address := address
      , backlog := 1
      , handle := handle
      }
   let server <- Server.setup config
   server.run
