class Url < ActiveRecord::Base

  def initiate_fetch_headlines
    Rails.logger.debug "Getting story from #{self.url}"
    Resque.enqueue(HeadLineFetcher, self.url)
  end

  def self.fetch_all
    Url.all.each {|u| u.initiate_fetch_headlines}
  end

  def self.fetch_facebook_comments(access_token)
    p "getting fb"
    Resque.enqueue(FacebookFetcher, access_token)
  end



end