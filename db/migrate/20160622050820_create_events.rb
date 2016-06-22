class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :party_type
      t.string :address
      t.float :budget
      t.integer :product_id
      t.date :date
      t.integer :invite_id

      t.timestamps null: false
    end
  end
end
