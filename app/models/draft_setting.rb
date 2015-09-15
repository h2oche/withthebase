class DraftSetting < ActiveRecord::Base
    belongs_to :draft
    
    has_one :apick
    has_one :team
end
