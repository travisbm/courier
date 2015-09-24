class Job < ActiveRecord::Base
  belongs_to :user, :messenger
  validates :business_name, :location, :job_description, :phone, presence: true
end
