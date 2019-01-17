class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  # dependent - jei user yra istrinamas, ištrins ir jo articles

  before_save { self.email = email.downcase }
  # before_save, padarys kad prieš įkeliant į db, email bus mažosiomis raidėmis

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  # presence username - turi buti ivestas
  # case_sensitivity neleis susikurti username joe ir Joe
  # format patikrins ar email valid

  has_secure_password

end