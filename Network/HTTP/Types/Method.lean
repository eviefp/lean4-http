namespace Network.HTTP.Types

/-- HTTP standard methods as defined by RFC 2616. -/
inductive Method : String -> Type where
  | Get     : Method "GET"
  | Post    : Method "POST"
  | Head    : Method "HEAD"
  | Put     : Method "PUT"
  | Delete  : Method "DELETE"
  | Trace   : Method "TRACE"
  | Connect : Method "CONNECT"
  | Options : Method "OPTIONS"
  /-- as defined by RFC 5789 -/
  | Patch   : Method "PATCH"

def Method.fromString (s: String) : Option (Method s) :=
  match s with
  | "GET" => some Get
  | "POST" => some Post
  | "HEAD" => some Head
  | "PUT" => some Put
  | "DELETE" => some Delete
  | "TRACE" => some Trace
  | "CONNECT" => some Connect
  | "OPTIONS" => some Options
  | "PATCH" => some Patch
  | _ => none

def Method.toString (_ : Method s) : String := s
