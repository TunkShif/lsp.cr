require "json"
require "./range"

module LSP
  struct TextEdit
    include JSON::Serializable

    # The range of the text document to be manipulated. To insert
    # text into a document create a range where start === end.
    property range : Range

    # The string to be inserted. For delete operations use an
    # empty string.
    @[JSON::Field(key: "newText")]
    property new_text : String
  end

  # A special text edit with an additional change annotation.
  struct AnnotatedTextEdit
    include JSON::Serializable

    property range : Range
    @[JSON::Field(key: "newText")]
    property new_text : String

    # The actual annotation identifier.
    # An identifier referring to a change annotation managed by a workspace
    # edit
    @[JSON::Field(key: "annotationId")]
    property annotation_id : String
  end

  alias ChangeAnnotationIdentifier = String

  # Additional information that describes document changes.
  struct ChangeAnnotation
    include JSON::Serializable

    # A human-readable string describing the actual change. The string
    # is rendered prominent in the user interface.
    property label : String

    # A flag which indicates that user confirmation is needed
    # before applying the change.
    @[JSON::Field(key: "needsConfirmation")]
    property needs_confirmation : Bool?

    # A human-readable string which is rendered less prominent in
    # the user interface.
    property description : String
  end
end
