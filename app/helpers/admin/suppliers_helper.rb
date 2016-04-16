module Admin::SuppliersHelper
    def supplier_full_name(supplier)
        full_name = supplier.first_name + ' ' + supplier.last_name
        full_name
    end
end
