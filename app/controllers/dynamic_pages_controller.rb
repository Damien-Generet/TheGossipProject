class DynamicPagesController < ApplicationController
  def welcome
    @first_name = params[:first_name]
    puts @first_name
  end

  def gossip_page
   id = params[:id]
   @gossip = Gossip.find(id)   
  end

  def user_page
    user_id = params[:id]
    @user = User.find(user_id)
  end
end
