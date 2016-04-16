module Supplier::RetailersHelper
  def retailer_full_name(contact)
      unless retailer.nil?
          full_name = contact.first_name + ' ' + contact.last_name
          return full_name
     end
  end

  def mobile_carrier
      [
          'TMobile',
          'ATT',
          'Verizon',
          'Sprint',
          'US Cellular',
          'Ultra Mobile',
          'Simple Mobile',
          'Lyca Mobile',
          'H2O',
          'Red Pocket',
          'Ting',
          'Net10',
          'Tracfone',
          'PagePlus'
      ]
  end
end
