require 'rails_helper'

RSpec.describe Libation, type: :model do
  describe '#search_and_log' do
    it 'returns BreweryDB::Client::Response' do
      expect(Libation.search_and_log("query").class).to eq(BreweryDB::Client::Response)
    end

    it 'logs creates a libation with name: query' do
      expect{Libation.search_and_log("query").class}.to change{Libation.where(query: :query).count}.by(1)
    end
  end
end
