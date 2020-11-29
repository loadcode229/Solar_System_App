class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_comment, only: [:show, :edit, :update]
    before_action :redirect_if_not_comment_author, only: [:edit, :update]

    def index
        if params[:planet_id] && @planet = Planet.find_by_id(params[:planet_id])
            @comments = @planet.comments
        else
            flash[:message] = "That planet doesn't exist" if params[:planet_id]
            @comments = Comment.new
        end
    end

    def new
        if params[:planet_id] && @planet = Planet.find_by_id(params[:planet_id])
            @comment = @planet.comments.build
        else
            @error = "That planet doesn't exist" if params[:planet_id]
            @comment = Comment.new
        end
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to planets_path
        else
            render :new
        end 
    end

    def show
        
    end

    def edit
        
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

    def set_comment
        @comment = Comment.find_by_id(params[:id])
        if !@comment
            flash[:message] = "Comment was not found."
            redirect_to comments_path
        end
    end

    def redirect_if_not_comment_author
        redirect_to comments_path if @comment.user != current_user
    end
end
