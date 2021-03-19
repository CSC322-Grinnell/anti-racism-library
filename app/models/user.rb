class User < ApplicationRecord

  #Devise Generated Model for the Users that has been edited by the ARL Team. Many functionalities are derived from the Devise Gem. This model comfirms
  #that the email being used is a Grinnell email (@grinnell.edu)

  # Associate a user with all suggested items
  has_many :items
  
  #Calls methods from the Devise Gem that handle many of the functionalities of the login/sign up process.

  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, authentication_keys: [:login]
  attr_writer :login

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: EMAIL_REGEX}
  validates :banned, inclusion: { in: [ true, false ] }
  
  def login

    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
        

  scope :admins, -> { where(admin: true) }
  scope :users, -> {where(admin: false) }


end