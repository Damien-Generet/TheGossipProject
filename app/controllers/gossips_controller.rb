class GossipsController < ApplicationController

def index
  @gossips = Gossip.all
end

def new
@gossip = Gossip.new
end

def show
  id = params[:id]
  @gossip = Gossip.find(id)   
  @comment = Gossip.find(id).comments
end

def create
  city = City.create(name: 'Paris', zip_code: "75000")
  user = User.create(first_name: params[:author], last_name: params[:author], description: "TEST", email: "TEST@TEST.COM", age: 42, city: city)
  puts params

  @gossip = Gossip.new(user: user, 
                     title: params[:title],
                     content: params[:content])

  if @gossip.save
    redirect_to '/gossips'
  else 
    render "#{new_gossip_path(@gossip)}"
  end

end

# def post_params
#   params.require(:post).permit(:title, :body, :author)
# end

end
