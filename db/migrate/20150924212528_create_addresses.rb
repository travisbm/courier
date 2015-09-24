class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_name
      t.string :city
      t.string :state
      t.integer :zip
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
