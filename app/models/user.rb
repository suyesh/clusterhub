class User < ActiveRecord::Base
  authenticates_with_sorcery!

  enum role: [:retailer, :supplier, :trucking, :admin]
  enum status: [:pending,:active,:denied,:archived,:inactive]
end
