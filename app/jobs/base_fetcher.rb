class BaseFetcher
  def self.feedzirra
     Feedzirra::Feed
  end

  def self.get_youtube_client
     YouTubeIt::Client.new
  end
end