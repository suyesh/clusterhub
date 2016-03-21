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
  tax_id: '2231034561',
  ssn: '234567892',
  in_biz: '3',
  email: 'new@yahoo.com',
  password: 'password',
  password_confirmation: 'password',
  terms: 1,
  role: 0,
  status: 0
)

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
  tax_id: '2231034563',
  ssn: '234567894',
  in_biz: '3',
  email: 'retailer@yahoo.com',
  password: 'password',
  password_confirmation: 'password',
  terms: 1,
  role: 1,
  status: 1
)

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
  tax_id: '2231034565',
  ssn: '234567896',
  in_biz: '3',
  email: 'supplier@yahoo.com',
  password: 'password',
  password_confirmation: 'password',
  terms: 1,
  role: 2,
  status: 1
)

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
  tax_id: '2231034567',
  ssn: '234567898',
  in_biz: '3',
  email: 'trucking@yahoo.com',
  password: 'password',
  password_confirmation: 'password',
  terms: 1,
  role: 3,
  status: 1
)

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
  tax_id: '2231034569',
  ssn: '234567890',
  in_biz: '3',
  email: 'admin@yahoo.com',
  password: 'password',
  password_confirmation: 'password',
  terms: 1,
  role: 4,
  status: 1
)
