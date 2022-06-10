require "json"

module LSP
  struct DidChangeWatchedFilesParams
    include JSON::Serializable

    # The actual file events.
    property changes : Array(FileEvent)
  end

  # An event describing a file change.
  struct FileEvent
    include JSON::Serializable

    # The file's URI.
    property uri : String
    # The change type.
    @[JSON::Field(converter: Enum::ValueConverter(LSP::FileChangeType))]
    property type : FileChangeType
  end

  # The file event type.
  enum FileChangeType
    # The file got created.
    Created = 1
    # The file got changed.
    Changed = 2
    # The file got deleted.
    Deleted = 3
  end
end
