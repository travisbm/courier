class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :business_name
      t.string :location
      t.string :job_description
      t.string :phone
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :messenger, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
