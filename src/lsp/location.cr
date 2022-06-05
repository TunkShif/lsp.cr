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

module Crystal
  class ASTNode
    def get_location
      loc = location
      end_loc = end_location
      return if loc.nil? || end_loc.nil?
      start = LSP::Position.new(loc.line_number - 1, loc.column_number - 1)
      ending = LSP::Position.new(end_loc.line_number - 1, end_loc.column_number - 1)
      range = LSP::Range.new(start, ending)
      LSP::Location.new(range)
    end
  end
end
