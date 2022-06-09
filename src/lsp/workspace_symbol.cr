require "json"
require "./document_symbol"

module LSP
  # A special workspace symbol that supports locations without a range
  struct WorkspaceSymbol
    include JSON::Serializable

    # The name of this symbol.
    property name : String

    # The kind of this symbol.
    @[JSON::Field(converter: Enum::ValueConverter(SymbolKind))]
    property kind : SymbolKind

    # TO BE FIXED : How to serialize an array of enums?
    # Tags for this completion item.
    property tags : Array(SymbolTag)?

    # The name of the symbol containing this symbol. This information is for
    # user interface purposes (e.g. to render a qualifier in the user interface
    # if necessary). It can't be used to re-infer a hierarchy for the document
    # symbols.
    @[JSON::Field(key: "containerName")]
    property container_name : String?

    # The location of this symbol. Whether a server is allowed to
    # return a location without a range depends on the client
    # capability `workspace.symbol.resolveSupport`.
    #
    # See also `SymbolInformation.location`.
    property location : Location | NamedTuple(uri: String)

    # A data entry field that is preserved on a workspace symbol between a
    # workspace symbol request and a workspace symbol resolve request.
    property data : JSON::Any?
  end
end
