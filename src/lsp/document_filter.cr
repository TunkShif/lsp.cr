require "json"

module LSP

  alias DocumentSelector = Array(DocumentFilter)

  struct DocumentFilter
    include JSON::Serializable

    # A language id, like `typescript`.
    property language : String?

    # A Uri [scheme](#Uri.scheme), like `file` or `untitled`.
    property scheme : String?

    # A glob pattern, like `*.{ts,js}`.
    #
    # Glob patterns can have the following syntax:
    # - `*` to match one or more characters in a path segment
    # - `?` to match on one character in a path segment
    # - `**` to match any number of path segments, including none
    # - `{}` to group sub patterns into an OR expression. (e.g. `**​/*.{ts,js}`
    #   matches all TypeScript and JavaScript files)
    # - `[]` to declare a range of characters to match in a path segment
    #   (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
    # - `[!...]` to negate a range of characters to match in a path segment
    #   (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but
    #   not `example.0`)
    property pattern : String?
  end
end
