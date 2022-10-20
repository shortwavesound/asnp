local Map = game.GetMap():lower() or ""
if not Map:find("gm_metro_pink_line_redux_v1") then return nil end

Metrostroi.AddANSPAnnouncer("[SWS RUS] Estintax",
	{
		announcer_ready = {"subway_announcers/sws_estintax/ready.mp3", 3.312},
		click1 = {"subway_announcers/sws_estintax/click1.mp3", 0.456},
		click2 = {"subway_announcers/sws_estintax/click2.mp3", 0.359},
		doors_right = {"subway_announcers/sws_estintax/rightside.mp3", 1.967},
		last = {"subway_announcers/sws_estintax/laststop.mp3", 4.103},
		lawwarning = {"subway_announcers/sws_estintax/lawwarning.mp3", 8.135},
		last_short = {"subway_announcers/sws_estintax/laststop_short.mp3", 0.840},
		odz = {"subway_announcers/sws_estintax/closedoors.mp3", 2.243},
		next = {"subway_announcers/sws_estintax/nextstation.mp3", 1.392},
		station = {"subway_announcers/sws_estintax/station.mp3", 0.792},
		spec_attention_train_depart = {"subway_announcers/sws_estintax/warning_2.mp3", 4.367},
		spec_attention_train_stop = {"subway_announcers/sws_estintax/warning_1.mp3", 4.367},
		spec_please = {"subway_announcers/sws_estintax/spec_please.mp3", 7.560},
		spec_handrail = {"subway_announcers/sws_estintax/spec_handrail.mp3", 4.608},
		spec_items1 = {"subway_announcers/sws_estintax/spec_items1.mp3", 4.944},
		spec_items2 = {"subway_announcers/sws_estintax/spec_items2.mp3", 4.680}, -- Желательно использовать при прыбытии или на конечных
		spec_exit = {"subway_announcers/sws_estintax/spec_exit.mp3", 4.104},
		train_goes_to = {"subway_announcers/sws_estintax/tothe.mp3", 1.872},
		
		-- Pink stations
		pervomayskaya = {"subway_announcers/sws_estintax/stations/pink/pervomayskaya.mp3", 1.175},
		zyablikovo = {"subway_announcers/sws_estintax/stations/pink/zyablikovo.mp3", 1.056},
		partizanskaya = {"subway_announcers/sws_estintax/stations/pink/partizanskaya.mp3", 1.2},
		gidropark = {"subway_announcers/sws_estintax/stations/pink/gidropark.mp3", 1.344},
	},
	{
		{
			LED = {5, 5, 5, 15},
			Name = "Розовая линия",
			spec_last = {"last"},
			spec_wait = {{"spec_attention_train_stop"}, {"spec_attention_train_depart"}},
			Loop = false,
			{
				101, "Первомайская",
				arrlast = {nil, {"station", "pervomayskaya", "doors_right", "last", "lawwarning"}, "pervomayskaya"},
				dep = {{"odz", "next", "zyablikovo", "doors_right", "spec_please"}, nil},
				right_doors = true
			},
			{
				102, "Зябликово",
				arr = {{"station", "zyablikovo", "doors_right"},{"station", "zyablikovo", "doors_right"}},
				dep = {{"odz", "next", "partizanskaya", "spec_handrail"}, {"odz", "next", "pervomayskaya", "doors_right", "spec_handrail"}},
				right_doors = true
			},
			{
				103, "Партизанская",
				arr = {{"station", "partizanskaya", "spec_exit"}, {"station", "partizanskaya", "spec_exit"}},
				arrlast = {{"station", "partizanskaya", "last", "lawwarning"}, nil, "partizanskaya"},
				dep = {{"odz", "next", "gidropark"}, {"odz", "next", "zyablikovo"}}
			},
			{
				104, "Гидропарк",
				arrlast = {{"station", "gidropark", "last_short", "spec_items2"}, nil, "gidropark"},
				dep = {nil, {"odz", "next", "partizanskaya"}},
				ignorelast = true
			},
		}
	}
)