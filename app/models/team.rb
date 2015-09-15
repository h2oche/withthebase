class Team < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :room
    belongs_to :draft_setting
    
    has_many :rosters, dependent: :destroy
    has_many :players, through: :rosters
    has_many :results
    
end
