class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_name
      t.string :city
      t.string :state
      t.integer :zip
      t.user :belongs_to
      t.job :belongs_to

      t.timestamps null: false
    end
  end
end
