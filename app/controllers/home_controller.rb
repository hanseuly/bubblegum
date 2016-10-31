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
    @post = Post.find_by_id(params[:id]) || Post.last
    @hashTags = @post.get_imageTags
    @replies = @post.replies.where(option_num: 0).all
  end

  def main_pre
  end

  def ggums
    post = Post.find(params[:post_id])
    ggum = post.replies
      .where("replies.location_text LIKE ?", "%#{params[:query].strip}%")
      .order('like_count DESC')
    render json: ggum
  end

  def ggum
    post = Post.find(params[:post_id])
    ggum = post.replies
      .where("replies.location_text LIKE ?", "%#{params[:query].strip}%")
      .order('like_count DESC')
      .first
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
