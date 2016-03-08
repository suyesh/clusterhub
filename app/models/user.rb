class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :business_name, presence: true
  validates :phone_number, presence: true
  validates :cell_number, presence: true
  validates :tax_identification, presence: true
  validates :ssn, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :account_type, presence: true
  validates :y_in_biz, presence: true
  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create




end
