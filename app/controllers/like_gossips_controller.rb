class LikeGossipsController < ApplicationController
  def create
    @gossip = Gossip.find(params[:id])
    @like_gossip = LikeGossip.create(user: current_user, gossip: @gossip)
    puts "ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"
    redirect '/home'
  end
 
  def destroy
    @gossip = Gossip.find(params[:id])
    @like_gossip = LikeGossip.find_by(user == current_user && gossip==@gossip).destroy
    puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  end
end
