class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @tvs = Tv.search_by_name_and_year(params[:query])
    else
      @tvs = Tv.all
    end
  end
end
