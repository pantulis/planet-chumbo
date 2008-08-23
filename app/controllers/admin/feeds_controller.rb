class Admin::FeedsController < ResourceController::Base

  layout 'admin'

  update do
    wants.html {redirect_to :action => 'edit', :id => object.id}
    flash "Feed updated"
    after {object.save}
  end

  private
    def collection
      @collection ||= Feed.paginate(:page => params[:page], :order => 'name ASC', :per_page => 20)
    end 
    
    def object
      @feed = Feed.find(params[:id])
    end
end

