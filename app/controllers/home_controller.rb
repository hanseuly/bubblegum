class HomeController < ApplicationController

  def login
  end

  def index
  end

  def entering
  end

  def list
    @posts = Post.all.replies_ordered
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

  def ggum
    post = Post.find(params[:post_id])
    ggum = post.replies
      .where(location_text: params[:query])
      .order('like_count DESC')
    render json: ggum
  end

  def main
    @post = Post.last
    unless params[:id].nil?
      @post = Post.find(params[:id])
    end
    @content = @post.content_to_split_span_block
  end

  def hanseuly
  end

end
