class PostsController < ApplicationController
  def new
    @post = Post.new
    @posts = Post.all
  end

  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = current_user.posts.new(permit_post)
    @post.save!
    
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js #render posts/create
    end
  end
  
  def setup
    @comments  = Comment.find(params[:id])
  end
  
  private
    def permit_post
      params.require(:post).permit(:title, :description,:image)
    end
  
end
