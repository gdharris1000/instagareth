class CommentsController < ApplicationController
  before_action :find_comment, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to '/posts'
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to posts_path
  end

  def destroy
    @comment.destroy
    redirect_to posts_path
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])  
  end

  def comment_params
    params.require(:comment).permit(:comment_text, :user_id, :post_id)
  end

end
