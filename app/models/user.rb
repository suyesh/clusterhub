class User < ActiveRecord::Base
    before_save :generate_account_number
    authenticates_with_sorcery!
    validates :password, length: { minimum: 3 }, if: -> { new_record? || changes['password'] }
    validates :password, confirmation: true, if: -> { new_record? || changes['password'] }
    validates :password_confirmation, presence: true, if: -> { new_record? || changes['password'] }
    validates :email, uniqueness: true, presence: true, if: -> { new_record? || changes['password'] }
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Oops! Looks like the email you provided is not valid. Please fix and resubmit the form.'
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :business_name
    validates_presence_of :phone_number
    validates_presence_of :cell_number
    validates_presence_of :street_address
    validates_presence_of :city
    validates_presence_of :state
    validates_presence_of :zip_code
    # validates :tax_id, uniqueness: true, presence: true, if: -> { new_record? || changes['password'] }
    # validates :ssn, uniqueness: true, presence: true, if: -> { new_record? || changes['password'] }
    validates_presence_of :terms, terms: 1, message: 'You have to agree to our terms and conditions.', on: :create

    enum role: [:pending, :retailer, :supplier, :trucking, :admin]
    enum status: [:inactive, :active, :denied, :archived]

    has_many :stations, foreign_key: :retailer_id
    has_many :fuel_prices, foreign_key: :supplier_id
    has_many :contacts, foreign_key: :supplier_id
    has_many :retail_prices, foreign_key: :retailer_id
    has_many :pricerockets, foreign_key: :supplier_id

    # validate :validate_formula_duplication
    # validates :fuel_formula, presence: true
    has_many :fuel_formulas, foreign_key: :retailer_id, dependent: :destroy
    accepts_nested_attributes_for :fuel_formulas, allow_destroy: true
    has_many :connections
    ##has_many :retailers, class_mame: 'User', foreign_key: :retailer_id, through: :connections_retails
    ##has_many :suppliers, through: :connections_suppliers

    private

    def generate_account_number
        rand_num = SecureRandom.hex(3).upcase
        if account_number.nil?
            self.account_number = if admin? && active?
                                      'EGYPT' + rand_num
                                  elsif retailer? && active?
                                      'NJ' + rand_num + 'RET'
                                  elsif supplier? && active?
                                      'NJ' + rand_num + 'SUP'
                                  elsif trucking? && active?
                                      'NJ' + rand_num + 'TRU'
                                          end
        end
    end

    def validate_formula_duplication
        formulas = []
        counter = 0
        fuel_formulas.each do |formula|
            if formulas.include? formula.fuel
                counter += 1
            else
                formulas << formula.fuel
            end
        end
        return false if counter > 0
    end
end
