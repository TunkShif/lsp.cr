require "json"
require "../notebook_document"

module LSP
  # Notebook specific client capabilities.
  struct NotebookDocumentSyncClientCapabilities
    include JSON::Serializable

    # Whether implementation supports dynamic registration. If this is
    # set to `true` the client supports the new
    # `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    # return value for the corresponding server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    # The client supports sending execution summary data per cell.
    @[JSON::Field(key: "executionSummarySupport")]
    property execution_summary_support : Bool?
  end

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

  struct NotebookDocumentSyncRegistrationOptions
    include NotebookDocumentSyncOptions
    include StaticRegistrationOptions
    include JSON::Serializable
  end
end
