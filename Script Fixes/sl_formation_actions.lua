log_message ("sl_formation_actions.lua ")


-- Присоединение группы к группе --
function sl_joining(actor)
	-- LOG:write("sl_joining\n");
	context = actor:get_action_context()
	actor_pos = actor:get_position()
	goal = context:get_formation(0)
	goal_pos = goal:get_position()
	if actor_pos.x == goal_pos.x and actor_pos.y == goal_pos.y then
		goal:add_formation(actor:get_id())
		return 1
	else
		return 0
	end
end


-- Основание базы --
function sl_found_base(actor)
	context = actor:get_action_context()
	actor_pos = actor:get_position()
	base_pos = context:get_position()
	if actor_pos.x == base_pos.x and actor_pos.y == base_pos.y then
		zone = context:get_zone()
		if zone:get_base() == nil then
			zone:create_base(actor:get_player_id())
		end
		return 1
	else
		return 0
	end
end


-- Идти на базу --
function sl_go_to_base(actor)
	context = actor:get_action_context()
	base = context:get_base(0)
	if base == nil then
		return 1
	end	
	actor_pos = actor:get_position()
	base_pos = context:get_position()
	if actor_pos.x == base_pos.x and actor_pos.y == base_pos.y then
		actor:go_join_base(base:get_id())
		return 1
	else
		return 0
	end
end


-- Конвой снабжения --
function sl_supply_convoy(actor)
	context = actor:get_action_context()
	dest_base = context:get_base(0)
	src_base = context:get_base(1)
	dest_pos = dest_base:get_position()
	if actor:on_base() then
		if actor:unload_cargo() and actor:load_cargo() then
			actor:leave_base()
			actor:send_to(dest_pos.x, dest_pos.y)
		end
	else
		actor_pos = actor:get_position()
		if actor_pos.x == dest_pos.x and actor_pos.y == dest_pos.y then
			actor:go_join_base(dest_base:get_id())
			context:clear_bases()
			context:add_base(src_base:get_id())
			context:add_base(dest_base:get_id())
		end
	end
	return 0
end


-- Атака формации --
function sl_attack_formation(actor)
	if sl_is_update_count_true(50) then
		context = actor:get_action_context()
		undergoer = context:get_formation(0)
		pos = undergoer:get_position()
		actor:send_to(pos.x, pos.y)
	end
end