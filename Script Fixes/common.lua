------------------------------------------------------------------------------
-- Copyright (c) Lesta Studio, 2004
------------------------------------------------------------------------------

log_message ("common.lua: common script functions loaded...")

------------------------------------------------------------------------------
-- Сохранение скриншота с именем, прописанным в конфиге
------------------------------------------------------------------------------

function __take_screenshot ()
    take_screenshot (CONFIG["Loader.ScreenshotFile"]:get_value ())
end

------------------------------------------------------------------------------
-- Статистика рендера
------------------------------------------------------------------------------

function show_stats ()
	local stats = get_stats ()
	CONSOLE:println ("--------------------------------------------------------")
	CONSOLE:println ("Triangles   : "..stats.triangle_count)
	CONSOLE:println ("--------------------------------------------------------")
	CONSOLE:println ("Worst FPS   : "..stats.worst_fps)
	CONSOLE:println ("Average FPS : "..stats.average_fps)
	CONSOLE:println ("Best FPS    : "..stats.best_fps)
	CONSOLE:println ("--------------------------------------------------------")
	CONSOLE:println ("Current FPS : "..stats.current_fps) 
	CONSOLE:show ()
end

CONSOLE:add_autocomplete ("show_stats", "")

------------------------------------------------------------------------------
-- Metatable для 3D векторов
------------------------------------------------------------------------------

vector_metatable = 
{
	__add = function (op1, op2)
		local result = {}
		result.x = op1.x + op2.x
		result.y = op1.y + op2.y
		result.z = op1.z + op2.z
		return result
	end; -- __add
	
	__sub = function (op1, op2)
		local result = {}
		result.x = op1.x - op2.x
		result.y = op1.y - op2.y
		result.z = op1.z - op2.z
		return result
	end; -- __sub
	
	__mul = function (op1, op2)
		local result = {}
		result.x = op1.x * op2
		result.y = op1.y * op2
		result.z = op1.z * op2
		return result
	end; -- __mul
	
	__div = function (op1, op2)
		local result = {}
		result.x = op1.x / op2
		result.y = op1.y / op2
		result.z = op1.z / op2
		return result
	end; -- __div
	
	__unm = function (op1)
		local result = {}
		result.x = - op1.x
		result.y = - op1.y
		result.z = - op1.z
		return result
	end; -- __div
	
	__eq = function (op1, op2)
		return (op1.x == op2.x) and (op1.y == op2.y) and (op1.z == op2.z)
	end; -- __eq
}

------------------------------------------------------------------------------
-- Операции над векторами
------------------------------------------------------------------------------

function dotproduct (v1, v2)
	return v1.x*v2.x+v1.y*v2.y+v1.z*v2.z
end

function crossproduct (v1, v2)
	return {
		x = v1.y*v2.z - v1.z*v2.y;
		y = v1.z*v2.x - v1.x*v2.z;
		z = v1.x*v2.y - v1.y*v2.x;
	}
end

function normalise (v)
	local length = math.sqrt (v.x*v.x+v.y*v.y+v.z*v.z)
	if length > 1e-06 then
		return {
			x = v.x/length;
			y = v.y/length;
			z = v.z/length;
		}
	else
		return {x = 0; y = 0; z = 0;}
	end
end

------------------------------------------------------------------------------
-- Преобразование таблицы содержащей поля x, y и z в вектор (назначение 
-- metatable для перегрузки арифметических операторов)
------------------------------------------------------------------------------

function tovector (t)
	setmetatable (t, vector_metatable)
	return t
end -- tovector

function obj2vec (obj)
	return {
		x = tonumber (obj["X"]:get_value ());
		y = tonumber (obj["Y"]:get_value ());
		z = tonumber (obj["Z"]:get_value ())
	}
end -- obj2vec

------------------------------------------------------------------------------
-- Общие сочетания клавиш
------------------------------------------------------------------------------

begin_group ("COMMON_SHORTCUTS")
	-- Биндинг кнопки на выход
	bind_key ({KC_LCONTROL, KC_F4, priority=0}, "shutdown ()", 250)
	bind_key ({KC_LMENU, KC_F4, priority=0}, "shutdown ()", 250)
	bind_key ({KC_RMENU, KC_F4, priority=0}, "shutdown ()", 250)
	bind_key ({KC_LCONTROL, KC_LSHIFT, KC_F4, priority=0}, "instant_shutdown()", 250)
	
	-- Сохранить скриншот
	bind_key ({KC_SYSRQ, priority=0}, "__take_screenshot ()", 2000)
	bind_key ({KC_RSHIFT,KC_SYSRQ, priority=0}, "__take_screenshot ()", 2000)
	bind_key ({KC_LSHIFT,KC_SYSRQ, priority=0}, "__take_screenshot ()", 2000)
end_group () -- COMMON_SHORTCUTS

------------------------------------------------------------------------------
