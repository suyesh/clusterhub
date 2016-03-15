class User < ActiveRecord::Base
  #before_save :generate_account_number, on: [:create]
  authenticates_with_sorcery!

  enum role: [:reviewed,:retailer, :supplier, :trucking, :admin]
  enum status: [:pending, :active, :denied, :archived, :inactive]

  # validate :account_number_check

  # def generate_account_number
  #   randomly generated
  # end

  #private

  # do a custum validator

  # def account_number_check
  #   if User.find_by(account_number: the_account_number)
  #    SecureRandom.hex(2)
  # end
  #end
#end
