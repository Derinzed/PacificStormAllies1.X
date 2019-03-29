------------------------------------------------------------------------------
-- Copyright (c) Lesta Studio, 2006 Version 1.0
------------------------------------------------------------------------------
--[[
Внимание!!! В редактора игры, просмотр роликов работает не корректно!!!!
Может не корректно работать с игровой паузой... Перед использованием рекомендую в ручную снять паузу!!!
Если вы в планировщике и без юнитов, то дождитесь появления окна о победе или поражении...
Не корректная работа пост эффекта OldFilm при повторных просмотрах ролика, эффект не удаляется по окончанию ролика...
Не совместим со старыми миссиями (см. mission1-9) Полностью совместим с новыми миссиями

Сохраненная таблица кидается в каталог _GAME_
Загружаемая таблица всегда с именем cam_path и в исходном формате, из файла cam_path в каталоге _GAME_

Задачи для Version 1.1:
Проиграть ролик с конкретной точки
Выводить через какую точку камера пролетела (сделать опционально)
Изменение последовательности точек в таблице
Вращение камеры вокруг объекта, точки (просчет обкрутки камеры)
Все тексты в редакторе перевести в таблицу текстов
Возможность задать имя для таблицы при сохранении
]]
mis_log_message ("Execuite Movie_Editor_Script")

