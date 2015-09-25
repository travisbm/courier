class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :messenger
  has_one   :addresses
  validates :business_name, :location, :job_description, :phone, presence: true
end
