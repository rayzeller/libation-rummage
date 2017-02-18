module Api
  class LibationsController < ApplicationController
    before_filter :filter_params

    def search
       respond_to do |format|
        format.json {
          render :status => :ok, :json => {
            :success => true,
            :data => BreweryDB::Client.new(api_key: ENV['BREWERY_API_KEY']).search('gose').search(params[:q]).result.body
          }
        }
      end
    end

    private
      def filter_params
        params.permit(:q)
      end
  end
end
