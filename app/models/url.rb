class Url < ActiveRecord::Base

  def initiate_fetch
    Rails.logger.debug "Getting story from #{self.url}"
    Resque.enqueue(Fetcher, self.url)
  end

  def self.fetch_all
    Url.all.each {|u| u.initiate_fetch}
  end
end