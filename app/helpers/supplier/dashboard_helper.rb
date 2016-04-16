module Supplier::DashboardHelper
    def to_percentage(text)
        percentage = if text.nil?
                         0
                     else
                         text * 100 / 2000
                     end
        percentage.to_f
    end

    def calculate_average(_current_user)
        0
    end
end
