class User < ActiveRecord::Base
  has_many :jobs
  has_one :addresses
  validates :first_name, :last_name, :user_name, :business_name,
            :location, :phone, presence: true
end
