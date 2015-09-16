class ProcController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def draft_random_pick
        draft = Room.find(params[:room_id]).draft
        
        player_id = -1
        players = Player.all
        
        player_positions = Array.new
        DraftResult.where(:team_id => params[:team_id]).each do |result|
           player_positions.push(result.player.pos)
        end
        
        if player_positions.count > 18
            render :text => 'draft done!'
        end
        
        #get available player id
        loop do 
            player_id = Random.new.rand(0..players.count)
           break if Player.exists?(player_id) && !DraftResult.exists?(:player_id => player_id) && 
                                        is_available_position(player_positions, Player.find(player_id).pos)
        end
        
        new_draft_result = DraftResult.new
        new_draft_result.round = params[:round]
        new_draft_result.draft_id = draft.id
        new_draft_result.team_id = params[:team_id]
        new_draft_result.player_id = player_id
        new_draft_result.save
        
        render :json => new_draft_result
    end
    
    def draft_pick
        draft = Room.find(params[:room_id]).draft
        
        new_draft_result = DraftResult.new
        new_draft_result.round = params[:round]
        new_draft_result.draft_id = draft.id
        new_draft_result.team_id = params[:team_id]
        new_draft_result.player_id = params[:player_id]
        new_draft_result.save
        
        render :json => new_draft_result
    end
    
    def is_available_position _positions, _add_position
        count = _positions.count(_add_position)
        
        puts _add_position + " ||| " + _positions.to_s
        
        pitcher_positions = %w(선발 구원)
        batter_positions = %w(1루 2루 3루 유격 좌익 우익 중견 지명 포수)
        
        positions_clone = _positions.clone
        positions_clone.push(_add_position)
        
        batter_count = 0
        pitcher_count = 0
        
        batter_dup_count = 0
        
        batter_positions.each do |bp|
           partial_batter_count = positions_clone.count(bp)
           batter_count += partial_batter_count
           
           if partial_batter_count > 1
              batter_dup_count += 1 
           end
        end
        
        pitcher_positions.each do |pp|
           pitcher_count += positions_clone.count(pp) 
        end
        
        puts batter_count
        puts pitcher_count
        
        return false if batter_count > 11 || pitcher_count > 8
        return false if batter_dup_count > 2
        
        if ( _add_position == "선발" || _add_position == "구원" ) && count < 4
            return true
        elsif count < 2
            return true
        else
            return false
        end
    end
end
