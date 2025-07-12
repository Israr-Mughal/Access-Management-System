# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
# Create age groups
age_groups = [
  { name: 'Little Ones', min_age: 0, max_age: 12, requires_parental_consent: true },
  { name: 'Adolescents', min_age: 13, max_age: 17, requires_parental_consent: true },
  { name: 'Emerging Adults', min_age: 18, max_age: 25, requires_parental_consent: false },
  { name: 'Middle-Aged', min_age: 26, max_age: 64, requires_parental_consent: false },
  { name: 'Golden Years', min_age: 65, max_age: 120, requires_parental_consent: false }
]

age_groups.each do |group|
  AgeGroup.find_or_create_by(name: group[:name]) do |ag|
    ag.assign_attributes(group)
  end
end

# Create test users for login testing
puts "Creating test users..."

# Adult user (for full access testing)
adult_user = User.find_or_create_by(email: 'michael.chen@example.com') do |user|
  user.first_name = 'Michael'
  user.last_name = 'Chen'
  user.phone_number = '5556789012'
  user.date_of_birth = 28.years.ago.to_date
  user.password = 'securepass456'
  user.password_confirmation = 'securepass456'
end

# Minor user (for parental consent testing)
minor_user = User.find_or_create_by(email: 'emma.williams@example.com') do |user|
  user.first_name = 'Emma'
  user.last_name = 'Williams'
  user.phone_number = '5553456789'
  user.date_of_birth = 15.years.ago.to_date
  user.password = 'securepass456'
  user.password_confirmation = 'securepass456'
end

# Create sample organizations
tech_org = Organization.find_or_create_by(name: 'CloudVision Technologies') do |org|
  org.organization_type = 'company'
end

nonprofit_org = Organization.find_or_create_by(name: 'Ocean Conservation Alliance') do |org|
  org.organization_type = 'nonprofit'
end

# Create organization memberships
if adult_user.persisted? && tech_org.persisted?
  OrganizationMembership.find_or_create_by(
    user: adult_user,
    organization: tech_org
  ) do |membership|
    membership.role = 'admin'
    membership.status = 'active'
  end
end

if minor_user.persisted? && nonprofit_org.persisted?
  OrganizationMembership.find_or_create_by(
    user: minor_user,
    organization: nonprofit_org
  ) do |membership|
    membership.role = 'member'
    membership.status = 'active'
  end
end

puts "Test users created successfully!"
puts "Adult user: michael.chen@example.com / securepass456"
puts "Minor user: emma.williams@example.com / securepass456"
puts "Organizations: #{Organization.count} created"
puts "Memberships: #{OrganizationMembership.count} created"
