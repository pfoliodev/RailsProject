class PostsController < ApplicationController

  before_action :set_post, only: [:update, :edit, :show, :destroy]

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
  	  redirect_to posts_path, success: "Article modifié avec succès"
    else
      render 'edit'
    end
  end

  def create
  	post = current_user.posts.build(post_params)
    if post.valid?
      post.save
  	  redirect_to post_path(post.id), success: "Article créer avec succès"
    else
      @post = post
      render 'new'
    end
  end

  def destroy
  	@post.destroy
  	redirect_to posts_path, success: "Article supprimé avec succès"
  end
  private

  def post_params
  	params.require(:post).permit(:title, :content, :slug, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
