class Admin < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates :username, length: { minimum: 6 }
end
