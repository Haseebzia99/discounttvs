class TvsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @tvs = Tv.all
    if !params[:query].nil?
      @tvs = Tv.where('name ILIKE ?', params[:query])
    end
    if !params[:search].nil?
      params[:search].each do |key, value|
        @tvs = @tvs.where(key => value) if value.present?
      end
    end
  end

  def show
    @tv = Tv.find(params[:id])
  end

  # def edit
  #   @tv = Tv.find(params[:id])
  # end

  # def update
  #   @tv = Tv.find(params[:id])
  #   @tv.update(tv_params)


    # recycle_price = old_price + 25
  #   install_price = old_price + 40
  #   recycle_install_price = old_price + 65

  # end

  #   old_price = @tv.price
  # private

  # def tv_params
  #   params.require(:tv).permit(:price)
  # end
end
