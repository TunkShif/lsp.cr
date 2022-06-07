require "json"
require "./registration"
require "./notebook_filter"

module LSP
  # Options specific to a notebook plus its cells
  # to be synced to the server.
  #
  # If a selector provider a notebook document
  # filter but no cell selector all cells of a
  # matching notebook document will be synced.
  #
  # If a selector provides no notebook document
  # filter but only a cell selector all notebook
  # document that contain at least one matching
  # cell will be synced.
  module NotebookDocumentSyncOptions
    # The notebooks to be synced
    property notebookSelector : Array(NotebookSelector)
    # Whether save notification should be forwarded to
    # the server. Will only be honored if mode === `notebook`.
    property save : Bool?
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

  struct NotebookDocumentSyncRegistrationOptions
    include NotebookDocumentSyncOptions
    include StaticRegistrationOptions
    include JSON::Serializable
  end
end
