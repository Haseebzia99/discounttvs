class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @tvs = Tv.search_by_name_and_year(params[:query])
    else
      @tvs = Tv.all
    end
    @best_sellers = Tv.order(:price).limit(1)
    @reviews = [{ name: "Mo", content: "Order Today & Pay on Delivery Day" }, { name: "Mo", content: "We offer a Great Service"}, { name: "Mo", content: "Price Promise on all Products" }]

  end

end
