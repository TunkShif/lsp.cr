require "json"
require "./position"

module LSP
  struct Range
    include JSON::Serializable

    # The range's start position.
    property start : Position
    # The range's end position.
    property ending : Position

    def initialize(@start, @ending)
    end

    def to_s(io)
      io << start.to_s << "-" << ending.to_s
    end
  end
end
