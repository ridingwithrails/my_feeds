class FeedsController < ApplicationController
  before_filter :authenticate_user!
end
