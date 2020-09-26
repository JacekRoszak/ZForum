class ChangeColumnPostComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :post_comments, :parent_id_id
  end
end
