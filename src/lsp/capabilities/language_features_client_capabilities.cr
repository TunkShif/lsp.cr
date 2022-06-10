require "json"

module LSP
  macro define_capabilities(names)
    {% for name in names %}
      struct {{name}}ClientCapabilities
        include JSON::Serializable 

        @[JSON::Field(key: "dynamicRegistration")]
        property dynamic_registration : Bool?

        @[JSON::Field(key: "linkSupport")]
        property link_support : Bool?
      end
    {% end %}
  end

  macro define_refreshable(names)
    {% for name in names %}
      struct {{name}}WorkspaceClientCapabilities
        include JSON::Serializable 

        @[JSON::Field(key: "refreshSupport")]
        property refresh_support : Bool?
      end
    {% end %}
  end

  define_capabilities [Declaration, Definition, TypeDefinition, Implementation, Reference, CallHierarchy, TypeHierarchy, DocumentHighlight, DocumentLink, Hover, CodeLens, SelectionRange, InlineValue, Moniker, DocumentColor, DocumentFormatting, DocumentRangeFormatting, DocumentOnTypeFormatting, LinkedEditingRange]
  define_refreshable [CodeLens, SemanticTokens, InlayHint, InlineValue, Diagnostic]

  # TODO: complex capabilities

  struct DeclarationOptions
    include JSON::Serializable
  end

  struct DeclarationRegistrationOptions
    include JSON::Serializable
  end

  struct TypeDefinitionOptions
    include JSON::Serializable
  end

  struct TypeDefinitionRegistrationOptions
    include JSON::Serializable
  end

  struct DefinitionOptions
    include JSON::Serializable
  end

  struct DefinitionRegistrationOptions
    include JSON::Serializable
  end

  struct ImplementationOptions
    include JSON::Serializable
  end

  struct ImplementationRegistrationOptions
    include JSON::Serializable
  end

  struct HoverOptions
    include JSON::Serializable
  end

  struct ReferenceOptions
    include JSON::Serializable
  end

  struct DocumentHighlightOptions
    include JSON::Serializable
  end

  struct DocumentLinkOptions
    include JSON::Serializable
  end

  struct CodeLensOptions
    include JSON::Serializable
  end

  struct DocumentColorOptions
    include JSON::Serializable
  end

  struct DocumentColorRegistrationOptions
    include JSON::Serializable
  end

  struct DocumentFormattingOptions
    include JSON::Serializable
  end

  struct DocumentRangeFormattingOptions
    include JSON::Serializable
  end

  struct DocumentOnTypeFormattingOptions
    include JSON::Serializable
  end

  struct RenameOptions
    include JSON::Serializable
  end

  struct FoldingRangeClientCapabilities
    include JSON::Serializable
  end

  struct FoldingRangeOptions
    include JSON::Serializable
  end

  struct FoldingRangeRegistrationOptions
    include JSON::Serializable
  end

  struct SelectionRangeOptions
    include JSON::Serializable
  end

  struct SelectionRangeRegistrationOptions
    include JSON::Serializable
  end

  struct LinkedEditingRangeOptions
    include JSON::Serializable
  end

  struct LinkedEditingRangeRegistrationOptions
    include JSON::Serializable
  end

  struct CallHierarchyOptions
    include JSON::Serializable
  end

  struct CallHierarchyRegistrationOptions
    include JSON::Serializable
  end

  struct TypeHierarchyOptions
    include JSON::Serializable
  end

  struct TypeHierarchyRegistrationOptions
    include JSON::Serializable
  end

  struct InlineValueOptions
    include JSON::Serializable
  end

  struct InlineValueRegistrationOptions
    include JSON::Serializable
  end

  struct InlayHintOptions
    include JSON::Serializable
  end

  struct InlayHintRegistrationOptions
    include JSON::Serializable
  end

  struct DiagnosticOptions
    include JSON::Serializable

    def initialize(@inter_file_dependencies, @workspace_diagnostics, @identifier = nil)
    end

    # An optional identifier under which the diagnostics are
    # managed by the client.
    property identifier : String?

    # Whether the language has inter file dependencies meaning that
    # editing code in one file can result in a different diagnostic
    # set in another file. Inter file dependencies are common for
    # most programming languages and typically uncommon for linters.
    @[JSON::Field(key: "interFileDependencies")]
    property inter_file_dependencies : Bool

    # The server provides support for workspace diagnostics as well.
    @[JSON::Field(key: "workspaceDiagnostics")]
    property workspace_diagnostics : Bool
  end

  struct DiagnosticRegistrationOptions
    include JSON::Serializable
  end

  struct SemanticTokensOptions
    include JSON::Serializable
  end

  struct SemanticTokensRegistrationOptions
    include JSON::Serializable
  end

  struct MonikerOptions
    include JSON::Serializable
  end

  struct MonikerRegistrationOptions
    include JSON::Serializable
  end

  struct DocumentSymbolClientCapabilities
    include JSON::Serializable
  end

  struct DocumentSymbolOptions
    include JSON::Serializable
  end

  struct SemanticTokensClientCapabilities
    include JSON::Serializable
  end

  struct InlayHintClientCapabilities
    include JSON::Serializable
  end

  struct CompletionClientCapabilities
    include JSON::Serializable
  end

  struct CompletionOptions
    include JSON::Serializable
  end

  struct PublishDiagnosticsClientCapabilities
    include JSON::Serializable
  end

  struct DiagnosticClientCapabilities
    include JSON::Serializable
  end

  struct SignatureHelpClientCapabilities
    include JSON::Serializable
  end

  struct SignatureHelpOptions
    include JSON::Serializable
  end

  struct CodeActionClientCapabilities
    include JSON::Serializable
  end

  struct CodeActionOptions
    include JSON::Serializable
  end

  struct RenameClientCapabilities
    include JSON::Serializable
  end
end
