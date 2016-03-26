FactoryGirl.define do
  factory :contact do
    first_name 'John'
    last_name 'Doe'
    business_name 'Acme Inc'
    phone_number '2124567890'
    cell_number '5202124567'
    carrier "TMobile"
    street_address '212 Wise St'
    apt_suite '410'
    city 'New york'
    state "New York"
    zip_code '11104'
    c_regular 1.2
    c_medium 1.2
    c_premium 1.2
    c_diesel 1.2
    c_delivery 200
  end
end
