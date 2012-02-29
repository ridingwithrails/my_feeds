class VideosController  < ApplicationController
before_filter

  def index
  unless params[:q].blank?
    @client = get_youtube_client
    @videos = @client.videos_by(:query => params[:q])
  end
  end
  
end