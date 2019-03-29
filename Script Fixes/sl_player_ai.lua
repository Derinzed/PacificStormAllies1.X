function sl_england_condition_of_defeat2()
	if sl_default_condition_of_defeat(sl_england_player) then
		return "IDS_DefaultDefeatCondition"
	end
	return "NoDefeat"
end

function sl_holland_condition_of_defeat()
	if sl_default_condition_of_defeat(sl_holland_player) then
		return "IDS_DefaultDefeatCondition"
	end
	return "NoDefeat"
end

function sl_germany_condition_of_defeat()
	if sl_default_condition_of_defeat(sl_germany_player) then
		return "IDS_DefaultDefeatCondition"
	end
	return "NoDefeat"
end

function sl_ussr_condition_of_defeat()
	if sl_default_condition_of_defeat(sl_ussr_player) and sl_is_at_war(USA, Japan) then
		return "IDS_DefaultDefeatCondition"
	end
	return "NoDefeat"
end

--------------------------------------------------------------
-- Поражение при захвате всех зон и уничтожении всех юнитов --
--------------------------------------------------------------
function sl_default_condition_of_defeat(player)
	if player:get_metropoly_zones_count() == 0 and player:get_formations_count() == 0 then
		return true
	end
	return false
end

--------------------------------------------------------------------------------------------
-- Для неиграбельных игроков - нет условия поражения
--------------------------------------------------------------------------------------------
function sl_no_defeat_condition(player)
	return "NoDefeat"
end

--------------------------------------------------------------------------------------------
-- Если зона с именем zoneName удерживается противником игрока с идентификатором playerId
-- не менее dTime минут, то возращает true, иначе false
--------------------------------------------------------------------------------------------
function sl_zone_holding_check(zoneName, playerId, dTime)
	zone = sl_get_zone(zoneName)
	zonePlayerId = zone:get_player_id()
	if (zonePlayerId ~= 255 and
		zonePlayerId ~= playerId and
		sl_get_my_player_id() == zonePlayerId and
		sl_get_game_min() - zone:get_capture_time() >= dTime
		) then
		return true
	end
	return false
end


--------------------------------------------------------------------------------------------
-- Если зона с именем zoneName удерживается игроком с идентификатором playerId
-- не менее dTime минут, то возращает true, иначе false
--------------------------------------------------------------------------------------------
function sl_zone_holding_check_by_player(zoneName, playerId, dTime)
	zone = sl_get_zone(zoneName)
	zonePlayerId = zone:get_player_id()
	if(zonePlayerId ~= 255 and zonePlayerId == playerId and sl_get_game_min() - zone:get_capture_time() >= dTime) then
		return true
	end
	return false
end


-- Для неиграбельных наций скрипты пустые
function sl_holland_game_script()
	local zones_count = 0
	log_message ("sl_holland_game_script")

	if not(sl_is_my_player("Holland")) and not(sl_is_at_war(Holland, Japan)) and sl_is_at_war(USA, Japan) and
		sl_get_year() >= 1941 and sl_get_month() >= 11 and sl_get_day() >= 1
	then
		sl_begin_war(Holland,Japan)
	end

	--local l_action = math.mod(sl_get_month(),3)
	--log_message ("l_action:"..l_action)

	if sl_get_my_player_id() ~= sl_holland_player:get_id() and sl_holland_player:get_metropoly_zones_count() ~= 0 then
		if sl_get_month() == 1 and sl_get_day() == 1 then
			sl_holland_player:create_formation_on_main_base("LightCruiser_Divisiox_holland")
			log_message ("Create LightCruiser_Divisiom_holland XXX")
		end

		if sl_get_day() == 5 then
			local f_cnt = sl_holland_player:get_formations_count()
			log_message ("H Formations count:"..f_cnt)

			if sl_get_month() == 7 and f_cnt < 3000 then
				sl_holland_player:create_formation_on_main_base("LightCruiser_Divisiox_holland")
				log_message ("Create LightCruiser_Divisiom_holland XXX")
			end

			log_message ("H Last Money :"..h_money)
			local moneyCount = sl_holland_player:get_resources("Money") - h_money
			log_message ("H Money Diff:"..moneyCount)
			h_money = sl_holland_player:get_resources("Money")
			log_message ("H Money :"..h_money)

			log_message ("H Last Iron :"..h_iron)
			local ironCount = sl_holland_player:get_resources("Iron") - h_iron
			log_message ("H Iron Diff:"..ironCount)
			h_iron = sl_holland_player:get_resources("Iron")
			log_message ("H Iron :"..h_iron)

			local aluminiumCount = sl_holland_player:get_resources("Aluminium")
			log_message ("H Aluminium :"..aluminiumCount)
			local oilCount = sl_holland_player:get_resources("Oil")
			log_message ("H Oil :"..oilCount)

			if moneyCount > 10000 and ironCount > 10000 then
				sl_holland_player:add_to_production("Ammos.Ammo.Ammo", 10000, 0.)
				sl_holland_player:add_to_production("Ammos.hl_torp_fleet.hl_torp_fleet", 50, 0.)
				sl_holland_player:add_to_production("Ships.Zaandam.Prototype", 5, 0.)
				sl_holland_player:add_to_production("Ships.Amsterdam.Prototype", 5, 0.)
				--sl_holland_player:add_to_production("Turrets.PU_SAM_HL_Turret.PU_SAM_HL_Turret", 1, 0.)
				--sl_holland_player:add_to_production("Turrets.PU_V1_Turret.PU_V1_Turret", 1, 0.)
				--sl_holland_player:add_to_production("Turrets.PU_V2_Turret.PU_V2_Turret", 1, 0.)

				log_message ("Holland add_to_production Ammo & Cargo")
--				zones_count = sl_holland_player:get_zones_count()
--				if zones_count == 1 then
--					sl_holland_player:add_to_production("Ammos.hl_torp_fleet.hl_torp_fleet", 300, 0.)
--					log_message ("Holland add_to_production Torpedo")
--				end
			end

			if moneyCount > 10000 and aluminiumCount  > 100 and ironCount > 10000 then
				sl_holland_player:add_to_production("Airplanes.OS2U_HL.Prototype", 5, 0.)
				if sl_get_year() >= 1943 then
					sl_holland_player:add_to_production("Airplanes.Blenheim4HL.Prototype", 5, 0.)
					sl_holland_player:add_to_production("Airplanes.F2A2_HL.Prototype", 5, 0.)
					log_message ("H add_to_production Airplanes 43")
				else
					sl_holland_player:add_to_production("Airplanes.Blenheim4HL.Prototype", 5, 0.)
					sl_holland_player:add_to_production("Airplanes.F2A2_HL.Prototype", 5, 0.)
					log_message ("H add_to_production Airplanes 40")
				end
			end

			local mbase = 41478
			local ibase = 30656

			--if (h_money/24 ) > (moneyCount/2) then
			  --moneyCount = h_money/24
			--else
			  --moneyCount = moneyCount/2
			--end

			--if (h_iron/24 ) > (ironCount/2) then
			  --ironCount = h_iron/24
			--else
			  --ironCount = ironCount/2
			--end

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

			if (moneyCount +  h_money) > mbase and (ironCount + h_iron) > ibase then
				for i = 1, l_ICount do
					sl_holland_player:add_to_production("Ammos.Ammo.Ammo", 10000, 0.)
					if sl_get_year() >= 1945 then
						sl_holland_player:add_to_production("Ships.Vangalen.ai_45", 5, 0.)
						sl_holland_player:add_to_production("Ships.Vangalen.ai_45", 5, 0.)
						sl_holland_player:add_to_production("Ships.Vangalen.ai_45", 5, 0.)
						sl_holland_player:add_to_production("Ships.Vangalen.ai_45", 5, 0.)
						sl_holland_player:add_to_production("Ships.DeReutar.ai_45", 1, 0.)
						sl_holland_player:add_to_production("Ships.DeReutar.ai_45", 1, 0.)
						sl_holland_player:add_to_production("Ships.Zaandam.Prototype", 2, 0.)
						sl_holland_player:add_to_production("Ships.Amsterdam.Prototype", 2, 0.)
						log_message ("Holland add_to_production Ships 45")
					elseif sl_get_year() >= 1943 then
						sl_holland_player:add_to_production("Ships.Vangalen.ai_43", 5, 0.)
						sl_holland_player:add_to_production("Ships.Vangalen.ai_43", 5, 0.)
						sl_holland_player:add_to_production("Ships.Vangalen.ai_43", 5, 0.)
						sl_holland_player:add_to_production("Ships.Vangalen.ai_43", 5, 0.)
						sl_holland_player:add_to_production("Ships.DeReutar.ai_43", 1, 0.)
						sl_holland_player:add_to_production("Ships.DeReutar.ai_43", 1, 0.)
						sl_holland_player:add_to_production("Ships.Zaandam.Prototype", 2, 0.)
						sl_holland_player:add_to_production("Ships.Amsterdam.Prototype", 2, 0.)
						log_message ("Holland add_to_production Ships 43")
					else
						sl_holland_player:add_to_production("Ships.Vangalen.Prototype", 5, 0.)
						sl_holland_player:add_to_production("Ships.Vangalen.Prototype", 5, 0.)
						sl_holland_player:add_to_production("Ships.Vangalen.Prototype", 5, 0.)
						sl_holland_player:add_to_production("Ships.Vangalen.Prototype", 5, 0.)
						sl_holland_player:add_to_production("Ships.DeReutar.Prototype", 1, 0.)
						sl_holland_player:add_to_production("Ships.DeReutar.Prototype", 1, 0.)
						sl_holland_player:add_to_production("Ships.Zaandam.Prototype", 2, 0.)
						sl_holland_player:add_to_production("Ships.Amsterdam.Prototype", 2, 0.)
						log_message ("Holland add_to_production Ships 40")
					end
				end
			end
		end
	end
