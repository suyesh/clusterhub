class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :first_name,
            :last_name,
            :business_name,
            :phone_number,
            :cell_number,
            :tax_identification,
            :ssn,
            :address,
            :city,
            :state,
            :zip_code,
            :account_type,
            :y_in_biz,
            :email,
            presence: true
  validates_confirmation_of :password
  validates :password, presence: true, length: { minimum: 6 }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  enum account_status: [:pending, :approved, :disabled]
  enum user_kind: [:unsure, :retailer, :supplier, :trucking, :admin]


end
