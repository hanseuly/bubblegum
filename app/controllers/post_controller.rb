class PostController < ApplicationController

    # 기사 입력하는 페이지/ 기사 4개 입력 끝나서 주석처리함.
  def show
    @path = post_create_path
    @post = nil
    unless params[:id].nil?
      @post = Post.find(params[:id])
      @path = "/post/update/#{params[:id]}"
    end
  end

  def create
    # params = ActionController::Parameters.new({
    #     "post" : {
    #         user_id: current_user.id,
    #         Post.create_permitted_attr(["user_id"]).each do |post_attr|
    #             eval("#{post_attr}: params[:#{post_attr}]")
    #         end
    #     }
    # })
    # permitted = params.require(:post).permit(:user_id, :user_name,                          # => 글 등록자 정보
    #                                          :title, :content, :written_at, :img_url,       # => 글 정보
    #                                          :editor_name, :editor_email)                   # => 기자 정보
    # po = Post.create!(permitted)

    # redirect_to :back

    # return render json: { status: "SUCCESS", posts: po }

    po = Post.new
    Post.create_permitted_attr([""]).each do |attrN|
        eval("po.#{attrN} = params[:#{attrN}]")
    end
    po.save
    redirect_to :back
  end

  def read

  end

  def update
    po = Post.find(params[:id])
    Post.create_permitted_attr([nil]).each do |attrN|
      eval("po.#{attrN} = params[:#{attrN}]")
    end
    po.save
    redirect_to '/post/show'
  end

  def delete
    Post.delete(params[:id])
    redirect_to :back
  end
end
