module SessionsHelper
    # Connecte l'utilisateur donné
    def log_in(user)
      session[:user_id] = user.id
    end
  
    # Se souvient d'un utilisateur dans une session persistante
    def remember(user)
      user.remember
      cookies.permanent.encrypted[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
    end
  
    # Oublie un utilisateur persistant
    def forget(user)
      user.forget
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
    end
  
    # Renvoie l'utilisateur connecté actuellement
    def current_user
      if (user_id = session[:user_id])
        @current_user ||= User.find_by(id: user_id)
      elsif (user_id = cookies.encrypted[:user_id])
        user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
          log_in user
          @current_user = user
        end
      end
    end
  
    # Vérifie si l'utilisateur donné est l'utilisateur actuel
    def current_user?(user)
      user && user == current_user
    end
  
    # Retourne true si l'utilisateur est connecté, false sinon
    def logged_in?
      !current_user.nil?
    end
  
    # Déconnecte l'utilisateur courant
    def log_out
      forget(current_user)
      session.delete(:user_id)
      @current_user = nil
    end
  
    # Redirige vers l'emplacement stocké (ou vers l'emplacement par défaut)
    def redirect_back_or(default)
      redirect_to(session[:forwarding_url] || default)
      session.delete(:forwarding_url)
    end
  end