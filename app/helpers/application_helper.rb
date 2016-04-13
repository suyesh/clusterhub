module ApplicationHelper
    def is_active_controller(controller_name)
        params[:controller] == controller_name ? "active" : nil
    end

    def is_active_action(action_name)
        params[:action] == action_name ? "active" : nil
    end

    def user_navigation(current_user)
        if current_user.admin?
          render 'layouts/admin_navigation'
        elsif current_user.retailer?
          render 'layouts/retailer_navigation'
        elsif current_user.supplier?
          render 'layouts/supplier_navigation'
        else
          render 'layouts/trucking_navigation'
        end

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
        render(association.to_s + "_fields", f: builder)
      end
      link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end
end
