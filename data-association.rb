require 'faker'
require 'csv'

locations = [
  'Downtown Houston',
  'South Side',
  'Southwest',
  'Southeast',
  'Northside',
  'Energy Corridor',
  'Midtown',
  'Texas Medical Center',
  'Museum District',
  'Greenway Plaza'
]

interests = [
  'Running',
  'Shopping',
  'Nightlife',
  'Live Music',
  'Outdoor Sports',
  'Water Sports'
]

users = []

200.times do
  users << {
    name: Faker::Name.name,
    emails: [
      Faker::Internet.email,
      Faker::Internet.free_email,
    ],
    phones: [
      Faker::PhoneNumber.cell_phone,
      Faker::PhoneNumber.cell_phone
    ]
  }
end

# ----------------------------------------------------------------------
# Relocation Interest Form
# ----------------------------------------------------------------------

reloation_form_array = []
relocation_users = users.clone

rand(70..150).times do
  user = relocation_users.sample
  relocation_users.delete(user)

  user_info = {
    'Email' => user[:emails].sample,
    'Phone Number' => user[:phones].sample,
  }

  location_info = {}
  locations.each do |location|
    location_info[location]= ['true','false'].sample
  end

  reloation_form_array << user_info.merge(location_info)
end


# CSV.open("reloation_interest_form.csv", "w") do |csv|
#   reloation_form_array.each do |row|
#     csv << row.values
#   end
# end


# ----------------------------------------------------------------------
# Realtor Walkthrough Data
# ----------------------------------------------------------------------

realtor_walkthrough_array = []
walkthrough_users = users.clone

rand(70..150).times do
  user = walkthrough_users.sample
  walkthrough_users.delete(user)

  realtor_info = {
    'Realtor' => Faker::Name.name,
    'Realtor Office' => Faker::Company.name,
    'Realtor Cell' => Faker::PhoneNumber.cell_phone
  }

  user_info = {
    'Name' => user[:name],
    'Phone Cell' => user[:phones][0],
    'Phone Work' => user[:phones][1]
  }

  property_info = {
    'Walkthrough Date' => Faker::Date.between((Date.today - 500), Date.today).to_s,
    'Property Name' => Faker::Company.name,
    'Property Area of Town' => locations.sample
  }

  interests_info = {}
  interests.each do |interest|
    interests_info[interest]= ['true','false'].sample
  end

  realtor_walkthrough_array << realtor_info.merge(user_info).merge(property_info).merge(interests_info)
end

# CSV.open("realtor_walkthrough_data.csv", "w") do |csv|
#   realtor_walkthrough_array.each do |row|
#     csv << row.values
#   end
# end


# ----------------------------------------------------------------------
# Facebook Groups
# ----------------------------------------------------------------------

facebook_array = []
facebook_users = users.clone

rand(70..150).times do
  user = facebook_users.sample
  facebook_users.delete(user)

  facebook_array << {
    'Group Name' => Faker::Team.name,
    'Memeber Email' => user[:emails].sample,
    'Group Interests' => interests.sample(rand(1..5)).join(', ')
  }
end

# CSV.open("facebook_groups.csv", "w") do |csv|
#   facebook_array.each do |row|
#     csv << row.values
#   end
# end
















