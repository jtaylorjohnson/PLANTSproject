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
        @comment = Comment.find_by(id: params[:id])
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        @comment = Comment.find_by(id: params[:id])
    end

end
