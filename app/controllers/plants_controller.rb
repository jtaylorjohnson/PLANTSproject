class PlantsController < ApplicationController
    before_action :redirect_not_logged_in

    def new
        @plant = Plant.new
        
        #if params[:author_id] && !Author.exists?(params[:author_id])
        #    redirect_to authors_path, alert: "Author not found."
         # else
          #  @post = Post.new(author_id: params[:author_id])
         # end
    end

    def create
        #@plant = current_user.plants.build(plant_params)
        @plant = Plant.find_or_create_by(name: plant_params[:name]) do |plant|
            plant.users << plant_params[:name]
        if @plant.save
            redirect_to plants_path
            # if @post.valid?
            #@post.save
            #redirect_to post_path(@post)
        else
            render :new
        end
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @plants = @user.plants
        else
            @plants = Plant.all 
        end
    end

    def show
        @plant = Plant.find_by_id(params[:id])
        redirect_to plants_path if !@plant
    end

    # def edit
    #     if params[:author_id]
    #       author = Author.find_by(id: params[:author_id])
    #       if author.nil?
    #         redirect_to authors_path, alert: "Author not found."
    #       else
    #         @post = author.posts.find_by(id: params[:id])
    #         redirect_to author_posts_path(author), alert: "Post not found." if @post.nil?
    #       end
    #     else
    #       @post = Post.find(params[:id])
    #     end
    #   end

    private

    def plant_params
        params.require(:plant).permit(:name, :kind)
    end

end

