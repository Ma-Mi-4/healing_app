class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def create
    @favorite = Favorite.new(message: params[:message])

    if @favorite.save
      redirect_to main_index_path, notice: "お気に入りに登録しました"
    else
      redirect_to main_index_path, alert: "お気に入りに登録できませんでした"
    end
  end
end
