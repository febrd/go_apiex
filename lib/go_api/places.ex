defmodule GoApi.Places do

  import GoApi.Conf
  @api_key_places api_key_places() # Mendefinisikan atribut module api_key

 @moduledoc """
  Search for specific places in Indonesia and retrieve coordinates.
  """
  def find(area \\ "jawa") do
    get_api_params("places?search=#{area}&api_key=#{@api_key_places}")
  end

end
