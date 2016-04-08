class Supplier::MassSendController < Supplier::ApplicationController

  def index
    @contacts = current_user.contacts.all
  end

  def mass_send_texts
  end
end
