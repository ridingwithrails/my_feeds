require "json"
class YoutubeFetcher < BaseFetcher
  @queue = :youtube_comments
  def self.perform video_id
    client = get_youtube_client
    comments = client.comments(video_id).map{|comment| {:author => comment.author, :content => comment.content}}
    unless comments.blank?
      comments_key = "youtube_#{video_id}"
      Rails.logger.debug "I just fetched #{comments.to_yaml}"
      $redis.set(comments_key, comments)
    end
  end
end