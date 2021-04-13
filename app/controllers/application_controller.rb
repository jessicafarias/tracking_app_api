class ApplicationController < ActionController::Base
  include TracksHelper
  protect_from_forgery with: :null_session
end
