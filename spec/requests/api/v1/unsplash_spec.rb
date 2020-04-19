require 'rails_helper'

RSpec.describe 'Unsplash API' do
  it 'returns an image url from a city input' do
    city = 'denver,co'
    get "/api/v1/backgrounds?location=#{city}"

    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(image[:attributes].keys).to eq([:url])
  end
end
