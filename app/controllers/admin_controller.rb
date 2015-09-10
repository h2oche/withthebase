class AdminController < ApplicationController
    
    def manage
        
        @all_user = User.all
        @all_room = Room.all
        @all_player = Player.all
        @all_team = Team.all
        @all_game = Game.all
        @all_pitch = Pitch.all
        @all_bat = Bat.all
        
    end
    
    def make_user
        
        new_user = User.new
        new_user.account = params[:account]
        new_user.password = params[:password]
        new_user.email = params[:email]
        new_user.name = params[:name]
        new_user.save
        redirect_to '/admin/manage'
        
    end
    
    def delete_user
        
        to_del = User.find(params[:id])
        to_del.destroy
        
        
        
        ##(To Do)## 이 유저가 방장이면 방장 권한 주기 or 리그 지우기
        
        redirect_to '/admin/manage'
        
    end
    
    def create_room
        
        new_room = Room.new
        new_room.name = params[:name]
        new_room.adminid = params[:adminid]
        new_room.size = params[:size]
        new_room.mode = params[:mode]
        new_room.room_pw = params[:room_pw]
        new_room.save
        
        join_room(params[:adminid], new_room.id, params[:team])
        
    end
    
    def delete_room_with_admin
    
        delete_room()
    
    end    
    
    
    def delete_room
        
        to_del = Room.find(params[:id])
        to_del.destroy
        redirect_to '/admin/manage'
        
    end
    
    def join_room_from_user
        
        join_room(params[:user_id], params[:room_id], params[:name])
        
    end
    
    
    def join_room user_id, room_id, name
        
        new_team = Team.new
        new_team.user_id = user_id
        new_team.room_id = room_id
        new_team.name = name
        
        new_team.save
        
        ##(To do)## 팀을 생성하면 팀 로스터도 같이 생성 기능
        
        redirect_to '/admin/manage'
        
    end
    
    def delete_team
        
        to_del = Team.find(params[:id])
        to_del.destroy
        redirect_to '/admin/manage'
        
    end
    
    def create_player_from_admin
       
        create_player(params[:name], params[:pos], params[:team])
        redirect_to '/admin/manage'
    
    end
    
    def create_player name, pos, team
        
        new_player = Player.new
        new_player.name = name
        new_player.pos = pos
        new_player.team = team
        new_player.save
        
    end
    
    def create_player_random
        
        10.times do
            name = [['이','김','최','오','상','윤','정','전','구','박','최','장'].sample,
                    ['성하','병철','지우','나영','장섭','한솔','슬기','하늘','우람','한결','가람','다운','한별','한샘','으뜸','한얼','보람','한울','솔','어진'].sample].join
            pos = ['외야','내야','선발','중견'].sample
            team = ['삼성','헬지','졷데','아놔'].sample
             
            create_player(name, pos, team)
        end
        
        redirect_to '/admin/manage'
        
    end
    
    def delete_player
        
        to_del = Player.find(params[:id])
        to_del.destroy
        
        redirect_to '/admin/manage'
        
    end
    
    def pick_player_from_admin
        
        pick_player(params[:team_id], params[:player_id])
        
    end
    
    def pick_player team_id, player_id
       
       new_roster = Roster.new
       new_roster.team_id = team_id
       new_roster.player_id = player_id
       new_roster.state = '선발'
       new_roster.save
       
       redirect_to '/admin/manage'
       
    end
    
    def unpick_player
        
        to_del = Roster.find(params[:id])
        to_del.destroy
        
        redirect_to '/admin/manage'
    
    end
    
    def get_data_random
        
        pos = Player.find(params[:player_id]).pos
        
        if (pos == '중견') or (pos == '선발')
            
            win = rand(2)
            strikeout = rand(9)
            savehold = rand(2)
            era = rand(2.50..8.00).round(2)
            
            get_data(params[:player_id], 'pitch', params[:date], win, strikeout, savehold, era, nil)
            
        elsif (pos == '내야') or (pos == '외야')
            
            bat_avg = rand(0.100..0.350).round(3)
            rbi = rand(3)
            homerun = rand(2)
            steal = rand(2)
            error = rand(2)
            
            get_data(params[:player_id], 'bat', params[:date], bat_avg, rbi, homerun, steal, error)
            
        end
        
    end
    
    def get_data player, pos, date, a1, a2, a3, a4, a5
       
        if pos == 'pitch'
        
            new_result = Pitch.new
            new_result.player_id = player
            new_result.win = a1
            new_result.strikeout = a2 
            new_result.savehold = a3
            new_result.era = a4
            new_result.record_date = date
            new_result.save
            
        elsif pos == 'bat'
        
            new_result = Bat.new
            new_result.player_id = player
            new_result.bat_avg = a1
            new_result.rbi = a2
            new_result.homerun = a3
            new_result.steal = a4
            new_result.error = a5
            new_result.record_date = date
            new_result.save
            
        end
        
        redirect_to '/admin/manage'
        
    end
    
    def delete_data_pitch
        
        to_del = Pitch.find(params[:id])
        to_del.destroy
        
        redirect_to '/admin/manage'
        
    end
    
    def delete_data_bat
        
        to_del = Bat.find(params[:id])
        to_del.destroy
        
        redirect_to '/admin/manage'
        
    end
    
    def make_game_from_admin
        
        make_game(params[:room_id], params[:date], params[:team1_id], params[:team2_id], 'TBD')
        
    end
    
    def make_game room, date, t1, t2, result
        
        new_game = Game.new
        new_game.room_id = room
        new_game.game_date = date
        new_game.team1 = t1
        new_game.team2 = t2
        new_game.result = result
        new_game.save
        
        redirect_to '/admin/manage'
        
    end
    
    def delete_game
        
        to_del = Game.find(params[:id])
        to_del.destroy
        
        redirect_to '/admin/manage'
        
        
    end
    
    def play_game
       
       new_result1 = Result.new
       
       new_result2 = Result.new
        
    end
    
end
