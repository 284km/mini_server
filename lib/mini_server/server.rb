require "socket"
require "mini_server/request"
require "mini_server/response"

module MiniServer
  class Server
    def self.call(*args)
      new(*args).call
    end

    def initialize(host, port)
      @server = Socket.new(:INET, :STREAM)
      # @addr = Socket.pack_sockaddr_in(port.to_i, host.to_s)
      # @addr = Socket.pack_sockaddr_in(port, host)
      @addr = Socket.pack_sockaddr_in(5001, "0.0.0.0")
      @server.bind(@addr)
      @server.listen(Socket::SOMAXCONN)
    end

    def call
      loop do
        connection, _ = @server.accept
        req = Request.new.parse(connection)
        connection.write build_response(req)
        connection.close
      end
    end

    private

    def build_response(req)
puts req.path
      case req.path
      when "/"
        res = Response.new("HTTP/1.1", "200").to_s
      # when "/favicon.ico"
      #   res = Response.new("HTTP/1.1", "200").to_s
      end
      res
    end
  end
end
