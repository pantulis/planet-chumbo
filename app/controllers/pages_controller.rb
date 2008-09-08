class PagesController < ApplicationController

  session :disabled => true

  def show
    render :action => params[:page]
  end
end
