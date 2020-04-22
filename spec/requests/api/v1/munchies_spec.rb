require 'rails_helper'

RSpec.describe 'munchies endpoint' do
  it 'can retrieve all wanted data' do
    start = 'denver,co'
    finish = 'pueblo,co'
    food = 'chinese'

    get "/api/v1/munchies?start=#{start}&end=#{finish}&food=#{food}"

    expect(response).to be_successful

    munchie_data = JSON.parse(response.body, symbolize_names: true)

    expect(munchie_data[:data][:type]).to eq('munchie')
    expect(munchie_data[:data][:attributes].keys).to eq([:end_location, :travel_time, :forecast, :restaurant])
    expect(munchie_data[:data][:attributes][:restaurant].keys).to eq([:name, :address])
  end
end
