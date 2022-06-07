require "json"
require "../text_document"
require "../notebook_document"

module LSP
  # The params sent in a open notebook document notification.
  struct DidOpenNotebookDocumentParams
    include JSON::Serializable

    # The notebook document that got opened.
    @[JSON::Field(key: "notebookDocument")]
    property notebook_document : NotebookDocument

    # The text documents that represent the content
    # of a notebook cell.
    @[JSON::Field(key: "cellTextDocuments")]
    property cell_text_documents : Array(TextDocumentItem)
  end
end
