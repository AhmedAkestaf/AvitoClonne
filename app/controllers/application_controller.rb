class ApplicationController < ActionController::Base
    include SessionsHelper
  
    private
  
    # Vérifie si un utilisateur est connecté
    def require_login
      unless logged_in?
        store_location
        flash[:danger] = "Veuillez vous connecter pour accéder à cette page"
        redirect_to login_url
      end
    end
  
    # Stocke l'URL vers laquelle l'utilisateur était sur le point d'accéder
    def store_location
      session[:forwarding_url] = request.original_url if request.get?
    end
  end