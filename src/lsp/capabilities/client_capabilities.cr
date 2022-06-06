require "json"
require "./*"

module LSP
  # Workspace specific client capabilities.
  struct ClientCapabilities
    include JSON::Serializable

    # The client supports applying batch edits to the workspace by supporting the request
    # 'workspace/applyEdit'
    property workspace : Workspace

    # Text document specific client capabilities.
    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentClientCapabilities?

    # Capabilities specific to the notebook document support.
    @[JSON::Field(key: "notebookDocument")]
    property notebook_document : NotebookDocumentClientCapabilities?

    # Window specific client capabilities.
    property window : Window?

    # General client capabilities.
    property general : General?

    # Experimental client capabilities.
    property experimental : JSON::Any?

    struct Workspace
      include JSON::Serializable

      # The client supports applying batch edits
      # to the workspace by supporting the request
      # 'workspace/applyEdit'
      @[JSON::Field(key: "applyEdit")]
      property apply_edit : Bool?

      # Capabilities specific to `WorkspaceEdit`s
      @[JSON::Field(key: "workspaceEdit")]
      property workspace_edit : WorkspaceEditClientCapabilities?

      # Capabilities specific to the `workspace/didChangeConfiguration` notification.
      @[JSON::Field(key: "didChangeConfiguration")]
      property did_change_configuration : DidChangeConfigurationClientCapabilities?

      # Capabilities specific to the `workspace/didChangeWatchedFiles` notification.
      @[JSON::Field(key: "didChangeWatchedFiles")]
      property did_change_watched_files : DidChangeWatchedFilesClientCapabilities?

      # Capabilities specific to the `workspace/symbol` request.
      property symbol : WorkspaceSymbolClientCapabilities?

      # Capabilities specific to the `workspace/executeCommand` request.
      @[JSON::Field(key: "executeCommand")]
      property execute_command : ExecuteCommandClientCapabilities?

      # The client has support for workspace folders.
      @[JSON::Field(key: "workspaceFolders")]
      property workspace_folders : Bool?

      # The client supports `workspace/configuration` requests.
      property configuration : Bool?

      # Capabilities specific to the semantic token requests scoped to the
      # workspace.
      @[JSON::Field(key: "semanticTokens")]
      property semantic_tokens : SemanticTokensWorkspaceClientCapabilities?

      # Capabilities specific to the code lens requests scoped to the
      # workspace.
      @[JSON::Field(key: "codeLens")]
      property code_lens : CodeLensWorkspaceClientCapabilities?

      # The client has support for file requests/notifications.
      @[JSON::Field(key: "fileOperations")]
      property file_operations : FileOperations?

      # Client workspace capabilities specific to inline values.
      @[JSON::Field(key: "inlineValue")]
      property inline_value : InlineValueWorkspaceClientCapabilities?

      # Client workspace capabilities specific to inlay hints.
      @[JSON::Field(key: "inlayHint")]
      property inlay_hint : InlayHintWorkspaceClientCapabilities?

      # Client workspace capabilities specific to diagnostics.
      property diagnostics : DiagnosticWorkspaceClientCapabilities?

      struct FileOperations
        include JSON::Serializable

        # Whether the client supports dynamic registration for file
        # requests/notifications.
        @[JSON::Field(key: "dynamicRegistration")]
        property dynamic_registration : Bool?

        # The client has support for sending didCreateFiles notifications.
        @[JSON::Field(key: "didCreate")]
        property did_create : Bool?

        # The client has support for sending willCreateFiles requests.
        @[JSON::Field(key: "willCreate")]
        property will_create : Bool?

        # The client has support for sending didRenameFiles notifications.
        @[JSON::Field(key: "didRename")]
        property did_rename : Bool?

        # The client has support for sending willRenameFiles requests.
        @[JSON::Field(key: "willRename")]
        property will_rename : Bool?

        # The client has support for sending didDeleteFiles notifications.
        @[JSON::Field(key: "didDelete")]
        property did_delete : Bool?

        # The client has support for sending willDeleteFiles requests.
        @[JSON::Field(key: "willDelete")]
        property will_delete : Bool?
      end
    end

    struct Window
      include JSON::Serializable

      # It indicates whether the client supports server initiated
      # progress using the `window/workDoneProgress/create` request.
      #
      # The capability also controls Whether client supports handling
      # of progress notifications. If set servers are allowed to report a
      # `workDoneProgress` property in the request specific server
      # capabilities.
      @[JSON::Field(key: "workDoneProgress")]
      property work_done_progress : Bool?

      # Capabilities specific to the showMessage request
      @[JSON::Field(key: "showMessage")]
      property show_message : ShowMessageRequestClientCapabilities?

      # Client capabilities for the show document request.
      @[JSON::Field(key: "showDocument")]
      property show_document : ShowDocumentClientCapabilities?
    end

    struct General
      include JSON::Serializable

      # Client capability that signals how the client
      # handles stale requests (e.g. a request
      # for which the client will not process the response
      # anymore since the information is outdated).
      @[JSON::Field(key: "staleRequestSupport")]
      property stale_request_support : StaleRequestSupport?

      # Client capabilities specific to regular expressions.
      @[JSON::Field(key: "regularExpressions")]
      property regular_expressions : RegularExpressionsClientCapabilities?

      # Client capabilities specific to the client's markdown parser.
      property markdown : MarkdownClientCapabilities?

      # The position encodings supported by the client. Client and server
      # have to agree on the same position encoding to ensure that offsets
      # (e.g. character position in a line) are interpreted the same on both
      # side.
      #
      # To keep the protocol backwards compatible the following applies: if
      # the value 'utf-16' is missing from the array of position encodings
      # servers can assume that the client supports UTF-16. UTF-16 is
      # therefore a mandatory encoding.
      #
      # If omitted it defaults to ['utf-16'].
      #
      # Implementation considerations: since the conversion from one encoding
      # into another requires the content of the file / line the conversion
      # is best done where the file is read which is usually on the server
      # side.
      @[JSON::Field(key: "positionEncodings")]
      property position_encodings : Array(PositionEncodingKind)

      struct StaleRequestSupport
        include JSON::Serializable

        # The client will actively cancel the request.
        property cancel : Bool

        # The list of requests for which the client
        # will retry the request if it receives a
        # response with error code `ContentModified``
        @[JSON::Field(key: "retryOnContentModified")]
        property retry_on_content_modified : Array(String)
      end
    end
  end
end
