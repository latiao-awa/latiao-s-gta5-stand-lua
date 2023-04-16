menu.action(menu.my_root(), "restart lua", { "latiaorestartlua" }, "restartlua", function()
    util.restart_script()
end)
util.keep_running()
-- util.require_natives("1672190175-uno")
util.require_natives("1681379138")


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

menu.action(menu.my_root(), "delallpickups", { "latiaodelallvehicles" }, "delallvehicles.", function()
    deleteEntities(entities.get_all_pickups_as_handles)
end)

menu.action(menu.my_root(), "delall", { "latiaodelall" }, "delall.", function()
    deleteEntities(entities.get_all_objects_as_handles)
    deleteEntities(entities.get_all_peds_as_handles)
    deleteEntities(entities.get_all_vehicles_as_handles)
    deleteEntities(entities.get_all_pickups_as_handles)
end)



menu.toggle_loop(menu.my_root(), "tppedtome", { "latiaotppedtome" }, "latiaotppedtome.", function()
    local pos = players.get_position(players.user())
    for _, ped in entities.get_all_peds_as_handles() do
        if IS_PLAYER_PED(ped) then goto out end
        ENTITY.SET_ENTITY_COORDS(ped, pos.x, pos.y, pos.z, false)
        ::out::
    end
end)

menu.toggle_loop(menu.my_root(), "silencekillallped", { "latiaosilencekillallped" }, "latiaotsilencekillallped.",
function()
    local pos = players.get_position(players.user())
    for _, ped in entities.get_all_peds_as_handles() do
        if IS_PLAYER_PED(ped) then goto out end
        ENTITY.SET_ENTITY_COORDS(ped, pos.x, pos.y, 1000, false)
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, 1000, 0, 1000, false, true, 0.0)
        ::out::
    end
end)

menu.toggle_loop(menu.my_root(), "tppedto 00", { "latiaotppedto00" }, "latiaotpped00.", function()
    for _, ped in entities.get_all_peds_as_handles() do
        if IS_PLAYER_PED(ped) then goto out end
        ENTITY.SET_ENTITY_COORDS(ped, 0, 0, -200, false)
        ::out::
    end
end)

local function tpall(getHandlesFn)
    for k, ent in pairs(getHandlesFn()) do
        ENTITY.SET_ENTITY_COORDS(ent, 0, 0, 0, false)
    end
end

menu.toggle_loop(menu.my_root(), "tpall 00", { "latiaotpallto00" }, "latiaotpall00.", function()
    tpall(entities.get_all_objects_as_handles)
    tpall(entities.get_all_peds_as_handles)
    tpall(entities.get_all_vehicles_as_handles)
    tpall(entities.get_all_pickups_as_handles)
end)

local function tp(getHandlesFn)
    local pos = players.get_position(players.user())
    pos:add(v3.new(0, 0, 100))
    -- if IS_PLAYER_PED(entities.get_all_peds_as_handles()) then goto out end
    for k, ent in pairs(getHandlesFn()) do
        ENTITY.SET_ENTITY_COORDS(ent, pos.x, pos.y, pos.z, false)
    end
end

menu.toggle_loop(menu.my_root(), "tpall to me", { "latiaotpalltome" }, "latiaotpalltome.", function()
    tp(entities.get_all_objects_as_handles)
    -- tp(entities.get_all_peds_as_handles)
    tp(entities.get_all_vehicles_as_handles)
    tp(entities.get_all_pickups_as_handles)
end)

menu.toggle_loop(menu.my_root(), "Ped Ignore", { "latiaopedIgnore" }, ("all ped Ignore you."), function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(players.user(), true)
end, function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(players.user(), false)
end)

menu.toggle_loop(menu.my_root(), "killaura all", { "latiaokillaura" }, ("SHOOT ALL"), function()
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
menu.toggle_loop(menu.my_root(), "killaura all by EXPLOSION", { "latiaokillauraEXPLOSION" }, ("use EXPLOSION kill all"),
    function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 10000.0, false, true, 0.0)
        end
    end)

    menu.toggle_loop(menu.my_root(), "killaura all entities by EXPLOSION", { "latiaokillauraEXPLOSION" }, ("use EXPLOSION kill all"),
    function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 10000.0, false, true, 0.0)
        end
    end)

menu.toggle_loop(menu.my_root(), "killaura PED by EXPLOSION", { "latiaokillauraEXPLOSIONPed" },
    ("use EXPLOSION kill all Ped"), function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if IS_PLAYER_PED(ped) or ENTITY.IS_ENTITY_DEAD(ped) then goto out end
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 10000.0, false, true, 0.0)
            ::out::
        end
    end)

menu.toggle_loop(menu.my_root(), "killaura all exclude VEHICLE", { "latiaokillauraexcludeVEHICLE" },
    ("killaura all exclude VEHICLE"), function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if ENTITY.IS_ENTITY_DEAD(ped) or PED.GET_VEHICLE_PED_IS_USING(ped) ~= 0 then goto out end


            local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            AddPos:add(v3.new(0, 0, 1))
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 1000,
                false,
                0xC472FE2, players.user_ped(), false, true, 1000)
            ::out::
        end
    end)

