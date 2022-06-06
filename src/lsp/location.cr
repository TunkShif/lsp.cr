require "json"
require "./range"
require "./position"

module LSP
  struct Location
    include JSON::Serializable

    property uri : String
    property range : Range

    def initialize(@uri, @range)
    end

    def to_s(io)
      io << range.to_s
    end
  end
end
