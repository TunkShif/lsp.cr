require "json"
require "./workspace_folder"

module LSP
  # The glob pattern to watch relative to the base path. Glob patterns can have
  # the following syntax:
  # - `*` to match one or more characters in a path segment
  # - `?` to match on one character in a path segment
  # - `**` to match any number of path segments, including none
  # - `{}` to group conditions (e.g. `**​/*.{ts,js}` matches all TypeScript
  #   and JavaScript files)
  # - `[]` to declare a range of characters to match in a path segment
  #   (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
  # - `[!...]` to negate a range of characters to match in a path segment
  #   (e.g., `example.[!0-9]` to match on `example.a`, `example.b`,
  #   but not `example.0`)
  alias Pattern = String

  # A relative pattern is a helper to construct glob patterns that are matched
  # relatively to a base URI. The common value for a `baseUri` is a workspace
  # folder root, but it can be another absolute URI as well.
  struct RelativePattern
    include JSON::Serializable

    # A workspace folder or a base URI to which this pattern will be matched
    # against relatively.
    @[JSON::Field(key: "baseUri")]
    property base_uri : WorkspaceFolder | String

    # The actual glob pattern;
    property pattern : Pattern
  end

  # The glob pattern. Either a string pattern or a relative pattern.
  alias GlobPattern = Pattern | RelativePattern

  struct FileSystemWatcher
    include JSON::Serializable

    # The glob pattern to watch. See {@link GlobPattern glob pattern}
    # for more detail.
    @[JSON::Field(key: "globPattern")]
    property glob_pattern : GlobPattern

    # The kind of events of interest. If omitted it defaults
    # to WatchKind.Create | WatchKind.Change | WatchKind.Delete
    # which is 7.
    @[JSON::Field(converter: Enum::ValueConverter(WatchKind))]
    property kind : WatchKind?
  end

  enum WatchKind
    # Interested in create events.
    Create = 1
    # Interested in change events
    Change = 2
    # Interested in delete events
    Delete = 4
  end
end
