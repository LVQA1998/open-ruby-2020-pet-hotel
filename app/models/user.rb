class User < ApplicationRecord
  has_one :company, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :profiles, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :user_applies

  delegate :name, :logo, to: :company, prefix: true
  
  has_secure_password
end
