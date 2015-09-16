class Team < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :room
    
    has_many :rosters, dependent: :destroy
    has_many :players, through: :rosters
    has_many :results
    has_many :draft_results
    has_one :draft_setting
end
