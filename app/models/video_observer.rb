class VideoObserver < ActiveRecord::Observer
  def after_save(video)
    puts "In observer ready to sleep now #{video.expire_at}";
    Url.youtube_meta_data video.youtube_id if video.eligible_for_fetch?
    puts "After condition in observer #{video.expire_at}"
  end
end
