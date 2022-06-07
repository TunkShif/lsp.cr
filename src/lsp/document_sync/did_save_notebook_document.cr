require "json"
require "../notebook_document"

module LSP
  # The params sent in a save notebook document notification.
  struct DidSaveNotebookDocumentParams
    include JSON::Serializable

    # The document that will be saved.
    @[JSON::Field(key: "notebookDocument")]
    # The notebook document that got saved.
    property notebook_document: NotebookDocumentIdentifier
  end
end
