require "json"

module LSP
  enum TraceValue
    Off
    Message
    Verbose

    def to_json(builder : JSON::Builder)
      builder.string self.to_s.downcase
    end
  end
end
