class Address < ActiveRecord::Base
  belongs_to :user, :job
  validates :street_name, :city, :state, :zip, presence: true
end
