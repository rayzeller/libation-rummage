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

      def search_raw(query)
        connection.get('search', {q: query})
      end

      def search(query)
        Response.new(JSON.parse(search_raw(query).body))
      end

      class Response

        class Data
          include Virtus.model
          attribute :name, String
          attribute :description, String
          attribute :abv, Float
          attribute :ibu, Float

          class Label
            include Virtus.model

            attribute :icon
            attribute :medium
            attribute :large
          end
          attribute :labels, Label

          def icon
            if labels and labels.icon
              return labels.icon
            else
              return ""
            end
          end

        end
        include Virtus.model

        attribute :data, Array[Data]
      end
      include Virtus.model



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