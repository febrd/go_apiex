defmodule GoApi.Regional do


  import GoApi.Conf
  @api_key_regional api_key_regional() # Mendefinisikan atribut module api_key


   @moduledoc """
  Get regional data for Indonesia.
  """
  def province do
    get_api_params("regional/provinsi?api_key=#{@api_key_regional}")
  end

  def city(province_id \\ 1) do
    get_api_params("regional/kota?provinsi_id=#{province_id}&api_key=#{@api_key_regional}")
  end

  def district(city_id \\ 11.01) do
    get_api_params("regional/kecamatan?kota_id=#{city_id}&api_key=#{@api_key_regional}")
  end

  def sub_district(district_id \\ "11.01.01") do
    get_api_params("regional/kelurahan?kecamatan_id=#{district_id}&api_key=#{@api_key_regional}")
  end



end
