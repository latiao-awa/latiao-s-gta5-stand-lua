menu.action(menu.my_root(), "restart lua", { "latiaorestartlua" }, "restartlua", function()
    util.restart_script()
end)
util.keep_running()
util.require_natives("1672190175")



function IS_PLAYER_PED(ped)
    if PED.GET_PED_TYPE(ped) < 4 then
        return true
    else
        return false
    end
end

local function deleteEntities(getHandlesFn)
    for k, ent in pairs(getHandlesFn()) do
        entities.delete_by_handle(ent)
    end
end

menu.action(menu.my_root(), "delallobjects", { "latiaodelallobjects" }, "delallobjects.", function()
    deleteEntities(entities.get_all_objects_as_handles)
end)

menu.action(menu.my_root(), "delallpeds", { "latiaodelallpeds" }, "delallpeds.", function()
    deleteEntities(entities.get_all_peds_as_handles)
end)

menu.action(menu.my_root(), "delallvehicles", { "latiaodelallvehicles" }, "delallvehicles.", function()
    deleteEntities(entities.get_all_vehicles_as_handles)
end)

menu.action(menu.my_root(), "delall", { "latiaodelall" }, "delall.", function()
    deleteEntities(entities.get_all_objects_as_handles)
    deleteEntities(entities.get_all_peds_as_handles)
    deleteEntities(entities.get_all_vehicles_as_handles)
end)



menu.toggle_loop(menu.my_root(), "Ignore", {"latiaopedIgnore"},("all ped Ignore you."), function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(players.user(), true)
end, function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(players.user(), false)
end)

menu.toggle_loop(menu.my_root(), "killaura all", {"latiaokillaura"},("killaura"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if NTITY.IS_ENTITY_DEAD(ped) then goto out end
        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 200, true, 0xA914799, players.user_ped(), false, true, 1000)
        ::out::
    end
end)

menu.toggle_loop(menu.my_root(), "killaura all exclude VEHICLE", {"latiaokillaura"},("killaura"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then goto out end


        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))
        if PED.GET_VEHICLE_PED_IS_USING(ped) ~= 0 then goto out end
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 1000, false, 0xC472FE2, players.user_ped(), false, true, 1000)
        ::out::
    end
end)

menu.toggle_loop(menu.my_root(), "killaura all ped", {"latiaokillaura ped"},("killaura"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if IS_PLAYER_PED(ped) or ENTITY.IS_ENTITY_DEAD(ped) then goto out end

        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))

        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 200, true, 0xA914799, players.user_ped(), false, true, 1000)
        ::out::
    end
end)