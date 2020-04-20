require 'rails_helper'

describe 'Forecast' do
  it 'sends forecast data to a city' do
    location = "denver,co"

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(forecast).to have_key(:attributes)
    expect(forecast[:attributes]).to have_key(:current)
    expect(forecast[:attributes]).to have_key(:hourly)
    expect(forecast[:attributes]).to have_key(:daily)
    expect(forecast[:attributes][:daily].nil?).to eq(false)
    expect(forecast[:attributes][:current].nil?).to eq(false)
    expect(forecast[:attributes][:hourly].nil?).to eq(false)
  end
end
