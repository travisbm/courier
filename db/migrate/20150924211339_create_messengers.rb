class CreateMessengers < ActiveRecord::Migration
  def change
    create_table :messengers do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.boolean :active
      t.string :transit_type
      t.string :location
      t.string :phone

      t.timestamps null: false
    end
  end
end
