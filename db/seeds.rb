# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  user = User.new({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_name: Faker::Internet.user_name,
    business_name: Faker::Company.name,
    location: ['North', 'East', 'South', 'West', 'Central'].sample,
    phone: Faker::PhoneNumber.phone_number
  })

  user.addresses.build({
      street_name: Faker::Address.street_name,
      city: Faker::Address.state,
      state: Faker::Address.state,
      zip: Faker::Address.zip,
      user_id: user.id
      })

  [1, 2, 3].sample.times do
    user.jobs.build({
      business_name: user.business_name,
      location: user.location,
      job_description: ['letter', 'parcel'].sample,
      phone: user.phone
    })
  end

  user.jobs.each do |job|
    job.addresses.build({
      street_name: Faker::Address.street_name,
      city: Faker::Address.state,
      state: Faker::Address.state,
      zip: Faker::Address.zip
      })
  end
  user.save!

  messenger = Messenger.new({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_name: Faker::Internet.user_name,
    transit_type: ['bike', 'car', 'truck'].sample,
    location: ['North', 'East', 'South', 'West', 'Central'].sample,
    phone: Faker::PhoneNumber.phone_number
  })
  messenger.save!
end
