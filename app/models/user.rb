class User < ApplicationRecord

    has_many :annonces, dependent: :destroy
    attr_accessor :remember_token
    
    before_save { self.email = email.downcase }
    
    validates :prenom, presence: true, length: { maximum: 50 }
    validates :nom, presence: true, length: { maximum: 50 }
    validates :phone, presence: true, format: { with: /\A\d+\z/, message: "only allows numbers" }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
    # Renvoie le hash d'un token donné
    def self.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  
    # Renvoie un token aléatoire
    def self.new_token
      SecureRandom.urlsafe_base64
    end
  
    # Se souvient d'un utilisateur dans la base de données pour utiliser dans les sessions persistantes
    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end
  
    # Retourne vrai si le token donné correspond au digest
    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
  
    # Oublie un utilisateur
    def forget
      update_attribute(:remember_digest, nil)
    end
  end