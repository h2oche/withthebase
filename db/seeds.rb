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

first_room_draft = Draft.new
first_room_draft.time_limit = 30
first_room_draft.is_complete = false
first_room_draft.room_id = 1

first_room_team_1 = Team.new
first_room_team_1.user_id = 1
first_room_team_1.room_id = 1
first_room_team_1.name = "라이언투"
first_room_team_1.save

first_room_team_2 = Team.new
first_room_team_2.user_id = 2
first_room_team_2.room_id = 1
first_room_team_2.name = "치느님"
first_room_team_2.save

first_room_team_3 = Team.new
first_room_team_3.user_id = 3
first_room_team_3.room_id = 1
first_room_team_3.name = "두희찡"
first_room_team_3.save

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

second_room_draft = Draft.new
second_room_draft.time_limit = 30
second_room_draft.is_complete = false
second_room_draft.room_id = 2

second_room_team_1 = Team.new
second_room_team_1.user_id = 1
second_room_team_1.room_id = 2
second_room_team_1.name = "야신"
second_room_team_1.save

second_room_team_1 = Team.new
second_room_team_1.user_id = 2
second_room_team_1.room_id = 2
second_room_team_1.name = "배고플땐야식"
second_room_team_1.save

second_room_team_1 = Team.new
second_room_team_1.user_id = 3
second_room_team_1.room_id = 2
second_room_team_1.name = "이판만할께"
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

dummy_room_1_draft = Draft.new
dummy_room_1_draft.time_limit = 30
dummy_room_1_draft.is_complete = false
dummy_room_1_draft.room_id = 3

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

dummy_room_2_draft = Draft.new
dummy_room_2_draft.time_limit = 30
dummy_room_2_draft.is_complete = false
dummy_room_2_draft.room_id = 4

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

dummy_room_3_draft = Draft.new
dummy_room_3_draft.time_limit = 30
dummy_room_3_draft.is_complete = false
dummy_room_3_draft.room_id = 5

dummy_room_3_team_1 = Team.new
dummy_room_3_team_1.user_id = 4
dummy_room_3_team_1.room_id = 5
dummy_room_3_team_1.name = "후라이드만"
dummy_room_3_team_1.save

dummy_room_3_team_2 = Team.new
dummy_room_3_team_2.user_id = 5
dummy_room_3_team_2.room_id = 5
dummy_room_3_team_2.name = "양념반"
dummy_room_3_team_2.save

dummy_room_3_team_3 = Team.new
dummy_room_3_team_3.user_id = 6
dummy_room_3_team_3.room_id = 5
dummy_room_3_team_3.name = "치킨"
dummy_room_3_team_3.save

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

dummy_room_4_draft = Draft.new
dummy_room_4_draft.time_limit = 30
dummy_room_4_draft.is_complete = false
dummy_room_4_draft.room_id = 6

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

dummy_room_5_draft = Draft.new
dummy_room_5_draft.time_limit = 30
dummy_room_5_draft.is_complete = false
dummy_room_5_draft.room_id = 7

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

dummy_room_6_draft = Draft.new
dummy_room_6_draft.time_limit = 30
dummy_room_6_draft.is_complete = false
dummy_room_6_draft.room_id = 8

dummy_room_6_team_1 = Team.new
dummy_room_6_team_1.user_id = 4
dummy_room_6_team_1.room_id = 8
dummy_room_6_team_1.name = "야식먹자"
dummy_room_6_team_1.save

dummy_room_7 = Room.new
dummy_room_7.name = '해커톤'
dummy_room_7.admin_id = 4
dummy_room_7.is_classic_mode = true
dummy_room_7.is_public_mode = false
dummy_room_7.period = 8
dummy_room_7.draft_time =  "2015-10-1 20:00:00"
dummy_room_7.size_limit = 7
dummy_room_7.draft_time_limit = 60
dummy_room_7.save

dummy_room_7_draft = Draft.new
dummy_room_7_draft.time_limit = 30
dummy_room_7_draft.is_complete = false
dummy_room_7_draft.room_id = 9

dummy_room_7_team_1 = Team.new
dummy_room_7_team_1.user_id = 4
dummy_room_7_team_1.room_id = 9
dummy_room_7_team_1.name = "야식먹자"
dummy_room_7_team_1.save



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


## new dummy


player_30 = Player.new
player_30.name = '추신수'
player_30.pos = '외야'
player_30.team = '한화'
player_30.war = 1.00
player_30.save

player_31 = Player.new
player_31.name = '이승엽'
player_31.pos = '1루'
player_31.team = '삼성'
player_31.war = 1.00
player_31.save

