class TvsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @tvs_all = Tv.all
    @tvs = Tv.all
    if !params[:query].nil?
      @tvs = Tv.where('name ILIKE ?', params[:query])
    end
    if !params[:search].nil?
      params[:search].each do |key, value|
        @tvs = @tvs.where(key => value) if value.present?
      end
    end
    # @recent_tvs = Tv.where(@tv.id = current)
  end

  def show
    @tv = Tv.find(params[:id])
    # @similar_tvs = Tv.where(["name = ? and id != ?", @tv.name, @tv.id]).limit(3)

    @similar_tvs = Tv.where(["name = ? and id != ?", @tv.name, @tv.id]).limit(3)
  end

  def new
   @tv_new = Tv.new
  end

  def create
    @tv_new = Tv.new(tv_params)
    if @tv_new.save
      flash[:success] = "Your Tv Has been listed"
      redirect_to tvs_path
    else
      render :new
    end
  end

  def edit
    @tv = Tv.find(params[:id])
  end

  def update
    @tv = Tv.find(params[:id])
    @tv.update(tv_params)
    redirect_to tvs_path(current_user)
    @tv.save
  end

  def destroy
    @tv = Tv.find(params[:id])
    @tv.destroy(tv_params)
    redirect_to user_path(current_user)
  end

  def tv_params
    params.require(:tv).permit(:price, :name, :model, :size, :year, photos: [])
  end
end
