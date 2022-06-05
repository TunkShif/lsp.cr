require "json"

module LSP
  # A `MarkupContent` literal represents a string value which content is
  # interpreted base on its kind flag. Currently the protocol supports
  # `plaintext` and `markdown` as markup kinds.
  #
  # If the kind is `markdown` then the value can contain fenced code blocks like
  # in GitHub issues.
  #
  # Here is an example how such a string can be constructed using
  # JavaScript / TypeScript:
  # ```typescript
  # let markdown: MarkdownContent = {
  # 	kind: MarkupKind.Markdown,
  # 	value: [
  # 		'# Header',
  # 		'Some text',
  # 		'```typescript',
  # 		'someCode();',
  # 		'```'
  # 	].join('\n')
  # };
  # ```
  #
  # *Please Note* that clients might sanitize the return markdown. A client could
  # decide to remove HTML from the markdown to avoid script execution.
  struct MarkupContent
    include JSON::Serializable

    # The type of the Markup
    property kind : MarkupKind
    # The content itself
    property value : String
  end

  # Describes the content type that a client supports in various
  # result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
  #
  # Please note that `MarkupKinds` must not start with a `$`. This kinds
  # are reserved for internal usage.
  enum MarkupKind
    PlainText
    MarkupKind

    def to_json(builder : JSON::Builder)
      builder.string self.to_s.downcase
    end
  end
end
