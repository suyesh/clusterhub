module Supplier::RetailersHelper
  def retailer_full_name(contact)
      unless contact.nil?
          full_name = contact.first_name + ' ' + contact.last_name
          return full_name
     end
  end

  def add_or_minus(price)
    if price < 0
      "-#{price}"
    else
      "+#{price}"
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

  def link_to_add_fields(name, f, association)
      # creates a new instance of the 'has_many' object
      new_object = f.object.send(association).klass.new
      # new_object = f.object.association.klass.new
      #    f.object.association.klass # => Document
      # new_object = f.object.documents.build Document(user_id: f.object.id)

      # gets the object id
      id = new_object.object_id

      # creates a new form for the association
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
          render(association.to_s + '_fields', f: builder)
      end
      link_to(name, '#', class: 'btn btn-success  add_fields', data: { id: id, fields: fields.delete("\n") })
  end
end
