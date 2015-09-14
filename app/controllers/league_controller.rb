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
                      size_limit: room.size_limit, is_classic_mode: room.is_classic_mode, is_public_mode: room.is_public_mode}
    end
  end

  def info
    redirect_to '/users/sign_in' unless user_signed_in?
    @roomid = params[:id]
  end

  def lineup
    redirect_to '/users/sign_in' unless user_signed_in?
    @yet_drafted = true
  end

  def trade
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def draft
    redirect_to '/users/sign_in' unless user_signed_in?
  end
  
  def autopick
    redirect_to '/users/sign_in' unless user_signed_in?
  end
  
  def result
    redirect_to '/users/sign_in' unless user_signed_in?
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
  end
  
  def create_new_league
    #리그 이름 중복 검사, 리그 3개 이상 못 참여 하게
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
    
    join_room current_user.id, new_room.id, params[:league_admin_teamname]
    
    redirect_to '/league/dashboard'
  end
end
