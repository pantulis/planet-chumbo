class Admin::FeedsController < ApplicationController

  layout 'admin'

  def index
    @planet = Planet.find(:first)
    @feeds = Feed.paginate(
       :page => params[:page], :order => 'url ASC', :per_page => 20)
  end

end