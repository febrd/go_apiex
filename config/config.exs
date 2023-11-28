import Config

# Setting UP url & APIKEY
config :go_api, GoApi,
cg_base_url: "",
api_key: [
  stock: "",
  regional: "",
  places: ""
 ],
 spv_speed: 0, #milisecond 5000 -> 5 seconds, supervisor speed
 print_url: true #true for optional debugging
