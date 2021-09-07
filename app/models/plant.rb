class Plant < ApplicationRecord
    has_many :user_plants
    has_many :users, through: :user_plants
    has_many :comments
    has_many :commented_users, through: :comments, source: :user
end
