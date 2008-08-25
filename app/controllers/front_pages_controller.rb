class FrontPagesController < ApplicationController

  session :disabled => true

  def index
    page = params[:page]
    @posts = FeedPost.paginate(
      :page => page, :order => 'date_published DESC', :per_page => 5)
      
    respond_to do |format|
      format.html
      format.atom
      format.js
    end
  end
end
