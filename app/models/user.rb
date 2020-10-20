class User < ApplicationRecord
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, authentication_keys: [:login]
  attr_writer :login

  VALID_GRINNELL_EMAIL_REGEX = /\A[\w+\-.]+@grinnell\.edu/i
  validates_format_of :email, :with => VALID_GRINNELL_EMAIL_REGEX , :message => "domain must be 'grinnell.edu'"
  
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
        
end
