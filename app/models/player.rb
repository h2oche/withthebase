class Player < ActiveRecord::Base
    
    has_many :rosters
    has_many :teams, through: :rosters
    
    has_many :pitches, dependent: :destroy
    has_many :bats, dependent: :destroy
    has_many :draft_results
end
