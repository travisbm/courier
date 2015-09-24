class User < ActiveRecord::Base
  has_many :jobs
  validates :first_name, :last_name, :user_name, :business_name,
            :location, :phone, presence: true
end
