class HomeController < ApplicationController

  def login
  end

  def index
  end

  def entering
  end

  def list
    @posts = Post.all
  end

  def howto
  end

  def listpre
    @posts = Post.all
    @post = @posts.last
    
    unless params[:id].nil?
      @post = Post.find(params[:id])
    end
    @view_count = @post.view_count_plus
    @replies = @post.replies.where(option_num: 0).all
  end

  def main_pre
  end

  def main
    @post = Post.last
    unless params[:id].nil?
      @post = Post.find(params[:id])
    end
  end

  def hanseuly
  end

end
