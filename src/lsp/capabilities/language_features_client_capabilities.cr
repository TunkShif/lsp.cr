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
  end
  struct DeclarationRegistrationOptions
  end

  struct TypeDefinitionOptions
  end
  struct TypeDefinitionRegistrationOptions
  end

  struct DefinitionOptions
  end
  struct DefinitionRegistrationOptions
  end

  struct ImplementationOptions
  end
  struct ImplementationRegistrationOptions
  end

  struct HoverOptions
  end

  struct ReferenceOptions
  end

  struct DocumentHighlightOptions
  end

  struct DocumentLinkOptions
  end

  struct CodeLensOptions
  end

  struct DocumentColorOptions
  end
  struct DocumentColorRegistrationOptions
  end

  struct DocumentFormattingOptions
  end

  struct DocumentRangeFormattingOptions
  end

  struct DocumentOnTypeFormattingOptions
  end

  struct RenameOptions
  end

  struct FoldingRangeClientCapabilities
  end
  struct FoldingRangeOptions
  end
  struct FoldingRangeRegistrationOptions
  end

  struct SelectionRangeOptions
  end
  struct SelectionRangeRegistrationOptions
  end

  struct LinkedEditingRangeOptions
  end
  struct LinkedEditingRangeRegistrationOptions
  end

  struct CallHierarchyOptions
  end
  struct CallHierarchyRegistrationOptions
  end

  struct TypeHierarchyOptions
  end
  struct TypeHierarchyRegistrationOptions
  end

  struct InlineValueOptions
  end
  struct InlineValueRegistrationOptions
  end

  struct InlayHintOptions
  end
  struct InlayHintRegistrationOptions
  end

  struct DiagnosticOptions
  end
  struct DiagnosticRegistrationOptions
  end

  struct SemanticTokensOptions
  end
  struct SemanticTokensRegistrationOptions
  end

  struct MonikerOptions
  end
  struct MonikerRegistrationOptions
  end
  struct DocumentSymbolClientCapabilities
  end
  struct DocumentSymbolOptions
  end

  struct SemanticTokensClientCapabilities
  end

  struct InlayHintClientCapabilities
  end

  struct CompletionClientCapabilities
  end
  struct CompletionOptions
  end

  struct PublishDiagnosticsClientCapabilities
  end

  struct DiagnosticClientCapabilities
  end

  struct SignatureHelpClientCapabilities
  end
  struct SignatureHelpOptions
  end

  struct CodeActionClientCapabilities
  end
  struct CodeActionOptions
  end

  struct RenameClientCapabilities
  end
end