end

function sl_ussr_game_script()
log_message ("sl_ussr_game_script")
	local zones_count = 0
	if not(sl_is_my_player("USSR")) and not(sl_is_at_war(Japan, USSR)) and
		sl_get_year() == 1945 and sl_get_month() == 8 and sl_get_day() >= 8 + math.random(0, 22)
	then
		sl_begin_war(USSR, Japan)
	end

	if sl_get_my_player_id() ~= sl_ussr_player:get_id() and sl_ussr_player:get_metropoly_zones_count() ~= 0  then
		if sl_get_month() == 1 and sl_get_day() == 1 then
			sl_ussr_player:create_formation_on_main_base("Expeditionary_Fleex_ussr")
			log_message ("Create Expeditionary_Fleet_ussr XXX")
			sl_ai_attack_zone()
		end

		if sl_get_day() == 5 then
			local f_cnt = sl_ussr_player:get_formations_count()
			log_message ("USSR Formations count:"..f_cnt)

			if sl_get_month() == 7 and f_cnt < 3000 then
				sl_ussr_player:create_formation_on_main_base("Expeditionary_Fleex_ussr")
				log_message ("Create Expeditionary_Fleet_ussr XXX")
			end

			sl_ai_attack_zone()

			log_message ("R Last Money :"..r_money)
			local moneyCount = sl_ussr_player:get_resources("Money") - r_money
			log_message ("USSR Money Diff:"..moneyCount)
			r_money = sl_ussr_player:get_resources("Money")
			log_message ("R Money :"..r_money)

			log_message ("R Last Iron :"..r_iron)
			local ironCount = sl_ussr_player:get_resources("Iron") - r_iron
			log_message ("USSR Iron Diff:"..ironCount)
			r_iron = sl_ussr_player:get_resources("Iron")
			log_message ("R Iron :"..r_iron)

			local aluminiumCount = sl_ussr_player:get_resources("Aluminium")
			log_message ("USSR Aluminium :"..aluminiumCount)
			local oilCount = sl_ussr_player:get_resources("Oil")
			log_message ("USSR Oil :"..oilCount)

			if moneyCount > 10000 and ironCount > 10000 then
				sl_ussr_player:add_to_production("Ammos.Torp_SU_53_39.Torp_SU_53_39", 500, 0.)
				sl_ussr_player:add_to_production("Ammos.SU_torp_avia_45-36.SU_torp_avia_45-36", 50, 0.)
				sl_ussr_player:add_to_production("Ammos.Ammo.Ammo", 10000, 0.)
				sl_ussr_player:add_to_production("Ships.Komsomol.Prototype", 5, 0.)
				sl_ussr_player:add_to_production("Ships.Krasnodar.Prototype", 5, 0.)
				--sl_ussr_player:add_to_production("Turrets.PU_SAM_R_Turret.PU_SAM_R_Turret", 1, 0.)
				--sl_ussr_player:add_to_production("Turrets.PU_V1_Turret.PU_V1_Turret", 1, 0.)
				--sl_ussr_player:add_to_production("Turrets.PU_V2_Turret.PU_V2_Turret", 1, 0.)
				log_message ("USSR add_to_production Ammo")
--				zones_count = sl_ussr_player:get_zones_count()
--				if zones_count == 1 then
--					sl_ussr_player:add_to_production("Ammos.Torp_SU_53_39.Torp_SU_53_39", 300, 0.)
--					log_message ("USSR add_to_production Torpedo")
--				end
			end

			if moneyCount > 10000 and aluminiumCount  > 100 and ironCount > 10000 then
				sl_ussr_player:add_to_production("Airplanes.OS2U_USSR.Prototype", 4, 0.)
				sl_ussr_player:add_to_production("Airplanes.PBY_USSR.Prototype", 4, 0.)
				sl_ussr_player:add_to_production("Airplanes.DB3.Prototype", 4, 0.)
				sl_ussr_player:add_to_production("Airplanes.Il2.Prototype", 4, 0.)
				sl_ussr_player:add_to_production("Airplanes.Il2m3.Prototype", 4, 0.)
				sl_ussr_player:add_to_production("Airplanes.Il4.Prototype", 4, 0.)
				sl_ussr_player:add_to_production("Airplanes.La5FN.Prototype", 4, 0.)
				sl_ussr_player:add_to_production("Airplanes.La7.Prototype", 4, 0.)
				sl_ussr_player:add_to_production("Airplanes.PBY_USSR.Prototype", 4, 0.)
				sl_ussr_player:add_to_production("Airplanes.Yak3.Prototype", 4, 0.)
				sl_ussr_player:add_to_production("Airplanes.Yak9T.Prototype", 4, 0.)
				log_message ("USSR add_to_production Airplanes")
			end

--- BB+CA+DD7Y money = 100000...
			local mbase = 50000
			local ibase = 50656

			if (r_money/24 ) > (moneyCount/2) then
			  moneyCount = r_money/24
			else
			  moneyCount = moneyCount/2
			end

			if (r_iron/24 ) > (ironCount/2) then
			  ironCount = r_iron/24
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

			if (moneyCount +  r_money) > mbase and (ironCount + r_iron) > ibase then
