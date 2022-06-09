require "json"

module LSP
  # A notebook document
  struct NotebookDocument
    include JSON::Serializable

    # The notebook document's uri.
    property uri : String

    # The type of the notebook.
    @[JSON::Field(key: "notebookType")]
    property notebook_type : String

    # The version number of this document (it will increase after each
    # change, including undo/redo).
    property version : Int32

    # Additional metadata stored with the notebook
    # document.
    property metadata : JSON::Any

    # The cells of a notebook.
    property cells : Array(NotebookCell)
  end

  # A literal to identify a notebook document in the client.
  struct NotebookDocumentIdentifier
    include JSON::Serializable

    # The notebook document's uri.
    property uri : String
  end

  # A versioned notebook document identifier.
  struct VersionedNotebookDocumentIdentifier
    include JSON::Serializable

    # The version number of this notebook document.
    property version : Int32
    # The notebook document's uri.
    property uri : String
  end

  struct NotebookSelector
    include JSON::Serializable

    # The notebook to be synced If a string
    # value is provided it matches against the
    # notebook type. '*' matches every notebook.
    property notebook : (String | NotebookDocumentFilter)?

    # The cells of the matching notebook to be synced.
    property cells : Array(NamedTuple(language: String))
  end

  # A notebook cell.
  #
  # A cell's document URI must be unique across ALL notebook
  # cells and can therefore be used to uniquely identify a
  # notebook cell or the cell's text document.
  struct NotebookCell
    include JSON::Serializable

    # The cell's kind
    @[JSON::Field(converter: Enum::ValueConverter(NotebookCellKind))]
    property kind : NotebookCellKind

    # The URI of the cell's text document
    # content.
    property document : String

    # Additional metadata stored with the cell.
    property metadata : JSON::Any?

    # Additional execution summary information
    # if supported by the client.
    @[JSON::Field(key: "executionSummary")]
    property execution_summary : ExecutionSummary
  end

  enum NotebookCellKind
    Markup = 1
    Code   = 2
  end

  struct ExecutionSummary
    include JSON::Serializable

    # A strict monotonically increasing value
    # indicating the execution order of a cell
    # inside a notebook.
    @[JSON::Field(key: "executionOrder")]
    property execution_order : UInt32

    # Whether the execution was successful or
    # not if known by the client.
    property success : Bool?
  end
end
