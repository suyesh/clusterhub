FactoryGirl.define do
  # sequence(:email) { |n| "test#{n}@example.com" }

  factory :john_doe, class: 'User' do
    first_name 'John'
    last_name 'Doe'
    business_name 'ACME inc'
    phone_number '2128456789'
    cell_number '2123456789'
    street_address '81 updown st'
    apt_suite '35'
    city 'New York'
    state 'New York'
    zip_code '11367'
    tax_id '223103456'
    ssn '23456789'
    in_biz '3'
    email 'john.doe@example.com'
    password 'password'
    password_confirmation 'password'
    terms 1
  end
end
