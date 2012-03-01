class VideoObserver < ActiveRecord::Observer
  def after_save(video)
    puts "In observer ready to sleep now #{video.fetched}";
    Url.youtube_meta_data video.youtube_id if video.title.nil? 
    puts "After condition in observer #{video.fetched}"
  end
end
