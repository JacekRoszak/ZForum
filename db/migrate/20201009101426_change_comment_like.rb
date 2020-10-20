class ChangeCommentLike < ActiveRecord::Migration[6.0]
  def change
    drop_table :comment_likes
    create_table :comment_likes do |t|
      t.integer :user_id
      t.integer :post_comment_id

      t.timestamps
    end

  end
end
