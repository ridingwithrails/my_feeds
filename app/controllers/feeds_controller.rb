class FeedsController < ApplicationController
  #include Common::Facebook

  before_filter :authenticate_user! #:process_facebook_messages
  respond_to :html, :json

  def index
    @stories = Feed.stories
    respond_with(@stories.compact.to_json)
  end

end
