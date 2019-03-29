log_message ("sl_japan_scripts.lua ")


require ("res://sl_player_ai.lua")

function sl_japan_game_script()

	-- Япония начинает войну, дав добро на захват американских зон
	if not(sl_is_my_player("Japan")) and not(sl_is_at_war(Japan, USA)) and
		sl_get_year() == 1941 and sl_get_month() == 11 and sl_get_day() >= 1 + math.random(0, 25)
	then
		--sl_begin_war(Japan, USA)
		sl_pearl_harbor_attack()
		log_message ("sl_pearl_harbor_attack")
		--sl_japan_player:begin_war()
		if sl_is_at_war(Japan, USA) then
			sl_begin_war(Japan, England)
			sl_begin_war(Japan, Holland)
			sl_begin_war(USA, Germany)
			sl_usa_player:appoint_general_commander("Nimitz");
		end
	end

	local zones_count = 0
	zones_count = sl_japan_player:get_zones_count()
	--log_message ("J Zones :"..zones_count)
	if zones_count >= 25 and not (sl_is_at_war(Japan, Germany)) then
		sl_begin_war(Germany, Japan)
	end

	-- Если же японский AI не смог начать войну до нужного срока, то принудительно ее начнем
	if not(sl_is_my_player("Japan")) and not(sl_is_at_war(Japan, USA)) and
		sl_get_year() == 1941 and sl_get_month() == 12 and sl_get_day() >= 30
	then
		sl_begin_war(Japan, USA)
		sl_begin_war(Japan, England)
		sl_begin_war(Japan, Holland)
		sl_begin_war(USA, Germany)
		sl_usa_player:appoint_general_commander("Nimitz");
	end

	--если играем за них, то вызовем обработчик случайных заданий
	if (sl_get_my_player_id() == sl_japan_player:get_id() and sl_get_map_option("GovTasksOpt") == 1) then
		sl_jap_watch_for_new_random_task()
	end

	if sl_get_my_player_id() ~= sl_japan_player:get_id() and sl_japan_player:get_metropoly_zones_count() ~= 0 then
		if sl_get_month() == 3 and sl_get_day() == 3 then
			sl_japan_player:create_formation_on_main_base("Shock_AircraftCarrier_Fleex_japan")
			log_message ("Create Shock_AircraftCarrier_Flees_japan XXX")
		end
		
		if sl_get_day() == 5 then
			local f_cnt = sl_japan_player:get_formations_count()
			log_message ("J Formations count:"..f_cnt)

			if sl_get_month() == 7 and f_cnt < 3000 then
				sl_japan_player:create_formation_on_main_base("Shock_AircraftCarrier_Fleex_japan")
				log_message ("Create Shock_AircraftCarrier_Flees_japan XXX")
			end
			
			log_message ("J Last Money :"..j_money)
			local moneyCount = sl_japan_player:get_resources("Money") - j_money
			log_message ("J Money Diff:"..moneyCount)
			j_money = sl_japan_player:get_resources("Money")
			log_message ("J Money :"..j_money)

			log_message ("J Last Iron :"..j_iron)
			local ironCount = sl_japan_player:get_resources("Iron") - j_iron
			log_message ("J Iron Diff:"..ironCount)
			j_iron = sl_japan_player:get_resources("Iron")
			log_message ("J Iron :"..j_iron)

			local aluminiumCount = sl_japan_player:get_resources("Aluminium")
			log_message ("J Aluminium :"..aluminiumCount)
			local oilCount = sl_japan_player:get_resources("Oil")
			log_message ("J Oil :"..oilCount)
	
			if moneyCount > 8000 and ironCount > 8000 then
				sl_japan_player:add_to_production("Ammos.Torp_Jap_Mk91.Torp_Jap_Mk91", 500, 0.)
				sl_japan_player:add_to_production("Ammos.Torp_Jap_Mk91_A_SA.Torp_Jap_Mk91_A_SA", 500, 0.)
				sl_japan_player:add_to_production("Ammos.Torp_Jap_Mk91_M_I.Torp_Jap_Mk91_M_I", 500, 0.)
				sl_japan_player:add_to_production("Ammos.Torp_Jap_Mk93.Torp_Jap_Mk93", 200, 0.)
				sl_japan_player:add_to_production("Ammos.Torp_Jap_Mk93_A_SA.Torp_Jap_Mk93_A_SA", 200, 0.)
				sl_japan_player:add_to_production("Ammos.Torp_Jap_Mk93_M_I.Torp_Jap_Mk93_M_I", 200, 0.)
				sl_japan_player:add_to_production("Ammos.BV_246_Com_SR.BV_246_Com_SR", 200, 0.)
				sl_japan_player:add_to_production("Ammos.BV_246_Com_ST.BV_246_Com_ST", 200, 0.)
				sl_japan_player:add_to_production("Ammos.Fritz_X_AP_P.Fritz_X_AP_P", 200, 0.)
				sl_japan_player:add_to_production("Ammos.Fritz_X_AP_R.Fritz_X_AP_R", 200, 0.)
				--sl_japan_player:add_to_production("Ammos.V1_ST.V1_ST", 20, 0.)
				--sl_japan_player:add_to_production("Ammos.V2_ST.V2_ST", 20, 0.)
				sl_japan_player:add_to_production("Ammos.Ohka_11.Ohka_11", 20, 0.)
				sl_japan_player:add_to_production("Ammos.Ammo.Ammo", 5000, 0.)
				sl_japan_player:add_to_production("Ships.Hokoku.Prototype", 5, 0.)
				sl_japan_player:add_to_production("Ships.Kazahaia.Prototype", 5, 0.)
				--sl_japan_player:add_to_production("Turrets.PU_SAM_Jap_Turret.PU_SAM_Jap_Turret", 1, 0.)
				--sl_japan_player:add_to_production("Turrets.PU_V1_Turret.PU_V1_Turret", 1, 0.)
				--sl_japan_player:add_to_production("Turrets.PU_V2_Turret.PU_V2_Turret", 1, 0.)
				log_message ("J add_to_production Ammo & Cargo")
			end

			if moneyCount > 8000 and aluminiumCount  > 100 and ironCount > 8000 then
				if sl_get_year() >= 1945 then
					sl_japan_player:add_to_production("Airplanes.F1M.Prototype", 5, 0.)
					log_message ("J add_to_production Airplanes F1M 45")
				elseif sl_get_year() >= 1943 then
					sl_japan_player:add_to_production("Airplanes.F1M.Prototype", 5, 0.)
					log_message ("J add_to_production Airplanes F1M 43")
				else
					sl_japan_player:add_to_production("Airplanes.F1M.Prototype", 5, 0.)
					log_message ("J add_to_production Airplanes F1M 40")
				end
				sl_japan_player:add_to_production("Airplanes.H8K.Prototype", 5, 0.)
			end

			local mbase = 50000
			local ibase = 50000

			if (j_money/24 ) > (moneyCount/2) then
			  moneyCount = j_money/24
			else
			  moneyCount = moneyCount/2
			end

			if (j_iron/24 ) > (ironCount/2) then
			  ironCount = j_iron/24
			else
			  ironCount = ironCount/2
			end

			local l_mCount = math.floor(moneyCount/mbase)
			local l_ICount = math.floor(ironCount/ibase)
			log_message ("l_mCount"..l_mCount)
			log_message ("l_ICount"..l_ICount)

			if l_mCount <= l_ICount then
				l_ICount = l_mCount
			end

			if l_ICount >= 99 then
				l_ICount = 99
			end

			l_ICount = 1

			if (moneyCount +  j_money) > mbase and (ironCount + j_iron) > mbase then
