require "json"
class FacebookFetcher <  BaseFetcher
  @queue = :facebook_comments
  def self.perform access_token
    Rails.logger.debug
    $redis.set "ANIS_FACEBOOK", "lalalala"
  end


end