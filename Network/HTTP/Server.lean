import Socket
import Network.HTTP.Types.Request

namespace Network.HTTP

open Network.HTTP.Types


structure Server.Config where
  addressFamily: Socket.AddressFamily
  address: Socket.SockAddr
  backlog: UInt32
  handle: Socket.SockAddr -> Request -> IO String -- TODO: these should be request & response

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
  - Use a Http.Response object.
  - Serialize and response.
  - Make sure the whole response made it over.
-/
private def runServer (server: Server) : IO Unit := do
    while true do
        let (client, addr) <- server.socket.accept
        let rawRequest <- client.recv 4096
        let request <- IO.ofExcept $ Request.parse rawRequest
        let response <- server.config.handle addr request
        let responseByteArray := response.toUTF8
        _ <- client.send responseByteArray
        client.close

private def finalize (server: Server) (e: IO.Error) : BaseIO Unit := do
  _ <- (println! e.toString).toBaseIO
  _ <- server.socket.close.toBaseIO

def Server.run (server: Server) : IO Unit := do
  EIO.catchExceptions (runServer server) (finalize server)
