class CreateCommentsComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments_comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :postcomment_id

      t.timestamps
    end
  end
end
