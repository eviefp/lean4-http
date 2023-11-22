import Network.HTTP.Types.Header
import Network.HTTP.Types.Method
import Network.HTTP.Types.Version

namespace Network.HTTP.Types

structure Request where
  method : Method
  uri : String -- TODO: need to do better
  httpVersion: Version
  headers: List Header
  -- TODO: content

namespace Request.Parser
