require "json"
require "../document_symbol"

module LSP
  # Symbol request supports dynamic registration.
  struct WorkspaceSymbolClientCapabilities
    include JSON::Serializable

    # Symbol request supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    # Specific capabilities for the `SymbolKind` in the `workspace/symbol`
    # request.
    @[JSON::Field(key: "symbolKind")]
    property symbol_kind : SymbolKindValue?

    # The client supports tags on `SymbolInformation` and `WorkspaceSymbol`.
    # Clients supporting tags have to handle unknown tags gracefully.
    @[JSON::Field(key: "tagSupport")]
    property tag_support : TagSupportValue?

    # The client support partial workspace symbols. The client will send the
    # request `workspaceSymbol/resolve` to the server to resolve additional
    # properties.
    #
    # The properties that a client can resolve lazily. Usually
    # `location.range`
    @[JSON::Field(key: "resolveSupport")]
    property resolve_support : NamedTuple(properties: Array(String))

    struct SymbolKindValue
      include JSON::Serializable

      # The symbol kind values the client supports. When this
      # property exists the client also guarantees that it will
      # handle values outside its set gracefully and falls back
      # to a default value when unknown.
      #
      # If this property is not present the client only supports
      # the symbol kinds from `File` to `Array` as defined in
      # the initial version of the protocol.
      @[JSON::Field(key: "valueSet")]
      property value_set : Array(SymbolKind)?
    end

    struct TagSupportValue
      include JSON::Serializable

      # The tags supported by the client.
      @[JSON::Field(key: "valueSet")]
      property value_set : Array(SymbolTag)?
    end
  end

  struct WorkspaceSymbolOptions
    include JSON::Serializable
    include WorkDoneProgressOptions

    # The server provides support to resolve additional
    # information for a workspace symbol.
    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?
  end

  alias WorkspaceSymbolRegistrationOptions = WorkspaceSymbolOptions
end
