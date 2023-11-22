import Socket

namespace Network.HTTP


structure Server.Config where
  addressFamily: Socket.AddressFamily
  address: Socket.SockAddr
  backlog: UInt32
  handle: Socket.SockAddr -> String -> IO String -- TODO: these should be request & response

structure Server where
  socket: Socket
  config: Server.Config

def Server.setup (config: Config) : IO Server := do
  let socket <- Socket.mk config.addressFamily .stream
  socket.bind config.address
  socket.listen config.backlog
  return { socket := socket, config := config }

/-- TODO:
  - Should launch off a task for each of the accepted clients.
  - Make sure we read the whole request, not just 4096 bytes.
  - Timeout the request after a while.
  - Parse request into a Http.Request object.
  - Use a Http.Response object.
  - Serialize and response.
  - Make sure the whole response made it.
-/
def Server.run (server: Server) : IO Unit := do
  while true do
    let (client, addr) <- server.socket.accept
    let request <- client.recv 9000
    let requestString := String.fromUTF8Unchecked request
    let response <- server.config.handle addr requestString
    let responseByteArray := response.toUTF8
    _ <- client.send responseByteArray
