# coing: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.table_exists?
  %w(nobu akr matz naruse usa eban ko1 knu drbrain mame).each do |h|
    User.where(username: h).first_or_create!
  end
end

if Company.table_exists?
  ['company 1', 'company 2', 'company 3'].each do |n|
    Company.where(name: n).first_or_create!
  end
end
