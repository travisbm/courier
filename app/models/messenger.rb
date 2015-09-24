class Messenger < ActiveRecord::Base
  has_many :jobs
  validates :first_name, :last_name, :user_name, :transit_type,
            :location, :phone, presence: true
end
