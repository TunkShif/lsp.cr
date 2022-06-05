require "json"
require "./text_edit"

module LSP
  # Options to create a file.
  struct CreateFileOptions
    include JSON::Serializable

    # Overwrite existing file. Overwrite wins over `ignoreIfExists`
    property overwrite : Bool?

    # Ignore if exists.
    @[JSON::Field(key: "ignoreIfExists")]
    property ignore_if_exists : Bool?
  end

  # Create file operation
  struct CreateFile
    include JSON::Serializable

    getter kind = "create"

    # The resource to create.
    property uri : String
    # An optional annotation identifier describing the operation.
    property options : CreateFileOptions?

    # An optional annotation identifier describing the operation.
    @[JSON::Field(key: "annotationId")]
    property annotation_id : ChangeAnnotationIdentifier?
  end

  # Rename file options
  struct RenameFileOptions
    include JSON::Serializable

    # Overwrite existing file. Overwrite wins over `ignoreIfExists`
    property overwrite : Bool?
    @[JSON::Field(key: "ignoreIfExists")]

    # Ignore if exists.
    property ignore_if_exists : Bool?
  end

  # Rename file operation
  struct RenameFile
    include JSON::Serializable

    getter kind = "rename"

    # The old (existing) location.
    @[JSON::Field(key: "oldUri")]
    property old_url : String

    # The new location.
    @[JSON::Field(key: "newUri")]
    property new_uri : String

    # Rename options.
    property options : RenameFileOptions?

    # An optional annotation identifier describing the operation.
    @[JSON::Field(key: "annotationId")]
    property annotation_id : ChangeAnnotationIdentifier?
  end

  # Delete file options
  struct DeleteFileOptions
    include JSON::Serializable

    # Delete the content recursively if a folder is denoted.
    property recursive : Bool?

    # Ignore the operation if the file doesn't exist.
    @[JSON::Field(key: "ignoreIfNotExists")]
    property ignore_if_not_exists : Bool?
  end

  # Delete file operation
  struct DeleteFile
    include JSON::Serializable

    getter kind = "delete"

    # The file to delete.
    property uri : String

    # Delete options.
    property options : DeleteFileOptions?

    # An optional annotation identifier describing the operation.
    @[JSON::Field(key: "annotationId")]
    property annotation_id : ChangeAnnotationIdentifier?
  end
end
