import Config

# Setting UP url & APIKEY
config :go_api, GoApi,
cg_base_url: "https://api.goapi.io/",
api_key: [
  stock: "YOUR_STOCK_APIKEY",
  regional: "YOUR_REGIONAL_APIKEY",
  places: "YOUR_PLACES_APIKEY"
],
 spv_speed: 5000, #milisecond 5000 -> 5 seconds, supervisor speed
 print_url: false #true for optional debugging
