class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :business_name
      t.string :location
      t.string :phone

      t.timestamps null: false
    end
  end
end
