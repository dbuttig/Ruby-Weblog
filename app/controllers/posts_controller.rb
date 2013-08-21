class PostsController < ApplicationController
  respond_to :html

  before_filter :ensure_logged_in, except: [:show, :index]

  # new action
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :text))
    @post.author_id = session[:author_id]
    @post.save
    respond_with @post
  end

  # show action
  def show
    @post = Post.find(params[:id])
  end

  # index action
  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  # edit action
  def update
    @post = Post.find(params[:id])
    @post.update(params[:post].permit(:title, :text, :author))
    respond_with @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with @post
  end

  # private here prevents an attacker from setting the model's
  # attributes by manipulating the hash passed to the model
  private
    def post_params
      params.require(:post).permit(:title, :text, :author)
    end
end
