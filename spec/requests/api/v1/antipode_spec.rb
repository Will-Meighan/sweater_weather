require 'rails_helper'

describe 'Forecast API' do
  it 'sends forecast information of a place' do

    get '/api/v1/antipode?location=hongkong'

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(forecast[:data][:type]).to eq("antipode_weather")
    expect(forecast[:data][:attributes]).to have_key(:location_name)
    expect(forecast[:data][:attributes]).to have_key(:forecast)
    expect(forecast[:data][:attributes]).to have_key(:search_location)
    expect(forecast[:data][:attributes][:forecast]).to have_key(:summary)
    expect(forecast[:data][:attributes][:forecast]).to have_key(:current_temperature)
  end
end
