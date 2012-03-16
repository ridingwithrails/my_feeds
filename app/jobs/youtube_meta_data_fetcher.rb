class YoutubeMetaDataFetcher < BaseFetcher
  @queue = :youtube_meta_data
  def self.perform(video_id)
    client = get_youtube_client
    youtube_video_model = client.video_by(video_id)
    video = Video.find_by_youtube_id video_id
    video.update_attributes(
        :thumbnail => youtube_video_model.thumbnails.first.url,
        :title => youtube_video_model.title,
        :duration => youtube_video_model.duration,
        :description => youtube_video_model.description,
        :rating => youtube_video_model.rating.average,
        :expire_at => 4.hours.from_now
    )
    YoutubeCommentsFetcher.perform(video_id)
  end
end