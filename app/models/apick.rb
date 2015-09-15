class Apick < ActiveRecord::Base
    belongs_to :draft_setting
    
    has_many :apick_settings
end
