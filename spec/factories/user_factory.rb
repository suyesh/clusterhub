FactoryGirl.define do
  factory :user do
    first_name 'Suyesh'
    last_name 'Bhandari'
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'password'
    business_name 'Acme Retail Inc'
    phone_number '3472817892'
    cell_number '3472817892'
    tax_identification '1234567890'
    ssn' 2222'
    address '3416 99 st'
    zip_code '11234'
    city 'New York'
    state 'New York'
    account_type 'Retail'
    y_in_biz '5'
  end
end
