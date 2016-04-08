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
    unless current_user.fuel_prices.empty? && current_user.contacts.empty?
      regulars = []
      medium = []
      premium = []
      diesel = []
      current_user.contacts.each do |contact|
        regulars << contact.c_regular
        medium << contact.c_medium
        premium << contact.c_premium
        diesel << contact.c_diesel
      end
      av_regular =   regulars.inject(:+) / regulars.length
      av_medium = medium.inject(:+) / medium.length
      av_premium = premium.inject(:+) / premium.length
      av_diesel = diesel.inject(:+)/ diesel.length
      all_av = {
        regular: av_regular,
        medium: av_medium,
        premium: av_premium,
        diesel: av_diesel
      }
      return all_av[:regular]
    end
    return 0
  end
end
