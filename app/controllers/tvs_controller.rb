class TvsController < ApplicationController
<<<<<<< HEAD
  skip_before_action :authenticate_user!, only: :index

=======
  skip_before_action :authenticate_user!, only: [:index]
>>>>>>> c836fa98ec667bcb2cb8d22f915f95e0f793d357
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
<<<<<<< HEAD


=======
>>>>>>> c836fa98ec667bcb2cb8d22f915f95e0f793d357
end
