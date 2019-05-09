class User < ApplicationRecord
  
  
  has_secure_password
  
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  # this regedx needs changing
  VALID_EMAIL_REGEX = /[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,}/i
  validates :email, presence: true, length: { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 6 }
  #validates :password_confirmation, presence: true 
end
