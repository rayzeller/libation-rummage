class HomeController < ApplicationController
  before_filter :filter_params

  def index
    if params[:q]
      @result = Libation.search_and_log(params[:q]).data
    else
      @result = []
    end
    @queries = Libation.group(:query).order("count_all desc").count
  end

  private
    def filter_params
      params.permit(:q)
    end
end
