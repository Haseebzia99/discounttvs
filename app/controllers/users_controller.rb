class UsersController < ApplicationController

  def edit
    @tv = Tv.find(params[:id])
  end

  def update
    @tv = Tv.find(params[:id])
    @tv.update(tv_params)
    redirect_to user_path(current_user)
  end


end
