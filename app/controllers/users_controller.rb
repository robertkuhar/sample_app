class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user_edit_update, :only => [:edit, :update]
  before_filter :correct_user_new_create, :only => [ :new, :create ]
  before_filter :admin_user, :only => :destroy


  def index
    @title = "All Users"
    @users = User.paginate(:page => params[:page])
  end

  def new
    @user = User.new
    @title = "Sign Up"
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = CGI.escapeHTML(@user.name)
  end

  def edit
    @title = "Edit user"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = 'Sign up'
      @user.password = ''
      @user.password_confirmation = ''
      render "new"
    end
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    target = User.find(params[:id])
    if target != current_user
      target.destroy
      flash[:success] = "User destroyed."
    elsif
      flash[:error] = "You cannot destroy yourself."
    end
    redirect_to users_path
  end

  private

  def correct_user_edit_update
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def correct_user_new_create
    redirect_to(root_path) if signed_in?
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
