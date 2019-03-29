log_message ("sl_england_scripts.lua ")


require ("res://sl_player_ai.lua")

function sl_england_game_script()

	--если играем за них, то вызовем обработчик случайных заданий
	if (sl_get_my_player_id() == sl_england_player:get_id() and sl_get_map_option("GovTasksOpt") == 1) then
		sl_eng_watch_for_new_random_task()
	end

	if not(sl_is_my_player("England")) and not(sl_is_at_war(England, Germany)) and
		sl_get_year() >= 1940 and sl_get_month() >= 1 and sl_get_day() >= 1
	then
		--sl_begin_war(England,Germany)
	end

	if not(sl_is_my_player("England")) and not(sl_is_at_war(England, Japan)) and sl_is_at_war(USA, Japan) and
		sl_get_year() >= 1941 and sl_get_month() >= 11 and sl_get_day() >= 1
	then
		sl_begin_war(England,Japan)
	end

	if sl_get_my_player_id() ~= sl_england_player:get_id() and sl_england_player:get_metropoly_zones_count() ~= 0 then
		if sl_get_month() == 1 and sl_get_day() == 1 then
			sl_england_player:create_formation_on_main_base("Shock_AircraftCarrier_Fleex_england")
			log_message ("Create Shock_AircraftCarrier_Flees_england XXX")
		end

		if sl_get_day() == 5 then
			local f_cnt = sl_england_player:get_formations_count()
			log_message ("E Formations count:"..f_cnt)

			if sl_get_month() == 7 and f_cnt < 3000 then
				sl_england_player:create_formation_on_main_base("Shock_AircraftCarrier_Fleex_england")
				log_message ("Create Shock_AircraftCarrier_Flees_england XXX")
			end

			log_message ("E Last Money :"..e_money)
			local moneyCount = sl_england_player:get_resources("Money") - e_money
			log_message ("E Money Diff:"..moneyCount)
			e_money = sl_england_player:get_resources("Money")
			log_message ("E Money :"..e_money)

			log_message ("E Last Iron :"..e_iron)
			local ironCount = sl_england_player:get_resources("Iron") - e_iron
			log_message ("E Iron Diff:"..ironCount)
			e_iron = sl_england_player:get_resources("Iron")
			log_message ("E Iron :"..e_iron)

			local aluminiumCount = sl_england_player:get_resources("Aluminium")
			log_message ("E Aluminium :"..aluminiumCount)
			local oilCount = sl_england_player:get_resources("Oil")
			log_message ("E Oil :"..oilCount)

			if moneyCount > 10000 and ironCount > 100 then
				sl_england_player:add_to_production("Ammos.Ammo.Ammo", 5000, 0.)
				sl_england_player:add_to_production("Ammos.uk_torp_avia.uk_torp_avia", 200, 0.)
				sl_england_player:add_to_production("Ammos.uk_torp_fleet.uk_torp_fleet", 200, 0.)
				sl_england_player:add_to_production("Ammos.Torp_UK_Mk13.Torp_UK_Mk13", 200, 0.)
				sl_england_player:add_to_production("Ammos.Torp_UK_Mk13_A_SA.Torp_UK_Mk13_A_SA", 20, 0.)
				sl_england_player:add_to_production("Ammos.Torp_UK_Mk13_M_I.Torp_UK_Mk13_M_I", 20, 0.)
				sl_england_player:add_to_production("Ammos.UK_Bat_ASM2_SAR.UK_Bat_ASM2_SAR", 100, 0.)
				sl_england_player:add_to_production("Ammos.UK_Bat_ASM2_SAR.UK_Bat_ASM2_SAR", 100, 0.)
				sl_england_player:add_to_production("Ammos.UK_Loon_SAR.UK_Loon_SAR", 20, 0.)
				sl_england_player:add_to_production("Ships.Canonesa.Prototype", 5, 0.)
				sl_england_player:add_to_production("Ships.Sildra.Prototype", 5, 0.)
				--sl_england_player:add_to_production("Turrets.PU_SAM_Eng_Turret.PU_SAM_Eng_Turret", 1, 0.)
				--sl_england_player:add_to_production("Turrets.PU_V1_Turret.PU_V1_Turret", 1, 0.)
				--sl_england_player:add_to_production("Turrets.PU_V2_Turret.PU_V2_Turret", 1, 0.)
				log_message ("E add_to_production Ammo & Cargo")
			end

			if moneyCount > 10000 and aluminiumCount  > 100 and ironCount > 10000 then
				sl_england_player:add_to_production("Airplanes.Walrus.Prototype", 5, 0.)
				sl_england_player:add_to_production("Airplanes.PBY_ENG.Prototype", 5, 0.)
				log_message ("E add_to_production Airplanes Walrus")
			end

--			local mbase = 164569
--			local ibase = 131484

			local mbase = 50000
			local ibase = 50000


			if (e_money/24 ) > (moneyCount/2) then
			  moneyCount = e_money/24
			else
			  moneyCount = moneyCount/2
			end

			if (e_iron/24 ) > (ironCount/2) then
			  ironCount = e_iron/24
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

			if (moneyCount +  e_money) > mbase and (ironCount + e_iron) > ibase then
