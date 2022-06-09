require "json"
require "../notebook_document"

module LSP
  # The params sent in a save notebook document notification.
  struct DidSaveNotebookDocumentParams
    include JSON::Serializable

    # The notebook document that got saved.
    @[JSON::Field(key: "notebookDocument")]
    property notebook_document : NotebookDocumentIdentifier
  end
end
