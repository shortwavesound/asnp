local Map = game.GetMap():lower() or ""
if not Map:find("metro_nsk_line_2") then return nil end

Metrostroi.AddANSPAnnouncer("[SWS RUS] Estintax",
	{
		announcer_ready = {"subway_announcers/sws_estintax/ready.mp3", 3.312},
		click1 = {"subway_announcers/sws_estintax/click1.mp3", 0.456},
		click2 = {"subway_announcers/sws_estintax/click2.mp3", 0.359},
		doors_right = {"subway_announcers/sws_estintax/rightside.mp3", 1.967},
		doors_left = {"subway_announcers/sws_estintax/leftside.mp3", 1.968},
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
		
		-- NSK 2 stations
		garina = {"subway_announcers/sws_estintax/stations/nsk/garina.mp3", 1.944},
		siberian = {"subway_announcers/sws_estintax/stations/nsk/siberian.mp3", 1.008},
		marshala = {"subway_announcers/sws_estintax/stations/nsk/marshala.mp3", 1.415},
		berezovaya = {"subway_announcers/sws_estintax/stations/nsk/berezovayaroshcha.mp3", 1.488},
		zolotayaniva = {"subway_announcers/sws_estintax/stations/nsk/zolotayaniva.mp3", 1.296},
	},
	{
		{
			LED = {4, 4, 4, 4, 4, 4, 6},
			Name = "Дзержинская линия",
			spec_last = {"last_short"},
			spec_wait = {{"spec_attention_train_stop"}, {"spec_attention_train_depart"}},
			Loop = false,
			{
				200, "Золотая Нива",
				arrlast = {nil, {"station", "zolotayaniva", "last_short", "spec_items2"}, "zolotayaniva"},
				dep = {{"odz", "next", "berezovaya", "spec_please"}, nil},
				right_doors = true,
				ignorelast = true
			},
			{
				201, "Березовая роща",
				arr = {{"station", "berezovaya"},{"station", "berezovaya"}},
				dep = {{"odz", "next", "marshala", "spec_handrail"}, {"odz", "next", "zolotayaniva", "doors_right", "spec_handrail"}}
			},
			{
				202, "Маршала Покрышкина",
				arr = {{"station", "marshala"}, {"station", "marshala"}},
				dep = {{"odz", "next", "siberian"}, {"odz", "next", "berezovaya"}}
			},
			{
				203, "Сибирская",
				arr = {{"station", "siberian"}, {"station", "siberian", "doors_left"}},
				arrlast = {{"station", "siberian", "last", "spec_items2", "lawwarning"}, {"station", "siberian", "last", "spec_items2", "lawwarning"}, "siberian"},
				dep = {{"odz", "next", "garina"}, {"odz", "next", "marshala"}},
				not_last = {0.5, "train_goes_to", "siberian"},
			},
			{
				204, "Площадь Гарина-Михайловского",
				arrlast = {{"station", "garina", "last_short", "spec_items2"}, nil, "garina"},
				dep = {nil, {"odz", "next", "siberian", "doors_left"}},
				ignorelast = true
			},
		}
	}
)