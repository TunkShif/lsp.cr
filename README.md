# lsp.cr

**WORK IN PROGRESS**

[Language Server Protocol][0] specification implemented in Crystal.

Current Progress:

TODO: [Register Capability][1]

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     lsp:
       github: TunkShif/lsp.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "lsp"
```

[0]: https://microsoft.github.io/language-server-protocol/
[1]: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#client_registerCapability
