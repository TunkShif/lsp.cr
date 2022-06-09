require "json"

module LSP
  struct ApplyWorkspaceEditParams
    include JSON::Serializable

    # An optional label of the workspace edit. This label is
    # presented in the user interface for example on an undo
    # stack to undo the workspace edit.
    property label : String?

    # The edits to apply.
    property edit : WorkspaceEdit
  end

  struct ApplyWorkspaceEditResult
    include JSON::Serializable

    # Indicates whether the edit was applied or not.
    property applied : Bool

    # An optional textual description for why the edit was not applied.
    # This may be used by the server for diagnostic logging or to provide
    # a suitable error for a request that triggered the edit.
    @[JSON::Field(key: "failureReason")]
    property failure_reason : String?

    # Depending on the client's failure handling strategy `failedChange`
    # might contain the index of the change that failed. This property is
    # only available if the client signals a `failureHandling` strategy
    # in its client capabilities.
    @[JSON::Field(key: "failedChange")]
    property failed_change : UInt32?
  end
end
