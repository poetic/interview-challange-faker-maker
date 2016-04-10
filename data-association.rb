require 'faker'

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

# Relocation Interest Form
reloation_form_array = []

rand(70..150).times do
  user = users.sample

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

puts reloation_form_array.first

# Realtor Walkthrough Data


# Facebook Groups