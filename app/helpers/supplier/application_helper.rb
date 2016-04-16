module Supplier::ApplicationHelper
    def avatar_url(user)
        default_url = "#{root_url}images/person_placeholder.png"
        gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
        "http://gravatar.com/avatar/#{gravatar_id}.png?s=200"
    end

    #  def contact_full_name(contact)
    #  full_name = contact.first_name + " " + contact.last_name
    # #end
    def fuel_types
        [
            '87 RFG E10',
            '89 RFG E10',
            '91 RFG E10',
            '93 RFG E10',
            'Low Sodium Diesel',
            'Dyed ULS Diesel',
            'Undyed ULS Diesel',
            'Jet Fuel',
            'Heating Oil',
            'Kerosene'
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
