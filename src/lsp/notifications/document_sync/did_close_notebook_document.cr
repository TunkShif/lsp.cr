require "json"
require "../../text_document"
require "../../notebook_document"

module LSP
  # The params sent in a close notebook document notification.
  struct DidCloseNotebookDocumentParams
    include JSON::Serializable

    # The notebook document that got closed.
    @[JSON::Field(key: "notebookDocument")]
    property notebook_document : NotebookDocumentIdentifier

    # The text documents that represent the content
    # of a notebook cell that got closed.
    @[JSON::Field(key: "cellTextDocuments")]
    property cell_text_documents : Array(TextDocumentIdentifier)
  end
end
