class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:planet_id] && @planet = Planet.find_by_id(params[:planet_id])
            @comments = @planet.comments
        else
            flash[:message] = "That planet doesn't exist" if params[:planet_id]
            @comments = Comment.new
        end
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end 
    end

    def show
        @comment = Comment.find_by_id(params[:id])
    end

    def edit
        @comment = Comment.find_by_id(params[:id])
    end

    def update
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            render :edit
        end
    end

    def destroy
        @comment = Comment.find_by_id(params[:id])
        @comment.destroy
        redirect_to planets_path
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :planet_id)
    end
end
