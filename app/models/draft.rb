class Draft < ActiveRecord::Base
    belongs_to :room
    has_many :draft_settings
    has_many :draft_results
end
