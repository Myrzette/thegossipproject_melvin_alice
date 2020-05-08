class LikeController < ApplicationController

  def create
    @like = Like.create('user_id'  => session[:user_id],
    'gossip_id' => params[:gossip_id])
    redirect_to gossip_path(params[:gossip_id])
  end

  def destroy
    @like = Like.find_by(gossip_id: params[:id]) && Like.find_by(user_id: session[:user_id])
    @like.destroy
    redirect_to gossip_path(params[:gossip_id])
  end
end
