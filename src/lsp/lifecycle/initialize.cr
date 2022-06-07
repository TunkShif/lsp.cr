require "json"
require "../workspace_folder"
require "../trace_value"
require "../work_done_progress"
require "../capabilities/client_capabilities"

module LSP
  struct InitializeParams
    include WorkDoneProgressParams
    include JSON::Serializable

    # The process Id of the parent process that started the server. Is null if
    # the process has not been started by another process. If the parent
    # process is not alive then the server should exit (see exit notification)
    # its process.
    @[JSON::Field(key: "processId")]
    property process_id : Int32?

    # Information about the client
    @[JSON::Field(key: "clientInfo")]
    property client_info : NamedTuple(name: String, version: String?)?

    # The locale the client is currently showing the user interface
    # in. This must not necessarily be the locale of the operating
    # system.
    #
    # Uses IETF language tags as the value's syntax
    # (See https://en.wikipedia.org/wiki/IETF_language_tag)
    property locale : String?

    # The rootPath of the workspace. Is null
    # if no folder is open.
    # @deprecated in favour of `rootUri`.
    @[JSON::Field(key: "rootPath")]
    property root_path : String?

    # The rootUri of the workspace. Is null if no
    # folder is open. If both `rootPath` and `rootUri` are set
    # `rootUri` wins.
    # @deprecated in favour of `workspaceFolders`
    @[JSON::Field(key: "rootUri")]
    property root_uri : String?

    # User provided initialization options.
    @[JSON::Field(key: "initializationOptions")]
    property initialization_options : JSON::Any?

    # The capabilities provided by the client (editor or tool)
    property capabilities : ClientCapabilities

    # The initial trace setting. If omitted trace is disabled ('off').
    property trace : TraceValue?

    # The workspace folders configured in the client when the server starts.
    # This property is only available if the client supports workspace folders.
    # It can be `null` if the client supports workspace folders but none are
    # configured.
    property workspace_folders : Array(WorkspaceFolder)?
  end

  struct InitializeResult
    include JSON::Serializable

    # The capabilities the language server provides.
    property capabilities : ServerCapabilities

    # Information about the server.
    @[JSON::Field(key: "serverInfo")]
    property server_info : NamedTuple(name: String, version: String?)?
  end

  # Indicates whether the client execute the following retry logic:
  # (1) show the message provided by the ResponseError to the user
  # (2) user selects retry or cancel
  # (3) if user selected retry the initialize method is sent again.
  struct InitializeError
    include JSON::Serializable

    property retry : Bool
  end
end
