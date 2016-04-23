class User < ActiveRecord::Base
    before_save :generate_account_number
    authenticates_with_sorcery!
    attr_accessor :user_supplier, :supplier_number
    validates :password, length: { minimum: 3 }, if: -> { new_record? || changes['password'] }
    validates :password, confirmation: true, if: -> { new_record? || changes['password'] }
    validates :password_confirmation, presence: true, if: -> { new_record? || changes['password'] }
    validates :email, uniqueness: true, presence: true, if: -> { new_record? || changes['password'] }
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Oops! Looks like the email you provided is not valid. Please fix and resubmit the form.'
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :business_name
    validates_presence_of :cell_number
    enum role: [:pending, :retailer, :supplier, :trucking, :admin]
    enum status: [:inactive, :active, :denied, :archived]
    has_many :stations, foreign_key: :retailer_id
    has_many :fuel_prices, foreign_key: :supplier_id
    has_many :contacts, foreign_key: :supplier_id
    has_many :retail_prices, foreign_key: :retailer_id
    has_many :pricerockets, foreign_key: :supplier_id
    has_many :fuel_formulas, foreign_key: :retailer_id, dependent: :destroy
    accepts_nested_attributes_for :fuel_formulas, allow_destroy: true
    has_many :connection_retailers
    has_many :connection_suppliers
    has_many :retailers, foreign_key: :retailer_id, through: :connection_retailers,dependent: :destroy
    has_many :suppliers, foreign_key: :supplier_id, through: :connection_suppliers,dependent: :destroy
    validate :validate_formula_duplication, if: :user_supplier_check

    private


    def user_supplier_check
        user_supplier == :supplier
    end

    def gen_retail_price
      supp = suppliers.find(supplier_number)
      fuel_formulas.each do |formula|
        supp.fuel_prices.last.fuel_products.each do |products|
        end
      end
    end

    def generate_account_number
        rand_num = SecureRandom.hex(3).upcase
        if account_number.nil?
            self.account_number = if admin?
                                      'EGYPT' + rand_num
                                  elsif retailer?
                                      'NJ' + rand_num + 'RET'
                                  elsif supplier?
                                      'NJ' + rand_num + 'SUP'
                                  elsif trucking?
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