--			if moneyCount > mbase and ironCount  > ibase then
				for i = 1, l_ICount do
					if sl_get_year() >= 1945 then
						sl_england_player:add_to_production("Airplanes.F2A2_ENG.ai_45", 3, 0.)
						sl_england_player:add_to_production("Airplanes.F2A2_ENG.ai_45", 3, 0.)
						sl_england_player:add_to_production("Airplanes.F2A2_ENG.ai_45", 3, 0.)
						sl_england_player:add_to_production("Airplanes.F2A2_ENG.ai_45", 3, 0.)
						sl_england_player:add_to_production("Airplanes.Barracuda2.ai_45", 10, 0.)
						sl_england_player:add_to_production("Airplanes.TBF_ENG.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.SeaFuryFB11.ai_45", 10, 0.)
						sl_england_player:add_to_production("Airplanes.Barracuda2.ai_45", 10, 0.)
						sl_england_player:add_to_production("Airplanes.TBF_ENG.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.SeaFuryFB11.ai_45", 10, 0.)
						sl_england_player:add_to_production("Airplanes.Barracuda2.ai_45", 10, 0.)
						sl_england_player:add_to_production("Airplanes.TBF_ENG.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.SeaFuryFB11.ai_45", 10, 0.)
						sl_england_player:add_to_production("Airplanes.Barracuda2.ai_45", 10, 0.)
						sl_england_player:add_to_production("Airplanes.TBF_ENG.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.SeaFuryFB11.ai_45", 10, 0.)
						sl_england_player:add_to_production("Airplanes.LancasterB1.Prototype", 10, 0.)
						log_message ("E add_to_production Airplanes 45")
					elseif sl_get_year() >= 1943 then
						sl_england_player:add_to_production("Airplanes.F2A2_ENG.ai_43", 3, 0.)
						sl_england_player:add_to_production("Airplanes.F2A2_ENG.ai_43", 3, 0.)
						sl_england_player:add_to_production("Airplanes.F2A2_ENG.ai_43", 3, 0.)
						sl_england_player:add_to_production("Airplanes.F2A2_ENG.ai_43", 3, 0.)
						sl_england_player:add_to_production("Airplanes.Barracuda2.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.TBF_ENG.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.SeaFire.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.Barracuda2.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.TBF_ENG.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.SeaFire.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.Barracuda2.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.TBF_ENG.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.SeaFire.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.Barracuda2.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.TBF_ENG.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.SeaFire.ai_43", 10, 0.)
						sl_england_player:add_to_production("Airplanes.LancasterB1.ai_43", 10, 0.)
						log_message ("E add_to_production Airplanes 43")
					else
						sl_england_player:add_to_production("Airplanes.Swordfish2.Prototype", 10, 0.)
						sl_england_player:add_to_production("Airplanes.F2A2_ENG.Prototype", 10, 0.)
						sl_england_player:add_to_production("Airplanes.Swordfish2.Prototype", 10, 0.)
						sl_england_player:add_to_production("Airplanes.F2A2_ENG.Prototype", 10, 0.)
						sl_england_player:add_to_production("Airplanes.Swordfish2.Prototype", 10, 0.)
						sl_england_player:add_to_production("Airplanes.F2A2_ENG.Prototype", 10, 0.)
						sl_england_player:add_to_production("Airplanes.Swordfish2.Prototype", 10, 0.)
						sl_england_player:add_to_production("Airplanes.F2A2_ENG.Prototype", 10, 0.)
						log_message ("E add_to_production Airplanes 40")
					end

					if sl_get_year() >= 1945 then
						sl_england_player:add_to_production("Ships.Hunt.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Hunt.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Tribal.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.Tribal.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.Tribal.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.Tribal.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.Bogue.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.Fiji.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.Fiji.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.Dorsetshire.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.Dorsetshire.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.Illustrious.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.Illustrious.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.KingGeorgV.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.Hood.ai_45", 1, 0.)
						sl_england_player:add_to_production("Ships.Canonesa.Prototype", 4, 0.)
						sl_england_player:add_to_production("Ships.Sildra.Prototype", 4, 0.)
						log_message ("E add_to_production Ships 45")
					elseif sl_get_year() >= 1943 then
						sl_england_player:add_to_production("Ships.Hunt.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Hunt.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Tribal.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Tribal.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Tribal.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Tribal.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Bogue.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Fiji.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Fiji.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Dorsetshire.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Dorsetshire.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Illustrious.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Illustrious.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.KingGeorgV.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Hood.ai_43", 1, 0.)
						sl_england_player:add_to_production("Ships.Canonesa.Prototype", 4, 0.)
						sl_england_player:add_to_production("Ships.Sildra.Prototype", 4, 0.)
						log_message ("E add_to_production Ships 43")
					else
						sl_england_player:add_to_production("Ships.Tribal.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.Tribal.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.Tribal.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.Tribal.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.Bogue.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.Fiji.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.Fiji.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.Dorsetshire.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.Dorsetshire.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.Illustrious.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.Illustrious.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.KingGeorgV.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.Hood.Prototype", 1, 0.)
						sl_england_player:add_to_production("Ships.Canonesa.Prototype", 4, 0.)
						sl_england_player:add_to_production("Ships.Sildra.Prototype", 4, 0.)
						log_message ("E add_to_production Ships 40")
					end
				end
			end
		end
	end
end


-----------------------------------
-- Условие поражения англичан
-----------------------------------
function sl_england_condition_of_defeat()
	if sl_default_condition_of_defeat(sl_england_player) then
		return "IDS_DefaultDefeatCondition"
	else
		count = 0
		playerId = sl_england_player:get_id()
		if sl_zone_holding_check("Zone96", playerId, 173000) and
			(sl_zone_holding_check("Zone105", playerId, 173000) or
			sl_zone_holding_check("Zone106", playerId, 173000) )
		then
			return "IDS_MainEnglandDefeatCondition"
		end
	end
	return "NoDefeat"
end

----------------------------------------------------------------------------------------
-- Получить имя главной базы британцев
----------------------------------------------------------------------------------------
function who_have_england_main_base()
	zone = sl_get_zone("Zone96")	--Калькутта
	return zone:get_player_id()
end