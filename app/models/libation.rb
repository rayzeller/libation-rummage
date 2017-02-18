class Libation < ActiveRecord::Base
  ## returns BreweryDB::Client::Response
  def self.search_and_log(query)
    result = BreweryDB::Client.new(api_key: ENV['BREWERY_API_KEY']).search(query)
    Libation.create(query: query)
    return result
  end
end
