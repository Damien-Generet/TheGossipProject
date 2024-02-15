class StaticPagesController < ApplicationController
  def home
     @gossips = Gossip.all
  end

  def contact
  end

  def team
  end

end
