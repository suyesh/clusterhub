module Supplier::ContactsHelper
    def contact_full_name(contact)
        unless contact.nil?
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

    def latest_price_date(latest_price)
        if latest_price.nil?
            return '00/00/00'
        else
            return latest_price.created_at.strftime('Latest Price Updated on %B %d at %I:%M %p')
        end
    end

    def latest_price_diesel(latest_price)
        if latest_price.nil?
            return 0
        else
            return latest_price.r_diesel
        end
    end

    def latest_price_regular(latest_price)
        if latest_price.nil?
            return 0
        else
            return latest_price.r_regular
        end
    end

    def latest_price_premium(latest_price)
        if latest_price.nil?
            return 0
        else
            return latest_price.r_premium
        end
    end

    def latest_price_medium(latest_price)
        if latest_price.nil?
            return 0
        else
            return latest_price.r_medium
        end
    end
end
