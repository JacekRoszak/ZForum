class ChangePostComments < ActiveRecord::Migration[6.0]
  def change
    def change
      drop_table :post_comments
      create_table :post_comments do |t|
        t.text :content
        t.references :parent
        t.integer :user_id
        t.integer :post_id
  
        t.timestamps
      end
    end
  
  end
end
