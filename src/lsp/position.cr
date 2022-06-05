require "json"

module LSP
  struct Position
    include JSON::Serializable

    # Line position in a document (zero-based).
    property line : UInt32
    # Character offset on a line in a document (zero-based). Assuming that
    # the line is represented as a string, the `character` value represents
    # the gap between the `character` and `character + 1`.
    #
    # If the character value is greater than the line length it defaults back
    # to the line length.
    property character : UInt32

    def initialize(@line, @character)
    end

    def to_s(io)
      io << @line << ":" << @character
    end
  end

  enum PositionEncodingKind
    UTF8
    UTF16
    UTF32

    def to_json(builder : JSON::Builder)
      encoding = case self
                 when UTF8
                   "utf-8"
                 when UTF16
                   "utf-16"
                 when UTF32
                   "utf-32"
                 end
      builder.string encoding
    end
  end
end
