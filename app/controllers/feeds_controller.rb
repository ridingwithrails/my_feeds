class FeedsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    @stories = $redis.keys.map do |key|
    if key.include?('headline')
        $redis.get(key)
      end
    end
    respond_with(@stories.compact.to_json)
  end
end
