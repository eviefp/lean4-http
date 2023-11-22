namespace Network.HTTP.Types

/-- HTTP standard methods as defined by RFC 2616. -/
inductive Method  where
  | Get
  | Post
  | Head
  | Put
  | Delete
  | Trace
  | Connect
  | Options
  /-- as defined by RFC 5789 -/
  | Patch

def Method.fromString (rawMethod: String) : Option Method :=
  match rawMethod with
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

def Method.toString (method: Method) : String :=
  match method with
  | Get => "GET"
  | Post => "POST"
  | Head => "HEAD"
  | Put => "PUT"
  | Delete => "DELETE"
  | Trace => "TRACE"
  | Connect => "CONNECT"
  | Options => "OPTIONS"
  | Patch => "PATCH"
