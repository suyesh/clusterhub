class LoginrequiredController < ApplicationController
  before_action :require_login, alert: 'You must be Logged in to Visit this page.'
end
