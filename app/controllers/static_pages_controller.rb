class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if logged_in?
    if logged_in_user
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page(params[:page])
    end
  end
end
