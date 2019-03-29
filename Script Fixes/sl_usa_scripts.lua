require ("res://sl_player_ai.lua")

oneTimePer2Week = 1.0/14.0
oneTimePerMonth = 1.0/30.0
oneTime2Month = 1.0/60.0

function sl_usa_game_script()
	local l_attack = 1

	l_attack = (sl_get_year() - 1940)/14
	--l_attack = oneTimePer2Week
	log_message ("l_attack:"..l_attack)

	randNum = math.random()
	if randNum < l_attack then
		sl_ai_attack_zone()
	end
	sl_reset_err_relation()

	log_message ("sl_usa_scripts.lua USA")
	--если играем за них, то вызовем обработчик случайных заданий
	if (sl_get_my_player_id() == sl_usa_player:get_id() and sl_get_map_option("GovTasksOpt") == 1) then
		sl_usa_watch_for_new_random_task()
	end

	local zones_count = 0
	zones_count = sl_usa_player:get_zones_count()
	--log_message ("U Zones :"..zones_count)
	if zones_count >= 25 and not (sl_is_at_war(USA, Germany)) then
		sl_begin_war(Germany,USA)
	end

	if sl_is_at_war(Japan, USA) and not(sl_is_at_war(Germany, USA)) and
		sl_get_year() == 1941 and sl_get_month() >= 11 and sl_get_day() >= 1 + math.random(0, 25)
	then
		sl_begin_war(USA, Germany)
		sl_usa_player:appoint_general_commander("Nimitz");
	end

	if sl_is_at_war(Japan, USA) and not(sl_is_at_war(Germany, USA)) and
		sl_get_year() == 1942 and sl_get_month() >= 1 and sl_get_day() >= 1 + math.random(0, 25)
	then
		sl_begin_war(USA, Germany)
		sl_usa_player:appoint_general_commander("Nimitz");
	end

	if sl_get_my_player_id() ~= sl_usa_player:get_id() and sl_usa_player:get_metropoly_zones_count() ~= 0 then
		if sl_get_month() == 1 and sl_get_day() == 2 then
			sl_usa_player:create_formation_on_main_base("Shock_AircraftCarrier_Fleex_usa")
			log_message ("Create Shock_AircraftCarrier_Flees_usa XXX")
		end
		
		if sl_get_day() == 5 then
			local f_cnt = sl_usa_player:get_formations_count()
			log_message ("USA Formations count:"..f_cnt)

			if sl_get_month() == 7 and f_cnt < 3000 then
				sl_usa_player:create_formation_on_main_base("Shock_AircraftCarrier_Fleex_usa")
				log_message ("Create Shock_AircraftCarrier_Flees_usa XXX")
			end

			log_message ("U Last Money :"..u_money)
			local moneyCount = sl_usa_player:get_resources("Money") - u_money
			log_message ("USA Money Diff:"..moneyCount)
			u_money = sl_usa_player:get_resources("Money")
			log_message ("U Money :"..u_money)

			log_message ("U Last Iron :"..u_iron)
			local ironCount = sl_usa_player:get_resources("Iron") - u_iron
			log_message ("USA Iron Diff:"..ironCount)
			u_iron = sl_usa_player:get_resources("Iron")
			log_message ("U Iron :"..u_iron)

			local aluminiumCount = sl_usa_player:get_resources("Aluminium")
			log_message ("USA Aluminium :"..aluminiumCount)

			local oilCount = sl_usa_player:get_resources("Oil")
			log_message ("USA Oil :"..oilCount)

			if moneyCount > 8000 and ironCount > 8000 then
				sl_usa_player:add_to_production("Ammos.Torp_US_Mk13.Torp_US_Mk13", 500, 0.)
				sl_usa_player:add_to_production("Ammos.Torp_US_Mk13_A_SA.Torp_US_Mk13_A_SA", 500, 0.)
				sl_usa_player:add_to_production("Ammos.Torp_US_Mk13_M_I.Torp_US_Mk13_M_I", 500, 0.)
				sl_usa_player:add_to_production("Ammos.Torp_US_Mk15.Torp_US_Mk15", 200, 0.)
				sl_usa_player:add_to_production("Ammos.Torp_US_Mk15_A_SA.Torp_US_Mk15_A_SA", 200, 0.)
				sl_usa_player:add_to_production("Ammos.Torp_US_Mk15_M_I.Torp_US_Mk15_M_I", 200, 0.)
				sl_usa_player:add_to_production("Ammos.Bat_ASM2_SAR.Bat_ASM2_SAR", 200, 0.)
				sl_usa_player:add_to_production("Ammos.Bat_ASM2_SAR.Bat_ASM2_SAR", 200, 0.)
				sl_usa_player:add_to_production("Ammos.Loon_SAR.Loon_SAR", 50, 0.)
				sl_usa_player:add_to_production("Ammos.Shrike_SAR.Shrike_SAR", 50, 0.)
				sl_usa_player:add_to_production("Ammos.Ammo.Ammo", 5000, 0.)
				sl_usa_player:add_to_production("Ships.Liberty.Prototype", 5, 0.)
				sl_usa_player:add_to_production("Ships.Simarron.Prototype", 5, 0.)
				--sl_usa_player:add_to_production("Turrets.PU_SAM_US_Turret.PU_SAM_US_Turret", 1, 0.)
				--sl_usa_player:add_to_production("Turrets.PU_V1_Turret.PU_V1_Turret", 1, 0.)
				--sl_usa_player:add_to_production("Turrets.PU_V2_Turret.PU_V2_Turret", 1, 0.)

				log_message ("USA add_to_production Ammo & Cargo")
			end

			if moneyCount > 8000 and aluminiumCount  > 100 and ironCount > 8000 then
				if sl_get_year() >= 1945 then
					sl_usa_player:add_to_production("Airplanes.OS2U.Prototype", 1, 0.)
					log_message ("USA add_to_production Airplanes OS2U 45")
				elseif sl_get_year() >= 1943 then
					sl_usa_player:add_to_production("Airplanes.OS2U.Prototype", 1, 0.)
					log_message ("USA add_to_production Airplanes OS2U 43")
				else
					sl_usa_player:add_to_production("Airplanes.OS2U.Prototype", 1, 0.)
					log_message ("USA add_to_production Airplanes OS2U 40")
				end
				sl_usa_player:add_to_production("Airplanes.PBY.Prototype", 5, 0.)
			end

			local mbase = 50000
			local ibase = 50000

			if (u_money/24 ) > (moneyCount/2) then
			  moneyCount = u_money/24
			else
			  moneyCount = moneyCount/2
			end

			if (u_iron/24 ) > (ironCount/2) then
			  ironCount = u_iron/24
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

			if (moneyCount +  u_money) > mbase and (ironCount + u_iron) > ibase then
