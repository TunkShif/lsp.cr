require "json"
require "./text_edit"
require "./text_document"
require "./file_resource_changes"

module LSP
  struct WorkspaceEdit
    include JSON::Serializable

    # Holds changes to existing resources.
    property changes : Hash(String, Array(TextEdit))

    # Depending on the client capability
    # `workspace.workspaceEdit.resourceOperations` document changes are either
    # an array of `TextDocumentEdit`s to express changes to n different text
    # documents where each text document edit addresses a specific version of
    # a text document. Or it can contain above `TextDocumentEdit`s mixed with
    # create, rename and delete file / folder operations.
    #
    # Whether a client supports versioned document edits is expressed via
    # `workspace.workspaceEdit.documentChanges` client capability.
    #
    # If a client neither supports `documentChanges` nor
    # `workspace.workspaceEdit.resourceOperations` then only plain `TextEdit`s
    # using the `changes` property are supported.
    @[JSON::Field(key: "documentChanges")]
    property document_changes : (Array(TextDocumentEdit) | Array(TextDocumentEdit | CreateFile | RenameFile | DeleteFile))?

    # A map of change annotations that can be referenced in
    # `AnnotatedTextEdit`s or create, rename and delete file / folder
    # operations.
    #
    # Whether clients honor this property depends on the client capability
    # `workspace.changeAnnotationSupport`.
    @[JSON::Field(key: "changeAnnotations")]
    property change_annotations : (Hash(ChangeAnnotationIdentifier, ChangeAnnotation))
  end
end
