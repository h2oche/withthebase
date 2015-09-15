class Draft < ActiveRecord::Base
    belongs_to :room
    has_many :draft_settings
end
