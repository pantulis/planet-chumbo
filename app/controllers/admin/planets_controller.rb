class Admin::PlanetsController < ApplicationController
  
  layout 'admin'
  
  def index
    
  end
  
  def edit
    @planet = Planet.find(:first) 
  end
  
  def update
    @planet = Planet.find(:first)
    @planet.update_attributes(params[:planet])
    flash[:notice] = 'Los datos se han cambiado correctamente'
    redirect_to edit_admin_planet_url(@planet)
  end
end