class VideoObserver < ActiveRecord::Observer
  def after_save(video)
    Rails.logger.debug("In observer ready to sleep now");
    Url.youtube_meta_data video.youtube_id
  end
end
