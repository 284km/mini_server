module MiniServer
  class Response
    HTTP_STATUSES = {
      100 => 'Continue',
      101 => 'Switching Protocols',
      102 => 'Processing',
      200 => 'OK',
      201 => 'Created',
      202 => 'Accepted',
      203 => 'Non-Authoritative Information', # since HTTP/1.1
      204 => 'No Content',
      205 => 'Reset Content',
      206 => 'Partial Content',
      207 => 'Multi-Status',        # WebDAV, RFC2518
      300 => 'Multiple Choices',
      301 => 'Moved Permanently',
      302 => 'Found',
      303 => 'See Other',
      304 => 'Not Modified',
      305 => 'Use Proxy',           # since HTTP/1.1
      307 => 'Temporary Redirect',   # since HTTP/1.1
      400 => 'Bad Request',
      401 => 'Unauthorized',
      402 => 'Payment Required',
      403 => 'Forbidden',
      404 => 'Not Found',
      405 => 'Method Not Allowed',
      406 => 'Not Acceptable',
      407 => 'Proxy Authentication Required',
      408 => 'Request Timeout',
      409 => 'Conflict',
      410 => 'Gone',
      411 => 'Length Required',
      412 => 'Precondition Failed',
      413 => 'Request Entity Too Large',
      414 => 'Request-URI Too Long',
      415 => 'Unsupported Media Type',
      416 => 'Requested Range Not Satisfiable',
      417 => 'Expectation Failed',
      422 => 'Unprocessable Entity', # WebDAV, RFC4918
      423 => 'Locked',               # WebDAV, RFC4918
      424 => 'Failed Dependency',    # WebDAV, RFC4918
      425 => 'Unordered Collection', # WebDAV, RFC4918
      426 => 'Ungrade Required',     # RFC2817
      500 => 'Internal Server Error',
      501 => 'Not Implemented',
      502 => 'Bad Gateway',
      503 => 'Service Unavailable',
      504 => 'Gateway Timeout',
      505 => 'HTTP Version Not Supported',
      506 => 'Variant Also Negotiates', # RFC2295
      507 => 'Insufficient Storage',    # WebDAV, RFC4918
      510 => 'Not Extended'             # RFC2774
    }

    attr_accessor :version, :status_code, :reason, :headers, :body

    def initialize(version, status_code)
      @version = version
      @status_code = status_code
      @reason = HTTP_STATUSES[status_code]
    end

    def to_s
      res = ""
      # start_line = "#{@version} #{@status_code} #{@reason}\r\n"
      # res << start_line
res = "EOF
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8
Server: rserver
Connection: close

<html>
<head>
  <title>hey</title>
</head>
<body>
  <h1>Test !!</h1>
</body>
</html>
"
    end
  end
end
