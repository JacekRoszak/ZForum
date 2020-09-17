class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.integer :user_id
      t.text :content
      t.date :end

      t.timestamps
    end
  end
end
