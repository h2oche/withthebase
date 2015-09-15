# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin_user = User.new
admin_user.email = 'admin@wtb.com'
admin_user.username = 'admin'
admin_user.password = 'goodsmile'
admin_user.password_confirmation = 'goodsmile'
admin_user.save!



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