--			if moneyCount > mbase and ironCount  > ibase then
				for i = 1, l_ICount do
					sl_ussr_player:add_to_production("Ammos.Ammo.Ammo", 10000, 0.)
					if sl_get_year() >= 1945 then
						sl_ussr_player:add_to_production("Ships.PikeV.ai_45", 1, 0.)
						sl_ussr_player:add_to_production("Ships.Sevastopol.ai_45", 1, 0.)
						sl_ussr_player:add_to_production("Ships.Cruiser26bis.ai_45", 1, 0.)
						sl_ussr_player:add_to_production("Ships.Cruiser26bis.ai_45", 1, 0.)
						sl_ussr_player:add_to_production("Ships.KrasnyiKrym.ai_45", 1, 0.)
						sl_ussr_player:add_to_production("Ships.KrasnyiKrym.ai_45", 1, 0.)
						sl_ussr_player:add_to_production("Ships.DD7Y.ai_45", 5, 0.)
						sl_ussr_player:add_to_production("Ships.DD7Y.ai_45", 5, 0.)
						sl_ussr_player:add_to_production("Ships.DD7Y.ai_45", 5, 0.)
						sl_ussr_player:add_to_production("Ships.DD7Y.ai_45", 5, 0.)
						sl_ussr_player:add_to_production("Ships.Komsomol.Prototype", 2, 0.)
						sl_ussr_player:add_to_production("Ships.Krasnodar.Prototype", 2, 0.)
						log_message ("USSR add_to_production Ships 45")
					elseif sl_get_year() >= 1943 then
						sl_ussr_player:add_to_production("Ships.PikeV.ai_43", 1, 0.)
						sl_ussr_player:add_to_production("Ships.Sevastopol.ai_43", 1, 0.)
						sl_ussr_player:add_to_production("Ships.Cruiser26bis.ai_43", 1, 0.)
						sl_ussr_player:add_to_production("Ships.Cruiser26bis.ai_43", 1, 0.)
						sl_ussr_player:add_to_production("Ships.KrasnyiKrym.ai_43", 1, 0.)
						sl_ussr_player:add_to_production("Ships.KrasnyiKrym.ai_43", 1, 0.)
						sl_ussr_player:add_to_production("Ships.DD7Y.ai_43", 5, 0.)
						sl_ussr_player:add_to_production("Ships.DD7Y.ai_43", 5, 0.)
						sl_ussr_player:add_to_production("Ships.DD7Y.ai_43", 5, 0.)
						sl_ussr_player:add_to_production("Ships.DD7Y.ai_43", 5, 0.)
						sl_ussr_player:add_to_production("Ships.Komsomol.Prototype", 2, 0.)
						sl_ussr_player:add_to_production("Ships.Krasnodar.Prototype", 2, 0.)
						log_message ("USSR add_to_production Ships 43")
					else
						sl_ussr_player:add_to_production("Ships.PikeV.Prototype", 1, 0.)
						sl_ussr_player:add_to_production("Ships.Sevastopol.Prototype", 1, 0.)
						sl_ussr_player:add_to_production("Ships.Cruiser26bis.Prototype", 1, 0.)
						sl_ussr_player:add_to_production("Ships.Cruiser26bis.Prototype", 1, 0.)
						sl_ussr_player:add_to_production("Ships.KrasnyiKrym.Prototype", 1, 0.)
						sl_ussr_player:add_to_production("Ships.KrasnyiKrym.Prototype", 1, 0.)
						sl_ussr_player:add_to_production("Ships.DD7Y.Prototype", 5, 0.)
						sl_ussr_player:add_to_production("Ships.DD7Y.Prototype", 5, 0.)
						sl_ussr_player:add_to_production("Ships.DD7Y.Prototype", 5, 0.)
						sl_ussr_player:add_to_production("Ships.DD7Y.Prototype", 5, 0.)
						sl_ussr_player:add_to_production("Ships.Komsomol.Prototype", 2, 0.)
						sl_ussr_player:add_to_production("Ships.Krasnodar.Prototype", 2, 0.)
						log_message ("USSR add_to_production Ships 40")
					end
				end
			end
		end
	end

	--sl_ussr_player:attack_zone("Zone117")
	--log_message("TEST USSR near enemy base attack:Zone117")

	--sl_usa_player:destroy_all_formations()
	--sl_japan_player:destroy_all_formations()
	--sl_england_player:destroy_all_formations()
	--sl_ussr_player:destroy_all_formations()
	--sl_holland_player:destroy_all_formations()
	--sl_germany_player:destroy_all_formations()

	--local base = get_base("Base100")

	--base:make_new_formation("Base100")
	--sl_get_diplomatic_gui():reset_nation()
	--local f_cnt = sl_germany_player:get_formations_count()
	--local l_ok = Airplanes.B-25-AT.Prototype
	--if l_ok == false then
		--log_message ("Ships.Cruiser26bis.Prototype:OK"..l_ok)
	--else
		--log_message ("Ships.Cruiser26bis.Prototype:NG")
	--end

	--local fs = sl_germany_player:get_all_formations()
	--log_message ("1")
	--local object_count = table.getn (fs)
	--log_message ("2")

	--for i = 1, object_count do
		--fs[i]:go_to_base(base72:get_id())
		--log_message ("3")
	--end
	--log_message ("4")
	--log_message ("TEST Formation cnt:"..object_count)

	--local f_cnt = sl_get_relations(England,Germany)
	--log_message ("G sl_get_relations count:"..f_cnt)

end

function sl_germany_game_script()
  local zones_count = 0
  log_message ("sl_germany_game_script")

	if sl_get_year() == 1941 and sl_get_month() == 6 and sl_get_day() == 30 and not(sl_is_at_war(Germany, USSR)) then
		if not(sl_is_my_player("Germany")) then
			sl_begin_war(Germany, USSR)
		else
			sl_begin_war(USSR, Germany)
		end
	end


	if sl_get_my_player_id() ~= sl_germany_player:get_id() and sl_germany_player:get_metropoly_zones_count() ~= 0 then
		if sl_get_month() == 1 and sl_get_day() == 1 then
			sl_germany_player:create_formation_on_main_base("Shock_AircraftCarrier_Fleex_germany")
			log_message ("Create Shock_AircraftCarrier_Fleex_germany XXX")
		end

		if sl_get_day() == 5 then
			local f_cnt = sl_germany_player:get_formations_count()
			log_message ("G Formations count:"..f_cnt)

			if sl_get_month() == 7 and f_cnt < 3000 then
				sl_germany_player:create_formation_on_main_base("Shock_AircraftCarrier_Fleex_germany")
				log_message ("Create Shock_AircraftCarrier_Fleex_germany XXX")
			end

			log_message ("G Last Money :"..g_money)
			local moneyCount = sl_germany_player:get_resources("Money") - g_money
			log_message ("G Money Diff:"..moneyCount)
			g_money = sl_germany_player:get_resources("Money")
			log_message ("G Money :"..g_money)

			log_message ("G Last Iron :"..g_iron)
			local ironCount = sl_germany_player:get_resources("Iron") - g_iron
			log_message ("G Iron Diff:"..ironCount)
			g_iron = sl_germany_player:get_resources("Iron")
			log_message ("G Iron :"..g_iron)

			local aluminiumCount = sl_germany_player:get_resources("Aluminium")
			log_message ("G Aluminium :"..aluminiumCount)
			local oilCount = sl_germany_player:get_resources("Oil")
			log_message ("G Oil :"..oilCount)

			if moneyCount > 10000 and ironCount > 10000 then
				sl_germany_player:add_to_production("Ammos.Ammo.Ammo", 10000, 0.)
				sl_germany_player:add_to_production("Ammos.torp_DE_F5b_M_I.torp_DE_F5b_M_I", 500, 0.)
				sl_germany_player:add_to_production("Ammos.torp_DE_F5b_A_SA.torp_DE_F5b_A_SA", 500, 0.)
				sl_germany_player:add_to_production("Ammos.torp_DE_F5b_M_I.torp_DE_F5b_M_I", 500, 0.)
				sl_germany_player:add_to_production("Ammos.Germany_Torpedoes_G7a.Germany_Torpedoes_G7a", 200, 0.)
				sl_germany_player:add_to_production("Ammos.Torp_Ger_G7es_A_SA.Torp_Ger_G7es_A_SA", 200, 0.)
				sl_germany_player:add_to_production("Ammos.Torp_Ger_G7es_M_I.Torp_Ger_G7es_M_I", 200, 0.)
				sl_germany_player:add_to_production("Ammos.De_Fritz_X_AP_P.De_Fritz_X_AP_P", 200, 0.)
				sl_germany_player:add_to_production("Ammos.De_Fritz_X_AP_R.De_Fritz_X_AP_R", 200, 0.)
				sl_germany_player:add_to_production("Ammos.De_BV_246_Com_SR.De_BV_246_Com_SR", 200, 0.)
				sl_germany_player:add_to_production("Ammos.De_BV_246_Com_ST.De_BV_246_Com_ST", 200, 0.)
				sl_germany_player:add_to_production("Ships.Kormoran.Prototype", 5, 0.)
				sl_germany_player:add_to_production("Ships.Nordmark.Prototype", 5, 0.)
				--sl_germany_player:add_to_production("Ammos.DE_V1_ST.DE_V1_ST", 20, 0.)
				--sl_germany_player:add_to_production("Ammos.DE_V2_ST.DE_V2_ST", 20, 0.)
				--sl_germany_player:add_to_production("Turrets.PU_SAM_DE_Turret.PU_SAM_DE_Turret", 1, 0.)
				--sl_germany_player:add_to_production("Turrets.PU_V1_Turret.PU_V1_Turret", 1, 0.)
				--sl_germany_player:add_to_production("Turrets.PU_V2_Turret.PU_V2_Turret", 1, 0.)

				log_message ("G add_to_production Ammo")
