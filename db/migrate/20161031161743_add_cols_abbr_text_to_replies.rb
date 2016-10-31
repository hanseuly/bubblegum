class AddColsAbbrTextToReplies < ActiveRecord::Migration
  def up
    add_column :replies, :abbr_text, :string
    Reply.all.each do |reply|
      reply.update(abbr_text: reply.location_text)
    end
  end

  def down
    remove_column :replies, :abbr_text
  end
end
