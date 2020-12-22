class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @tvs = Tv.search_by_name_and_year(params[:query])
    else
      @tvs = Tv.all
    end
    @deals = Tv.order(:price).first(3)
    @reviews = [{ content: "Order Today & Pay on Delivery Day" }, { content: "We offer a Great Service"}, { content: "Price Promise on all Products" }]

  end

end
