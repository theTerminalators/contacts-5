class Contact < ApplicationRecord
  def display_updated_time
    updated_at.strftime("%m/%d/%Y")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def japanese_phone
    # add +81 to the beginnning of all phone numbers
    "+81 #{phone}"
  end

  def self.all_johns
    Contact.where(first_name: "John")
  end
end