menu.toggle_loop(menu.my_root(), "killaura ped", { "latiaokillauraped" }, ("killauraped"), function()
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

menu.toggle_loop(menu.my_root(), "killaura ped exclude VEHICLE", { "latiaokillaurapedexcludeVEHICLE" },
    ("killaurapedexcludeVEHICLE"), function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if IS_PLAYER_PED(ped) or ENTITY.IS_ENTITY_DEAD(ped) or PED.GET_VEHICLE_PED_IS_USING(ped) ~= 0 then goto out end


            local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            AddPos:add(v3.new(0, 0, 1))
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 1000,
                false,
                0xC472FE2, players.user_ped(), false, true, 1000)
            ::out::
        end
    end)

menu.toggle_loop(menu.my_root(), "tp Picked", { "LatiaoTpPicked" }, ("TpPicked for you"), function()
    local pos = players.get_position(players.user())
    for _, pickup in entities.get_all_pickups_as_handles() do
        ENTITY.SET_ENTITY_COORDS(pickup, pos.x, pos.y, pos.z, false)
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
        if pid == PLAYER.PLAYER_ID() then goto out end
        if players.is_marked_as_attacker(pid) then
            local attack = PLAYER.GET_PLAYER_NAME(pid)
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
        ::out::
    end
end)



menu.toggle_loop(menu.my_root(), "super crash and kick all moder", { "latiaocrashkickmod" }, "crash and kickmod.",
    function()
        for pid = 0, 32 do
            if players.is_marked_as_modder(pid) then
                local attack = PLAYER.GET_PLAYER_NAME(pid)
                if pid == PLAYER.PLAYER_ID() then goto out end
                util.toast(attack .. "moder kick ing")
                menu.trigger_commands("crash" .. attack)
                menu.trigger_commands("choke" .. attack)
                menu.trigger_commands("flashcrash" .. attack)
                menu.trigger_commands("ngcrash" .. attack)
                menu.trigger_commands("footlettuce" .. attack)
                menu.trigger_commands("slaughter" .. attack)
                menu.trigger_commands("ban" .. attack)
            end
            ::out::
        end
    end)

menu.toggle_loop(menu.my_root(), "loveletterkickallmoder", { "latiaoloveletterkickallmoder" }, "loveletterkickallmoder.",
    function()
        for pid = 0, 32 do
            if pid == PLAYER.PLAYER_ID() then goto out end
            if players.is_marked_as_modder(pid) then
                local attack = PLAYER.GET_PLAYER_NAME(pid)
                util.toast(attack .. "kick ing")
                menu.trigger_commands("loveletterkick" .. attack)
            end
            ::out::
        end
    end)

menu.toggle_loop(menu.my_root(), "hostkickallmoder", { "latiaohostkickallmoder" }, "latiaohostkickallmoder.",
    function()
        for pid = 0, 32 do
            if pid == PLAYER.PLAYER_ID() then goto out end
            if players.is_marked_as_modder(pid) then
                NETWORK.NETWORK_SESSION_KICK_PLAYER(pid)
                local attack = PLAYER.GET_PLAYER_NAME(pid)
                util.toast(attack .. "kick ing")
            end
            ::out::
        end
    end)

menu.toggle_loop(menu.my_root(), "ban all moder", { "latiaobanmoder" }, "ban moder.", function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then goto out end
        if players.is_marked_as_modder(pid) then
            local attack = PLAYER.GET_PLAYER_NAME(pid)
            menu.trigger_commands("ban" .. attack)
            util.toast(attack .. "moder kick ing")
        end
        ::out::
    end
end)

menu.action(menu.my_root(), "love letter kick all", { "latiaoloveletterkickall" }, "loveletter kick all.", function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)

        util.toast(player .. "love kick")
        menu.trigger_commands("loveletterkick" .. player)
        ::out::
    end
end)
menu.action(menu.my_root(), "super crash all", { "latiaosuperall" }, "crash all.", function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)

        util.toast(player .. "crash ing")
        menu.trigger_commands("crash" .. player)
        menu.trigger_commands("choke" .. player)
        menu.trigger_commands("flashcrash" .. player)
        menu.trigger_commands("ngcrash" .. player)
        menu.trigger_commands("footlettuce" .. player)
        menu.trigger_commands("slaughter" .. player)
        menu.trigger_commands("steamroll" .. player)
        ::out::
    end
end)

menu.action(menu.my_root(), "kickall no host", { "latiaokickallnhost" }, "latiaokickallnhost", function()
    for pid = 0, 32 do
        if pid == players.get_host() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)
        util.toast(player .. "kicking")
        menu.trigger_commands("nonhostkick" .. player)
        ::out::
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
menu.action(menu.my_root(), "hostkickall", { "latiaohostkickall" }, "latiaohostkickall.", function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then goto out end
        NETWORK.NETWORK_SESSION_KICK_PLAYER(pid)
        ::out::
    end
end)


menu.action(menu.my_root(), "timeoutall", { "latiaotimeout" }, "latiaotimeout.", function()
    for pid = 0, 32 do
        if pid == PLAYER.PLAYER_ID() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)
        menu.trigger_commands("timeout" .. player)
        ::out::
    end
end)

menu.action(menu.my_root(), "kick me", { "latiaokickme" }, "latiaokickme.", function()
    NETWORK.NETWORK_SESSION_KICK_PLAYER(PLAYER.PLAYER_ID())
end)

menu.toggle_loop(menu.my_root(), "test1", { "latiaotest" }, "latiaotest.", function()
    util.trigger_script_event(30, { 54323524, 30, 2147483647, 0, 0, -864314358, -864314358, 0 })
end)
