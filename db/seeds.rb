# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



####### dummy USER #######

    ## ADMIN ##

admin_user = User.new
admin_user.email = 'admin@wtb.com'
admin_user.username = 'admin'
admin_user.password = 'goodsmile'
admin_user.password_confirmation = 'goodsmile'
admin_user.save!

admin_user2 = User.new
admin_user2.email = 'admin2@wtb.com'
admin_user2.username = 'admin'
admin_user2.password = 'goodsmile'
admin_user2.password_confirmation = 'goodsmile'
admin_user2.save!

admin_user3 = User.new
admin_user3.email = 'admin3@wtb.com'
admin_user3.username = 'admin'
admin_user3.password = 'goodsmile'
admin_user3.password_confirmation = 'goodsmile'
admin_user3.save!

    ## USER ##

dummy_user_1 = User.new
dummy_user_1.email = 'dummy1@wtb.com'
dummy_user_1.username = '두희'
dummy_user_1.password = 'goodsmile'
dummy_user_1.password_confirmation = 'goodsmile'
dummy_user_1.save!

dummy_user_2 = User.new
dummy_user_2.email = 'dummy2@wtb.com'
dummy_user_2.username = '경훈'
dummy_user_2.password = 'goodsmile'
dummy_user_2.password_confirmation = 'goodsmile'
dummy_user_2.save!

dummy_user_3 = User.new
dummy_user_3.email = 'dummy3@wtb.com'
dummy_user_3.username = '범준'
dummy_user_3.password = 'goodsmile'
dummy_user_3.password_confirmation = 'goodsmile'
dummy_user_3.save!




####### dummy ROOM #######

    ## admin1's ROOMS ##

first_room = Room.new
first_room.name = '멋사'
first_room.admin_id = 1
first_room.is_classic_mode = true
first_room.is_public_mode = true
first_room.period = 3
first_room.draft_time =  "2015-9-10 20:00:00"
first_room.size_limit = 4
first_room.draft_time_limit = 45
first_room.save

first_room_team_1 = Team.new
first_room_team_1.user_id = 1
first_room_team_1.room_id = 1
first_room_team_1.name = "라이언투"
first_room_team_1.save

second_room = Room.new
second_room.name = '야알못'
second_room.admin_id = 1
second_room.is_classic_mode = true
second_room.is_public_mode = true
second_room.period = 4
second_room.draft_time =  "2015-7-30 20:00:00"
second_room.size_limit = 3
second_room.draft_time_limit = 15
second_room.save

second_room_team_1 = Team.new
second_room_team_1.user_id = 1
second_room_team_1.room_id = 2
second_room_team_1.name = "야신"
second_room_team_1.save

    ## room_list ROOMS ##

dummy_room_1 = Room.new
dummy_room_1.name = '초보만'
dummy_room_1.admin_id = 4
dummy_room_1.is_classic_mode = true
dummy_room_1.is_public_mode = true
dummy_room_1.period = 8
dummy_room_1.draft_time =  "2015-9-10 20:00:00"
dummy_room_1.size_limit = 4
dummy_room_1.draft_time_limit = 45
dummy_room_1.save

dummy_room_1_team_1 = Team.new
dummy_room_1_team_1.user_id = 4
dummy_room_1_team_1.room_id = 3
dummy_room_1_team_1.name = "Dummy"
dummy_room_1_team_1.save


dummy_room_2 = Room.new
dummy_room_2.name = '아무나'
dummy_room_2.admin_id = 4
dummy_room_2.is_classic_mode = false
dummy_room_2.is_public_mode = true
dummy_room_2.period = 10
dummy_room_2.draft_time =  "2015-7-21 20:00:00"
dummy_room_2.size_limit = 10
dummy_room_2.draft_time_limit = 30
dummy_room_2.save

dummy_room_2_team_1 = Team.new
dummy_room_2_team_1.user_id = 4
dummy_room_2_team_1.room_id = 4
dummy_room_2_team_1.name = "내가최고"
dummy_room_2_team_1.save


dummy_room_3 = Room.new
dummy_room_3.name = '20대이상ㄱㄱ'
dummy_room_3.admin_id = 4
dummy_room_3.is_classic_mode = false
dummy_room_3.is_public_mode = true
dummy_room_3.period = 10
dummy_room_3.draft_time =  "2015-7-21 20:00:00"
dummy_room_3.size_limit = 10
dummy_room_3.draft_time_limit = 30
dummy_room_3.save

dummy_room_3_team_1 = Team.new
dummy_room_3_team_1.user_id = 4
dummy_room_3_team_1.room_id = 5
dummy_room_3_team_1.name = "후라이드만"
dummy_room_3_team_1.save

dummy_room_4 = Room.new
dummy_room_4.name = '빠른게임ㄱ'
dummy_room_4.admin_id = 4
dummy_room_4.is_classic_mode = false
dummy_room_4.is_public_mode = true
dummy_room_4.period = 2
dummy_room_4.draft_time =  "2015-9-15 20:00:00"
dummy_room_4.size_limit = 5
dummy_room_4.draft_time_limit = 15
dummy_room_4.save

dummy_room_4_team_1 = Team.new
dummy_room_4_team_1.user_id = 4
dummy_room_4_team_1.room_id = 6
dummy_room_4_team_1.name = "한화짱"
dummy_room_4_team_1.save

dummy_room_5 = Room.new
dummy_room_5.name = '넥센팬 모여라'
dummy_room_5.admin_id = 4
dummy_room_5.is_classic_mode = false
dummy_room_5.is_public_mode = true
dummy_room_5.period = 2
dummy_room_5.draft_time =  "2015-9-15 20:00:00"
dummy_room_5.size_limit = 5
dummy_room_5.draft_time_limit = 15
dummy_room_5.save

