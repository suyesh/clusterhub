module Admin::SuppliersHelper
  def supplier_full_name(supplier)
    full_name = supplier.first_name + " " + supplier.last_name
    return full_name
  end
end
