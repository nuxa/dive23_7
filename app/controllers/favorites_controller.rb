class FavoritesController < ApplicationController
  def index
      @user = User.find(params[:user_id])
      @favorites = Favorite.where(user_id: @user.id)
  end
end
