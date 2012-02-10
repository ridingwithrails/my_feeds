class Fetcher
  @queue = :fetch_q  
  def self.perform addr
    feed = self.feedzirra.fetch_and_parse addr
    $redis.set(Time.now.to_s, feed.entries.first.title)
  end

  def self.feedzirra
    Feedzirra::Feed
  end
end