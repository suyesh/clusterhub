# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(
  first_name: 'John',
  last_name: 'Doe',
  business_name: 'ACME inc',
  phone_number: '2128456789',
  cell_number: '2123456789',
  street_address: '81 updown st',
  apt_suite: '35',
  city: 'New York',
  state: 'New York',
  zip_code: '11367',
  tax_id: '223103456',
  ssn: '23456789',
  in_biz: '3',
  email: 'apple@yahoo.com',
  password: 'password',
  password_confirmation: 'password',
  terms: 1)
