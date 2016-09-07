

40.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  Contact.create(first_name: first_name,
                 last_name: last_name,
                 email: "#{first_name.first}.#{last_name}@gmail.com",
                 phone: Faker::PhoneNumber.phone_number)
end