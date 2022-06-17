local Map = game.GetMap():lower() or ""
if not Map:find("gm_mustox_neocrimson_line_a") then return nil end

Metrostroi.AddANSPAnnouncer("[SWS RUS] Estintax",
	{
		announcer_ready = {"subway_announcers/sws_estintax/ready.mp3", 3.312},
		click1 = {"subway_announcers/sws_estintax/click1.mp3", 0.456},
		click2 = {"subway_announcers/sws_estintax/click2.mp3", 0.359},
		doors_right = {"subway_announcers/sws_estintax/rightside.mp3", 1.967},
		laststop = {"subway_announcers/sws_estintax/laststop.mp3", 4.103},
		lawwarning = {"subway_announcers/sws_estintax/lawwarning.mp3", 8.135},
		last_short = {"subway_announcers/sws_estintax/laststop_short.mp3", 0.840},
		odz = {"subway_announcers/sws_estintax/closedoors.mp3", 2.243},
		next_station = {"subway_announcers/sws_estintax/nextstation.mp3", 1.392},
		station = {"subway_announcers/sws_estintax/station.mp3", 0.792},
		spec_attention_train_depart = {"subway_announcers/sws_estintax/warning_2.mp3", 4.367},
		spec_attention_train_stop = {"subway_announcers/sws_estintax/warning_1.mp3", 4.367},
		spec_please = {"subway_announcers/sws_estintax/spec_please.mp3", 7.560},
		spec_handrail = {"subway_announcers/sws_estintax/spec_handrail.mp3", 4.608},
		spec_items1 = {"subway_announcers/sws_estintax/spec_items1.mp3", 4.944},
		spec_items2 = {"subway_announcers/sws_estintax/spec_items2.mp3", 4.680}, -- Желательно использовать при прыбытии или на конечных
		spec_exit = {"subway_announcers/sws_estintax/spec_exit.mp3", 4.104},
		train_goes_to = {"subway_announcers/sws_estintax/tothe.mp3", 1.872},
		transfer_to = {"subway_announcers/sws_estintax/transfer_to.mp3", 1.008},
		
		-- Transfer to
		to_loopline = {"subway_announcers/sws_estintax/lines/loopline.mp3", 1.775},
		to_orange = {"subway_announcers/sws_estintax/lines/orange.mp3", 1.536},
		
		-- Crimson stations
		brateevo = {"subway_announcers/sws_estintax/stations/neocrimson/brateevo.mp3", 1.056},
		pionerskaya = {"subway_announcers/sws_estintax/stations/neocrimson/pionerskaya.mp3", 1.007},
		lithium = {"subway_announcers/sws_estintax/stations/neocrimson/lithium.mp3", 0.960},
		metrostroiteley = {"subway_announcers/sws_estintax/stations/neocrimson/metrostroiteley.mp3", 1.343},
		slavutich = {"subway_announcers/sws_estintax/stations/neocrimson/slavutich.mp3", 1.103},
		fauna = {"subway_announcers/sws_estintax/stations/neocrimson/fauna.mp3", 0.864},
		stalinskaya = {"subway_announcers/sws_estintax/stations/neocrimson/stalinskaya.mp3", 1.271}
	},
	{
		{
			LED = {4, 5, 5, 4, 4, 4, 4},
			Name = "Малиновая линия",
			spec_last = {"last"},
			spec_wait = {{"spec_attention_train_stop"}, {"spec_attention_train_depart"}},
			Loop = false,
			{
				551, "Братеево",
				arrlast = {nil, {"station", "brateevo", "last_short", "spec_items2"}, "brateevo"},
				dep = {{"odz", "next_station", "pionerskaya", "doors_right", "spec_please"}, nil},
				ignorelast = true
			},
			{
				552, "Пионерская",
				arr = {{"station", "pionerskaya", "doors_right", "transfer_to", "to_loopline"},{"station", "pionerskaya", "doors_right", "transfer_to", "to_loopline"}},
				dep = {{"odz", "next_station", "lithium", "spec_handrail"}, {"odz", "next_station", "brateevo", "spec_handrail"}},
				right_doors = true,
				have_inrerchange = true
			},
			{
				553, "Литиевая",
				arr = {{"station", "lithium", "transfer_to", "to_orange"}, {"station", "lithium", "transfer_to", "to_orange"}},
				dep = {{"odz", "next_station", "metrostroiteley", "spec_items1"}, {"odz", "next_station", "pionerskaya", "doors_right"}},
				have_inrerchange = true
			},
			{
				554, "Метростроителей",
				arr = {{"station", "metrostroiteley", "transfer_to", "to_loopline"}, {"station", "metrostroiteley", "transfer_to", "to_loopline"}},
				dep = {{"odz", "next_station", "slavutich", "doors_right"}, {"odz", "next_station", "lithium"}},
				arrlast = {{"station", "metrostroiteley", "transfer_to", "to_loopline", "laststop", "lawwarning"}, {"station", "metrostroiteley", "transfer_to", "to_loopline", "laststop", "lawwarning"}, "metrostroiteley"},
				not_last = {0.5, "train_goes_to", "metrostroiteley"},
				have_inrerchange = true
			},
			{
				555, "Славутич",
				arr = {{"station", "slavutich", "doors_right"}, {"station", "slavutich", "doors_right"}},
				dep = {{"odz", "next_station", "fauna"}, {"odz", "next_station", "metrostroiteley"}},
				arrlast = {{"station", "slavutich", "doors_right", "laststop", "lawwarning"}, {"station", "slavutich", "doors_right", "laststop", "lawwarning"}, "slavutich"},
				not_last = {0.5, "train_goes_to", "slavutich"},
				right_doors = true
			},
			{
				556, "Фауна",
				arr = {{"station", "fauna", "spec_items2"}, {"station", "fauna", "spec_items2"}},
				dep = {{"odz", "next_station", "stalinskaya"}, {"odz", "next_station", "slavutich", "doors_right"}},
				arrlast = {{"station", "fauna", "laststop", "lawwarning"}, {"station", "fauna", "laststop", "lawwarning"}, "fauna"},
				not_last = {0.5, "train_goes_to", "fauna"}
				
			},
			{
				557, "Сталинская",
				arrlast = {{"station", "stalinskaya", "laststop", "lawwarning"}, nil, "stalinskaya"},
				dep = {nil, {"odz", "next_station", "fauna", "spec_please"}}
			}
		}
	}
)