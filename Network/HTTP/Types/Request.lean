import Network.HTTP.Types.Header
import Network.HTTP.Types.Method
import Network.HTTP.Types.Version
import Lean.Parser

namespace Network.HTTP.Types

def optionToParser (o: Option α) (err: String) : Lean.Parsec α :=
  match o with
    | .some res => pure res
    | .none => Lean.Parsec.fail err

structure Request where
  method : Method
  uri : String -- TODO: need to do better
  httpVersion: Version
  headers: List Header -- TODO: header values?
  -- TODO: content

open Lean

/--
GET / HTTP/1.1xxAccept: */*xxAccept-Encoding: gzip, deflate, brxx Connection: keep-alivexxHost: 127.0.0.1:1235xxUser-Agent: HTTPie/3.2.2xx
-/
private def parseMethod : Parsec Method := do
  let str <- Parsec.many1Chars Parsec.asciiLetter
  optionToParser (Method.fromString str) s!"failed parsing header: {str.quote}"

private def except (c: Char) (i: Char) : Bool :=
  not (c == i)

private def parseURI : Parsec String :=
  Parsec.many1Chars (Parsec.satisfy (except ' '))

private def parseVersion : Parsec Version := do
  let str <- Parsec.many1Chars $ Parsec.satisfy (except '\r')
  optionToParser (Version.fromString str) s!"failed parsing version: {str.quote}"

private def parseHeader : Parsec Header := do
  Parsec.ws
  let headerName <- Parsec.many1Chars (Parsec.satisfy (except ':'))
  _ <- Parsec.pchar ':'
  Parsec.ws
  let _rest <- Parsec.many1Chars (Parsec.satisfy (except '\r'))
  optionToParser (Header.fromString headerName) s!"failed parsing header: {headerName.quote}"

private def parseRequest : Parsec Request := do
  let method <- parseMethod
  Parsec.ws
  let uri <- parseURI
  Parsec.ws
  let httpVersion <- parseVersion
  Parsec.ws

  let headers <- Parsec.many (Parsec.attempt parseHeader)

  Parsec.ws

  pure { method := method
       , uri := uri
       , httpVersion := httpVersion
       , headers := headers.data
       }

def Request.parse (ba: ByteArray) : Except String Request :=
  Parsec.run parseRequest
    $ String.fromUTF8Unchecked ba