--				zones_count = sl_germany_player:get_zones_count()
--				if zones_count == 1 then
--					sl_germany_player:add_to_production("Ammos.torp_DE_F5b_M_I.torp_DE_F5b_M_I", 500, 0.)
--					sl_germany_player:add_to_production("Ammos.torp_DE_F5b_A_SA.torp_DE_F5b_A_SA", 500, 0.)
--					sl_germany_player:add_to_production("Ammos.torp_DE_F5b_M_I.torp_DE_F5b_M_I", 500, 0.)
--					sl_germany_player:add_to_production("Ammos.Germany_Torpedoes_G7a.Germany_Torpedoes_G7a", 500, 0.)
--					sl_germany_player:add_to_production("Ammos.Torp_Ger_G7es_A_SA.Torp_Ger_G7es_A_SA", 500, 0.)
--					sl_germany_player:add_to_production("Ammos.Torp_Ger_G7es_M_I.Torp_Ger_G7es_M_I", 500, 0.)
--					log_message ("G add_to_production Torpedo")
--				end
			end

			local mbase = 50000
			local ibase = 50000

			if (g_money/24 ) > (moneyCount/2) then
			  moneyCount = g_money/24
			else
			  moneyCount = moneyCount/2
			end

			if (g_iron/24 ) > (ironCount/2) then
			  ironCount = g_iron/24
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

			if (moneyCount +  g_money) > mbase and (ironCount + g_iron) > ibase then
