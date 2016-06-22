class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :fname
      t.string :lname
      t.string :extra_guest
      t.string :dietary_type
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
