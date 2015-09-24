class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :business_name
      t.string :location
      t.string :job_description
      t.string :phone
      t.user :belongs_to
      t.messenger :belongs_to

      t.timestamps null: false
    end
  end
end
