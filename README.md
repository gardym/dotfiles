### There's no place like $HOME - Elixir edition

    $ bash install.sh

    # Or if you already have some dotfiles, then force it
    $ bash install.sh -f

### VIM

I had issues getting ElixirLS to start, so I followed the instructions [here](https://github.com/elixir-lsp/coc-elixir#troubleshooting)
to build my own language server. If you don't want to do this you can always delete the following line from
`~/.vim/coc-settings.json`:

      "elixir.pathToElixirLS": "~/.elixir-ls/release/language_server.sh",

Install all the VIM plugins

    :PlugInstall
    :CocInstall coc-elixir
