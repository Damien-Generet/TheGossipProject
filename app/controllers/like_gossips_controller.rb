class LikeGossipsController < ApplicationController
  def create
    @gossip_to_like = Gossip.find(params[:gossip_id])
    @like_gossip = LikeGossip.create(user: current_user, gossip: @gossip_to_like)
    redirect_to "/gossips/#{@gossip_to_like.id}"
  end
 
  def destroy
    @gossip_to_unlike = Gossip.find(params[:gossip_id])
    @like_gossip = LikeGossip.find_by(user: current_user).destroy
    redirect_to "/gossips/#{@gossip_to_unlike.id}"
  end
 
end
