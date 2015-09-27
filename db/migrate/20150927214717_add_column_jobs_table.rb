class AddColumnJobsTable < ActiveRecord::Migration
  def change
    add_column(:users, :status, string)
  end
end
