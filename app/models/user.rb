class User < ActiveRecord::Base
    
    has_many :rooms, through: :teams
    has_many :teams, dependent: :destroy
    
end
