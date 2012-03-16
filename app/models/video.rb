class Video  < ActiveRecord::Base

  def eligible_for_fetch?
    title.nil? || expire_at < updated_at
  end

  def self.fetch_comments
    Video.all.each {|v| v.youtube_comments}
  end

  def youtube_comments
    Rails.logger.debug "Getting comments for Video #{self.youtube_id}"
    Resque.enqueue(YoutubeCommentsFetcher, self.youtube_id)
  end

  def self.youtube_meta_data(video_id)
    Rails.logger.debug "Getting video meta debugger"
    Resque.enqueue(YoutubeMetaDataFetcher, video_id)
  end
end