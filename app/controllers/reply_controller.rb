class ReplyController < ApplicationController
  def create
    reply = Reply.new
    reply.post_id = params[:post_id]
    reply.user_id = 2
    reply.user_name = params[:user_name]
    # reply.user_name = User.find(params[:user_id]).name
    reply.option_num = params[:option_num]
    reply.location_text = params[:location_text]
    reply.location  = params[:location]
    reply.link    = params[:link] unless params[:link].nil?
    reply.content = params[:content] unless params[:content].nil?
    reply.img_url = DataFile.save(params[:upload], "/post/#{params[:post_id]}").to_s unless params[:upload].nil?
    reply.save
    # render json: { 
    #               Reply:          Reply.all,
    #               current_reply:  reply,
    #               current_post:   Post.find(params[:post_id])
    #               # current_user:   User.find(params[:user_id])
    #             }
    redirect_to :back
  end

  def read
  end

  def count_update
    reply = Reply.find(params[:reply_id])
    
    unless reply.like_count.nil?
      reply.like_count = reply.like_count + 1
    else
      reply.like_count = 0 + 1
    end
    reply.save
    num = reply.like_count
    render json: { count: num }
  end
  
  def anti_count_update
    reply = Reply.find(params[:reply_id])
    
    unless reply.like_count.nil?
      reply.unlike_count = reply.unlike_count + 1
    else
      reply.unlike_count = 0 + 1
    end
    reply.save
    num = reply.unlike_count
    render json: { count: num }
  end

  def delete
  end
end