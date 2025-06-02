class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path
    else
      # Gestion des messages d'erreur spécifiques
      if !user
        flash.now[:email_error] = "Cet email n'est pas enregistré"
        flash.now[:danger] = "Email non trouvé dans notre base de données"
      elsif !user.authenticate(params[:session][:password])
        flash.now[:password_error] = "Mot de passe incorrect"
        flash.now[:danger] = "Le mot de passe saisi est incorrect"
      else
        flash.now[:danger] = "Combinaison email/mot de passe invalide"
      end
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def redirect_if_logged_in
    redirect_to root_url if logged_in?
  end
end