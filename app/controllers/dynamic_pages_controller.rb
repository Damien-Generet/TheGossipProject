class DynamicPagesController < ApplicationController
  def welcome
    @first_name = params[:first_name]
    puts @first_name
  end

  def gossip_page
   id = params[:gossip_id]
   @gossip = Gossip.find(id)   
   @comment = Gossip.find(id).comments
  end


  def user_page
    user_id = params[:user_id]
    @user = User.find(user_id)
  end
end
