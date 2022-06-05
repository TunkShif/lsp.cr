require "json"

module LSP
  # Text document specific client capabilities.
  struct TextDocumentClientCapabilities
    include JSON::Serializable

    property synchronization : TextDocumentSyncClientCapabilities?

    property completion : CompletionClientCapabilities?

    property hover : HoverClientCapabilities?

    @[JSON::Field(key: "signatureHelp")]
    property signature_help : SignatureHelpClientCapabilities?

    property declaration : DeclarationClientCapabilities?
    property definition : DefinitionClientCapabilities?

    @[JSON::Field(key: "typeDefinition")]
    property type_definition : TypeDefinitionClientCapabilities?

    property implementation : ImplementationClientCapabilities?

    property references : ReferenceClientCapabilities?

    @[JSON::Field(key: "documentHighlight")]
    property document_highlight : DocumentHighlightClientCapabilities?

    @[JSON::Field(key: "documentSymbol")]
    property document_symbol : DocumentSymbolClientCapabilities?

    @[JSON::Field(key: "codeAction")]
    property code_action : CodeActionClientCapabilities?

    @[JSON::Field(key: "codeLens")]
    property code_lens : CodeLensClientCapabilities?

    @[JSON::Field(key: "documentLink")]
    property document_link : DocumentLinkClientCapabilities?

    @[JSON::Field(key: "colorProvider")]
    property color_provider : DocumentColorClientCapabilities?

    property formatting : DocumentFormattingClientCapabilities?

    @[JSON::Field(key: "rangeFormatting")]
    property range_formatting : DocumentRangeFormattingClientCapabilities?

    @[JSON::Field(key: "onTypeFormatting")]
    property on_type_formatting : DocumentOnTypeFormattingClientCapabilities?

    property rename : RenameClientCapabilities?

    @[JSON::Field(key: "publishDiagnostics")]
    property publish_diagnostics : PublishDiagnosticsClientCapabilities?

    @[JSON::Field(key: "foldingRange")]
    property folding_range : FoldingRangeClientCapabilities?

    @[JSON::Field(key: "selectionRange")]
    property selection_range : SelectionRangeClientCapabilities?

    @[JSON::Field(key: "linkedEditingRange")]
    property linked_editing_range : LinkedEditingRangeClientCapabilities?

    @[JSON::Field(key: "callHierarchy")]
    property call_hierarchy : CallHierarchyClientCapabilities?

    @[JSON::Field(key: "semanticTokens")]
    property semantic_tokens : SemanticTokensClientCapabilities?

    property moniker : MonikerClientCapabilities?

    @[JSON::Field(key: "typeHierarchy")]
    property type_hierarchy : TypeHierarchyClientCapabilities?

    @[JSON::Field(key: "inlineValue")]
    property inline_value : InlineValueClientCapabilities?

    @[JSON::Field(key: "inlayHint")]
    property inlay_hint : InlayHintClientCapabilities?

    property diagnostic : DiagnosticClientCapabilities?
  end
end
