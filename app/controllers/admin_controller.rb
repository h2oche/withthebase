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
    
    def create_player name, pos, team, war
        
        new_player = Player.new
        new_player.name = name
        new_player.pos = pos
        new_player.team = team
        new_player.war = war
        new_player.save
        
    end
    
    def create_player_random
        
        10.times do
            name = [['이','김','최','오','상','윤','정','전','구','박','최','장'].sample,
                    ['성하','병철','지우','나영','장섭','한솔','슬기','하늘','우람','한결','가람','다운','한별','한샘','으뜸','한얼','보람','한울','어진'].sample].join
            pos = ['1루','2루','3루','포수','유격','좌익','우익','중견','지명','선발','선발','선발','선발','구원','구원','구원','구원'].sample
            team = ['삼성','LG','롯데','KT','NC','KIA','넥센','한화','두산','SK'].sample
            war = rand(1.00..4.00).round(2)
             
            create_player(name, pos, team, war)
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
        
        if (pos == '구원') or (pos == '선발')
            
            win = rand(2)
            strikeout = rand(9)
            savehold = rand(2)
            era = rand(2.50..8.00).round(2)
            
            get_data(params[:player_id], 'pitch', params[:date], win, strikeout, savehold, era, nil)
            
        else
            
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
        
        game = Game.find(params[:id])
        team1 = Team.find(game.team1)
        team2 = Team.find(game.team2)
        game_date = game.game_date
        
        pitch_count_1 = 0
        bat_count_1 = 0
        win_1 = 0
        strikeout_1 = 0
        savehold_1 = 0
        era_1 = 0
        bat_avg_1 = 0
        rbi_1 = 0
        homerun_1 = 0
        steal_1 = 0
        error_1 = 0
        
        team1.players.each do |x|
            
            if (x.pos == '중견') or (x.pos == '선발')
                
                pitch_count_1 += 1
                result = x.pitches.find_by_record_date(game_date)
                
                win_1 += result.win
                strikeout_1 += result.strikeout
                savehold_1 += result.savehold
                era_1 += result.era
                
            else
                
                bat_count_1 += 1
                result = x.bats.find_by_record_date(game_date)
                
                bat_avg_1 += result.bat_avg
                rbi_1 += result.rbi
                homerun_1 += result.homerun
                steal_1 += result.steal
                error_1 += result.error
                
            end
        end
        
        
            
        pitch_count_2 = 0
        bat_count_2 = 0
        win_2 = 0
        strikeout_2 = 0
        savehold_2 = 0
        era_2 = 0
        bat_avg_2 = 0
        rbi_2 = 0
        homerun_2 = 0
        steal_2 = 0
        error_2 = 0
            
        team2.players.each do |y|
            
            if (y.pos == '중견') or (y.pos == '선발')
                
                pitch_count_2 += 1
                result = y.pitches.find_by_record_date(game_date)
                
                win_2 += result.win
                strikeout_2 += result.strikeout
                savehold_2 += result.savehold
                era_2 += result.era
                
            else
                
                bat_count_2 += 1
                result = y.bats.find_by_record_date(game_date)
                
                bat_avg_2 += result.bat_avg
                rbi_2 += result.rbi
                homerun_2 += result.homerun
                steal_2 += result.steal
                error_2 += result.error
                
            end
        end
        
        unless pitch_count_1 == 0
            era_1 = era_1 / pitch_count_1
        end
        
        unless pitch_count_2 == 0
            era_2 = era_2 / pitch_count_2
        end
        
        unless bat_count_1 == 0
            bat_avg_1 = bat_avg_1 / bat_count_1
        end
        
        unless bat_count_2 == 0
            bat_avg_2 = bat_avg_2 / bat_count_2
        end
        
        
        add_result(game.team1, win_1, strikeout_1, savehold_1, era_1, bat_avg_1, rbi_1, homerun_1, steal_1, error_1)
        add_result(game.team2, win_2, strikeout_2, savehold_2, era_2, bat_avg_2, rbi_2, homerun_2, steal_2, error_2)
        
        redirect_to '/admin/manage'
        
    end
    
    def add_result team_id, win, strikeout, savehold, era, bat_avg, rbi, homerun, steal, error
        
        result = Result.new
        result.team_id = team_id
        result.win = win
        result.strikeout = strikeout
        result.savehold = savehold
        result.era = era
        result.bat_avg = bat_avg
        result.rbi = rbi
        result.homerun = homerun
        result.steal = steal
        result.error = error
        result.save
        
    end
    
end


