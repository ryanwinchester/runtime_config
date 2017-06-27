# RuntimeConfig

Load config values at runtime and can handle config values like `{:system, "ENV_NAME"}`.

## Installation

The package can be installed by adding `runtime_config` to your list of
dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:runtime_config, "~> 0.1.0"},
  ]
end
```

## Usage

```elixir
my_val = Config.get_env(:my_app, :my_key)
```
