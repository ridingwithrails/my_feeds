class ApplicationController < ActionController::Base
  include Common::Youtube
  protect_from_forgery
end
