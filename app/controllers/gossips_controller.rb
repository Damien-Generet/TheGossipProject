class GossipsController < ApplicationController

  def index
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else
      @gossips = Gossip.all
    end
  end

  def new
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else

      @gossip = Gossip.new
      @tags = Tag.all
    end

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
    @gossip = Gossip.new(user: current_user, 
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
    if @gossip.user != current_user
      redirect_to "/gossips/#{@gossip.id}"
    end
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.user == current_user
      if @gossip.update(content: params[:new_content], title: params[:new_title])
        redirect_to @gossip
      else
        render :edit
      end
    else
      redirect_to "/gossips/#{@gossip.id}"
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.user == current_user
      @gossip.destroy
      redirect_to '/gossips'
    else
      redirect_to "/gossips/#{@gossip.id}"
    end
  end

end