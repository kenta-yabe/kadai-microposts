class FavoritesController < ApplicationController
  before_action :require_user_logged_in


  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.book(micropost)
    flash[:success] = '投稿をお気に入りに登録しました。'
    redirect_to current_user
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unbook(micropost)
    flash[:success] = '投稿のお気に入り登録を解除しました。'
    redirect_to current_user
  end
end
