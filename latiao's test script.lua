menu.action(menu.my_root(), "restart lua", { "latiaorestartlua" }, "restartlua", function()
    util.restart_script()
end)
util.keep_running()
util.require_natives("1672190175-uno")



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



menu.toggle_loop(menu.my_root(), "Ignore", { "latiaopedIgnore" }, ("all ped Ignore you."), function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(players.user(), true)
end, function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(players.user(), false)
end)

menu.toggle_loop(menu.my_root(), "killaura all", { "latiaokillaura" }, ("killaura"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 200, true,
            0xA914799, players.user_ped(), false, true, 1000)
        ::out::
    end
end)
menu.toggle_loop(menu.my_root(), "killaura all by EXPLOSION", { "latiaokillaura" }, ("killaura"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 10000.0, false, true, 0.0)
    end
end)

menu.toggle_loop(menu.my_root(), "killaura PED by EXPLOSION", { "latiaokillaura" }, ("killaura"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if IS_PLAYER_PED(ped) or ENTITY.IS_ENTITY_DEAD(ped) then goto out end
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 10000.0, false, true, 0.0)
    end
    ::out::
    -- end
end)

menu.toggle_loop(menu.my_root(), "killaura all exclude VEHICLE", { "latiaokillaura" }, ("killaura"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) or PED.GET_VEHICLE_PED_IS_USING(ped) ~= 0 then goto out end


        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 1000, false,
            0xC472FE2, players.user_ped(), false, true, 1000)
        ::out::
    end
end)

menu.toggle_loop(menu.my_root(), "killaura all ped", { "latiaokillaura ped" }, ("killaura"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if IS_PLAYER_PED(ped) or ENTITY.IS_ENTITY_DEAD(ped) then goto out end

        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))

        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 200, true,
            0xA914799, players.user_ped(), false, true, 1000)
        ::out::
    end
end)

menu.toggle_loop(menu.my_root(), "killaura all ped exclude VEHICLE", { "latiaokillaura" }, ("killaura"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if IS_PLAYER_PED(ped) or ENTITY.IS_ENTITY_DEAD(ped) or PED.GET_VEHICLE_PED_IS_USING(ped) ~= 0 then goto out end


        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 1000, false,
            0xC472FE2, players.user_ped(), false, true, 1000)
        ::out::
    end
end)

menu.toggle_loop(menu.my_root(), "tp Picked", { "tppick" }, ("tppick"), function()
    local pos = players.get_position(players.user())
    for _, pickup in entities.get_all_pickups_as_handles() do
        ENTITY.SET_ENTITY_COORDS(pickup, pos, false, false, false, false)
    end
end)

menu.toggle_loop(menu.my_root(), "auto host", { "autohost" }, ("autohost"), function()
    if not (players.get_host() == PLAYER.PLAYER_ID()) then
        menu.trigger_commands("breakup" .. PLAYER.GET_PLAYER_NAME(players.get_host()))
    end
end)
menu.toggle_loop(menu.my_root(), "auto Script host", { "autoScripthost" }, ("autoScripthost"), function()
    if not (players.get_script_host() == PLAYER.PLAYER_ID()) then
        menu.trigger_commands("Scripthost")
    end
end)

menu.toggle_loop(menu.my_root(), "auto  kick cheat you", { "autokickcheatyou" }, ("autokickcheatyou"), function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then goto out end
        if players.is_marked_as_attacker(pid) then
            local attack = PLAYER.GET_PLAYER_NAME(pid)
            print(attack .. "attack you")
            menu.trigger_commands("loveletterkick" .. attack)
        end
        ::out::
    end
end)

menu.toggle_loop(menu.my_root(), "auto crash  cheat you", { "autokickcheatyou" }, ("autokickcheatyou"), function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then goto out end
        if players.is_marked_as_attacker(pid) then
            local attack = PLAYER.GET_PLAYER_NAME(pid)
            print(attack .. "attack you")
            menu.trigger_commands("crash" .. attack)
            menu.trigger_commands("choke" .. attack)
            menu.trigger_commands("flashcrash" .. attack)
            menu.trigger_commands("ngcrash" .. attack)
            menu.trigger_commands("footlettuce" .. attack)
            menu.trigger_commands("slaughter" .. attack)
        end
        ::out::
    end
end)

menu.action(menu.my_root(), "loveletterkickallmoder", { "loveletterkickallmoder" }, "loveletterkickallmoder.", function()
    for pid = 0, 32 do
        
        if players.is_marked_as_modder(pid) then
            local attack = PLAYER.GET_PLAYER_NAME(pid)
            if attack == PLAYER.PLAYER_ID() then goto out end
            print(attack .. "moder kick ing")
            menu.trigger_commands("loveletterkick" .. attack)
             
        end
        ::out::
    end
end)

menu.action(menu.my_root(), "super crash kick all moder", { "latiaocrashmod" }, "latiaocrashmod.", function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then goto out end
        if players.is_marked_as_modder(pid) then
            
            local attack = PLAYER.GET_PLAYER_NAME(pid)
            
            print(attack .. "moder kick ing")
            menu.trigger_commands("crash" .. attack)
            menu.trigger_commands("choke" .. attack)
            menu.trigger_commands("flashcrash" .. attack)
            menu.trigger_commands("ngcrash" .. attack)
            menu.trigger_commands("footlettuce" .. attack)
            menu.trigger_commands("slaughter" .. attack)
            menu.trigger_commands("loveletterkick" .. attack)
           
        end
        ::out::
    end
end)

menu.action(menu.my_root(), "latiaoloveletterkickall", { "latiaoloveletterkickall" }, "latiaoloveletterkickall.", function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)
        print(player .. "love kick")
        menu.trigger_commands("loveletterkick" .. player)
        ::out::
    end
end)
menu.action(menu.my_root(), "super crash all", { "latiaosuperall" }, "latiaosuperall.", function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)
        
        print(player .. "crash ing")
        menu.trigger_commands("crash" .. player)
        menu.trigger_commands("choke" .. player)
        menu.trigger_commands("flashcrash" .. player)
        menu.trigger_commands("ngcrash" .. player)
        menu.trigger_commands("footlettuce" .. player)
        menu.trigger_commands("slaughter" .. player)
        menu.trigger_commands("steamroll" .. player)
        print("没素质")
        ::out::
    end
end)

menu.action(menu.my_root(), "my id", { "latiaomyid" }, "latiaomyid.", function()
    me = PLAYER.PLAYER_ID()
    print(me)
end)