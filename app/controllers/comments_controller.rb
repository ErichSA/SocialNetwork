class CommentsController < ApplicationController
  before_action :find_post
  
  def new
    @comment = Comment.new
    @comments = Comment.find(params[:post_id])
  end

  def index
    @comments = Comment.find(params[:post_id])
  end

  def show
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:content).merge(user_id: current_user.id))
    @comment.save!
    respond_to do |format|
      format.html {redirect_to post_path(@post)}
      format.js #render posts/create
    end
  end
  
  def setup
    @comments  = Comment.find(params[:id])
  end
  
  private
    def find_post
      @post =Post.find(params[:post_id])
    end
  
end

 