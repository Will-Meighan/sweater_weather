require 'rails_helper'

RSpec.describe 'user registration' do
  it 'can register a new user' do
    post '/api/v1/users', params:{
      email: 'will@gmail.com',
      password: 'password',
      password_confrimation: 'password'
     }

    expect(response).to be_successful
    will = User.last

    expect(response.status).to eq(201)

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response[:data][:attributes][:api_key]).to eq(will.api_key)
  end

  it 'will not register with an email already in use' do
    post '/api/v1/users', params:{
      email: 'will@gmail.com',
      password: 'password',
      password_confirmation: 'password'
     }

     will = User.last

     post '/api/v1/users', params: {
      email: 'will@gmail.com',
      password: 'password',
      password_confirmation: 'password'
     }

     message = JSON.parse(response.body)

     expect(response.status).to eq(400)
     expect(User.count).to eq(1)
     expect(User.first.api_key).to eq(will.api_key)
     expect(message['email']).to eq(['has already been taken'])
  end

  it 'will not register if passwords do not match' do
    post '/api/v1/users', params:{
      email: 'will@gmail.com',
      password: 'password',
      password_confirmation: 'kjdfjkndjfnwejdfkj'
     }

     expect(response.status).to eq(400)

     message = JSON.parse(response.body)

     expect(message['password_confirmation'][0]).to eq("doesn't match Password")
  end
end

RSpec.describe 'As a registered user' do
  before :each do
    post '/api/v1/users', params:{
      email: 'will@gmail.com',
      password: 'password',
      password_confirmation: 'password'
     }

     @will = User.last
  end

  it 'I can login with good credentials' do
    post '/api/v1/sessions', params: {
      email: 'will@gmail.com',
      password: 'password'
    }

    expect(response.status).to eq(200)

    session = JSON.parse(response.body)['data']['attributes']
    expect(session['api_key']).to eq(@will.api_key)
  end

  it 'I cannot login with wrong email or password' do
    post '/api/v1/sessions', params: {
      email: 'will@gmail.com',
      password: 'password1'
    }

    expect(response.status).to eq(401)

    message = JSON.parse(response.body)
    expect(message['error']).to eq('Bad credentials')
  end
end
