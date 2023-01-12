require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }
  
  context 'returns a list of names, sorted in alphabetical order' do
    it 'returns "Alice,Joe,Julia,Kieran,Zoe"' do
      response = post '/sort-names', {names: 'Joe,Alice,Zoe,Julia,Kieran'}

      expect(response.status).to eq (200)
      expect(response.body).to eq ('Alice,Joe,Julia,Kieran,Zoe')
    end

    it 'returns "Alice,Joe,Julia,Kieran,Zoe"' do
      response = post '/sort-names', {names: 'Banana,Apple,Strawberry,Orange,Dragonfruit'}

      expect(response.status).to eq (200)
      expect(response.body).to eq ('Apple,Banana,Dragonfruit,Orange,Strawberry')
    end
  end
end










# 03_EXAMPLE Test-driving a Route
# context 'GET /hello' do
#   it 'should return "Hello Leo"' do
#     response = get('/hello?name=Leo')
    
#     expect(response.status).to eq (200)
#     expect(response.body).to eq ('Hello Leo')
#   end

#   it 'should return "Hello Josh"' do
#     response = get('/hello?name=Josh')

#     expect(response.status).to eq (200)
#     expect(response.body).to eq ('Hello Josh')
#   end
# end


# 03_EXERCISE Test-driving a Route
# context 'GET /names' do
#   it 'should return "Julia, Mary, Karim"' do
#     response = get('/names?name1=Julia&name2=Mary&name3=Karim')

#     expect(response.status).to eq (200)
#     expect(response.body).to eq ('Julia, Mary, Karim')
#   end

#   it 'should return "Leo, Josh, Ben"' do
#     response = get('/names?name1=Leo&name2=Josh&name3=Ben')
#     response = post('/names', {name1='Leo&name2=Josh&name3=Ben'})

#     expect(response.status).to eq (200)
#     expect(response.body).to eq ('Leo, Josh, Ben')
#   end
# end