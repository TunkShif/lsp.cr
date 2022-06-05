require "json"

module LSP
  struct MarkdownClientCapabilities
    include JSON::Serializable
    # The name of the parser.
    property parser : String

    # The version of the parser.
    property version : String?

    # A list of HTML tags that the client allows / supports in Markdown.
    @[JSON::Field(key: "allowedTags")]
    property allowed_tags : Array(String)?
  end
end
