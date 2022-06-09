require "json"
require "../range"

module LSP
  # Params to show a document.
  struct ShowDocumentParams
    include JSON::Serializable

    # The document uri to show.
    property uri : String
    # Indicates to show the resource in an external program.
    # To show for example `https://code.visualstudio.com/`
    # in the default WEB browser set `external` to `true`.
    property external : Bool?

    # An optional property to indicate whether the editor
    # showing the document should take focus or not.
    # Clients might ignore this property if an external
    # program is started.
    @[JSON::Field(key: "takeFocus")]
    property take_focus : Bool?

    # An optional selection range if the document is a text
    # document. Clients might ignore the property if an
    # external program is started or the file is not a text
    # file.
    property selection : Range?
  end

  # The result of an show document request.
  struct ShowDocumentResult
    include JSON::Serializable

    # A boolean indicating if the show was successful.
    property success : Bool
  end
end
