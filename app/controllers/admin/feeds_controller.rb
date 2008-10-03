class Admin::FeedsController < ResourceController::Base

  layout 'admin'
  before_filter :set_listing_title

  create do
    wants.html { redirect_to({:action => 'edit', :id => object.id})}
    flash "Feed created and saved"
    after { object.save } 
  end

  update do
    wants.html {redirect_to :action => 'edit', :id => object.id}
    flash "Feed updated"
    after {object.save}
  end

  private
    def collection
      scopes = []
      scopes << :published if params[:published]
      scopes << :banned if params[:banned]
      
      @collection = scopes.inject(Feed){|m,v| m.scopes[v].call(m)}.paginate(
        :page => params[:page], :order => 'name ASC', :per_page => 20)
    end 
    
    def set_listing_title
      @listing_title = "Feeds » Banned" if params[:banned]
      @listing_title = "Feeds » Published" if params[:published]
    end
    
#    def object
#      @feed = Feed.find(params[:id])
#    end
end

