class Url < ActiveRecord::Base
  def initiate_fetch
    Resque.enqueue(Fetcher, self.url)
  end
end