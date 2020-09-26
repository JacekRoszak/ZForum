class CreatePostComments < ActiveRecord::Migration[6.0]
  def change
    create_table :post_comments do |t|
      t.text :content
      t.references :parent_id
      t.integer :user_id
      t.integer :post_id
    end
  end
end
