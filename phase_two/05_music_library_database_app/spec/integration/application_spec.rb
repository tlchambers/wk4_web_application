require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }
  
  context "GET /albums" do
    it 'should return a list of albums' do
      response = get('/albums')
      expected_response = ('Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring')

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end
  end

  context "POST /albums" do
    it 'should create a new album' do
      rsponse = post(
        '/albums', 
        title: 'Ok Computer',
        release_year: '1997',
        artist_id: '1'
        )

      expect(rsponse.status).to eq(200)
      expect(rsponse.body).to eq('')

      response = get ('/albums')
      
      expect(response.body).to include('Ok Computer')
    end

    it 'should create a new album' do
      rsponse = post(
        '/albums', 
        title: 'Voyage',
        release_year: '2022',
        artist_id: '2'
        )

      expect(rsponse.status).to eq(200)
      expect(rsponse.body).to eq('')

      response = get ('/albums')
      
      expect(response.body).to include('Voyage')
    end
  end

  context "GET /artists" do
    it 'returns a list of artist names' do
      response = get('/artists')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos')
    end
  end

  context "POST /artists" do
    it 'should create a new artist' do
      rsponse = post('/artists',
                    name: 'Wild Nothing',
                    genre: 'Indie'
                    )

      expect(rsponse.status).to eq(200)
      expect(rsponse.body).to eq('')

      response = get ('/artists')
      expect(response.body).to include('Wild Nothing')
    end
  end
end
