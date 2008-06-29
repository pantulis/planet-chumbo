class FrontPagesController < ApplicationController
  def index
    page = params[:page]
    @posts = FeedPost.paginate(
      :page => page, :order => 'date_published DESC', :per_page => 30)
  end
end
