# GoApi Hex.pm Package

## Installation
adding `go_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:go_api, "~> 0.1.0"}
  ]
end
```
## Configuration
Adding some configuration in your config/config.exs:
```elixir

  # Setting up URL & APIKEY
  config :go_api, GoApi,
    cg_base_url: "https://api.goapi.io/",
    api_key: [
      stock: "YOUR_STOCK_APIKEY",
      regional: "YOUR_REGIONAL_APIKEY",
      places: "YOUR_PLACES_APIKEY"
    ],
    spv_speed: 5000, #milisecond 5000 -> 5 seconds, supervisor speed
    print_url: false #true for optional debugging
  
```