--			if moneyCount > mbase and ironCount  > ibase then
				for i = 1, l_ICount do
					sl_usa_player:add_to_production("Ammos.Torp_US_Mk13.Torp_US_Mk13", 500, 0.)
					sl_usa_player:add_to_production("Ammos.Torp_US_Mk13_A_SA.Torp_US_Mk13_A_SA", 500, 0.)
					sl_usa_player:add_to_production("Ammos.Torp_US_Mk13_M_I.Torp_US_Mk13_M_I", 500, 0.)
					sl_usa_player:add_to_production("Ammos.Torp_US_Mk15.Torp_US_Mk15", 500, 0.)
					sl_usa_player:add_to_production("Ammos.Torp_US_Mk15_A_SA.Torp_US_Mk15_A_SA", 500, 0.)
					sl_usa_player:add_to_production("Ammos.Torp_US_Mk15_M_I.Torp_US_Mk15_M_I", 500, 0.)
					sl_usa_player:add_to_production("Ammos.Ammo.Ammo", 5000, 0.)

					if sl_get_year() >= 1945 then
						sl_usa_player:add_to_production("Airplanes.F2A2.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.SB2C.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.TBF.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.F5U.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.SB2C.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.TBF.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.F5U.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.SB2C.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.TBF.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.F4F.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.SB2C.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.TBF.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.F8F.ai_45", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.B-17.ai_45", 10, 0.)
						sl_usa_player:add_to_production("Airplanes.B-24.ai_45", 10, 0.)
						sl_usa_player:add_to_production("Airplanes.B-29.ai_45", 10, 0.)
						sl_usa_player:add_to_production("Airplanes.OS2U.ai_45", 5, 0.)
						log_message ("USA add_to_production Airplanes 45")
					elseif sl_get_year() >= 1943 then
						sl_usa_player:add_to_production("Airplanes.F2A2.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.SB2C.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.TBF.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.F6F.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.SB2C.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.TBF.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.F6F.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.SB2C.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.TBF.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.F6F.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.SB2C.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.TBF.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.F6F.ai_43", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.B-17.ai_43", 10, 0.)
						sl_usa_player:add_to_production("Airplanes.B-24.ai_43", 10, 0.)
						sl_usa_player:add_to_production("Airplanes.B-29.ai_43", 10, 0.)
						sl_usa_player:add_to_production("Airplanes.OS2U.ai_43", 5, 0.)
						log_message ("USA add_to_production Airplanes 43")
					else
						sl_usa_player:add_to_production("Airplanes.F2A2.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.SBD.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.TBD.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.F4F.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.SBD.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.TBD.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.F4F.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.SBD.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.TBD.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.F4F.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.SBD.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.TBD.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.F4F.Prototype", 25, 0.)
						sl_usa_player:add_to_production("Airplanes.B-17.Prototype", 10, 0.)
						sl_usa_player:add_to_production("Airplanes.B-24.Prototype", 10, 0.)
						sl_usa_player:add_to_production("Airplanes.OS2U.Prototype", 5, 0.)
						log_message ("USA add_to_production Airplanes 40")
					end

					if sl_get_year() >= 1945 then
						sl_usa_player:add_to_production("Ships.Liberty.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Liberty.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Liberty.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Liberty.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Simarron.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Simarron.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Simarron.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Simarron.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Evarts.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Evarts.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Fletcher.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Fletcher.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Fletcher.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Fletcher.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Casablanca.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Casablanca.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Clivlend.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Clivlend.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Baltimor.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Baltimor.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Essex.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Essex.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Iowa.ai_45", 1, 0.)
						sl_usa_player:add_to_production("Ships.Iowa.ai_45", 1, 0.)
						log_message ("USA add_to_production Ships 45")
					elseif sl_get_year() >= 1943 then
						sl_usa_player:add_to_production("Ships.Liberty.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Liberty.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Liberty.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Liberty.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Simarron.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Simarron.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Simarron.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Simarron.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Evarts.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Evarts.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Fletcher.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Fletcher.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Fletcher.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Fletcher.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Casablanca.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Casablanca.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Clivlend.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Clivlend.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Baltimor.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Baltimor.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Essex.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Essex.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Iowa.ai_43", 1, 0.)
						sl_usa_player:add_to_production("Ships.Iowa.ai_43", 1, 0.)
						log_message ("USA add_to_production Ships 43")
					else
						sl_usa_player:add_to_production("Ships.Liberty.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Liberty.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Liberty.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Liberty.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Simarron.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Simarron.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Simarron.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Simarron.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Evarts.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Evarts.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Fletcher.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Fletcher.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Fletcher.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Fletcher.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Casablanca.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Casablanca.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Clivlend.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Clivlend.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Baltimor.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Baltimor.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Essex.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Essex.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Iowa.Prototype", 1, 0.)
						sl_usa_player:add_to_production("Ships.Iowa.Prototype", 1, 0.)
						log_message ("USA add_to_production Ships 40")
					end
				end
			end
		end
	end
end

-----------------------------------
-- Условие поражения американцев --
-----------------------------------
function sl_usa_condition_of_defeat()
	if sl_default_condition_of_defeat(sl_usa_player) then
		return "IDS_DefaultDefeatCondition"
	else
		playerId = sl_usa_player:get_id()
		if sl_zone_holding_check("Zone55", playerId, 86500) and
			(	sl_zone_holding_check("Zone14", playerId, 86500) or
				sl_zone_holding_check("Zone15", playerId, 86500) or
				sl_zone_holding_check("Zone16", playerId, 86500)
			) then
			return "IDS_MainUSADefeatCondition"
		end
	end
	return "NoDefeat"
end

function sl_usa_condition_of_defeat2()
	if sl_default_condition_of_defeat(sl_usa_player) then
		return "IDS_DefaultDefeatCondition"
	end
	return "NoDefeat"
end
-----------------------------------
-- Условие победы американцев --
-----------------------------------
function sl_usa_condition_of_victory()
	count = 0
	playerId = sl_usa_player:get_id()
	if sl_zone_holding_check_by_player("Zone29", playerId, 173000) then count = count + 1 end
	if sl_zone_holding_check_by_player("Zone35", playerId, 173000) then count = count + 1 end
	if count >= 2 then return true end
	if sl_zone_holding_check_by_player("Zone28", playerId, 173000) then count = count + 1 end
	if count >= 2 then return true end
	if sl_zone_holding_check_by_player("Zone38", playerId, 173000) then count = count + 1 end
	if count >= 2 then return true end

	return false
end

----------------------------------------------------------------------------------------
-- Получить владельца главной базы американцев
----------------------------------------------------------------------------------------
function who_have_usa_main_base()
	zone = sl_get_zone("Zone16") --сан-диего
	return zone:get_player_id()
end