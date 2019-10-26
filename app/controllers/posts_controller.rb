class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new post_params
        if @post.save
            redirect_to posts_path
          else
            render :new
        end
    end

    def show
      @comment = Comment.new
    end

    def edit
      
    end

    def update
      if @post.update post_params
        redirect_to post_path(@post)
      else
        render :edit  
      end
    end

    def destroy
      flash[:notice] = "Post destoryed!"
      @post.destroy
      redirect_to posts_path
    end

    private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def find_post
        # get the current value inside of the db
        @post = Post.find params[:id]
      end

end
