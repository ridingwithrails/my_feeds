module FeedsContollerHelper

  def process_video_comment(comment)
      "#{comment[:author].name} + #{comment[:content]}" unless comment[:author].blank?
  end

end
