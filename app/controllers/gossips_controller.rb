class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
    @tags = Tag.all
  end

  def show
    id = params[:id]
    @my_tags = []
    @gossip = Gossip.find(id)   
    @comment = Gossip.find(id).comments
    
    @tag_of_gossip = GossipTag.where(gossip: @gossip)
    @tag_of_gossip.each do |gossip_tag|
      @my_tags << Tag.find(gossip_tag.tag_id)
    end
    
  end

  def create
    @gossip_tags = []
    city = City.create(name: 'Paris', zip_code: "75000")
    user = User.create(first_name: params[:author], last_name: params[:author], description: "TEST", email: "TEST@TEST.COM", age: 42, city: city)

    @gossip = Gossip.new(user: user, 
                      title: params[:title],
                      content: params[:content])

    @array_tags = params[:array_tag]

    if @array_tags.class == 'Array'
        @array_tags.each do |tag_id| 
          @gossip_tags << GossipTag.create(gossip: @gossip, tag: Tag.find(tag_id))
        end
    end

    if @gossip.save
      redirect_to '/gossips'
    else 
      render "#{new_gossip_path(@gossip)}"
    end

  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
   if @gossip.update(content: params[:new_content], title: params[:new_title])
    redirect_to @gossip
   else
    render :edit
   end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to '/gossips'
  end

end