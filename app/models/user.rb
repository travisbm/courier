class User < ActiveRecord::Base
  has_many :jobs, :dependent => :delete_all
  has_many :addresses, :dependent => :delete_all
  # validates :first_name, :last_name, :user_name, :business_name,
  #           :location, :phone, presence: true
end
