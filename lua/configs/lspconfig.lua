-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
-- local configs = require "lspconfig/configs"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- golang/gopls
lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      analyses = {
        -- fieldalignment = true,
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
      semanticTokens = true,
    },
  },
}

-- golangci-lint
-- if not configs.golangcilsp then
--   configs.golangcilsp = {
--     default_config = {
--       cmd = { "golangci-lint-langserver" },
--       root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
--       init_options = {
--         command = { "golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1", "--allow-parallel-runners" },
--       },
--     },
--   }
-- end
--
-- lspconfig.golangci_lint_ls.setup {
--   filetypes = { "go", "gomod" },
-- }

-- Configure the Terraform LSP
lspconfig.terraformls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  filetypes = { "terraform", "tf", "hcl" },
  settings = {
    terraform = {
      -- Example: enable specific analyses or features
      experimentalFeatures = {
        validateOnSave = true,
      },
    },
  },
}

-- Docker LSP configuration
lspconfig.dockerls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "dockerfile", "Dockerfile" },
  root_dir = lspconfig.util.root_pattern("Dockerfile", ".git"),
}

-- YAML LSP for Docker Compose
lspconfig.yamlls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    yaml = {
      schemas = {
        -- Docker Compose Schema
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
          "docker-compose.yml",
          "docker-compose.yaml",
        },
      },
      validate = true, -- Enable validation
      format = { enable = true }, -- Enable formatting
      hover = true, -- Enable hover
    },
  },
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
