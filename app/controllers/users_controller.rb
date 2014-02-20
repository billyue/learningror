class UsersController < ApplicationController
  def index
    @users = User.find(:all)
  end

  def login
  end

  def post_login 
    @user = User.find_by_login(params[:user][:loginname])
    if !@user.nil? then 
       session["name"] = @user.first_name 
       session["id"]   = @user.id
       redirect_to :controller => 'photos', :action =>'index', :id=> @user.id.to_s()  
    else 
       flash[:message]="Please enter valid user name and password"
       render :action => :edit
     end
  end

  def logout
    redirect_to :action => :login, :message => "You have been logged out"
    reset_session
  end
end