dummy_room_5_team_1 = Team.new
dummy_room_5_team_1.user_id = 4
dummy_room_5_team_1.room_id = 7
dummy_room_5_team_1.name = "하이드인부쉬"
dummy_room_5_team_1.save

dummy_room_6 = Room.new
dummy_room_6.name = '배고파'
dummy_room_6.admin_id = 4
dummy_room_6.is_classic_mode = true
dummy_room_6.is_public_mode = false
dummy_room_6.period = 8
dummy_room_6.draft_time =  "2015-10-1 20:00:00"
dummy_room_6.size_limit = 8
dummy_room_6.draft_time_limit = 60
dummy_room_6.save

dummy_room_6_team_1 = Team.new
dummy_room_6_team_1.user_id = 4
dummy_room_6_team_1.room_id = 8
dummy_room_6_team_1.name = "야식먹자"
dummy_room_6_team_1.save



### Dummy PLAYERS ###

    ## Real PLAYERS ##

player_1 = Player.new
player_1.name = '테임즈'
player_1.pos = '1루'
player_1.team = 'NC'
player_1.war = 10.25
player_1.save

player_2 = Player.new
player_2.name = '박병호'
player_2.pos = '1루'
player_2.team = '넥센'
player_2.war = 8.51
player_2.save

player_3 = Player.new
player_3.name = '강민호'
player_3.pos = '포수'
player_3.team = '롯데'
player_3.war = 6.65
player_3.save

player_4 = Player.new
player_4.name = '나바로'
player_4.pos = '2루'
player_4.team = '삼성'
player_4.war = 6.06
player_4.save

player_5 = Player.new
player_5.name = '마르테'
player_5.pos = '1루'
player_5.team = 'kt'
player_5.war = 5.87
player_5.save

player_6 = Player.new
player_6.name = '박석민'
player_6.pos = '3루'
player_6.team = '삼성'
player_6.war = 5.44
player_6.save

player_7 = Player.new
player_7.name = '김태균'
player_7.pos = '1루'
player_7.team = '한화'
player_7.war = 5.27
player_7.save

player_8 = Player.new
player_8.name = '최형우'
player_8.pos = '우익'
player_8.team = '삼성'
player_8.war = 5.26
player_8.save

player_9 = Player.new
player_9.name = '박경수'
player_9.pos = '2루'
player_9.team = 'kt'
player_9.war = 4.95
player_9.save

player_10 = Player.new
player_10.name = '양의지'
player_10.pos = '포수'
player_10.team = '두산'
player_10.war = 4.86
player_10.save

player_11 = Player.new
player_11.name = '김현수'
player_11.pos = '중견'
player_11.team = '두산'
player_11.war = 4.86
player_11.save

player_12 = Player.new
player_12.name = '아두치'
player_12.pos = '좌익'
player_12.team = '롯데'
player_12.war = 4.68
player_12.save

player_13 = Player.new
player_13.name = '최준석'
player_13.pos = '3루'
player_13.team = '롯데'
player_13.war = 4.31
player_13.save






player_14 = Player.new
player_14.name = '소사'
player_14.pos = '선발'
player_14.team = 'LG'
player_14.war = 5.93
player_14.save

player_15 = Player.new
player_15.name = '밴헤켄'
player_15.pos = '선발'
player_15.team = '넥센'
player_15.war = 5.69
player_15.save

player_16 = Player.new
player_16.name = '해커'
player_16.pos = '선발'
player_16.team = 'NC'
player_16.war = 5.68
player_16.save

player_17 = Player.new
player_17.name = '윤성환'
player_17.pos = '선발'
player_17.team = '삼성'
player_17.war = 4.72
player_17.save

player_18 = Player.new
player_18.name = '린드블럼'
player_18.pos = '선발'
player_18.team = '롯데'
player_18.war = 4.14
player_18.save

player_19 = Player.new
player_19.name = '김광현'
player_19.pos = '선발'
player_19.team = 'SK'
player_19.war = 3.96
player_19.save

player_20 = Player.new
player_20.name = '유희관'
player_20.pos = '선발'
player_20.team = '두산'
player_20.war = 3.69
player_20.save

player_21 = Player.new
player_21.name = '켈리'
player_21.pos = '선발'
player_21.team = 'SK'
player_21.war = 3.39
player_21.save

player_22 = Player.new
player_22.name = '장원준'
player_22.pos = '선발'
player_22.team = '두산'
player_22.war = 3.31
player_22.save

player_23 = Player.new
player_23.name = '차우찬'
player_23.pos = '선발'
player_23.team = '삼성'
player_23.war = 3.06
player_23.save

player_24 = Player.new
player_24.name = '레일리'
player_24.pos = '선발'
player_24.team = '롯데'
player_24.war = 3.01
player_24.save

player_25 = Player.new
player_25.name = '양현종'
player_25.pos = '선발'
player_25.team = 'KIA'
player_25.war = 2.95
player_25.save

player_26 = Player.new
player_26.name = '임창용'
player_26.pos = '구원'
player_26.team = '삼성'
player_26.war = 1.88
player_26.save

player_27 = Player.new
player_27.name = '장시환'
player_27.pos = '구원'
player_27.team = 'KT'
player_27.war = 2.34
player_27.save

player_28 = Player.new
player_28.name = '정우람'
player_28.pos = '구원'
player_28.team = 'SK'
player_28.war = 2.38
player_28.save


player_29 = Player.new
player_29.name = '김하성'
player_29.pos = '유격'
player_29.team = '넥센'
player_29.war = 3.96
player_29.save