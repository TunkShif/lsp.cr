require "json"
require "./range"

module LSP
  enum SymbolKind
    File          =  1
    Module        =  2
    Namespace     =  3
    Package       =  4
    Class         =  5
    Method        =  6
    Property      =  7
    Field         =  8
    Constructor   =  9
    Enum          = 10
    Interface     = 11
    Function      = 12
    Variable      = 13
    Constant      = 14
    String        = 15
    Number        = 16
    Boolean       = 17
    Array         = 18
    Object        = 19
    Key           = 20
    Null          = 21
    EnumMember    = 22
    Struct        = 23
    Event         = 24
    Operator      = 25
    TypeParameter = 26
  end

  # Symbol tags are extra annotations that tweak the rendering of a symbol.
  enum SymbolTag
    # Render a symbol as obsolete, usually using a strike-out.
    Deprecated = 1
  end

  # Represents programming constructs like variables, classes, interfaces etc.
  # that appear in a document. Document symbols can be hierarchical and they
  # have two ranges: one that encloses its definition and one that points to its
  # most interesting range, e.g. the range of an identifier.
  struct DocumentSymbol
    include JSON::Serializable

    # The name of this symbol. Will be displayed in the user interface and
    # therefore must not be an empty string or a string only consisting of
    # white spaces.
    property name : String

    # More detail for this symbol, e.g the signature of a function.
    property detail : String?

    # The kind of this symbol.
    @[JSON::Field(converter: Enum::ValueConverter(LSP::SymbolKind))]
    property kind : SymbolKind

    # FIXME : How to serialize an array of enums?
    # Tags for this document symbol.
    property tags : Array(SymbolTag)?

    # Indicates if this symbol is deprecated.
    #
    # @deprecated Use tags instead
    property deprecated : Bool?

    # The range enclosing this symbol not including leading/trailing whitespace
    # but everything else like comments. This information is typically used to
    # determine if the clients cursor is inside the symbol to reveal in the
    # symbol in the UI.
    property range : Range

    # The range that should be selected and revealed when this symbol is being
    # picked, e.g. the name of a function. Must be contained by the `range`.
    @[JSON::Field(key: "selectRange")]
    property select_range : Range

    # Children of this symbol, e.g. properties of a class.
    property children : Array(DocumentSymbol)?
  end
end
