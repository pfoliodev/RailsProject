class PostsController < ApplicationController

  before_action :set_post, only: [:update, :edit, :show, :destroy]
  before_action :authenticate_user!, except: [:edit]

  def index
  	@posts = Post.includes(:category).all
  end

  def show
  end

  def edit
  end

  def new
  	@post = current_user.posts.build
  end

  def update
  	if @post.update(post_params)
  	  redirect_to posts_path, success: "Article modifie avec succes"
    else
      render 'edit'
    end
  end

  def create
  	post = current_user.posts.build(post_params)
    if post.valid?
      post.save
  	  redirect_to post_path(post.id), success: "Article creer avec succes"
    else
      @post = post
      render 'new'
    end
  end

  def destroy
  	@post.destroy
  	redirect_to posts_path, success: "Article supprime avec succes"
  end
  private

  def post_params
  	params.require(:post).permit(:title, :content, :slug, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
