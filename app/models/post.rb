class Post < ActiveRecord::Base
  has_many :replies
  has_many :viewcounts
  belongs_to :user

  scope :replies_ordered, -> { includes(:replies).order(['posts.id ASC', 'replies.like_count DESC']) }

  def image_reply_length
    self.replies
      .select {|item| item.option_num == 0}
      .length
  end


  def self.create_permitted_attr(exclude)
    x = ['id', 'created_at', 'updated_at'] + exclude
    return Post.attribute_names - x
  end

  def content_to_split_span_block
    content = self.content
    content2 = content.gsub("<p class=\"post_content\">",'').gsub("</p>",'').gsub("<br>"," <br> ")
    content2 = content2.split
    arr = []
    i = 1
    limit = 20
    loop do
        break if content2[(limit * (i - 1))..((limit * i)-1)].nil?
        arr << content2[(limit * (i - 1))..((limit * i)-1)]
        i += 1
    end
    arr2 = []
    arr.each do |e|
        arr2 << e.join(' ')
    end
    arr3 = []
    j = 1
    arr2.each do |f|
        arr3 << "<span class=\"span_block\" id=\"block#{j}\">" + f + "</span>&nbsp;"
        j += 1
    end

    k = 1
    self.replies.reorder("like_count desc").each do |reply|
        arr3.each do |block|
            if block.include?(reply.location)
                block.gsub!("#{reply.location_text.strip}", "<span class=\"ggum_ddak_ji #{"most_best" if k == 1}\" id=\"#{reply.id}\">#{reply.location_text}</span>")
            end
        end
        k += 1
    end
    content3 = arr3.join
    return content3
  end

    # kind_of = "img" or "information" or "news" or "blahblah"
  def gum_count(kind_of)
    if kind_of == "img"
      num = 0
    elsif kind_of == "information"
      num = 1
    elsif kind_of == "news"
      num = 2
    elsif kind_of == "blahblah"
      num = 3
    end

    return self.replies.where(option_num: num)
  end
    # To Use this Method ::
    # @post = Post.first
    # @post.gum_count("img").count

  def view_count_plus
    post = self
    v = Viewcount.new
    v.post_id = post.id
    v.save

    return post.viewcounts.count
  end

  def ggum_ddak_ji_percentage
    content3 = self.content_to_split_span_block
    content4 = content3
    content4.gsub!('</span>',' ---- ')
    content4.gsub!('<span',' ---- ')
    content4.gsub!('">',' ---- ')
    content4.gsub!('&nbsp;','')
    content5 = content4.split(' ---- ')

    content6 = []
    i = 0
    content5.each do |sp|
        content6 << sp unless sp.include?('span_block')
    end

    content7 = []
    is_gdj = false
    content6.each do |sp|
        content7 << sp if is_gdj
        if sp.include?('ggum_ddak_ji')
            is_gdj = true
        else
            is_gdj = false
        end
    end
    # puts content7
    # puts ""

    content8 = content7.join
    # puts content8
    # puts content8.length
    # puts ""

    content_original = self.content
    content_original.gsub!('<p',' ---- ')
    content_original.gsub!('</p>',' ---- ')
    content_original.gsub!('<br>','')
    content_original.gsub!('">',' ---- ')
    content_original = content_original.split(' ---- ')
    content_original.delete_at(1)
    content_original = content_original.join
    # puts content_original
    # puts ""
    # puts content_original.length

    percentage = content8.length.to_f/content_original.length.to_f
    return (percentage * 100).round(2)
  end
end