player_32 = Player.new
player_32.name = '이대호'
player_32.pos = '3루'
player_32.team = '롯데'
player_32.war = 1.00
player_32.save

player_33 = Player.new
player_33.name = '이병규'
player_33.pos = '중견'
player_33.team = '엘지'
player_33.war = 1.00
player_33.save

player_29 = Player.new
player_29.name = '김종호'
player_29.pos = '1루'
player_29.team = 'NC'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '박민우'
player_29.pos = '좌익'
player_29.team = 'NC'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '최정'
player_29.pos = '우익'
player_29.team = 'SK'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '황재균'
player_29.pos = '포수'
player_29.team = '롯데'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '김재호'
player_29.pos = '포수'
player_29.team = '두산'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '오지환'
player_29.pos = '포수'
player_29.team = 'LG'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '김주찬'
player_29.pos = '포수'
player_29.team = 'KIA'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '이택근'
player_29.pos = '1루'
player_29.team = '넥센'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '민병헌'
player_29.pos = '1루'
player_29.team = '두산'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '김민성'
player_29.pos = '1루'
player_29.team = '넥센'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '박용택'
player_29.pos = '2루'
player_29.team = 'LG'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '댄블랙'
player_29.pos = '2루'
player_29.team = 'kt'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '이호준'
player_29.pos = '2루'
player_29.team = 'NC'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '윤석민'
player_29.pos = '3루'
player_29.team = '넥센'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '브라운'
player_29.pos = '3루'
player_29.team = '넥센'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '서건창'
player_29.pos = '3루'
player_29.team = '넥센'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '채태인'
player_29.pos = '3루'
player_29.team = '삼성'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '김상수'
player_29.pos = '우익'
player_29.team = '삼성'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '박동원'
player_29.pos = '우익'
player_29.team = '넥센'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '박한이'
player_29.pos = '우익'
player_29.team = '삼성'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '이재원'
player_29.pos = '좌익'
player_29.team = 'SK'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '김원섭'
player_29.pos = '좌익'
player_29.team = 'KIA'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '박해민'
player_29.pos = '좌익'
player_29.team = '삼성'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '이대형'
player_29.pos = '중견'
player_29.team = 'NC'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '장성우'
player_29.pos = '중견'
player_29.team = 'kt'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '고종욱'
player_29.pos = '중견'
player_29.team = '넥센'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '이대형'
player_29.pos = '중견'
player_29.team = 'NC'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '이대형'
player_29.pos = '중견'
player_29.team = 'NC'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '이대형'
player_29.pos = '중견'
player_29.team = 'NC'
player_29.war = 1.00
player_29.save

player_29 = Player.new
player_29.name = '이대형'
player_29.pos = '중견'
player_29.team = 'NC'
player_29.war = 1.00
player_29.save

p_1 = Player.new
p_1.name = '피가로'
p_1.pos = '선발'
p_1.team = '삼성'
p_1.war = 1.00
p_1.save

p_2 = Player.new
p_2.name = '정우람'
p_2.pos = '구원'
p_2.team = 'SK'
p_2.war = 1.00
p_2.save

p_3 = Player.new
p_3.name = '루카스'
p_3.pos = '선발'
p_3.team = 'LG'
p_3.war = 1.00
p_3.save

p_4 = Player.new
p_4.name = '장시환'
p_4.pos = '구원'
p_4.team = 'kt'
p_4.war = 1.00
p_4.save

p_5 = Player.new
p_5.name = '박종훈'
p_5.pos = '선발'
p_5.team = 'SK'
p_5.war = 1.00
p_5.save

p_6 = Player.new
p_6.name = '옥스프'
p_6.pos = '구원'
p_6.team = 'kt'
p_6.war = 1.00
p_6.save

p_7 = Player.new
p_7.name = '한현희'
p_7.pos = '선발'
p_7.team = '넥센'
p_7.war = 1.00
p_7.save

p_8 = Player.new
p_8.name = '로저스'
p_8.pos = '구원'
p_8.team = '한화'
p_8.war = 1.00
p_8.save

p_9 = Player.new
p_9.name = '클로이'
p_9.pos = '선발'
p_9.team = '삼성'
p_9.war = 1.00
p_9.save

p_10 = Player.new
p_10.name = '송승준'
p_10.pos = '구원'
p_10.team = '롯데'
p_10.war = 1.00
p_10.save

p_11 = Player.new
p_11.name = '탈보트'
p_11.pos = '선발'
p_11.team = '한화'
p_11.war = 1.00
p_11.save

p_12 = Player.new
p_12.name = '임창용'
p_12.pos = '구원'
p_12.team = '삼성'
p_12.war = 1.00
p_12.save

p_13 = Player.new
p_13.name = '심수창'
p_13.pos = '선발'
p_13.team = '롯데'
p_13.war = 1.00
p_13.save

