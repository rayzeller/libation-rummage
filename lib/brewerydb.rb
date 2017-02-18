module BreweryDB
   class Client
      BREWERYDB_API = 'http://api.brewerydb.com/v2/'

      attr_reader :api_key

      def initialize(options = {})
        options.symbolize_keys!
        @api_key = options[:api_key]
      end

      def connection
        @faraday ||= Faraday.new connection_options do |conn|
          conn.adapter  Faraday.default_adapter
        end
      end

      def search(query)
        connection.get('search', {q: query})
      end

      private

        def connection_options
          {
            url: BREWERYDB_API,
            headers: {
              content_type: 'application/json'
            },
            params: {:key => @api_key}
          }
        end

  end
end