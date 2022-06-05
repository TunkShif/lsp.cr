require "json"
require "../position"

module LSP
  struct ServerCapabilities
    include JSON::Serializable

    # The position encoding the server picked from the encodings offered
    # by the client via the client capability `general.positionEncodings`.
    #
    # If the client didn't provide any position encodings the only valid
    # value that a server can return is 'utf-16'.
    #
    # If omitted it defaults to 'utf-16'.
    @[JSON::Field(key: "positionEncoding")]
    property position_encoding : PositionEncodingKind?

    # Defines how text documents are synced. Is either a detailed structure
    # defining each notification or for backwards compatibility the
    # TextDocumentSyncKind number. If omitted it defaults to
    # `TextDocumentSyncKind.None`.
    @[JSON::Field(key: "textDocumentSync")]
    property text_document_sync : (TextDocumentSyncOptions | TextDocumentSyncKind)?

    # Defines how notebook documents are synced.
    @[JSON::Field(key: "notebookDocumentSync")]
    property notebook_document_sync : (NoteBookDocumentSyncOptions | NotebookDocumentsSyncRegistrationOptions)?

    # The server provides completion support.
    @[JSON::Field(key: "completionProvider")]
    property completion_provider : CompletionOptions?

    # The server provides hover support.
    @[JSON::Field(key: "hoverProvider")]
    property hover_provider : (Bool | HoverOptions)?

    # The server provides signature help support.
    @[JSON::Field(key: "signatureHelpProvider")]
    property signature_help_provider : SignatureHelpOptions?

    # The server provides go to declaration support.
    @[JSON::Field(key: "declarationProvider")]
    property declaration_provider : (Bool | DeclarationOptions | DeclarationRegistrationOptions)?

    # The server provides goto definition support.
    @[JSON::Field(key: "definitionProvider")]
    property definition_provider : (Bool | DefinitionOptions)?

    # The server provides goto type definition support.
    @[JSON::Field(key: "typeDefinitionProvider")]
    property type_definition_provider : (Bool | TypeDefinitionOptions | TypeDefinitionRegistrationOptions)?

    # The server provides goto implementation support.
    @[JSON::Field(key: "implementationProvider")]
    property implementation_provider : (Bool | ImplementationOptions | ImplementationRegistrationOptions)?

    # The server provides find references support.
    @[JSON::Field(key: "referencesProvider")]
    property references_provider : (Bool | ReferenceOptions)?

    # The server provides document highlight support.
    @[JSON::Field(key: "documentHighlightProvider")]
    property document_highlight_provider : (Bool | DocumentHighlightOptions)?

    # The server provides document symbol support.
    @[JSON::Field(key: "documentSymbolProvider")]
    property document_symbol_provider : (Bool | DocumentSymbolOptions)?

    # The server provides code actions. The `CodeActionOptions` return type is
    # only valid if the client signals code action literal support via the
    # property `textDocument.codeAction.codeActionLiteralSupport`.
    @[JSON::Field(key: "codeActionProvider")]
    property code_action_provider : (Bool | CodeActionOptions)?

    # The server provides code lens.
    @[JSON::Field(key: "codeLensProvider")]
    property code_lens_provider : CodeLensOptions?

    # The server provides document link support.
    @[JSON::Field(key: "documentLinkProvider")]
    property document_link_provider : DocumentLinkOptions?

    # The server provides color provider support.
    @[JSON::Field(key: "colorProvider")]
    property color_provider : (Bool | DocumentColorOptions | DocumentColorRegistrationOptions)?

    # The server provides document formatting.
    @[JSON::Field(key: "documentFormattingProvider")]
    property document_formatting_provider : (Bool | DocumentFormattingOptions)?

    # The server provides document range formatting.
    @[JSON::Field(key: "documentRangeFormattingProvider")]
    property document_range_formatting_provider : (Bool | DocumentRangeFormattingOptions)?

    # The server provides document formatting on typing.
    @[JSON::Field(key: "documentOnTypeFormattingProvider")]
    property document_on_type_formatting_provider : DocumentOnTypeFormattingOptions?

    # The server provides rename support. RenameOptions may only be
    # specified if the client states that it supports
    # `prepareSupport` in its initial `initialize` request.
    @[JSON::Field(key: "renameProvider")]
    property rename_provider : (Bool | RenameOptions)?

    # The server provides folding provider support.
    @[JSON::Field(key: "foldingRangeProvider")]
    property folding_range_provider : (Bool | FoldingRangeOptions | FoldingRangeRegistrationOptions)?

    # The server provides execute command support.
    @[JSON::Field(key: "executeCommandProvider")]
    property execute_command_provider : ExecuteCommandOptions?

    # The server provides selection range support.
    @[JSON::Field(key: "selectionRangeProvider")]
    property selection_range_provider : (Bool | SelectionRangeOptions | SelectionRangeRegistrationOptions)?

    # The server provides linked editing range support.
    @[JSON::Field(key: "linkedEditingRangeProvider")]
    property linked_editing_range_provider : (Bool? | LinkedEditingRangeOptions | LinkedEditingRangeRegistrationOptions)?

    # The server provides call hierarchy support.
    @[JSON::Field(key: "callHierarchyProvider")]
    property call_hierarchy_provider : (Bool | CallHierarchyOptions | CallHierarchyRegistrationOptions)?

    # The server provides semantic tokens support.
    @[JSON::Field(key: "semanticTokensProvider")]
    property semantic_tokens_provider : (SemanticTokensOptions | SemanticTokensRegistrationOptions)

    # Whether server provides moniker support.
    @[JSON::Field(key: "monikerProvider")]
    property moniker_provider : (Bool | MonikerOptions | MonikerRegistrationOptions)?

    # The server provides type hierarchy support.
    @[JSON::Field(key: "typeHierarchyProvider")]
    property type_hierarchy_provider : (Bool | TypeHierarchyOptions | TypeHierarchyRegistrationOptions)?

    # The server provides inline values.
    @[JSON::Field(key: "inlineValueProvider")]
    property inline_value_provider : (Bool | InlineValueOptions | InlineValueRegistrationOptions)?

    # The server provides inlay hints.
    @[JSON::Field(key: "inlayHintProvider")]
    property inlay_hint_provider : (Bool | InlayHintOptions | InlayHintRegistrationOptions)?

    # The server has support for pull model diagnostics.
    @[JSON::Field(key: "diagnosticProvider")]
    property diagnostic_provider : (DiagnosticOptions | DiagnosticRegistrationOptions)?

    # The server provides workspace symbol support.
    @[JSON::Field(key: "workspaceSymbolProvider")]
    property workspace_symbol_provider : (Bool | WorkspaceSymbolOptions)?

    # Workspace specific server capabilities
    property workspace : Workspace

    property experimental : JSON::Any?

    struct Workspace
      include JSON::Serializable

      # The server supports workspace folder.
      @[JSON::Field(key: "workspaceFolders")]
      property workspace_folders : WorkspaceFoldersServerCapabilities?

      # The server is interested in file notifications/requests.
      @[JSON::Field(key: "fileOperations")]
      property file_operations : FileOperations?

      struct FileOperations
        include JSON::Serializable

        @[JSON::Field(key: "didCreate")]
        property did_create : FileOperationRegistrationOptions?

        @[JSON::Field(key: "willCreate")]
        property will_create : FileOperationRegistrationOptions?

        @[JSON::Field(key: "didRename")]
        property did_rename : FileOperationRegistrationOptions?

        @[JSON::Field(key: "willRename")]
        property will_rename : FileOperationRegistrationOptions?

        @[JSON::Field(key: "didDelete")]
        property did_delete : FileOperationRegistrationOptions?

        @[JSON::Field(key: "willDelete")]
        property will_delete : FileOperationRegistrationOptions?
      end
    end
  end
end
