# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in?, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "You've posted successfully!"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
    @logged_in = logged_in?
  end

  private

    def post_params
      params.require(:post).permit(:comments, :user_id)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
