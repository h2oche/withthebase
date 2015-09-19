class LeagueController < ApplicationController
  
  before_filter :authenticate_user!
  
  def dashboard
    
    
    
    @teams_info = []
    @teams_classname = ["red-bg", "white-bg", "blue-bg"]
    
    User.find(current_user.id).teams.each do |t|
      room = Room.find(t.room_id)
      roomname = room.name
      roomid = room.id
      @teams_info << {teamname: t.name, roomname: roomname, roomid: roomid,
                      is_classic_mode: room.is_classic_mode,
                      is_public_mode: room.is_public_mode,
                      period: room.period,
                      draft_time:room.draft_time
      }
    end
    
    @rooms_info = []
    Room.all.each do |room| 
      #현재 이 room 에 몇명의 유저가 있는지 체크
      username = User.find(room.admin_id).username
      @rooms_info << {admin: username, roomname: room.name, draft_time: room.draft_time,
                      size_limit: room.size_limit, is_classic_mode: room.is_classic_mode, is_public_mode: room.is_public_mode, room_id: room.id}
    end
  end

  def info
    redirect_to '/users/sign_in' unless user_signed_in?
    #room_id와 my_team을 잘 찾아서 한다.
    room_id = params[:id]
    @room = Room.find(room_id)
    @my_team = @room.teams.where(:user_id => current_user.id)
  end

  def lineup
    redirect_to '/users/sign_in' unless user_signed_in?
    @yet_drafted = false
    
    room_id = params[:id]
    @room = Room.find(room_id)
    @my_team = @room.teams.where(:user_id => current_user.id)
    
    
  end

  def trade
    redirect_to '/users/sign_in' unless user_signed_in?
    room_id = params[:id]
    @room = Room.find(room_id)
    @my_team = @room.teams.where(:user_id => current_user.id)
  end

  def draft
    redirect_to '/users/sign_in' unless user_signed_in?
    
    room_id = params[:id]
    @room = Room.find(room_id)
    @my_team = @room.teams.where(:user_id => current_user.id)
    draft_id = Room.find(room_id).draft.id
    DraftResult.where(draft_id: draft_id).destroy_all
  end
  
  def autopick
    redirect_to '/users/sign_in' unless user_signed_in?
    room_id = params[:id]
    @room = Room.find(room_id)
    @my_team = @room.teams.where(:user_id => current_user.id)
  end
  
  
  ## SCHEDULE PLANNER + RESULT MAKER by Jae-Seo ## START
  
  ## MAKE_NEW_SCHEDULE
  def make_new_schedule room, date, t1, t2, result
    new_game = Game.new
    new_game.room_id = room
    new_game.game_date = date
    new_game.team1 = t1
    new_game.team2 = t2
    new_game.result = result
    new_game.save
  end
  
  ## MAKE_SCHEDULE_FOR_4_TEAMS
  def make_new_schedule_for_4teams_3days league_id, date
    league = Room.find(league_id)
    teams = league.teams
    t1 = teams.first.id
    t2 = teams.second.id
    t3 = teams.third.id
    t4 = teams.fourth.id
    make_new_schedule(league_id, date, t1, t2, 'TBD')
    make_new_schedule(league_id, date, t3, t4, 'TBD')
    make_new_schedule(league_id, date+1, t1, t3, 'TBD')
    make_new_schedule(league_id, date+1, t2, t4, 'TBD')
    make_new_schedule(league_id, date+2, t1, t4, 'TBD')
    make_new_schedule(league_id, date+2, t2, t3, 'TBD')
  end
  
  ## SAVE_1DAY_RESULT 
  def generate_result player, pos, date, a1, a2, a3, a4, a5
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
  end
  
  ## GENERATE_RAMDOM_DATA
  def get_data_random player, date
      pos = Player.find(player).pos
      if (pos == '구원') or (pos == '선발')
          win = rand(2)
          strikeout = rand(9)
          savehold = rand(2)
          era = rand(2.50..8.00).round(2)
          generate_result(player, 'pitch', date, win, strikeout, savehold, era, nil)
      else
          bat_avg = rand(0.100..0.350).round(3)
          rbi = rand(3)
          homerun = rand(2)
          steal = rand(2)
          error = rand(2)
          generate_result(player, 'bat', date, bat_avg, rbi, homerun, steal, error)
      end
  end
  
  ## RANDOM_RESULT_ALL_PLAYERS
  def generate_data_all_player_3days league, date
    Room.find(league).teams.each do |team|
      team.players.each do |player|
        get_data_random(player.id, date)
        get_data_random(player.id, date+1)
        get_data_random(player.id, date+2)
      end
    end
  end
  
  ## SAVE_TEAM_RESULTS
  def add_result team_id, win, strikeout, savehold, era, bat_avg, rbi, homerun, steal, error, game_date
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
    result.game_date = game_date
    result.save
  end
  
  ## CALCULATE_TEAM_RESULTS_AND_SAVE
  def play_game game_id
        
        game = Game.find(game_id)
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
            
            if (x.pos == '구원') or (x.pos == '선발')
                
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
            
            if (y.pos == '구원') or (y.pos == '선발')
                
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
        
        add_result(game.team1, win_1, strikeout_1, savehold_1, era_1, bat_avg_1, rbi_1, homerun_1, steal_1, error_1, game_date)
        add_result(game.team2, win_2, strikeout_2, savehold_2, era_2, bat_avg_2, rbi_2, homerun_2, steal_2, error_2, game_date)
        
  end
  
  ## CALCULATE RESULTS
  
  def calculate_result game_id
    
    game = Game.find(game_id)
    game_date = game.game_date
    team1 = Team.find(game.team1)
    result1 = team1.results.find_by_game_date(game_date)
    team2 = Team.find(game.team2)
    result2 = team2.results.find_by_game_date(game_date)
    
    t1_wins = 0
    
  end
  
  ## DRAFT RESULT INTO ROSTERS
  
  def put_draft_results_into_teams room_id
    
    room = Room.find(room_id)
    room.draft.draft_results.each do |x|
      new_roster = Roster.new
      new_roster.team_id = x.team_id
      new_roster.player_id = x.player_id
      new_roster.save
    end
    
  end
  
  
  ## DRAFT RESULTS 적용 + SCHEDULE PLANNER + RESULT MAKER by Jse-Seo ## END
  
  
  def result
    redirect_to '/users/sign_in' unless user_signed_in?

    room_id = params[:id]
    @room = Room.find(room_id)
    @my_team = @room.teams.where(:user_id => current_user.id)

    #redirect_to '/leagues/'+params[:id]+'/info' unless Room.find(params[:id]).draft.is_complete
    
    Game.destroy_all
    Result.destroy_all
    Roster.destroy_all
    
    ## 재서코드 ## START
    room_id = Room.find(params[:id]).id
    date = Date.today()
    put_draft_results_into_teams(room_id)                       ## DRAFT RESULT 적용
    make_new_schedule_for_4teams_3days(room_id, date)           ## SCHEDULE MAKER
    generate_data_all_player_3days(room_id, date)               ## RESULT GENERATOR
    
    ## 재서코드 ## END
    
    count = 0
    @game_results = Array.new
    temp = Array.new
    
    #해당 리그에 있는 스케쥴 모두 로드
    Room.find(params[:id]).games.each do |game|
      count += 1
      #스케줄에 해당하는 매치 진행
      play_game(game.id)
      
      team1 = Team.find(game.team1)
      team2 = Team.find(game.team2)
      
      temp << { team1: {name: team1.name, coach: team1.user.username, id: team1.id}, 
                                    team2: {name: team2.name, coach: team2.user.username, id: team2.id}}
      
      if count % 2 == 0
        @game_results << { date: date, matches: temp.clone}
        temp = Array.new
        date += 1
      end
    end
    
    #승패 결과 저장

  end
  
  def get_rooms _user_id
    #user id로 등록된 팀 찾기
    
  end
  
  def join_room _user_id, _room_id, _teamname
    new_team = Team.new
    new_team.user_id = _user_id
    new_team.room_id = _room_id
    new_team.name = _teamname
    new_team.save
    
    #draft setting table에 user data 넣기
    draft = Room.find(_room_id).draft
    
    new_draft_setting = DraftSetting.new
    new_draft_setting.order = _user_id
    new_draft_setting.draft_id = draft.id
    new_draft_setting.applied = true
    new_draft_setting.save
  end
  
  def join_league
    # room = Room.find(params[:room_id])
    #유저가 이미 그 리그에 있으면 진입하지 못하게
    
    join_room current_user.id, params[:room_id], current_user.username + "의팀"
    redirect_to '/league/dashboard'
  end
  
  def create_new_league
    #리그 이름 중복 검사, 리그 3개 이상 못 참여 하게
    
    #create new room
    new_room = Room.new
    new_room.name = params[:league_name]
    new_room.admin_id = current_user.id
    new_room.emblem = params[:league_emblem]
    new_room.is_classic_mode = params[:league_is_classic]
    new_room.is_public_mode = params[:league_is_public]
    new_room.password = params[:league_password]
    new_room.period = params[:league_period]
    new_room.draft_time = params[:league_draft_time]
    new_room.size_limit = params[:league_limit]
    new_room.draft_time_limit = params[:league_draft_time_limit]
    new_room.save
    
    #create new draft
    new_draft = Draft.new
    new_draft.room_id = new_room.id
    new_draft.is_complete = false
    new_draft.time_limit = params[:league_draft_time_limit]
    new_draft.save
    
    join_room current_user.id, new_room.id, params[:league_admin_teamname]
    redirect_to '/league/dashboard'
  end
  def interleague
     room_id = params[:id]
    @room = Room.find(room_id)
    @my_team = @room.teams.where(:user_id => current_user.id)
  end
  
  
  def leave_league
  
    to_del = Team.find(params[:id])
    to_del.destroy
    redirect_to '/league/dashboard'
  
  end
  
  def join_dummy_users
  
    
  
  end
  
end
