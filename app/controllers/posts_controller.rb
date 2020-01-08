# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Posted!'
    else
      render 'new'
    end
  end

  def index
    @post = Post.all.order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:comment, :user_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
