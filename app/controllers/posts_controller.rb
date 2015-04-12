class PostsController < ApplicationController
  helper PostsHelper
  before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user!
  respond_to :html
  require 'will_paginate/array'


  def index
    @new_post = Post.new
    @posts = Post.all.order('post_type_id, created_at DESC').paginate(page: params[:page], per_page: 15)
    respond_with(@post, @posts)
  end

  def show
    @new_post = Post.new
    @children = Post.where(parent_id: @post.id)
    respond_with(@post, @children)
  end

  def new
    @post = Post.new
    @schools = School.all
    respond_with(@post, @schools)
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user= User.current
    logger.debug @post.inspect
    @post.save
    @post.parent_id==-1?respond_with(@post):respond_with(Post.where(id: @post.parent_id).first)
  end

  def update
    @post.update(post_params)
    @post.parent_id==-1?respond_with(@post):respond_with(Post.where(id: @post.parent_id).first)
  end

  def destroy
    @post.destroy
    # deleting all the posts' children
    Post.destroy_all(parent_id: @post.id)
    @post.parent_id==-1?respond_with(@post):respond_with(Post.where(id: @post.parent_id).first)
  end

  def newReplyPost
  end

  def createReplyPost
    @post.user= User.current
    @post.save
    respond_with(@post)
  end

  def isParent
    self.parent_id==-1
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:post_type_id, :parent_id, :title, :body, :user_id, :school_id)
    end
end