--			if moneyCount > mbase and ironCount  > ibase then
				for i = 1, l_ICount do
					if sl_get_year() >= 1945 then
						sl_germany_player:add_to_production("Airplanes.Ar196.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju87D.ai_45", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.FW190A5.ai_45", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.ai_46", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Bf109G10.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju87D.ai_45", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.FW190A5.ai_45", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Bf109G10.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju87D.ai_45", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.FW190A5.ai_45", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Bf109G10.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju87D.ai_45", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.FW190A5.ai_45", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Bf109G10.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ar234.ai_45", 10, 0.)
						log_message ("G add_to_production Airplanes 45")
					elseif sl_get_year() >= 1943 then
						sl_germany_player:add_to_production("Airplanes.Ar196.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju87D.ai_43", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.FW190A5.ai_43", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Bf109G10.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju87D.ai_43", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.FW190A5.ai_43", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Bf109G10.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju87D.ai_43", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.FW190A5.ai_43", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Bf109G10.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju87D.ai_43", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.FW190A5.ai_43", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Bf109G10.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ar234.ai_43", 10, 0.)
						log_message ("G add_to_production Airplanes 43")
					else
						sl_germany_player:add_to_production("Airplanes.Ar196.Prototype", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.Prototype", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Bf109G10.Prototype", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju87D.Prototype", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.FW190A5.Prototype", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.Prototype", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Bf109G10.Prototype", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju87D.Prototype", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.FW190A5.Prototype", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.Prototype", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Bf109G10.Prototype", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju87D.Prototype", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.FW190A5.Prototype", 20, 0.)
						sl_germany_player:add_to_production("Airplanes.Ju88A4.Prototype", 10, 0.)
						sl_germany_player:add_to_production("Airplanes.Bf109G10.Prototype", 10, 0.)
						log_message ("G add_to_production Airplanes 40")
					end

					if sl_get_year() >= 1945 then
						sl_germany_player:add_to_production("Ships.U-Boat7.ai_45", 2, 0.)
						sl_germany_player:add_to_production("Ships.U-Boat7.ai_45", 2, 0.)
						sl_germany_player:add_to_production("Ships.Narvick.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Ships.Narvick.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Ships.Narvick.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Ships.Narvick.ai_45", 10, 0.)
						sl_germany_player:add_to_production("Ships.Leipzig.ai_45", 2, 0.)
						sl_germany_player:add_to_production("Ships.Leipzig.ai_45", 2, 0.)
						sl_germany_player:add_to_production("Ships.Hipper.ai_45", 1, 0.)
						sl_germany_player:add_to_production("Ships.Hipper.ai_45", 1, 0.)
						sl_germany_player:add_to_production("Ships.Zeppelin.ai_45", 1, 0.)
						sl_germany_player:add_to_production("Ships.Zeppelin.ai_45", 1, 0.)
						sl_germany_player:add_to_production("Ships.Bismarck.ai_45", 1, 0.)
						sl_germany_player:add_to_production("Ships.Tirpitz.ai_45", 1, 0.)
						sl_germany_player:add_to_production("Ships.Kormoran.ai_45", 4, 0.)
						sl_germany_player:add_to_production("Ships.Nordmark.ai_45", 4, 0.)
						log_message ("G add_to_production Ships 45")
					elseif sl_get_year() >= 1943 then
						sl_germany_player:add_to_production("Ships.U-Boat7.ai_43", 1, 0.)
						sl_germany_player:add_to_production("Ships.U-Boat7.ai_43", 1, 0.)
						sl_germany_player:add_to_production("Ships.Narvick.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Ships.Narvick.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Ships.Narvick.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Ships.Narvick.ai_43", 10, 0.)
						sl_germany_player:add_to_production("Ships.Leipzig.ai_43", 2, 0.)
						sl_germany_player:add_to_production("Ships.Leipzig.ai_43", 2, 0.)
						sl_germany_player:add_to_production("Ships.Hipper.ai_43", 1, 0.)
						sl_germany_player:add_to_production("Ships.Hipper.ai_43", 1, 0.)
						sl_germany_player:add_to_production("Ships.Zeppelin.ai_43", 1, 0.)
						sl_germany_player:add_to_production("Ships.Zeppelin.ai_43", 1, 0.)
						sl_germany_player:add_to_production("Ships.Bismarck.ai_43", 1, 0.)
						sl_germany_player:add_to_production("Ships.Tirpitz.ai_43", 1, 0.)
						sl_germany_player:add_to_production("Ships.Kormoran.ai_43", 4, 0.)
						sl_germany_player:add_to_production("Ships.Nordmark.ai_43", 4, 0.)
						log_message ("G add_to_production Ships 43")
					else
						sl_germany_player:add_to_production("Ships.U-Boat7.Prototype", 1, 0.)
						sl_germany_player:add_to_production("Ships.U-Boat7.Prototype", 1, 0.)
						sl_germany_player:add_to_production("Ships.Narvick.Prototype", 10, 0.)
						sl_germany_player:add_to_production("Ships.Narvick.Prototype", 10, 0.)
						sl_germany_player:add_to_production("Ships.Narvick.Prototype", 10, 0.)
						sl_germany_player:add_to_production("Ships.Narvick.Prototype", 10, 0.)
						sl_germany_player:add_to_production("Ships.Leipzig.Prototype", 2, 0.)
						sl_germany_player:add_to_production("Ships.Leipzig.Prototype", 2, 0.)
						sl_germany_player:add_to_production("Ships.Hipper.Prototype", 1, 0.)
						sl_germany_player:add_to_production("Ships.Hipper.Prototype", 1, 0.)
						sl_germany_player:add_to_production("Ships.Zeppelin.Prototype", 1, 0.)
						sl_germany_player:add_to_production("Ships.Zeppelin.Prototype", 1, 0.)
						sl_germany_player:add_to_production("Ships.Bismarck.Prototype", 1, 0.)
						sl_germany_player:add_to_production("Ships.Kormoran.Prototype", 4, 0.)
						sl_germany_player:add_to_production("Ships.Nordmark.Prototype", 4, 0.)
						log_message ("G add_to_production Ships 40")
					end
				end
			end
		end
	end
end

----------------------------------------------------------------------------------------------------------------
-- Для неиграбельных формаций можно генерить юнитов в разных точках с помощью нижних функций. Можно вернуть "" и тогда не создастся ничего
-- Фукции вызываются раз в 2-3 недели примерно случайным образом
-- sl_non_playable_get_formation_on_base_ - если есть главная база у игрока, то вызывается эта функция и может даже самолетные возвращать формации, тк они кинутся на базе
-- sl_non_playable_get_formation_ - если нет базы, то эта вызовется, чтобы корабельную формацию создать на карте.
-- sl_non_playable_get_formation_pos_ - если нет базы, то точку, где создать формацию игра получает из этой функции
----------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function sl_non_playable_get_formation_on_base_holland()
	local randNum = math.random()
	--голландцы реже подкреп шлют
	if (randNum < 0.5) then
		return ""
	end
	local randNum = math.random()
	if (randNum < 0.5) then
		log_message ("LightCruiser_Division_holland BaseX")
		return "LightCruiser_Division_holland"
	end
	if (randNum < 0.7) then
		log_message ("Fighter_Carrier_Division_holland BaseX")
		return "Fighter_Carrier_Division_holland"
	end
	log_message ("Tanker_Division_holland BaseX")
	return "Tanker_Division_holland"
end

function sl_non_playable_get_formation_holland()
	local randNum = math.random()
	--пока нет базы, генерим реже
	if (randNum < 0.7) then
		return ""
	end
	log_message ("LightCruiser_Division_holland SeaX")
	return "LightCruiser_Division_holland"
end

function sl_non_playable_get_formation_pos_holland()
	local randNum = math.random()
	if (randNum < 0.6) then
		return {x = 20, y = 1830, z = 0}
	end
	return {x = 70, y = 1350, z = 0}
end
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function sl_non_playable_get_formation_on_base_ussr()
	local randNum = math.random()
	if (randNum < 0.1) then
		log_message ("Scout_FlyBoat_Division_ussr BaseX")
		return "Scout_FlyBoat_Division_ussr"
	end
	if (randNum < 0.2) then
		log_message ("HeavyBomber_Fleet_ussr BaseX")
		return "HeavyBomber_Fleet_ussr"
	end
	if (randNum < 0.4) then
		log_message ("Tanker_Division_ussr BaseX")
		return "Tanker_Division_ussr"
	end
	if (randNum < 0.6) then
		log_message ("HeavyCruiser_Division_ussr BaseX")
		return "HeavyCruiser_Division_ussr"
	end
	if (randNum < 0.7) then
		log_message ("HeavyBomber_Division_ussr BaseX")
		return "HeavyBomber_Division_ussr"
	end
	log_message ("Expeditionary_Fleet_ussr BaseX")
	return "Expeditionary_Fleet_ussr"
end

function sl_non_playable_get_formation_ussr()
	local randNum = math.random()
	--пока нет базы, генерим реже
	if (randNum < 0.5) then
		return ""
	end
	log_message ("Expeditionary_Fleet_ussr SeaX")
	return "Expeditionary_Fleet_ussr"
end

function sl_non_playable_get_formation_pos_ussr()
	local randNum = math.random()
	if (randNum < 0.4) then
		return {x = 1045, y = 800, z = 0}
	end
	if (randNum < 0.8) then
		return {x = 2000, y = 430, z = 0}
	end
	return {x = 1350, y = 630, z = 0}
end
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function sl_non_playable_get_formation_on_base_germany()
	local randNum = math.random()
	if (randNum < 0.1) then
		log_message ("Battleship_Fleet_germany Basex")
		return "Battleship_Fleet_germany"
	end
	if (randNum < 0.2) then
		log_message ("HeavyBomber_Fleet_germany Basex")
		return "HeavyBomber_Fleet_germany"
	end
	if (randNum < 0.4) then
		log_message ("Transport_Division_germany Basex")
		return "Transport_Division_germany"
	end
	if (randNum < 0.6) then
		log_message ("Destroyer_Division_germany BaseX")
		return "Destroyer_Division_germany"
	end
	if (randNum < 0.7) then
		log_message ("Submarine_Division_germany Basex")
		return "Submarine_Division_germany"
	end
	log_message ("Tanker_Ship_Division_germany Basex")
	return "Tanker_Ship_Division_germany"
end

function sl_non_playable_get_formation_germany()
	local randNum = math.random()
	--пока нет базы, генерим реже
	if (randNum < 0.5) then
		return ""
	end
	local randNum = math.random()
	if (randNum < 0.7) then
		log_message ("Battleship_Fleet_germany SeaX")
		return "Battleship_Fleet_germany"
	end
	log_message ("Tanker_Ship_Division_germany SeaX")
	return "Tanker_Ship_Division_germany"
end

function sl_non_playable_get_formation_pos_germany()
	local randNum = math.random()
	if (randNum < 0.4) then
		return {x = 20, y = 1830, z = 0}
	end
	if (randNum < 0.8) then
		return {x = 70, y = 1350, z = 0}
	end
	return {x = 2100, y = 400, z = 0}
end

function sl_ai_attack_zone()
	log_message("sl_ai_attack_zone...")
	local myPlayer = sl_get_my_player_id()
	local o_Player = ""
	local base = get_base("Base100")
	local basePlayer = base:get_player_id()

	if (myPlayer == sl_usa_player:get_id()) then
		o_Player = "USA"
	end

	if (myPlayer == sl_japan_player:get_id()) then
		o_Player = "Japan"
	end

	if (myPlayer == sl_england_player:get_id()) then
		o_Player = "England"
	end

	if (myPlayer == sl_holland_player:get_id()) then
		o_Player = "Holland"
	end

	if (myPlayer == sl_germany_player:get_id()) then
		o_Player = "Germany"
	end

	if (myPlayer == sl_ussr_player:get_id()) then
		o_Player = "USSR"
	end

	sl_set_my_player("USA")
	local usa_w_base = sl_weak_zone()
	local usa_near_base = get_near_enemy_base_for_my_player()
	local m_base = get_main_base(true)
	local shipcounts = 0
	if sl_usa_player:get_metropoly_zones_count() ~= 0 then
	  --shipcounts = m_base:get_ships_count()
	  shipcounts = sl_usa_player:get_formations_count()
	end
	log_message ("U shipcounts:"..shipcounts)
	sl_set_my_player(o_Player)

	local l_aday = 1

	if (usa_near_base ~= nil) and (shipcounts >= 1000) then
		log_message ("USA sl_near_base:"..usa_near_base)

		base = get_base(usa_near_base)
		basePlayer = base:get_player_id()

		if sl_is_at_war(basePlayer+1, 1) and myPlayer ~= sl_usa_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			usa_near_base = string.sub(usa_near_base, 5)
			usa_near_base = "Zone"..usa_near_base
			sl_usa_player:attack_zone(usa_near_base)
			log_message("USA near enemy base attack:"..usa_near_base)
		end

		base = get_base("Base24")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 1) and myPlayer ~= sl_usa_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_usa_player:attack_zone("Zone24")
			log_message("U enemy base attack: MidWay")
		end

		base = get_base("Base33")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 1) and myPlayer ~= sl_usa_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_usa_player:attack_zone("Zone33")
			log_message("U enemy base attack: Wake")
		end

		base = get_base("Base44")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 1) and myPlayer ~= sl_usa_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_usa_player:attack_zone("Zone44")
			log_message("U enemy base attack: Truk")
		end

		base = get_base("Base43")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 1) and myPlayer ~= sl_usa_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_usa_player:attack_zone("Zone43")
			log_message("U enemy base attack: Saipan")
		end

		base = get_base("Base31")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 1) and myPlayer ~= sl_usa_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_usa_player:attack_zone("Zone31")
			log_message("U enemy base attack: IwoJima")
		end

		base = get_base("Base38")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 1) and myPlayer ~= sl_usa_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_usa_player:attack_zone("Zone38")
			log_message("U enemy base attack: Okinawa")
		end

		base = get_base("Base106")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 1) and myPlayer ~= sl_usa_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_usa_player:attack_zone("Zone106")
			log_message("U enemy base attack: Wellington")
		end

	end

	sl_set_my_player("Japan")
	local j_w_base = sl_weak_zone()
	local j_near_base = get_near_enemy_base_for_my_player()
	m_base = get_main_base(true)
	local shipcounts = 0
	if sl_japan_player:get_metropoly_zones_count() ~= 0 then
	  --shipcounts = m_base:get_ships_count()
	  shipcounts = sl_japan_player:get_formations_count()
	end
	log_message ("J shipcounts:"..shipcounts)
	sl_set_my_player(o_Player)

	if (j_near_base ~= nil) and (shipcounts >= 1000) then
		log_message ("J sl_near_base:"..j_near_base)

		base = get_base(j_near_base)
		basePlayer = base:get_player_id()

		if sl_is_at_war(basePlayer+1, 2) and myPlayer ~= sl_japan_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			j_near_base = string.sub(j_near_base, 5)
			j_near_base = "Zone"..j_near_base
			sl_japan_player:attack_zone(j_near_base)
			log_message("J near enemy base attack:"..j_near_base)
		end

		base = get_base("Base38")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 2) and myPlayer ~= sl_japan_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_japan_player:attack_zone("Zone38")
			log_message("J enemy base attack: Okinawa")
		end

		base = get_base("Base31")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 2) and myPlayer ~= sl_japan_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_japan_player:attack_zone("Zone31")
			log_message("J enemy base attack: IwoJima")
		end

		base = get_base("Base43")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 2) and myPlayer ~= sl_japan_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_japan_player:attack_zone("Zone43")
			log_message("J enemy base attack: Saipan")
		end

		base = get_base("Base33")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 2) and myPlayer ~= sl_japan_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_japan_player:attack_zone("Zone33")
			log_message("J enemy base attack: Wake")
		end

		base = get_base("Base56")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 2) and myPlayer ~= sl_japan_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_japan_player:attack_zone("Zone56")
			log_message("J enemy base attack: HongKong")
		end

		base = get_base("Base40")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 2) and myPlayer ~= sl_japan_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_japan_player:attack_zone("Zone40")
			log_message("J enemy base attack: Kaohsiung")
		end

		base = get_base("Base57")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 2) and myPlayer ~= sl_japan_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_japan_player:attack_zone("Zone57")
			log_message("J enemy base attack: Luzon")
		end

		base = get_base("Base71")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 2) and myPlayer ~= sl_japan_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_japan_player:attack_zone("Zone71")
			log_message("J enemy base attack: Miri")
		end

		base = get_base("Base44")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 2) and myPlayer ~= sl_japan_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_japan_player:attack_zone("Zone44")
			log_message("J enemy base attack: Truk")
		end
	end

	sl_set_my_player("England")
	local e_w_base = sl_weak_zone()
	local e_near_base = get_near_enemy_base_for_my_player()
	m_base = get_main_base(true)
	local shipcounts = 0
	if sl_england_player:get_metropoly_zones_count() ~= 0 then
	  --shipcounts = m_base:get_ships_count()
	  shipcounts = sl_england_player:get_formations_count()
	end
	log_message ("E shipcounts:"..shipcounts)
	sl_set_my_player(o_Player)

	if (e_near_base ~= nil) and (shipcounts >= 750) then
		log_message ("E sl_near_base:"..e_near_base)

		base = get_base(e_near_base)
		basePlayer = base:get_player_id()

		if sl_is_at_war(basePlayer+1, 3) and myPlayer ~= sl_england_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			e_near_base = string.sub(e_near_base, 5)
			e_near_base = "Zone"..e_near_base
			sl_england_player:attack_zone(e_near_base)
			log_message("E near enemy base attack:"..e_near_base)
		end

		base = get_base("Base81")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 3) and myPlayer ~= sl_england_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_england_player:attack_zone("Zone81")
			log_message("E enemy base attack: Singapore")
		end

		base = get_base("Base71")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 3) and myPlayer ~= sl_england_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_england_player:attack_zone("Zone71")
			log_message("E enemy base attack: Miri")
		end

		base = get_base("Base57")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 3) and myPlayer ~= sl_england_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_england_player:attack_zone("Zone57")
			log_message("E enemy base attack: Luzon")
		end

		base = get_base("Base40")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 3) and myPlayer ~= sl_england_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_england_player:attack_zone("Zone40")
			log_message("E enemy base attack: Kaohsiung")
		end

		base = get_base("Base56")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 3) and myPlayer ~= sl_england_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_england_player:attack_zone("Zone56")
			log_message("E enemy base attack: HongKong")
		end

		base = get_base("Base106")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 3) and myPlayer ~= sl_england_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_england_player:attack_zone("Zone106")
			log_message("UK enemy base attack: Wellington")
		end
	end

	sl_set_my_player("Holland")
	local h_w_base = sl_weak_zone()
	local h_near_base = get_near_enemy_base_for_my_player()
	m_base = get_main_base(true)
	shipcounts = 0
	if sl_holland_player:get_metropoly_zones_count() ~= 0 then
	  --shipcounts = m_base:get_ships_count()
	  shipcounts = sl_holland_player:get_formations_count()
	end
	log_message ("H shipcounts:"..shipcounts)
	sl_set_my_player(o_Player)

	if (h_near_base ~= nil) and (shipcounts >= 300) then
		log_message ("H sl_near_base:"..h_near_base)

		base = get_base(h_near_base)
		basePlayer = base:get_player_id()

		if sl_is_at_war(basePlayer+1, 4) and myPlayer ~= sl_holland_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			h_near_base = string.sub(h_near_base, 5)
			h_near_base = "Zone"..h_near_base
			sl_holland_player:attack_zone(h_near_base)
			log_message("H near enemy base attack:"..h_near_base)
		end

		base = get_base("Base71")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 4) and myPlayer ~= sl_holland_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_holland_player:attack_zone("Zone71")
			log_message("H enemy base attack: Miri")
		end

		base = get_base("Base57")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 4) and myPlayer ~= sl_holland_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_holland_player:attack_zone("Zone57")
			log_message("H enemy base attack: Luzon")
		end

		base = get_base("Base40")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 4) and myPlayer ~= sl_holland_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_holland_player:attack_zone("Zone40")
			log_message("H enemy base attack: Kaohsiung")
		end

		base = get_base("Base56")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 4) and myPlayer ~= sl_holland_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_holland_player:attack_zone("Zone56")
			log_message("H enemy base attack: HongKong")
		end

		base = get_base("Base106")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 4) and myPlayer ~= sl_holland_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_holland_player:attack_zone("Zone106")
			log_message("HL enemy base attack: Wellington")
		end

  end

	sl_set_my_player("Germany")
	local g_w_base = sl_weak_zone()
	local g_near_base = get_near_enemy_base_for_my_player()
	m_base = get_main_base(true)
	shipcounts = 0
	if sl_germany_player:get_metropoly_zones_count() ~= 0 then
	  --shipcounts = m_base:get_ships_count()
	  shipcounts = sl_germany_player:get_formations_count()
	end
	log_message ("G shipcounts:"..shipcounts)
	sl_set_my_player(o_Player)

	if (g_near_base ~= nil) and (shipcounts >= 300) then
		log_message ("G sl_near_base:"..g_near_base)

		base = get_base(g_near_base)
		basePlayer = base:get_player_id()

		if sl_is_at_war(basePlayer+1, 5) and myPlayer ~= sl_germany_player:get_id() and math.mod(sl_get_day(),l_aday) == 0  then
			g_near_base = string.sub(g_near_base, 5)
			g_near_base = "Zone"..g_near_base
			sl_germany_player:attack_zone(g_near_base)
			log_message("G near enemy base attack:"..g_near_base)
		end

		base = get_base("Base116")
		basePlayer = base:get_player_id()

		if sl_is_at_war(basePlayer+1, 5) and myPlayer ~= sl_germany_player:get_id() and math.mod(sl_get_day(),l_aday) == 0  then
			sl_germany_player:attack_zone("Zone116")
			log_message("G enemy base attack: Sydney")
		end

		base = get_base("Base106")
		basePlayer = base:get_player_id()

		if sl_is_at_war(basePlayer+1, 5) and myPlayer ~= sl_germany_player:get_id() and math.mod(sl_get_day(),l_aday) == 0  then
			sl_germany_player:attack_zone("Zone106")
			log_message("G enemy base attack: Townsville")
		end

		base = get_base("Base105")
		basePlayer = base:get_player_id()

		if sl_is_at_war(basePlayer+1, 5) and myPlayer ~= sl_germany_player:get_id() and math.mod(sl_get_day(),l_aday) == 0  then
			sl_germany_player:attack_zone("Zone105")
			log_message("G enemy base attack: Darwin")
		end

		base = get_base("Base104")
		basePlayer = base:get_player_id()

		if sl_is_at_war(basePlayer+1, 5) and myPlayer ~= sl_germany_player:get_id() and math.mod(sl_get_day(),l_aday) == 0  then
			sl_germany_player:attack_zone("Zone104")
			log_message("G enemy base attack: PortHeadland")
		end
	end

	sl_set_my_player("USSR")
	local ussr_w_base = sl_weak_zone()
	local ussr_near_base = get_near_enemy_base_for_my_player()
	m_base = get_main_base(true)
	shipcounts = 0
	if sl_ussr_player:get_metropoly_zones_count() ~= 0 then
	  --shipcounts = m_base:get_ships_count()
	  shipcounts = sl_ussr_player:get_formations_count()
	end
	log_message ("USSR shipcounts:"..shipcounts)
	sl_set_my_player(o_Player)

	if (ussr_near_base ~= nil) and (shipcounts >= 300) then
		log_message ("USSR sl_near_base:"..ussr_near_base)

		base = get_base(ussr_near_base)
		basePlayer = base:get_player_id()

		if sl_is_at_war(basePlayer+1, 6) and myPlayer ~= sl_ussr_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			ussr_near_base = string.sub(ussr_near_base, 5)
			ussr_near_base = "Zone"..ussr_near_base
			sl_ussr_player:attack_zone(ussr_near_base)
			log_message("USSR near enemy base attack:"..ussr_near_base)
		end

		base = get_base("Base106")
		basePlayer = base:get_player_id()
		if sl_is_at_war(basePlayer+1, 6) and myPlayer ~= sl_ussr_player:get_id() and math.mod(sl_get_day(),l_aday) == 0 then
			sl_ussr_player:attack_zone("Zone106")
			log_message("USSR enemy base attack: Wellington")
		end

  end

	if (usa_w_base ~= 0) then
		local zone = usa_w_base

		if sl_get_my_player_id() ~= sl_usa_player:get_id() then
			if sl_is_at_war(1, 1) and sl_get_day() == 1 then
				sl_usa_player:attack_zone(zone)
				log_message("USA w_zone_attack_usa:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_japan_player:get_id() then
			if sl_is_at_war(2, 1) and sl_get_day() == 6 then
				sl_japan_player:attack_zone(zone)
				log_message("J w_zone_attack_usa:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_england_player:get_id() then
			if sl_is_at_war(3, 1) and sl_get_day() == 11 then
				sl_england_player:attack_zone(zone)
				log_message("E w_zone_attack_usa:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_holland_player:get_id() then
			if sl_is_at_war(4, 1) and sl_get_day() == 16 then
				sl_holland_player:attack_zone(zone)
				log_message("H w_zone_attack_usa:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_germany_player:get_id() then
			if sl_is_at_war(5, 1) and sl_get_day() == 21 then
				sl_germany_player:attack_zone(zone)
				log_message("g w_zone_attack_usa:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_ussr_player:get_id() then
			if sl_is_at_war(6, 1) and sl_get_day() == 26 then
				sl_ussr_player:attack_zone(zone)
				log_message("USSR w_zone_attack_usa:"..zone)
			end
		end
	end

	if (j_w_base ~= 0) then
		local zone = j_w_base

		if sl_get_my_player_id() ~= sl_usa_player:get_id() then
			if sl_is_at_war(1, 2) and sl_get_day() == 1 then
				sl_usa_player:attack_zone(zone)
				log_message("USA w_zone_attack_japan:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_japan_player:get_id() then
			if sl_is_at_war(2, 2) and sl_get_day() == 6 then
				sl_japan_player:attack_zone(zone)
				log_message("J w_zone_attack_japan:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_england_player:get_id() then
			if sl_is_at_war(3, 2) and sl_get_day() == 11 then
				sl_england_player:attack_zone(zone)
				log_message("E w_zone_attack_japan:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_holland_player:get_id() then
			if sl_is_at_war(4, 2) and sl_get_day() == 16 then
				sl_holland_player:attack_zone(zone)
				log_message("H w_zone_attack_japan:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_germany_player:get_id() then
			if sl_is_at_war(5, 2) and sl_get_day() == 21 then
				sl_germany_player:attack_zone(zone)
				log_message("g w_zone_attack_japan:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_ussr_player:get_id() then
			if sl_is_at_war(6, 2) and sl_get_day() == 26 then
				sl_ussr_player:attack_zone(zone)
				log_message("USSR w_zone_attack_japan:"..zone)
			end
		end
	end

	if (e_w_base ~= 0) then
		local zone = e_w_base

		if sl_get_my_player_id() ~= sl_usa_player:get_id() then
			if sl_is_at_war(1, 3) and sl_get_day() == 1 then
				sl_usa_player:attack_zone(zone)
				log_message("USA w_zone_attack_england:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_japan_player:get_id() then
			if sl_is_at_war(2, 3) and sl_get_day() == 6 then
				sl_japan_player:attack_zone(zone)
				log_message("J w_zone_attack_england:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_england_player:get_id() then
			if sl_is_at_war(3, 3) and sl_get_day() == 11 then
				sl_england_player:attack_zone(zone)
				log_message("E w_zone_attack_england:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_holland_player:get_id() then
			if sl_is_at_war(4, 3) and sl_get_day() == 16 then
				sl_holland_player:attack_zone(zone)
				log_message("H w_zone_attack_england:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_germany_player:get_id() then
			if sl_is_at_war(5, 3) and sl_get_day() == 21 then
				sl_germany_player:attack_zone(zone)
				log_message("g w_zone_attack_england:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_ussr_player:get_id() then
			if sl_is_at_war(6, 3) and sl_get_day() == 26 then
				sl_ussr_player:attack_zone(zone)
				log_message("USSR w_zone_attack_england:"..zone)
			end
		end
	end

	if (h_w_base ~= 0) then
		local zone = h_w_base

		if sl_get_my_player_id() ~= sl_usa_player:get_id() then
			if sl_is_at_war(1, 4) and sl_get_day() == 1 then
				sl_usa_player:attack_zone(zone)
				log_message("USA w_zone_attack_holland:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_japan_player:get_id() then
			if sl_is_at_war(2, 4) and sl_get_day() == 6 then
				sl_japan_player:attack_zone(zone)
				log_message("J w_zone_attack_holland:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_england_player:get_id() then
			if sl_is_at_war(3, 4) and sl_get_day() == 11 then
				sl_england_player:attack_zone(zone)
				log_message("E w_zone_attack_holland:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_holland_player:get_id() then
			if sl_is_at_war(4, 4) and sl_get_day() == 16 then
				sl_holland_player:attack_zone(zone)
				log_message("H w_zone_attack_holland:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_germany_player:get_id() then
			if sl_is_at_war(5, 4) and sl_get_day() == 21 then
				sl_germany_player:attack_zone(zone)
				log_message("g w_zone_attack_holland:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_ussr_player:get_id() then
			if sl_is_at_war(6, 4) and sl_get_day() == 26 then
				sl_ussr_player:attack_zone(zone)
				log_message("USSR w_zone_attack_holland:"..zone)
			end
		end
	end

	if (g_w_base ~= 0) then
		local zone = g_w_base

		if sl_get_my_player_id() ~= sl_usa_player:get_id() then
			if sl_is_at_war(1, 5) and sl_get_day() == 1 then
				sl_usa_player:attack_zone(zone)
				log_message("USA w_zone_attack_germany:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_japan_player:get_id() then
			if sl_is_at_war(2, 5) and sl_get_day() == 6 then
				sl_japan_player:attack_zone(zone)
				log_message("J w_zone_attack_germany:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_england_player:get_id() then
			if sl_is_at_war(3, 5) and sl_get_day() == 11 then
				sl_england_player:attack_zone(zone)
				log_message("E w_zone_attack_germany:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_holland_player:get_id() then
			if sl_is_at_war(4, 5) and sl_get_day() == 16 then
				sl_holland_player:attack_zone(zone)
				log_message("H w_zone_attack_germany:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_germany_player:get_id() then
			if sl_is_at_war(5, 5) and sl_get_day() == 21 then
				sl_germany_player:attack_zone(zone)
				log_message("g w_zone_attack_germany:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_ussr_player:get_id() then
			if sl_is_at_war(6, 5) and sl_get_day() == 26 then
				sl_ussr_player:attack_zone(zone)
				log_message("USSR w_zone_attack_germany:"..zone)
			end
		end
	end

	if (ussr_w_base ~= 0) then
		local zone = ussr_w_base

		if sl_get_my_player_id() ~= sl_usa_player:get_id() then
			if sl_is_at_war(1, 6) and sl_get_day() == 1 then
				sl_usa_player:attack_zone(zone)
				log_message("USA w_zone_attack_ussr:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_japan_player:get_id() then
			if sl_is_at_war(2, 6) and sl_get_day() == 6 then
				sl_japan_player:attack_zone(zone)
				log_message("J w_zone_attack_ussr:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_england_player:get_id() then
			if sl_is_at_war(3, 6) and sl_get_day() == 11 then
				sl_england_player:attack_zone(zone)
				log_message("E w_zone_attack_ussr:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_holland_player:get_id() then
			if sl_is_at_war(4, 6) and sl_get_day() == 16 then
				sl_holland_player:attack_zone(zone)
				log_message("H w_zone_attack_ussr:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_germany_player:get_id() then
			if sl_is_at_war(5, 6) and sl_get_day() == 21 then
				sl_germany_player:attack_zone(zone)
				log_message("g w_zone_attack_ussr:"..zone)
			end
		end

		if sl_get_my_player_id() ~= sl_ussr_player:get_id() then
			if sl_is_at_war(6, 6) and sl_get_day() == 26 then
				sl_ussr_player:attack_zone(zone)
				log_message("USSR w_zone_attack_ussr:"..zone)
			end
		end
	end

end

function sl_weak_zone()

	local baseName = get_base_for_reinforce(5, 20)

	if (baseName == nil) then
		log_message ("get_base_for_reinforce: 0")
		return 0
	end

	log_message ("get_base_for_reinforce:"..baseName)

	local zone = string.sub(baseName, 5)
	zone = "Zone"..zone
	return zone

end

function sl_reset_err_relation()
	local f_cnt = sl_get_relations(USA, Japan)
	--log_message ("USA,Japan sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(USA, Japan, 0.5)
		log_message ("USA,Japan change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(USA,Japan)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(USA,Japan, math.random(5.5, 9.9)/10)
		log_message ("USA,Japan change...")
	end

	local f_cnt = sl_get_relations(USA, England)
	--log_message ("USA,England sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(USA, England, 0.5)
		log_message ("USA, England change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(USA, England)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(USA, England, math.random(5.5, 9.9)/10)
		log_message ("USA, England change...")
	end

	local f_cnt = sl_get_relations(USA, Holland)
	--log_message ("USA,Holland sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(USA, Holland, 0.5)
		log_message ("USA,Holland change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(USA,Holland)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(USA,Holland, math.random(5.5, 9.9)/10)
		log_message ("USA,Holland change...")
	end

	local f_cnt = sl_get_relations(USA, Germany)
	--log_message ("USA,Germany sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(USA, Germany, 0.5)
		log_message ("USA,Germany change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(USA,Germany)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(USA,Germany, math.random(5.5, 9.9)/10)
		log_message ("USA,Germany change...")

	end

	local f_cnt = sl_get_relations(USA, USSR)
	--log_message ("USA,USSR sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(USA, USSR, 0.5)
		log_message ("USA,USSR change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(USA,USSR)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(USA,USSR, math.random(5.5, 9.9)/10)
		log_message ("USA,USSR change...")
	end

	local f_cnt = sl_get_relations(Japan, England)
	--log_message ("Japan,England sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(Japan, England, 0.5)
		log_message ("Japan, England change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(Japan,England)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(Japan,England, math.random(5.5, 9.9)/10)
		log_message ("Japan,England change...")
	end

	local f_cnt = sl_get_relations(Japan, Holland)
	--log_message ("Japan,Holland sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(Japan, Holland, 0.5)
		log_message ("Japan,Holland change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(Japan,Holland)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(Japan,Holland, math.random(5.5, 9.9)/10)
		log_message ("Japan,Holland change...")
	end

	local f_cnt = sl_get_relations(Japan, Germany)
	--log_message ("Japan,Germany sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(Japan, Germany, 0.5)
		log_message ("Japan,Germany change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(Japan, Germany)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(Japan, Germany, math.random(5.5, 9.9)/10)
		log_message ("Japan,Germany change...")
	end

	local f_cnt = sl_get_relations(Japan, USSR)
	--log_message ("Japan,USSR sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(Japan, USSR, 0.5)
		log_message ("Japan,USSR change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(Japan,USSR)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(Japan,USSR, math.random(5.5, 9.9)/10)
		log_message ("Japan,USSR change...")
	end

	local f_cnt = sl_get_relations(England, Holland)
	--log_message ("England,Holland sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(England, Holland, 0.5)
		log_message ("England,Holland change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(England,Holland)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(England,Holland, math.random(5.5, 9.9)/10)
		log_message ("England,Holland change...")
	end

	local f_cnt = sl_get_relations(England, Germany)
	--log_message ("England,Germany sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(England, Germany, 0.5)
		log_message ("England,Germany change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(England,Germany)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(England,Germany, math.random(5.5, 9.9)/10)
		log_message ("England,Germany change...")
	end

	local f_cnt = sl_get_relations(England, USSR)
	--log_message ("England,USSR sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(England, USSR, 0.5)
		log_message ("England,USSR change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(England,USSR)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(England,USSR, math.random(5.5, 9.9)/10)
		log_message ("England,USSR change...")
	end

	local f_cnt = sl_get_relations(Holland, Germany)
	--log_message ("Holland,Germany sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(Holland, Germany, 0.5)
		log_message ("Holland,Germany change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(Holland,Germany)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(Holland,Germany, math.random(5.5, 9.9)/10)
		log_message ("Holland,Germany change...")
	end

	local f_cnt = sl_get_relations(Holland, USSR)
	--log_message ("Holland,USSR sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(Holland, USSR, 0.5)
		log_message ("Holland,USSR change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(Holland,USSR)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(Holland,USSR, math.random(5.5, 9.9)/10)
		log_message ("Holland,USSR change...")
	end

	local f_cnt = sl_get_relations(Germany, USSR)
	--log_message ("G,USSR sl_get_relations count:"..f_cnt)

	if not (f_cnt > 0) then
		sl_set_relations(Germany, USSR, 0.5)
		log_message ("G,USSR change sl_get_relations"..f_cnt)
	elseif not(sl_is_at_war(Germany,USSR)) and f_cnt < 0.56 and (sl_get_game_type() ~= "arcade") then
		sl_set_relations(Germany,USSR, math.random(5.5, 9.9)/10)
		log_message ("Germany,USSR change...")
	end
end
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------