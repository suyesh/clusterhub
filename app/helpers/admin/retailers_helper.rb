module Admin::RetailersHelper
  def retailer_full_name(retailer)
    full_name = retailer.first_name + " " + retailer.last_name
    return full_name
  end

  def roles
    [
      :pending,
      :retailer,
      :supplier,
      :trucking,
      :admin
    ]
  end

  def status
    [
      :inactive,
      :active,
      :denied,
      :archived
    ]
  end

end
