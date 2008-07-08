class Admin::FeedPostsController < ApplicationController

  layout 'admin'

  def index
    @planet = Planet.find(:first)
    @feed_posts = FeedPost.paginate(
       :page => params[:page], :order => 'date_published DESC', :per_page => 25)
  end

end