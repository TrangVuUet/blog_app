class StaticPagesController < ApplicationController

  def home
    if logged_in?
      # @entry -> create new entry
      @entry = current_user.entries.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @comment = Comment.new
    end
  end


  def about
  end

  def contact
  end
end
