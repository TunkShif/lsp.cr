# lsp.cr

**WORK IN PROGRESS**

[Language Server Protocol][0] specification implemented in Crystal.

Current Progress:

- TODO: add missing language features related definition
- TODO: add initialize method for strcuts in need
- TO BE FIXED: enum json converter

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
