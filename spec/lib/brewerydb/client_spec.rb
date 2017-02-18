require "rails_helper"

describe BreweryDB::Client do

  subject(:client) { BreweryDB::Client.new(api_key: 'rays-token') }

  describe '#initialize' do
    it 'initializes with an api key' do
      client = BreweryDB::Client.new(api_key: 'rays-token')
      expect(client.api_key).to eq('rays-token')
    end
  end

  describe '#connection' do
    it 'sets the content type' do
      expect(client.connection.headers['Content-Type']).to eq("application/json")
    end

    it 'sets the url' do
      expect(client.connection.url_prefix.to_s).to eq(BreweryDB::Client::BREWERYDB_API)
    end

    it 'sets the api_key' do
      expect(client.connection.params['key']).to eq('rays-token')
    end

  end

  describe '#search' do
    it 'goes to the search endpoint' do
      expect(client.search_raw("query").env.url.to_s).to eq("http://api.brewerydb.com/v2/search?key=rays-token&q=query")
    end
  end

end