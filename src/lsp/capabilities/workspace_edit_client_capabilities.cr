require "json"

module LSP
  struct WorkspaceEditClientCapabilities
    include JSON::Serializable

    # The client supports versioned document changes in `WorkspaceEdit`s
    @[JSON::Field(key: "documentChanges")]
    property document_changes : Bool?

    # The resource operations the client supports. Clients should at least
    # support 'create', 'rename' and 'delete' files and folders.
    @[JSON::Field(key: "resourceOperations")]
    property resource_operations : Array(ResourceOperationKind)?

    # The failure handling strategy of a client if applying the workspace edit fails.
    @[JSON::Field(key: "failureHandling")]
    property failure_handling : FailureHandlingKind?

    # Whether the client normalizes line endings to the client specific
    # setting.
    # If set to `true` the client will normalize line ending characters
    # in a workspace edit to the client specific new line character(s).
    @[JSON::Field(key: "normalizesLineEndings")]
    property normalizes_line_endings : Bool?

    # Whether the client in general supports change annotations on text edits,
    # create file, rename file and delete file changes.
    @[JSON::Field(key: "changeAnnotationSupport")]
    property change_annotation_support : ChangeAnnotationSupport?

    struct ChangeAnnotationSupport
      include JSON::Serializable

      # Whether the client groups edits with equal labels into tree nodes,
      # for instance all edits labelled with "Changes in Strings" would
      # be a tree node.
      @[JSON::Field(key: "groupsOnLabel")]
      property groups_on_label : Bool?
    end
  end

  enum ResourceOperationKind
    Create
    Rename
    Delete

    def to_json(builder : JSON::Builder)
      builder.string self.to_s.downcase
    end
  end

  enum FailureHandlingKind
    Abort
    Transactional
    Undo
    TextOnlyTransactional

    def to_json(builder : JSON::Builder)
      builder.string self.to_s.camelcase(lower: true)
    end
  end
end
