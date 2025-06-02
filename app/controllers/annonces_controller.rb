class AnnoncesController < ApplicationController
  before_action :require_login, except: [:index, :show, :recherche, :par_categorie]
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]
  before_action :check_owner_or_admin, only: [:edit, :update, :destroy]

  # GET /annonces - Liste toutes les annonces
  def index
    @annonces = Annonce.order(created_at: :desc)
  end

  # GET /annonces/:id - Affiche une annonce spécifique
  def show
  end

  # GET /annonces/new - Formulaire pour créer une nouvelle annonce
  def new
    @annonce = current_user.annonces.build
  end

  # POST /annonces - Crée une nouvelle annonce
  def create
    @annonce = current_user.annonces.build(annonce_params)
    
    if @annonce.save
      flash[:success] = "Votre annonce a été publiée avec succès!"
      redirect_to @annonce
    else
      puts "Erreurs: #{@annonce.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  # GET /annonces/:id/edit - Formulaire pour modifier une annonce
  def edit
  end

  # PATCH/PUT /annonces/:id - Met à jour une annonce
  def update
    if @annonce.update(annonce_params)
      flash[:success] = "Votre annonce a été mise à jour avec succès!"
      redirect_to @annonce
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /annonces/:id - Supprime une annonce
  def destroy
    @annonce.destroy
    flash[:success] = "L'annonce a été supprimée avec succès!"
    
    # Rediriger vers la liste des annonces de l'admin si c'est un admin qui supprime
    if current_user.admin?
      redirect_to annonces_path
    else
      redirect_to mes_annonces_path
    end
  end

  # GET /mes-annonces - Liste les annonces de l'utilisateur connecté
  def mes_annonces
    @annonces = current_user.annonces.order(created_at: :desc)
  end

  # GET /admin/annonces - Liste toutes les annonces pour l'admin
  def admin_index
    # Vérifier que l'utilisateur est admin
    unless current_user && current_user.admin?
      flash[:danger] = "Accès non autorisé."
      redirect_to root_path
      return
    end
    
    @annonces = Annonce.order(created_at: :desc)
    render :admin_index
  end

  # GET /recherche - Recherche d'annonces
  def recherche
    query = params[:query]
    categorie = params[:categorie] if params[:categorie].present?
    localisation = params[:localisation] if params[:localisation].present?
    
    @annonces = Annonce.all
    
    if query.present?
      @annonces = @annonces.where("titre LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
    end
    
    if categorie.present?
      @annonces = @annonces.where(categorie: categorie)
    end
    
    if localisation.present?
      @annonces = @annonces.where("localisation LIKE ?", "%#{localisation}%")
    end
    
    @annonces = @annonces.order(created_at: :desc)
    
    render :index
  end

  # GET /categories/:categorie - Filtre les annonces par catégorie
  def par_categorie
    @categorie = params[:categorie]
    @annonces = Annonce.where(categorie: @categorie).order(created_at: :desc)
    render :index
  end

  private
  
  # Récupère l'annonce par son ID
  def set_annonce
    @annonce = Annonce.find(params[:id])
  end
  
  # Vérifie que l'utilisateur connecté est le propriétaire de l'annonce ou un admin
  def check_owner_or_admin
    unless @annonce.user_id == current_user.id || current_user.admin?
      flash[:danger] = "Vous n'êtes pas autorisé à effectuer cette action."
      redirect_to annonces_path
    end
  end
  
  # Paramètres autorisés pour une annonce
  def annonce_params
    params.require(:annonce).permit(:titre, :description, :prix, :categorie, :localisation, :image)
  end
end