class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        gossip = Gossip.find(params[:gossip_id])
        @comment = Comment.new(content: params[:content], user: current_user, gossip: gossip)

        if @comment.save
            redirect_to "/gossips/#{params[:gossip_id]}"
        else
            @content = params[:content]
            redirect_to gossip_path(gossip)
        end 
    end
    
    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
       if @comment.update(content: params[:new_content])
        redirect_to "/gossips/#{params[:gossip_id]}"
       else
        render :edit
       end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to "/gossips/#{params[:gossip_id]}"
    end
end
