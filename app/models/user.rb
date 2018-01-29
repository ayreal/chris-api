class User < ApplicationRecord
  has_many :lists
  has_secure_password validations: false
  validates :name, presence: true
  validates :name, uniqueness: true
end
