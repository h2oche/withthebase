class User < ActiveRecord::Base
    
    belongs_to :person
    has_many :rooms, through: :teams
    has_many :teams, dependent: :destroy
    
end
