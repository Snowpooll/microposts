class UsersController < ApplicationController
  before_action :set_params, only:[:edit,:update,:show, :followings,:followers]
  before_action :correct_user, only:[:edit,:update]
  

  def show
   @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] ="Wellcome to the Sample App"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user 
    else
      render 'edit'
    end
  end
  
  def followings
    @title = 'following users'
 #   @user =  User.find(params[:id]) #before_action で定義のため不要
    @users = @user.following_users
    render 'follow_follower_list'
  end
  
  def followers
    @title = 'follower users' #タイトル表示の文字列
  #  @user = User.find(params[:id])
    @users = @user.follower_users
    render 'follow_follower_list'
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :location,:password,:password_confirmation)
  end
  
  def set_params
    @user = User.find(params[:id])
  end
  
  def correct_user
    redirect_to root_path if !current_user?(@user)
  end
  

end
