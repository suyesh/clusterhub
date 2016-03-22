class Formula < ActiveRecord::Base
  belongs_to :contact, class_name: 'User' # contact_id integer
  belongs_to :supplier, class_name: 'User' # supplier_id integer
end
