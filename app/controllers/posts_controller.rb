class PostsController < ApplicationController
    
    before_action :set_post, only: [:edit, :update, :show, :destroy]
    def index 
      cookies.delete(:username)

        @posts = Post.where(online) all

    end

    def show 
    end

    def edit
    end

      def update 
        post_params =params.require(:post).permit(:title, :content, :author)
        if @post.update(post_params)
            flash[:notice] = "Article modifié avec succès!"
            redirect_to posts_path
        else
            render 'edit' 
        end
      end      

      def new 
        @post = Post.new
      end

    def create 
        post = Post.create(post_params)
        redirect_to post_path(post.id)

    end

    private 
    def post_params
        params.require(:post).permit(:title, :content, :author)

    end

    def destroy 
        @post.destroy
        redirect_to posts_path
    end

    
    def set_post
        @category = Category.find(params[:id])
      end
end
