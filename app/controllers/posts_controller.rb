class PostsController < ApplicationController

    before_action :find_post, only: [:edit, :update]

    def index
        @posts = Post.all
        @comment = Comment.new
        @comments = Comment.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params.merge(user_id: current_user.id))
        @post.save
        redirect_to @post
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
    end

    def update
        @post.update(post_params.merge(user_id: current_user.id))
        redirect_to @post
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:caption, :image)
    end

end
