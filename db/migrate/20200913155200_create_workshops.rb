class CreateWorkshops < ActiveRecord::Migration[6.0]
  def change
    create_table :workshops do |t|
      t.integer :user_id
      t.string :content
      t.string :link
      t.string :graphic
      t.date :start_date

      t.timestamps
    end
  end
end
