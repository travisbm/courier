class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  validates :street_name, :city, :state, :zip, presence: true
end
