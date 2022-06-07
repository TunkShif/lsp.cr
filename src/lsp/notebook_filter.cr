require "json"

module LSP
  # A notebook cell text document filter denotes a cell text
  # document by different properties.
  struct NotebookCellTextDocumentFilter
    include JSON::Serializable

    # A filter that matches against the notebook
    # containing the notebook cell. If a string
    # value is provided it matches against the
    # notebook type. '*' matches every notebook.
    property notebook : String | NotebookDocumentFilter

    # A language id like `python`.
    #
    # Will be matched against the language id of the
    # notebook cell document. '*' matches every language.
    property language : String?
  end

  # A notebook document filter denotes a notebook document by
  # different properties.
  struct NotebookDocumentFilter
    include JSON::Serializable

    # The type of the enclosing notebook.
    @[JSON::Field(key: "notebookType")]
    property notebook_type : String?

    # A Uri [scheme](#Uri.scheme), like `file` or `untitled`.
    property scheme : String?

    # A glob pattern.
    property pattern : String?
  end
end
