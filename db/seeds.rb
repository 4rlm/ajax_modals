puts "Seeding the database ..."


def seed_account_table
  puts "Seeding the account table..."
  total_seeds_required = 50
  current_seeds_in_db = Account.count
  seeds_to_create = total_seeds_required - current_seeds_in_db

  # ["name", "phone", "address", "website", "description", "website"]
  seeds_to_create.times do
    # account_hash = {
    #   name: Faker::Lorem.word,
    #   description: Faker::Lorem.sentence,
    #   status: Faker::Lorem.word,
    #   rating: 5
    # }
    new_account_record = Account.new(account_hash)
    new_account_record.save!
  end

end
seed_account_table


def seed_contact_table
  puts "Seeding the contact table..."
  total_seeds_required = 50
  current_seeds_in_db = Contact.count
  seeds_to_create = total_seeds_required - current_seeds_in_db

  # ["name", "title", "email", "phone", "description"]
  seeds_to_create.times do
    # contact_hash = {
    #   name: Faker::Lorem.word,
    #   description: Faker::Lorem.sentence,
    #   status: Faker::Lorem.word,
    #   rating: 5
    # }
    new_contact_record = Contact.new(contact_hash)
    new_contact_record.save!
  end

end
seed_contact_table


