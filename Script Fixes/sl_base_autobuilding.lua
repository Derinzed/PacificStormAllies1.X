
-- Эта функция вызывается для автоматического строительства зданий на базе.
function BaseAutoBuildingFunc(baseId)
	local id = baseId
	
	--local base = sl_get_base(baseId)
	--if (base == nil) then
	--	return
	--end
	
	-- сначала 1 казарма и 1 госпиталь. пока хватает инженеров, заказывать их
	-- далее строить случайным образом одно из 4: казармы, склады, склады ГСМ и госпитали
	-- если зона добывающая и денег достаточно, то заказываем Mine
	-- если есть по 1 хотя бы всех 4-х предыдущих зданий и много денег, то заказываем порт, аэродром
	-- 
	
	--local builder = base:get_builder()
	
	--если нет свободных инженеров, то выходим сразу
	--if (builder:get_free_engineers() < 1) then
	--	return
	--end
	
	--если мало денег, то только простые строим
	--local moneyCount = base:get_player():get_resources("Money")
	--local NoMoney = (moneyCount < 5000)
	--local needEngineers = false
	
	
	
	--если нужны инженеры, то берем с юнитов
	--if (needEngineers) then
	--	base:takeAllEngineersFromUnitsToBase()
	--end
	
end