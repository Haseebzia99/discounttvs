class TvsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
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
end
