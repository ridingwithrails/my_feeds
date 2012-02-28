require "json"
class YoutubeFetcher < BaseFetcher
  @queue = :youtube_comments
  def self.perform video_id
    client = get_youtube_client
    comments = client.comments(video_id).map do |comment|
      {:author => comment.author,
       :content => comment.content,
      }
    end
    comments <<  {:embed_code => client.video_by(video_id).embed_html}
    unless comments.blank?
      comments_key = "youtube_#{video_id}"
      Rails.logger.debug "I just fetched #{comments.to_yaml}"
      $redis.set(comments_key, comments.to_yaml)
    end
  end
end