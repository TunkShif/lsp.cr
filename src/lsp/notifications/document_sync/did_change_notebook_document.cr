require "json"
require "./did_change_text_document"
require "../../notebook_document"
require "../../document_filter"

module LSP
  # The params sent in a change notebook document notification.
  struct DidChangeNotebookDocumentParams
    include JSON::Serializable

    # The notebook document that did change. The version number points
    # to the version after all provided changes have been applied.
    @[JSON::Field(key: "notebookDocument")]
    property notebook_document : VersionedNotebookDocumentIdentifier

    # The actual changes to the notebook document.
    #
    # The change describes single state change to the notebook document.
    # So it moves a notebook document, its cells and its cell text document
    # contents from state S to S'.
    #
    # To mirror the content of a notebook using change events use the
    # following approach:
    # - start with the same initial content
    # - apply the 'notebookDocument/didChange' notifications in the order
    #   you receive them.
    property change : NotebookDocumentChangeEvent
  end

  # A change event for a notebook document.
  struct NotebookDocumentChangeEvent
    include JSON::Serializable

    # The changed meta data if any.
    property metadata : JSON::Any?
    # Changes to cells
    property cells : Array(Cell)?

    struct Cell
      include JSON::Serializable

      # Changes to the cell structure to add or
      # remove cells.
      property structure : Structure?

      # Changes to notebook cells properties like its
      # kind, execution summary or metadata.
      property data : NotebookCell?

      # Changes to the text content of notebook cells.
      @[JSON::Field(key: "textContent")]
      property textContent : Array(TextContent)

      struct Structure
        include JSON::Serializable

        # The change to the cell array.
        property array : NotebookCellArrayChange

        #  Additional opened cell text documents.
        @[JSON::Field(key: "didOpen")]
        property did_open : Array(TextDocumentItem)?

        # Additional closed cell text documents.
        @[JSON::Field(key: "didClose")]
        property did_close : Array(TextDocumentIdentifier)?
      end

      struct TextContent
        include JSON::Serializable

        property document : TextDocumentIdentifier
        property changes : (TextDocumentContentChangeEvent)
      end
    end
  end

  # A change describing how to move a `NotebookCell`
  # array from state S to S'.
  struct NotebookCellArrayChange
    include JSON::Serializable
    # The start oftest of the cell that changed.
    property start : UInt32

    # The deleted cells
    @[JSON::Field(key: "deleteCount")]
    property delete_count : UInt32

    # The new cells, if any
    property cells : Array(NotebookCell)?
  end
end
