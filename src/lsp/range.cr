require "json"
require "./position"

module LSP
  struct Range
    include JSON::Serializable

    # The range's start position.
    property start : Position
    # The range's end position.
    @[JSON::Field(key: "end")]
    property ending : Position

    def initialize(@start, @ending)
    end

    def initialize(start_line, start_column, end_line, end_column)
      @start = Position.new(start_line, start_column)
      @ending = Position.new(end_line, end_column)
    end

    def to_s(io)
      io << start.to_s << "-" << ending.to_s
    end
  end
end
