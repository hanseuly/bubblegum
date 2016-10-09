class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string  :user_name
      
      t.string  :title
      t.text    :content
      t.string  :written_at
      t.string  :editor_name
      t.string  :editor_email
      t.string  :img_url
      t.timestamps null: false
    end
  end
end
