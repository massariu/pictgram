class User < ApplicationRecord
  validates :name, presence: true , length:{maximum:15}
  validates :email, presence: true , format:{with:/\A\S+@\S+\.\S+\z/}

  has_secure_password
  validates :password, presence: true , length:{in:8..32} ,format:{with:/\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/}

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
