class StocksController < ApplicationController
  before_action :require_user_logged_in

  def create
# おそらくユーザーの情報はここではいらない？

    user = User.find(params[:user_id])
    micropost = Micropost.find(params[:micropost_id])
      
    
    current_user.fav(micropost)
    flash[:success] = 'ツイートをお気に入りしました'
    
    redirect_to root_url
  end

#定義しなおす

  def destroy
    user = User.find(params[:user_id])
    micropost = Micropost.find(params[:micropost_id])

    current_user.unfav(micropost)
    flash[:success] = 'ツイートをお気に入りを解除しました'
    redirect_to root_url
  end
end
