module Supplier::DashboardHelper

  def to_percentage(text)
    if text.nil?
      percentage = 0
    else
      percentage = text * 100/2000
    end
    return percentage.to_f
  end

  def calculate_average(current_user)
    return 0
  end
end
