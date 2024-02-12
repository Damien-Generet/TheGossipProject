class StaticPagesController < ApplicationController
  def home
    # locals: {gossips: Gossip.all}
     @gossips = Gossip.all
  end

  def contact
  end

  def team
  end

  def new_gossip
  end

  def new_gossip_post
    @gossip_content = params[:content]
    @gossip_author = params[:author]
    @gossip_title = params[:title]
    city = City.create(name: 'Paris', zip_code: "75000")
    user = User.create(first_name: @gossip_author, last_name: @gossip_author, description: "TEST", email: "TEST@TEST.COM", age: 42, city: city)
    Gossip.create(user: user, content: @gossip_content, title: @gossip_title)
  end
  
  def index_gossips
  end
end
