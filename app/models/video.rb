class Video  < ActiveRecord::Base

  def eligible_for_fetch?
    title.nil? || expire_at < updated_at
  end
end