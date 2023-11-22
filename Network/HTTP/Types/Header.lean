namespace Network.HTTP.Types

/-- HTTP Header names according to http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html
-/
inductive Header : String -> Type where
  | Accept             : Header "Accept"
  | AcceptCharset      : Header "Accept-Charset"
  | AcceptEncoding     : Header "Accept-Encoding"
  | AcceptLanguage     : Header "Accept-Language"
  | AcceptRanges       : Header "Accept-Ranges"
  | Age                : Header "Age"
  | Allow              : Header "Allow"
  | Authorization      : Header "Authorization"
  | CacheControl       : Header "Cache-Control"
  | Connection         : Header "Connection"
  | ContentEncoding    : Header "Content-Encoding"
  | ContentLanguage    : Header "Content-Language"
  | ContentLength      : Header "Content-Length"
  | ContentLocation    : Header "Content-Location"
  | ContentMD          : Header "Content-MD5"
  | ContentRange       : Header "Content-Range"
  | ContentType        : Header "Content-Type"
  | Date               : Header "Date"
  | ETag               : Header "ETag"
  | Expect             : Header "Expect"
  | Expires            : Header "Expires"
  | From               : Header "From"
  | Host               : Header "Host"
  | IfMatch            : Header "If-Match"
  | IfModifiedSince    : Header "If-Modified-Since"
  | IfNoneMatch        : Header "If-None-Match"
  | IfRange            : Header "If-Range"
  | IfUnmodifiedSince  : Header "If-Unmodified-Since"
  | LastModified       : Header "Last-Modified"
  | Location           : Header "Location"
  | MaxForwards        : Header "Max-Forwards"
  | Pragma             : Header "Pragma"
  | ProxyAuthenticate  : Header "Proxy-Authenticate"
  | ProxyAuthorization : Header "Proxy-Authorization"
  | Range              : Header "Range"
  | Referer            : Header "Referer"
  | RetryAfter         : Header "Retry-After"
  | Server             : Header "Server"
  | TE                 : Header "TE"
  | Trailer            : Header "Trailer"
  | TransferEncoding   : Header "Transfer-Encoding"
  | Upgrade            : Header "Upgrade"
  | UserAgent          : Header "User-Agent"
  | Vary               : Header "Vary"
  | Via                : Header "Via"
  | WWWAuthenticate    : Header "WWW-Authenticate"
  | Warning            : Header "Warning"

/-- HTTP Header names according to http://www.w3.org/Protocols/rfc2616/rfc2616-sec19.html -/
  | ContentDisposition : Header "Content-Disposition"
  | MIMEVersion        : Header "MIME-Version"

/- HTTP Header names according to https://tools.ietf.org/html/rfc6265#section-4 -/
  | Cookie             : Header "Cookie"
  | SetCookie          : Header "Set-Cookie"

/-- HTTP Header names according to https://tools.ietf.org/html/rfc6454 -/
  | Origin             : Header "Origin"

/-- HTTP Header names according to https://tools.ietf.org/html/rfc7240 -/
  | Prefer             : Header "Prefer"
  | PreferenceApplied  : Header "Preference-Applied"

def Header.fromString (s: String) : Option (Header s) :=
  match s with
  | "Accept" => some Header.Accept
  | "Accept-Charset" => some Header.AcceptCharset
  | "Accept-Encoding" => some Header.AcceptEncoding
  | "Accept-Language" => some Header.AcceptLanguage
  | "Accept-Ranges" => some Header.AcceptRanges
  | "Age" => some Header.Age
  | "Allow" => some Header.Allow
  | "Authorization" => some Header.Authorization
  | "Cache-Control" => some Header.CacheControl
  | "Connection" => some Header.Connection
  | "Content-Encoding" => some Header.ContentEncoding
  | "Content-Language" => some Header.ContentLanguage
  | "Content-Length" => some Header.ContentLength
  | "Content-Location" => some Header.ContentLocation
  | "Content-MD5" => some Header.ContentMD
  | "Content-Range" => some Header.ContentRange
  | "Content-Type" => some Header.ContentType
  | "Date" => some Header.Date
  | "ETag" => some Header.ETag
  | "Expect" => some Header.Expect
  | "Expires" => some Header.Expires
  | "From" => some Header.From
  | "Host" => some Header.Host
  | "If-Match" => some Header.IfMatch
  | "If-Modified-Since" => some Header.IfModifiedSince
  | "If-None-Match" => some Header.IfNoneMatch
  | "If-Range" => some Header.IfRange
  | "If-Unmodified-Since" => some Header.IfUnmodifiedSince
  | "Last-Modified" => some Header.LastModified
  | "Location" => some Header.Location
  | "Max-Forwards" => some Header.MaxForwards
  | "Pragma" => some Header.Pragma
  | "Proxy-Authenticate" => some Header.ProxyAuthenticate
  | "Proxy-Authorization" => some Header.ProxyAuthorization
  | "Range" => some Header.Range
  | "Referer" => some Header.Referer
  | "Retry-After" => some Header.RetryAfter
  | "Server" => some Header.Server
  | "TE" => some Header.TE
  | "Trailer" => some Header.Trailer
  | "Transfer-Encoding" => some Header.TransferEncoding
  | "Upgrade" => some Header.Upgrade
  | "User-Agent" => some Header.UserAgent
  | "Vary" => some Header.Vary
  | "Via" => some Header.Via
  | "WWW-Authenticate" => some Header.WWWAuthenticate
  | "Warning" => some Header.Warning
  | "Content-Disposition" => some Header.ContentDisposition
  | "MIME-Version" => some Header.MIMEVersion
  | "Cookie" => some Header.Cookie
  | "Set-Cookie" => some Header.SetCookie
  | "Origin" => some Header.Origin
  | "Prefer" => some Header.Prefer
  | "Preference-Applied" => some Header.PreferenceApplied
  | _ => none

def Header.toString (_: Header s) : String := s

-- TODO: ByteRanges
