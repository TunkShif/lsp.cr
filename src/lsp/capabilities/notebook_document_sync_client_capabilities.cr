require "json"

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
end