p_14 = Player.new
p_14.name = '손민한'
p_14.pos = '구원'
p_14.team = 'NC'
p_14.war = 1.00
p_14.save

p_15 = Player.new
p_15.name = '윤석민'
p_15.pos = '선발'
p_15.team = 'KIA'
p_15.war = 1.00
p_15.save

p_16 = Player.new
p_16.name = '니퍼트'
p_16.pos = '구원'
p_16.team = '두산'
p_16.war = 1.00
p_16.save

p_17 = Player.new
p_17.name = '스틴슨'
p_17.pos = '선발'
p_17.team = 'KIA'
p_17.war = 1.00
p_17.save

p_18 = Player.new
p_18.name = '김재윤'
p_18.pos = '구원'
p_18.team = 'kt'
p_18.war = 1.00
p_18.save

p_19 = Player.new
p_19.name = '마야'
p_19.pos = '선발'
p_19.team = '두산'
p_19.war = 1.00
p_19.save

p_20 = Player.new
p_20.name = '조무근'
p_20.pos = '구원'
p_20.team = 'kt'
p_20.war = 1.00
p_20.save

p_21 = Player.new
p_21.name = '안지만'
p_21.pos = '선발'
p_21.team = '삼성'
p_21.war = 1.00
p_21.save

p_22 = Player.new
p_22.name = '스와잭'
p_22.pos = '구원'
p_22.team = '두산'
p_22.war = 1.00
p_22.save

p_23 = Player.new
p_23.name = '임창민'
p_23.pos = '선발'
p_23.team = 'NC'
p_23.war = 1.00
p_23.save

p_24 = Player.new
p_24.name = '밴와트'
p_24.pos = '구원'
p_24.team = 'SK'
p_24.war = 1.00
p_24.save

p_25 = Player.new
p_25.name = '임정우'
p_25.pos = '선발'
p_25.team = 'LG'
p_25.war = 1.00
p_25.save

p_26 = Player.new
p_26.name = '이태양'
p_26.pos = '구원'
p_26.team = 'NC'
p_26.war = 1.00
p_26.save

p_27 = Player.new
p_27.name = '임준혁'
p_27.pos = '선발'
p_27.team = 'KIA'
p_27.war = 1.00
p_27.save

p_28 = Player.new
p_28.name = '박정진'
p_28.pos = '구원'
p_28.team = '한화'
p_28.war = 1.00
p_28.save

p_29 = Player.new
p_29.name = '이동현'
p_29.pos = '선발'
p_29.team = 'LG'
p_29.war = 1.00
p_29.save

p_30 = Player.new
p_30.name = '윤지웅'
p_30.pos = '구원'
p_30.team = 'LG'
p_30.war = 1.00
p_30.save

p_31 = Player.new
p_31.name = '이재학'
p_31.pos = '선발'
p_31.team = 'NC'
p_31.war = 1.00
p_31.save

p_32 = Player.new
p_32.name = '유면'
p_32.pos = '구원'
p_32.team = '한화'
p_32.war = 1.00
p_32.save

p_33 = Player.new
p_33.name = '조상우'
p_33.pos = '선발'
p_33.team = '넥센'
p_33.war = 1.00
p_33.save

p_34 = Player.new
p_34.name = '류제국'
p_34.pos = '구원'
p_34.team = 'LG'
p_34.war = 1.00
p_34.save

p_35 = Player.new
p_35.name = '윤희상'
p_35.pos = '선발'
p_35.team = 'SK'
p_35.war = 1.00
p_35.save

p_36 = Player.new
p_36.name = '이현호'
p_36.pos = '구원'
p_36.team = '두산'
p_36.war = 1.00
p_36.save

p_37 = Player.new
p_37.name = '심창민'
p_37.pos = '선발'
p_37.team = '삼성'
p_37.war = 1.00
p_37.save

p_38 = Player.new
p_38.name = '김대우'
p_38.pos = '구원'
p_38.team = '넥센'
p_38.war = 1.00
p_38.save

p_39 = Player.new
p_39.name = '저마노'
p_39.pos = '선발'
p_39.team = 'kt'
p_39.war = 1.00
p_39.save

p_40 = Player.new
p_40.name = '함덕주'
p_40.pos = '구원'
p_40.team = '두산'
p_40.war = 1.00
p_40.save

p_41 = Player.new
p_41.name = '이현승'
p_41.pos = '선발'
p_41.team = '두산'
p_41.war = 1.00
p_41.save

p_42 = Player.new
p_42.name = '윤규진'
p_42.pos = '구원'
p_42.team = '한화'
p_42.war = 1.00
p_42.save

