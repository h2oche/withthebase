class DataController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def get_all_players 
       players = Player.all
       render :json => players
    end
    
    def get_draft_teams
       teams = Room.find(params[:room_id]).teams
       render :json => teams
    end
end
