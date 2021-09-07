class CommentsController < ApplicationController
    before_action :redirect_not_logged_in

    def index
        if params[:plant_id] && @plant = Plant.find_by_id(params[:plant_id])
            @comments = @plant.comments
        else
            @comments = Comment.all
        end
    end

    def new
        if params[:plant_id] && @plant = Plant.find_by_id(params[:plant_id])
            @comment = @plant.comments.build
        else
            @comment = Comment.new
        end
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
        @comment = Comment.find_by(id: params[:id])
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        @comment = Comment.find_by(id: params[:id])
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            render :edit
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :plant_id)
    end

end
