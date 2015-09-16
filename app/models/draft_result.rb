class DraftResult < ActiveRecord::Base
    belongs_to :draft
    belongs_to :player
    belongs_to :team
end
