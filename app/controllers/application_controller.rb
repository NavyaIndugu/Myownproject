class ApplicationController < ActionController::Base
    #IT IS USED FOR THE AUTHENTICATION
    before_action :authenticate_user!
end
