class Room < ActiveRecord::Base
    
    has_many :users, through: :teams
    has_many :teams, dependent: :destroy
    has_many :games, dependent: :destroy
    has_one :draft
end
