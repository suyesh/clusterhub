require "rails_helper"


RSpec.feature "Users can sign Up" do

  scenario "With Valid attributes" do
    #This should test If User can sign up
    #After sign-up They should be redirected to Upload documents page
      #-where user.documents will be created and assigned to user.
    #After uploading documents They should be redirected to -
      #-Splash page with message, asking them to wait for 24 hours for approval.
  end

  scenario "With Invalid attributes" do
  end

end
