require "json"
class HeadLineFetcher < BaseFetcher
  @queue = :fetch_headlines
  def self.perform addr
    feed = self.feedzirra.fetch_and_parse addr
    unless feed.blank?
      feed_hex = Digest::MD5.hexdigest feed.entries.first.title
      entry =  feed.entries.first
      Rails.logger.debug "I just fetched #{feed.entries.first.title}"
      feed_hash = {
        :title => entry.title.sanitize  ,
        :url => entry.url,
        :summary => entry.summary
      }
      $redis.set("headline_#{feed_hex}", feed_hash.as_json )
    end
  end
end