--[[///////////////////////////////////////////////////////////////////////////////////////////////////////////
Глобальные объявления
///////////////////////////////////////////////////////////////////////////////////////////////////////////]]

points = {}
current_point = {}
PointEditorVisible = false
EditPointFieldsVisible = false
AllMarkersVisible = false
indicators = {}
cam_path = {}

--[[///////////////////////////////////////////////////////////////////////////////////////////////////////////
Функции
///////////////////////////////////////////////////////////////////////////////////////////////////////////]]
----------------------------------------------------------------------------------------------------------------------------------------
function ShowEditor()
	mis_log_message("ShowEditor_start")	
	tl_add_message ("Please OFF Game Pause!!! before work with movie editor", -1)
	--Что бы окно было не модальным ставим false
	show_overlay ("TL/Movie_Editor", false)
	UpdateListBox()
	mis_log_message("ShowEditor_end")
end --ShowEditor() -- С вызова этой функции начинается работа с редактором...
----------------------------------------------------------------------------------------------------------------------------------------
function ClearListBox()
	mis_log_message("ClearListBox_start")	
	points = {}
	UpdateListBox()
	UpdatePointEditorLbx()
	mis_log_message("ClearListBox_end")
end --ClearListBox()
----------------------------------------------------------------------------------------------------------------------------------------
function AddListBoxItem()
	mis_log_message("AddListBoxItem_start")
	local cnt = table.getn(points)
	local name_p = "Point_"..cnt
	table.insert(points, {name=name_p,pos=tl_get_camera_pos(nil),dir=tl_get_camera_dir(),time=100})
	UpdateListBox()
	mis_log_message("AddListBoxItem_end")
end --AddListBoxItem()
----------------------------------------------------------------------------------------------------------------------------------------
function RemoveSelectedItem()
	mis_log_message("RemoveSelectItem_start")
	local obj_name = get_listbox ("TL/Movie_Editor/Panel_1/ListBox_1"):get_selected_caption ()
	mis_log_message("OBJ_NAME "..obj_name)
	local cnt = table.getn(points)
	for i=0, cnt do
		if (points[i].name == obj_name) then
			mis_log_message("TARGET_REACHED!!!! ".."POINT= "..tostring(points[i].name).." OBJ_NAME= "..obj_name)
			table.remove(points, i)
		end
	end
	UpdateListBox()
	UpdatePointEditorLbx()
	mis_log_message("RemoveSelectItem_end")
end --RemoveSelectedItem()
----------------------------------------------------------------------------------------------------------------------------------------
function UpdateListBox()
	mis_log_message("UpdateListBox_start")
	local lbx = get_listbox ("TL/Movie_Editor/Panel_1/ListBox_1")
	lbx:clear()
	for i, pt in ipairs(points) do
		lbx:add_item(pt.name)
	end
	mis_log_message("UpdateListBox_end")
end --function UpdateListBox()
----------------------------------------------------------------------------------------------------------------------------------------
function PointEditorShow()
	mis_log_message("PointEditorShow_start")
	local cnt = table.getn(points)
	if (cnt>0) then
		if (not PointEditorVisible and not EditPointFieldsVisible) then
			PointEditorVisible = true
			show_overlay ("TL/Movie_Editor/PointEditor", false)
			HidePos_and_Dir()
			UpdatePointEditorLbx()
		else
			PointEditorVisible = false
			hide_overlay ("TL/Movie_Editor/PointEditor", false)
		end
	else
		tl_add_message ("PLEASE ADD POINT FOR VIEW", -1)
		hide_overlay ("TL/Movie_Editor/PointEditor", false)
		PointEditorVisible = false
	end
	mis_log_message("PointEditorShow_end")
end --function PointEditorShow()
----------------------------------------------------------------------------------------------------------------------------------------
function ClickOnPointListBox()
	mis_log_message("ClickOnPointListBox_start")
	local cnt = table.getn(points)
	local obj_name = nil
	obj_name = get_listbox ("TL/Movie_Editor/Panel_1/ListBox_1"):get_selected_caption ()
	if (obj_name~=nil) then
		local cnt = table.getn(points)
		if (cnt>0) then
			for i=1, cnt do
				if (points[i].name == obj_name) then
					if (not PointEditorVisible) then
						HidePos_and_Dir()
						PointEditorVisible = true
						show_overlay ("TL/Movie_Editor/PointEditor", false)
						UpdatePointEditorLbx()
					else
						HidePos_and_Dir()
						UpdatePointEditorLbx()
					end
				end
			end
		end
	end
	mis_log_message("ClickOnPointListBox_end")
end --ClickOnPointListBox()
----------------------------------------------------------------------------------------------------------------------------------------
function UpdatePointEditorLbx()
	mis_log_message("UpdatePointEditorLbx_start")
	local LbxPointEditor = get_listbox ("TL/Movie_Editor/PointEditor/Panel_1/ListBox_PointEditor")
	LbxPointEditor:clear()
	local obj_name = nil
	obj_name = get_listbox ("TL/Movie_Editor/Panel_1/ListBox_1"):get_selected_caption ()
	if (obj_name~=nil) then
		local cnt = table.getn(points)
		if (cnt>0) then
			for i=1, cnt do
				if (points[i].name == obj_name) then
					LbxPointEditor:add_item("NAME:")
					LbxPointEditor:add_item(points[i].name)
					LbxPointEditor:add_item("TIME:")
					LbxPointEditor:add_item(points[i].time)
					LbxPointEditor:add_item("Direction(XYZ):")
					LbxPointEditor:add_item(points[i].dir.x)
					LbxPointEditor:add_item(points[i].dir.y)
					LbxPointEditor:add_item(points[i].dir.z)
					LbxPointEditor:add_item("Position(XYZ):")
					LbxPointEditor:add_item(points[i].pos.x)
					LbxPointEditor:add_item(points[i].pos.y)
					LbxPointEditor:add_item(points[i].pos.z)
				end
			end
		else
			PointEditorShow()
		end
	end
	mis_log_message("UpdatePointEditorLbx_end")
end --UpdatePointEditorLbx()
----------------------------------------------------------------------------------------------------------------------------------------
function camPreview()
	mis_log_message("camPreview_start")
	if (not EditPointFieldsVisible) then
		local cnt = table.getn(points)
		if (cnt>0) then
			--Прячем все ГУИ пока ролик, что бы юзеры не жали куда не надо...
			hide_overlay ("TL/Movie_Editor", false)
			hide_overlay ("TL/Movie_Editor/PointEditor", false)
			PointEditorVisible = false
			hide_overlay ("TL/Movie_Editor/ShowPos&Dir", false)
			add_timer("camPreviewStart()",1,false)
			show_timer("camPreviewStart()",game_timer_pos_x,game_timer_pos_y)
		else
			tl_add_message ("PLEASE ADD POINT FOR PLAY MOVIE", -1)
		end
	else
		tl_add_message ("Please close EditPointFields window before play movie", -1)
	end
	mis_log_message("camPreview_end")
end --camPreview()
----------------------------------------------------------------------------------------------------------------------------------------
function camPreviewStart()
	mis_log_message("camPreviewStart_start")
	tl_set_paused (true, true)
	tl_disable_interface(true)
	tl_camera_cpp_clear()
	for i=1, table.getn(points) do
		tl_camera_cpp_add(points[i].pos,points[i].dir,points[i].time)
	end
	tl_camera_cpp_set_func("camPreviewEnd()")
	mis_log_message("camPreviewStart_end")
end --camPreviewStart()
----------------------------------------------------------------------------------------------------------------------------------------
function camPreviewEnd()
	mis_log_message("camPreviewEnd_start")
	tl_set_paused(false, false)
	tl_disable_interface(false)
	--Вернем весь ГУЙ который спрятали...(Весь возвращать не стоит.. хватит главного окна...)
	show_overlay ("TL/Movie_Editor", false)
	mis_log_message("camPreviewEnd_end")
end --camPreviewEnd()
----------------------------------------------------------------------------------------------------------------------------------------
function MoveCameraTo()
	mis_log_message("MoveCameraTo_start")
	local obj_name = nil
	obj_name = get_listbox ("TL/Movie_Editor/Panel_1/ListBox_1"):get_selected_caption ()
	if (obj_name~=nil) then
		local cnt = table.getn(points)
		if (cnt>0) then
			for i=1, cnt do
				if (points[i].name == obj_name) then
					tl_move_camera_to(points[i].pos)
					tl_set_camera_dir(points[i].dir)
					tl_add_message ("Camera move to: Point name: "..points[i].name, -1)
				end
			end
		else
			tl_add_message ("Please select point for camera move", -1)
		end
	end
	mis_log_message("MoveCameraTo_end")
end --MoveCameraTo()
----------------------------------------------------------------------------------------------------------------------------------------
function ShowPos_and_Dir()
	mis_log_message("ShowPos_and_Dir_start")
	if (not EditPointFieldsVisible) then
		show_overlay ("TL/Movie_Editor/ShowPos&Dir", false)
		hide_overlay ("TL/Movie_Editor/PointEditor", false)
		PointEditorVisible = false
		local LbxPos_and_Dir = get_listbox ("TL/Movie_Editor/ShowPos&Dir/Panel_1/ListBox_Pos&Dir")
		LbxPos_and_Dir:clear()
		current_point = {}
		local cur_pos=tl_get_camera_pos(nil)
		local cur_dir=tl_get_camera_dir()
		
		table.insert(current_point, {pos=cur_pos,dir=cur_dir})
		
		LbxPos_and_Dir:add_item("Direction(XYZ):")
		LbxPos_and_Dir:add_item(current_point[1].dir.x)
		LbxPos_and_Dir:add_item(current_point[1].dir.y)
		LbxPos_and_Dir:add_item(current_point[1].dir.z)
		LbxPos_and_Dir:add_item("Position(XYZ):")
		LbxPos_and_Dir:add_item(current_point[1].pos.x)
		LbxPos_and_Dir:add_item(current_point[1].pos.y)
		LbxPos_and_Dir:add_item(current_point[1].pos.z)
	end
	
	mis_log_message("ShowPos_and_Dir_end")
end --ShowPos_and_Dir()
----------------------------------------------------------------------------------------------------------------------------------------
function HidePos_and_Dir()
	mis_log_message("HidePos_and_Dir_start")
	local LbxPos_and_Dir = get_listbox ("TL/Movie_Editor/ShowPos&Dir/Panel_1/ListBox_Pos&Dir")
	LbxPos_and_Dir:clear()
	hide_overlay ("TL/Movie_Editor/ShowPos&Dir", false)
	mis_log_message("HidePos_and_Dir_end")
end --HidePos_and_Dir()
----------------------------------------------------------------------------------------------------------------------------------------
function AddCurrentPoint()
	mis_log_message("AddCurrentPoint_start")
	local cnt = table.getn(points)
	local name_p = "Point_"..cnt
	table.insert(points, {name=name_p,pos=current_point[1].pos,dir=current_point[1].dir,time=100})
	UpdateListBox()
	mis_log_message("AddCurrentPoint_end")
end --AddCurrentPoint()
----------------------------------------------------------------------------------------------------------------------------------------
function ShowEditPointFields()
	mis_log_message("ShowEditPointFields_start")
	ClearEditPointFields()
	local cnt = table.getn(points)
	if (cnt>0) then
		show_overlay ("TL/Movie_Editor/EditPointFields", true)
		EditPointFieldsVisible = true
		hide_overlay ("TL/Movie_Editor/PointEditor", false)
		PointEditorVisible = false
		
		local cnt = table.getn(points)
		local obj_name = nil
		obj_name = get_listbox ("TL/Movie_Editor/Panel_1/ListBox_1"):get_selected_caption ()
		if (obj_name~=nil) then
			local cnt = table.getn(points)
			if (cnt>0) then
				for i=1, cnt do
					if (points[i].name == obj_name) then
						ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxName"):set_caption(points[i].name)
						ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxTime"):set_caption(points[i].time)
						ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxPosX"):set_caption(points[i].pos.x)
						ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxPosY"):set_caption(points[i].pos.y)
						ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxPosZ"):set_caption(points[i].pos.z)
						ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxDirX"):set_caption(points[i].dir.x)
						ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxDirY"):set_caption(points[i].dir.y)
						ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxDirZ"):set_caption(points[i].dir.z)
					end
				end
			end
		end
		
	else
		tl_add_message ("Please select point for edit", -1)
	end
	mis_log_message("ShowEditPointFields_end")
end --ShowEditPointFields()
----------------------------------------------------------------------------------------------------------------------------------------
function HideEditPointFields()
	mis_log_message("HideEditPointFields_start")
	hide_overlay ("TL/Movie_Editor/EditPointFields", true)
	EditPointFieldsVisible = false
	ClearEditPointFields()
	mis_log_message("HideEditPointFields_end")
end --HideEditPointFields()
----------------------------------------------------------------------------------------------------------------------------------------
function ClearEditPointFields()
	mis_log_message("ClearEditPointFields_start")
	ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxName"):set_caption("")
	ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxTime"):set_caption("")
	ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxPosX"):set_caption("")
	ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxPosY"):set_caption("")
	ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxPosZ"):set_caption("")
	ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxDirX"):set_caption("")
	ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxDirY"):set_caption("")
	ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxDirZ"):set_caption("")
	mis_log_message("ClearEditPointFields_end")
end --ClearEditPointFields()
----------------------------------------------------------------------------------------------------------------------------------------
function ApplyChangesPoint()
	mis_log_message("ApplyChangesPoint_start")
	local cnt = table.getn(points)
	local obj_name = nil
	obj_name = get_listbox ("TL/Movie_Editor/Panel_1/ListBox_1"):get_selected_caption ()
	if (obj_name~=nil) then
		local cnt = table.getn(points)
		if (cnt>0) then
			for i=1, cnt do
				if (points[i].name == obj_name) then
					points[i].name = tostring(ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxName"):get_caption())
					points[i].time = tonumber(ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxTime"):get_caption())
					points[i].pos.x = tonumber(ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxPosX"):get_caption())
					points[i].pos.y = tonumber(ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxPosY"):get_caption())
					points[i].pos.z = tonumber(ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxPosZ"):get_caption())
					points[i].dir.x = tonumber(ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxDirX"):get_caption())
					points[i].dir.y = tonumber(ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxDirY"):get_caption())
					points[i].dir.z = tonumber(ge_get("TL/Movie_Editor/EditPointFields/Panel_1/TextBoxDirZ"):get_caption())
				end
			end
		end
	end
	UpdateListBox()
	HideEditPointFields()
	mis_log_message("ApplyChangesPoint_end")
end --ApplyChangesPoint()
----------------------------------------------------------------------------------------------------------------------------------------
function OnClickAllMarkers()
	mis_log_message("OnClickAllMarkers_start")
	local function SetAllMarkers()
		mis_log_message("SetAllMarkers_start")
		AllMarkersVisible = true
		indicators = {}
		local cnt = table.getn(points)
		for i = 1, cnt do
			table.insert(indicators, "ind"..tostring(i))
		end
		for i, pt in ipairs(points) do
			indicators[i]=tl_set_indicator({pos = {x=pt.pos.x; y=pt.pos.y; z=pt.pos.z}})
			tl_set_indicator_text(indicators[i].indname, pt.name)
		end
		mis_log_message("SetAllMarkers_end")
	end --SetAllMarkers()
	
	if (not AllMarkersVisible) then
		local cnt = table.getn(points)
		if (cnt>0) then
			SetAllMarkers()
		end
	else
		local cnt = table.getn(indicators)
		if (cnt>0) then
			KillAllMarkers()
		end
	end
	mis_log_message("OnClickAllMarkers_end")
end --OnClickAllMarkers()
----------------------------------------------------------------------------------------------------------------------------------------
function KillAllMarkers()
	mis_log_message("KillAllMarkers_start")
	AllMarkersVisible = false
	for i, ind in ipairs(indicators) do
		ind["enable"] = false
		tl_set_indicator (ind)
	end
	indicators = {}
	mis_log_message("KillAllMarkers_end")
end --KillAllMarkers()
----------------------------------------------------------------------------------------------------------------------------------------
function OnClickSelectMarker()
	mis_log_message("OnClickSelectMarker_start")
	
	local function SetSelectMarker()
		mis_log_message("SetSelectMarker_start")
		AllMarkersVisible = true
		indicators = {}
		local obj_name = nil
		obj_name = get_listbox ("TL/Movie_Editor/Panel_1/ListBox_1"):get_selected_caption ()
		table.insert(indicators, "ind"..tostring(i))
		
		local cnt = table.getn(points)
		if (cnt>0) then
			for i=1, cnt do
				if (points[i].name == obj_name) then
					indicators[1]=tl_set_indicator({pos = {x=points[i].pos.x; y=points[i].pos.y; z=points[i].pos.z}})
					tl_set_indicator_text(indicators[1].indname, points[i].name)
				end
			end
		end
		mis_log_message("SetSelectMarker_end")
	end
	
	if (not AllMarkersVisible) then
		local cnt = table.getn(points)
		if (cnt>0) then
			SetSelectMarker()
		end
	else
		local cnt = table.getn(indicators)
		if (cnt>0) then
			KillAllMarkers()
		end
	end
	
	mis_log_message("OnClickSelectMarker_end")
end --OnClickSelectMarker()
----------------------------------------------------------------------------------------------------------------------------------------
function OnClickSave()
	mis_log_message("OnClickSave_start")
	if (table.getn(points)>0) then
		path = "../campath.txt"
		local pathfile = io.open(path,"w")
		pathfile:write("cam_path = {\n")
		for i, pt in ipairs(points) do
			pathfile:write("{time="..pt.time..",pos={x="..pt.pos.x..",y="..pt.pos.y..",z="..pt.pos.z.."},dir={x="..pt.dir.x..",y="..pt.dir.y..",z="..pt.dir.z.."}},\n")
		end
		pathfile:write("}\n")
		pathfile:close()
	else
		tl_add_message ("Please add points for save", -1)
	end
	mis_log_message("OnClickSave_end")
end --OnClickSave()
----------------------------------------------------------------------------------------------------------------------------------------
function OnClickLoad()
	mis_log_message("OnClickLoad_start")
	path = "../campath.txt"
	cam_path = {}
	points = {}
	dofile(path) --Перезаписываем временную таблицу cam_path
	
	for i, pt in ipairs(cam_path) do
		local name_p = "Point_"..i
		table.insert(points, {name=name_p,pos={x=pt.pos.x,y=pt.pos.y,z=pt.pos.z},dir={x=pt.dir.x,y=pt.dir.y,z=pt.dir.z},time=pt.time})
	end
	UpdateListBox()
	cam_path = {}
	mis_log_message("OnClickLoad_end")
end --OnClickLoad()
----------------------------------------------------------------------------------------------------------------------------------------
--[[///////////////////////////////////////////////////////////////////////////////////////////////////////////
Обработка событий
///////////////////////////////////////////////////////////////////////////////////////////////////////////]]

set_on_mouse_clicked ("TL/Movie_Editor/Panel_1/Button_2", "ClearListBox")
set_on_mouse_clicked ("TL/Movie_Editor/Panel_1/Button_1", "AddListBoxItem")
set_on_mouse_clicked ("TL/Movie_Editor/Panel_1/Button_3", "RemoveSelectedItem")
set_on_mouse_clicked ("TL/Movie_Editor/Panel_1/Button_4", "PointEditorShow")
set_on_mouse_clicked ("TL/Movie_Editor/Panel_1/ListBox_1", "ClickOnPointListBox")
set_on_mouse_clicked ("TL/Movie_Editor/Panel_1/Button_5", "camPreview")
set_on_mouse_clicked ("TL/Movie_Editor/PointEditor/Panel_1/Button_1", "MoveCameraTo")
set_on_mouse_clicked ("TL/Movie_Editor/Panel_1/Button_6", "ShowPos_and_Dir")
set_on_mouse_clicked ("TL/Movie_Editor/ShowPos&Dir/Panel_1/Button_1", "HidePos_and_Dir")
set_on_mouse_clicked ("TL/Movie_Editor/ShowPos&Dir/Panel_1/Button_2", "AddCurrentPoint")
set_on_mouse_clicked ("TL/Movie_Editor/PointEditor/Panel_1/Button_2", "ShowEditPointFields")
set_on_mouse_clicked ("TL/Movie_Editor/EditPointFields/Panel_1/Button_1", "ApplyChangesPoint")
set_on_mouse_clicked ("TL/Movie_Editor/EditPointFields/Panel_1/Button_2", "HideEditPointFields")
set_on_mouse_clicked ("TL/Movie_Editor/Panel_1/Button_7", "OnClickAllMarkers")
set_on_mouse_clicked ("TL/Movie_Editor/Panel_1/Button_8", "OnClickSelectMarker")
set_on_mouse_clicked ("TL/Movie_Editor/Panel_1/Button_9", "OnClickSave")
set_on_mouse_clicked ("TL/Movie_Editor/Panel_1/Button_10", "OnClickLoad")

mis_log_message ("Leaving Movie_Editor_Script")