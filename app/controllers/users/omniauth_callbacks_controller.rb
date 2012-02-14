class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    render :text => "DO IT BIG"
  end
end