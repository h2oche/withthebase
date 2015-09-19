class LeagueController < ApplicationController
  def dashboard
    redirect_to '/users/sign_in' unless user_signed_in?
    
    @teams_info = []
    @teams_classname = ["red-bg", "yellow-bg", "blue-bg"]
    
    User.find(current_user.id).teams.each do |t|
      room = Room.find(t.room_id)
      roomname = room.name
      roomid = room.id
      @teams_info << {teamname: t.name, roomname: roomname, roomid: roomid}
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
    
    room_id = params[:id]
    
    room = Room.find(room_id)
    @testvar = room.teams
  end

  def lineup
    redirect_to '/users/sign_in' unless user_signed_in?
    @yet_drafted = false
    
    room_id = params[:id]
    room = Room.find(room_id)
    
  end

  def trade
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def draft
    redirect_to '/users/sign_in' unless user_signed_in?
    
    room_id = params[:id]
    draft_id = Room.find(room_id).draft.id
    DraftResult.where(draft_id: draft_id).destroy_all
  end
  
  def autopick
    redirect_to '/users/sign_in' unless user_signed_in?
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
    t1 = teams.First.id
    t2 = teams.Second.id
    t3 = teams.Third.id
    t4 = teams.Fourth.id
    make_game(league_id, date, t1, t2, 'TBD')
    make_game(league_id, date, t3, t4, 'TBD')
    make_game(league_id, date+1, t1, t3, 'TBD')
    make_game(league_id, date+1, t2, t4, 'TBD')
    make_game(league_id, date+2, t1, t4, 'TBD')
    make_game(league_id, date+2, t2, t3, 'TBD')
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
          get_data(player, 'pitch', date, win, strikeout, savehold, era, nil)
      else
          bat_avg = rand(0.100..0.350).round(3)
          rbi = rand(3)
          homerun = rand(2)
          steal = rand(2)
          error = rand(2)
          get_data(player, 'bat', date, bat_avg, rbi, homerun, steal, error)
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
  
  ## 
  
  ## SCHEDULE PLANNER + RESULT MAKER by Jse-Seo ## END
  
  
  def result
    redirect_to '/users/sign_in' unless user_signed_in?
    #redirect_to '/leagues/'+params[:id]+'/info' unless Room.find(params[:id]).draft.is_complete
    
    
    
    
    ## 재서코드 ## START
    room_id = Room.find(params[:id])
    date = Date.today()
    make_new_schedule_for_4teams_3days(room_id, date)
    generate_data_all_player_3days(room_id, date)
    ## 재서코드 ## END
    
    
    #해당 리그에 있는 스케쥴 모두 로드
    Room.find(params[:id]).games.each do |game|
      #스케줄에 해당하는 매치 진행
      
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
  
end
