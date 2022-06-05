require "json"

module LSP
  # Capabilities specific to the notebook document support.
  struct NotebookDocumentClientCapabilities
    include JSON::Serializable

    property synchronization : NotebookDocumentSyncClientCapabilities?
  end
end
