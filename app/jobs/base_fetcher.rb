class BaseFetcher
  include Common::Youtube
  def self.feedzirra
     Feedzirra::Feed
  end
end