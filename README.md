# SimpleServer

HTTP server in Elixir that pulls latest articles from Hacker News and outputs in a `latestl` JSON endpoint. 
Also allows submission of additional links to be included in the `latest` endpoint.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `simple_server` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:simple_server, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/simple_server](https://hexdocs.pm/simple_server).
