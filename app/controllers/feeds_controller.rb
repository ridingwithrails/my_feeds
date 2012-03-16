class FeedsController < ApplicationController
  #include Common::Facebook

  before_filter :authenticate_user!#:process_facebook_messages
  respond_to :html, :json

  def index
    #@stories = Feed.stories
    @videos = $redis.keys.select{|v| v.include?("youtube")}

    #if params[:youtube_id]
    #
    #end

    respond_with(@videos.compact.to_json)
  end




end
