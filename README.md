# AstroNvim Template

**NOTE:** This is for AstroNvim v6 on Neovim 0.12+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## Requirements

CLI tools are installed with Homebrew and found on `$PATH`. Mason is configured to install nothing (see `lua/plugins/mason.lua`), so Neovim never downloads duplicate copies of these tools.

```shell
brew install tree-sitter-cli lua-language-server yaml-language-server ruff cue stylua selene
```

- `tree-sitter-cli` compiles parsers for nvim-treesitter (`main` branch).
- `lua-language-server`, `yaml-language-server`, `ruff`, and `cue` (`cue lsp`) are the language servers listed in `lua/plugins/astrolsp.lua`.
- `stylua` and `selene` format and lint this configuration.
- Optional: `go install github.com/asdine/cueimports@latest` for CUE import management; otherwise `cue fmt` is used.

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```
