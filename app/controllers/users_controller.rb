class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  # Permettre à un utilisateur de modifier son propre profil OU à un admin de modifier n'importe quel profil
  before_action :correct_user_or_admin, only: [:show, :edit, :update]
  # Actions réservées uniquement aux administrateurs
  before_action :admin_user, only: [:index, :destroy]
 


  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Compte créé avec succès!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  def index
    if params[:q].present?
      @users = User.where("nom LIKE ? OR prenom LIKE ? OR email LIKE ?", 
                           "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @users = User.all
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profil mis à jour!"
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utilisateur supprimé"
    redirect_to users_path
  end

  
  private
  
  def user_params
    params.require(:user).permit(:nom, :prenom, :email, :phone, :password, :password_confirmation)
  end

  def correct_user_or_admin
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) || current_user.admin?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user&.admin?
  end

end