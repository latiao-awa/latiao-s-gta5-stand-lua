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



menu.toggle_loop(menu.my_root(), "Ped Ignore", { "latiaopedIgnore" }, ("all ped Ignore you."), function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(players.user(), true)
end, function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(players.user(), false)
end)

menu.toggle_loop(menu.my_root(), "killaura all", { "latiaokillaura" }, ("SHOOT ALL"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then break end
        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 200, true,
            0xA914799, players.user_ped(), false, true, 1000)
    end
end)
menu.toggle_loop(menu.my_root(), "killaura all by EXPLOSION", { "latiaokillauraEXPLOSION" }, ("use EXPLOSION kill all"),
    function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 10000.0, false, true, 0.0)
        end
    end)

menu.toggle_loop(menu.my_root(), "killaura PED by EXPLOSION", { "latiaokillauraEXPLOSIONPed" },
    ("use EXPLOSION kill all Ped"), function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if IS_PLAYER_PED(ped) or ENTITY.IS_ENTITY_DEAD(ped) then break end
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 10000.0, false, true, 0.0)
        end

        -- end
    end)

menu.toggle_loop(menu.my_root(), "killaura all exclude VEHICLE", { "latiaokillauraexcludeVEHICLE" },
    ("killaura all exclude VEHICLE"), function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if ENTITY.IS_ENTITY_DEAD(ped) or PED.GET_VEHICLE_PED_IS_USING(ped) ~= 0 then break end


            local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            AddPos:add(v3.new(0, 0, 1))
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 1000,
                false,
                0xC472FE2, players.user_ped(), false, true, 1000)
        end
    end)

menu.toggle_loop(menu.my_root(), "killaura ped", { "latiaokillauraped" }, ("killauraped"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if IS_PLAYER_PED(ped) or ENTITY.IS_ENTITY_DEAD(ped) then break end

        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))

        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 200, true,
            0xA914799, players.user_ped(), false, true, 1000)
    end
end)

menu.toggle_loop(menu.my_root(), "killaura ped exclude VEHICLE", { "latiaokillaurapedexcludeVEHICLE" },
    ("killaurapedexcludeVEHICLE"), function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if IS_PLAYER_PED(ped) or ENTITY.IS_ENTITY_DEAD(ped) or PED.GET_VEHICLE_PED_IS_USING(ped) ~= 0 then break end


            local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            AddPos:add(v3.new(0, 0, 1))
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 1000,
                false,
                0xC472FE2, players.user_ped(), false, true, 1000)
        end
    end)

menu.toggle_loop(menu.my_root(), "tp Picked", { "LatiaoTpPicked" }, ("TpPicked for you"), function()
    local pos = players.get_position(players.user())
    for _, pickup in entities.get_all_pickups_as_handles() do
        ENTITY.SET_ENTITY_COORDS(pickup, pos, false, false, false, false)
    end
end)

menu.toggle_loop(menu.my_root(), "auto host", { "latiaoautohost" }, ("autohost"), function()
    if not (players.get_host() == PLAYER.PLAYER_ID()) then
        menu.trigger_commands("breakup" .. PLAYER.GET_PLAYER_NAME(players.get_host()))
    end
end)
menu.toggle_loop(menu.my_root(), "auto Script host", { "latiaoautoScripthost" }, ("autoScripthost"), function()
    if not (players.get_script_host() == PLAYER.PLAYER_ID()) then
        menu.trigger_commands("Scripthost")
    end
end)



menu.toggle_loop(menu.my_root(), "auto crash cheat you", { "latiaoautocrashcheatyou" }, ("autocrashcheatyou"), function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then break end
        if players.is_marked_as_attacker(pid) then
            local attack = PLAYER.GET_PLAYER_NAME(pid)
            util.toast(attack .. "attack you")
            util.toast(attack .. "attack you")
            menu.trigger_commands("crash" .. attack)
            menu.trigger_commands("choke" .. attack)
            menu.trigger_commands("flashcrash" .. attack)
            menu.trigger_commands("ngcrash" .. attack)
            menu.trigger_commands("footlettuce" .. attack)
            menu.trigger_commands("slaughter" .. attack)
            util.yield(1000)
            menu.trigger_commands("loveletterkick" .. attack)
        end
    end
end)

menu.action(menu.my_root(), "loveletterkickallmoder", { "latiaoloveletterkickallmoder" }, "loveletterkickallmoder.",
    function()
        for pid = 0, 32 do
            if players.is_marked_as_modder(pid) then
                local attack = PLAYER.GET_PLAYER_NAME(pid)
                if attack == PLAYER.PLAYER_ID() then break end
                util.toast(attack .. "kick ing")
            end
        end
    end)

menu.action(menu.my_root(), "super crash and kick all moder", { "latiaocrashkickmod" }, "crash and kickmod.", function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then break end
        if players.is_marked_as_modder(pid) then
            local attack = PLAYER.GET_PLAYER_NAME(pid)

            util.toast(attack .. "moder kick ing")
            menu.trigger_commands("crash" .. attack)
            menu.trigger_commands("choke" .. attack)
            menu.trigger_commands("flashcrash" .. attack)
            menu.trigger_commands("ngcrash" .. attack)
            menu.trigger_commands("footlettuce" .. attack)
            menu.trigger_commands("slaughter" .. attack)
            menu.trigger_commands("loveletterkick" .. attack)
        end
    end
end)

menu.action(menu.my_root(), "love letter kick all", { "latiaoloveletterkickall" }, "loveletter kick all.", function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then break end
        local player = PLAYER.GET_PLAYER_NAME(pid)
        util.toast(player .. "love kick")
        menu.trigger_commands("loveletterkick" .. player)
    end
end)
menu.action(menu.my_root(), "super crash all", { "latiaosuperall" }, "crash all (没素质).", function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then break end
        local player = PLAYER.GET_PLAYER_NAME(pid)

        util.toast(player .. "crash ing")
        menu.trigger_commands("crash" .. player)
        menu.trigger_commands("choke" .. player)
        menu.trigger_commands("flashcrash" .. player)
        menu.trigger_commands("ngcrash" .. player)
        menu.trigger_commands("footlettuce" .. player)
        menu.trigger_commands("slaughter" .. player)
        menu.trigger_commands("steamroll" .. player)
        util.toast("没素质")
    end
end)


menu.toggle_loop(menu.my_root(), "loop", { "latiaoloop" }, ("latiaoloop"), function()
    util.yield(1000)
    util.toast("hi")
end)

menu.action(menu.my_root(), "my id", { "latiaomyid" }, "latiaomyid.", function()
    me = PLAYER.PLAYER_ID()
    util.toast(me)
end)
