module Supplier::MassSendHelper
    def contact_name(phone_number)
        contact = Contact.find_by(cell_number: phone_number)
        full_name = contact.first_name + ' ' + contact.last_name
        full_name
    end

    def check_text(text)
        if text.not_sent?
            return 'Not Sent'
        else
            return 'Sent'
        end
    end

    def check_text_success(text)
        if text.not_sent?
            return 'warning'
        else
            return 'success'
        end
    end
end
