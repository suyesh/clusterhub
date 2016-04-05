module Admin::RetailersHelper
  def retailer_full_name(retailer)
    full_name = retailer.first_name + " " + retailer.last_name
    return full_name
  end

  def roles
    [
      ["Pending", :pending],
      ["Retailer", :retailer],
      ["Supplier", :supplier],
      ["Trucking", :trucking]
    ]
  end

  def status
    [
      ["Inactive", :inactive],
      ["Active", :active],
      ["Denied", :denied],
      ["Archive", :archived]
    ]
  end

end
