require "json"
require "../file_system_watcher"

module LSP
  struct DidChangeWatchedFilesClientCapabilities
    include JSON::Serializable

    # Did change watched files notification supports dynamic registration.
    # Please note that the current protocol doesn't support static
    # configuration for file changes from the server side.
    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    # Whether the client has support for relative patterns
    # or not.
    @[JSON::Field(key: "relativePatternSupport")]
    property relative_pattern_support : Bool?
  end

  # Describe options to be used when registering for file system change events.
  struct DidChangeWatchedFilesRegistrationOptions
    include JSON::Serializable

    # The watchers to register.
    property watchers : Array(FileSystemWatcher)
  end
end
