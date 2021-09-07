class User < ApplicationRecord
    has_many :user_plants
    has_many :plants, through: :user_plants
    has_many :comments
    has_many :commented_plants, through: :comments, source: :plant
    has_secure_password
end
