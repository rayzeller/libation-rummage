class HomeController < ApplicationController
  before_filter :filter_params

  def index
    @queries = Libation.group(:query).order("count_all desc").count
    if params[:q]
      @result = Libation.search_and_log(params[:q]).data
    else
      @result = []
    end
  end

  private
    def filter_params
      params.permit(:q)
    end
end
