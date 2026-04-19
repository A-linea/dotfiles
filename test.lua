local util = require("lspconfig.util")
print(util.root_pattern("tailwind.config.js", "tailwind.config.ts")(vim.loop.cwd()))
