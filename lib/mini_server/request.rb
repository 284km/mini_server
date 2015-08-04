module MiniServer
  class Request
    attr_reader :method, :path, :version, :headers

    def initialize
      @method = ""
      @path = ""
      @version = ""
      @headers = {}
    end

    def parse(connection)
      start_line = connection.gets
      @method, @path, @version = start_line.strip.split

      connection.each_line do |header_line|
        break if header_line.strip == ""

        key, value = header_line.strip.split ": "
        @headers[key] = value
      end
      self
    end
  end
end
