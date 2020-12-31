class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @tvs = Tv.search_by_name_and_year(params[:query])
    else
      @tvs = Tv.all
    end
    @best_sellers = Tv.order(:price).limit(1)
    @reviews = [{ name: "Mo", content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum deserunt sequi sed sunt nihil quam eos voluptas fugiat nulla voluptate eligendi magni, expedita, dicta ut quisquam. Voluptatem, eaque voluptate alias!
" }, { name: "Mo", content: "We offer a Great Service"}, { name: "Mo", content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum deserunt sequi sed sunt nihil quam eos voluptas fugiat nulla voluptate eligendi magni, expedita, dicta ut quisquam. Voluptatem, eaque voluptate alias!
"}]

  end

end
