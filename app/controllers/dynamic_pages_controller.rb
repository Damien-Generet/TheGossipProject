class DynamicPagesController < ApplicationController
  def home
    @first_name = params[:first_name]
    puts @first_name
    @gossips = Gossip.all
  end
end