--			if moneyCount > mbase and ironCount  > ibase then
				--sl_japan_player:add_to_production("Turrets.Main_Turret_100_Akitsuki.Main_Turret_100_Akitsuki", 48, 0.)
				for i = 1, l_ICount do
					sl_japan_player:add_to_production("Ammos.Torp_Jap_Mk91.Torp_Jap_Mk91", 500, 0.)
					sl_japan_player:add_to_production("Ammos.Torp_Jap_Mk91_A_SA.Torp_Jap_Mk91_A_SA", 500, 0.)
					sl_japan_player:add_to_production("Ammos.Torp_Jap_Mk91_M_I.Torp_Jap_Mk91_M_I", 500, 0.)
					sl_japan_player:add_to_production("Ammos.Torp_Jap_Mk93.Torp_Jap_Mk93", 500, 0.)
					sl_japan_player:add_to_production("Ammos.Torp_Jap_Mk93_A_SA.Torp_Jap_Mk93_A_SA", 500, 0.)
					sl_japan_player:add_to_production("Ammos.Torp_Jap_Mk93_M_I.Torp_Jap_Mk93_M_I", 500, 0.)
					sl_japan_player:add_to_production("Ammos.Ammo.Ammo", 5000, 0.)

					if sl_get_year() >= 1945 then
						sl_japan_player:add_to_production("Airplanes.D4Y.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.B7A.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.A7M.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.D4Y.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.B7A.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.A7M.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.D4Y.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.B7A.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.A7M.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.D4Y.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.B7A.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.A7M.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.Ki-67.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.G8N.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.G10N.ai_45", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.F1M.ai_45", 5, 0.)
						log_message ("J add_to_production Airplanes 45")
					elseif sl_get_year() >= 1943 then
						sl_japan_player:add_to_production("Airplanes.D4Y.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.B5N.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.A7M.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.D4Y.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.B5N.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.A7M.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.D4Y.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.B5N.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.A7M.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.D4Y.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.B5N.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.A7M.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.Ki-67.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.G8N.ai_43", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.F1M.ai_43", 5, 0.)
						log_message ("J add_to_production Airplanes 43")
					else
						sl_japan_player:add_to_production("Airplanes.D3A.Prototype", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.B5N.Prototype", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.A6M.Prototype", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.D3A.Prototype", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.B5N.Prototype", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.A6M.Prototype", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.D3A.Prototype", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.B5N.Prototype", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.A6M.Prototype", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.D3A.Prototype", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.B5N.Prototype", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.A6M.Prototype", 10, 0.)
						sl_japan_player:add_to_production("Airplanes.F1M.Prototype", 5, 0.)
						log_message ("J add_to_production Airplanes 40")
					end

					if sl_get_year() >= 1945 then
						sl_japan_player:add_to_production("Ships.Shimushu.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.Shimushu.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.Akizuki.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.Kagero.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.Akizuki.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.Kagero.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.Zuiho.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Agano.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.Agano.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.Myoko.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.Myoko.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.Zuikaku.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.Zuikaku.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.B64.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Yamato.ai_45", 1, 0.)
						sl_japan_player:add_to_production("Ships.Hokoku.Prototype", 4, 0.)
						sl_japan_player:add_to_production("Ships.Kazahaia.Prototype", 4, 0.)
						log_message ("J add_to_production Ships 45")
					elseif sl_get_year() >= 1943 then
						sl_japan_player:add_to_production("Ships.Shimushu.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.Shimushu.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.Akizuki.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.Kagero.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.Akizuki.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.Kagero.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.Zuiho.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Agano.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.Agano.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.Myoko.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.Myoko.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.Zuikaku.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.Zuikaku.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.B64.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Yamato.ai_43", 1, 0.)
						sl_japan_player:add_to_production("Ships.Hokoku.Prototype", 4, 0.)
						sl_japan_player:add_to_production("Ships.Kazahaia.Prototype", 4, 0.)
						log_message ("J add_to_production Ships 43")
					else
						sl_japan_player:add_to_production("Ships.Shimushu.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Shimushu.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Akizuki.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Kagero.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Akizuki.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Kagero.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Zuiho.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Agano.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Agano.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Myoko.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Myoko.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Zuikaku.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Zuikaku.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.B64.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Yamato.Prototype", 1, 0.)
						sl_japan_player:add_to_production("Ships.Hokoku.Prototype", 4, 0.)
						sl_japan_player:add_to_production("Ships.Kazahaia.Prototype", 4, 0.)
						log_message ("J add_to_production Ships 40")
					end
				end
			end
		end
	end
end


-----------------------------------
-- Условие поражения японцев
-----------------------------------
function sl_japan_condition_of_defeat()

log_message ("sl_japan_scripts.lua defeat 1")
	if (sl_get_game_type() ~= "arcade" and
		not(sl_is_at_war(Japan, USA)) and sl_get_year() >= 2000 and sl_get_month() >= 1 and sl_get_day() >= 1)
		and (sl_is_my_player("USA") or sl_is_my_player("England")) then
			return "IDS_FirstJapanDefeatCondition"
	end

log_message ("sl_japan_scripts.lua defeat 2")
	if sl_default_condition_of_defeat(sl_japan_player) then
		return "IDS_DefaultDefeatCondition"
	else
		count = 0
		playerId = sl_japan_player:get_id()
		if sl_zone_holding_check("Zone29", playerId, 173000) then count = count + 1 end
		if sl_zone_holding_check("Zone35", playerId, 173000) then count = count + 1 end
		if count >= 2 then return "IDS_MainJapanDefeatCondition" end
		if sl_zone_holding_check("Zone28", playerId, 173000) then count = count + 1 end
		if count >= 2 then return "IDS_MainJapanDefeatCondition" end
		if sl_zone_holding_check("Zone38", playerId, 173000) then count = count + 1 end
		if count >= 2 then return "IDS_MainJapanDefeatCondition" end
	end
	return "NoDefeat"
end


----------------------------------------------------------------------------------------
-- Атака Перл-Харбор
----------------------------------------------------------------------------------------
function sl_pearl_harbor_attack()
	log_message("sl_pearl_harbor_attack()")
	sl_japan_player:attack_zone("Zone48")
end

----------------------------------------------------------------------------------------
-- Получить имя главной базы японцев
----------------------------------------------------------------------------------------
function who_have_japan_main_base()
	zone = sl_get_zone("Zone29")	--Токио
	return zone:get_player_id()
end

function sl_japan_condition_of_defeat2()
	if sl_default_condition_of_defeat(sl_japan_player) then
		return "IDS_DefaultDefeatCondition"
	end
	return "NoDefeat"
end