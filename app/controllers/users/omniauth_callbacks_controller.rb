class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter :set_user, :only => :facebook

  def facebook
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  private
  def set_user
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    session["fb_access_token"] = request.env["omniauth.auth"]["credentials"]["token"]
  end
end