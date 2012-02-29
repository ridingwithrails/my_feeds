class Url < ActiveRecord::Base

  def initiate_fetch
    Rails.logger.debug "Getting story from #{self.url}"
    Resque.enqueue(HeadLineFetcher, self.url)
  end

  def self.fetch_all
    Url.all.each {|u| u.initiate_fetch}
  end

  def self.fetch_facebook_comments(access_token)
    p "getting fb"
    Resque.enqueue(FacebookFetcher, access_token)
  end

  def self.youtube_comments(video_id)
    Rails.logger.debug "Getting comments for Video #{video_id}"
    Resque.enqueue(YoutubeFetcher, video_id)
  end

  def self.youtube_meta_data(video_id)
    Rails.logger.debug "Getting video meta debugger"
    Resque.enqueue(YoutubeMetaDataFetcher, video_id)
  end

end