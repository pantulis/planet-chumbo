class Admin::UsersController < ApplicationController
  
  layout 'admin'
  
  def index
  end
  
  def edit
    @planet = Planet.find(:first)
    @user = User.find(:first) 
  end
  
  def update
    @user = User.find(:first)
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Los datos del usuario se han cambiado correctamente'
    else
      flash[:error] = @user.errors
    end
    
    redirect_to edit_admin_user_url(@user)
  end
end