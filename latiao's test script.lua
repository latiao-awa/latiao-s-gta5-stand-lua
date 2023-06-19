menu.action(menu.my_root(), "restart lua", { "latiaorestartlua" }, "restartlua", function()
    util.restart_script()
end)
util.keep_running()
-- util.require_natives("1672190175-uno")
util.require_natives("1681379138")

--copy hc start
--- Core Functions

function ADD_MP_INDEX(stat)
    local Exceptions = {
        "MP_CHAR_STAT_RALLY_ANIM",
        "MP_CHAR_ARMOUR_1_COUNT",
        "MP_CHAR_ARMOUR_2_COUNT",
        "MP_CHAR_ARMOUR_3_COUNT",
        "MP_CHAR_ARMOUR_4_COUNT",
        "MP_CHAR_ARMOUR_5_COUNT",
    }
    for _, exception in pairs(Exceptions) do
        if stat == exception then
            return "MP" .. util.get_char_slot() .. "_" .. stat
        end
    end

    if not string.contains(stat, "MP_") and not string.contains(stat, "MPPLY_") then
        return "MP" .. util.get_char_slot() .. "_" .. stat
    end
    return stat
end

function STAT_SET_INT(stat, value)
    STATS.STAT_SET_INT(util.joaat(ADD_MP_INDEX(stat)), value, true)
end

function STAT_SET_FLOAT(stat, value)
    STATS.STAT_SET_FLOAT(util.joaat(ADD_MP_INDEX(stat)), value, true)
end

function STAT_SET_BOOL(stat, value)
    STATS.STAT_SET_BOOL(util.joaat(ADD_MP_INDEX(stat)), value, true)
end

function STAT_SET_STRING(stat, value)
    STATS.STAT_SET_STRING(util.joaat(ADD_MP_INDEX(stat)), value, true)
end

function STAT_SET_DATE(stat, year, month, day, hour, min)
    local DatePTR = memory.alloc(8 * 7) -- Thanks for helping memory stuffs, aaronlink127#0127
    memory.write_int(DatePTR, year)
    memory.write_int(DatePTR + 8, month)
    memory.write_int(DatePTR + 16, day)
    memory.write_int(DatePTR + 24, hour)
    memory.write_int(DatePTR + 32, min)
    memory.write_int(DatePTR + 40, 0) -- Seconds
    memory.write_int(DatePTR + 48, 0) -- Milliseconds
    STATS.STAT_SET_DATE(util.joaat(ADD_MP_INDEX(stat)), DatePTR, 7, true)
end

function STAT_SET_MASKED_INT(stat, value1, value2)
    STATS.STAT_SET_MASKED_INT(util.joaat(ADD_MP_INDEX(stat)), value1, value2, 8, true)
end

function SET_PACKED_STAT_BOOL_CODE(stat, value)
    STATS.SET_PACKED_STAT_BOOL_CODE(stat, value, util.get_char_slot())
end

function STAT_INCREMENT(stat, value)
    STATS.STAT_INCREMENT(util.joaat(ADD_MP_INDEX(stat)), value, true)
end

function STAT_GET_INT(stat)
    local IntPTR = memory.alloc_int()
    STATS.STAT_GET_INT(util.joaat(ADD_MP_INDEX(stat)), IntPTR, -1)
    return memory.read_int(IntPTR)
end

function STAT_GET_FLOAT(stat)
    local FloatPTR = memory.alloc_int()
    STATS.STAT_GET_FLOAT(util.joaat(ADD_MP_INDEX(stat)), FloatPTR, -1)
    return tonumber(string.format("%.3f", memory.read_float(FloatPTR)))
end

function STAT_GET_BOOL(stat)
    if STAT_GET_INT(stat) ~= 0 then
        return "true"
    else
        return "false"
    end
end

function STAT_GET_STRING(stat)
    return STATS.STAT_GET_STRING(util.joaat(ADD_MP_INDEX(stat)), -1)
end

function STAT_GET_DATE(stat, type)
    local DatePTR = memory.alloc(8 * 7)
    STATS.STAT_GET_DATE(util.joaat(ADD_MP_INDEX(stat)), DatePTR, 7, true)
    local DateTypes = {
        "Years",
        "Months",
        "Days",
        "Hours",
        "Mins",
        -- Seconds,
        -- Milliseconds,
    }
    for i = 1, #DateTypes do
        if type == DateTypes[i] then
            return memory.read_int(DatePTR + 8 * (i - 1))
        end
    end
end

function SET_INT_GLOBAL(global, value)
    memory.write_int(memory.script_global(global), value)
end

function SET_FLOAT_GLOBAL(global, value)
    memory.write_float(memory.script_global(global), value)
end

function GET_INT_GLOBAL(global)
    return memory.read_int(memory.script_global(global))
end

function SET_PACKED_INT_GLOBAL(start_global, end_global, value)
    for i = start_global, end_global do
        SET_INT_GLOBAL(262145 + i, value)
    end
end

function SET_INT_LOCAL(script, script_local, value)
    if memory.script_local(script, script_local) ~= 0 then
        memory.write_int(memory.script_local(script, script_local), value)
    end
end

function SET_FLOAT_LOCAL(script, script_local, value)
    if memory.script_local(script, script_local) ~= 0 then
        memory.write_float(memory.script_local(script, script_local), value)
    end
end

function GET_INT_LOCAL(script, script_local)
    if memory.script_local(script, script_local) ~= 0 then
        local ReadLocal = memory.read_int(memory.script_local(script, script_local))
        if ReadLocal ~= nil then
            return ReadLocal
        end
    end
end

function SET_BIT(bits, place) -- Credit goes to WiriScript
    return (bits | (1 << place))
end

function SET_GLOBAL_BIT(global, bit)
    local Addr = memory.script_global(global)
    memory.write_int(Addr, SET_BIT(memory.read_int(Addr), bit))
end

function SET_LOCAL_BIT(script, script_local, bit)
    if memory.script_local(script, script_local) ~= 0 then
        local Addr = memory.script_local(script, script_local)
        memory.write_int(Addr, SET_BIT(memory.read_int(Addr), bit))
    end
end

--copy hc end





function IS_PLAYER_PED(ped)
    if PED.GET_PED_TYPE(ped) < 4 then
        return true
    else
        return false
    end
end

menu.divider(menu.my_root(), "world")

menu.action(menu.my_root(), "delallobjects", { "latiaodelallobjects" }, "delallobjects.", function()
    for k, ent in pairs(entities.get_all_objects_as_handles()) do
        entities.delete_by_handle(ent)
    end
end)

menu.action(menu.my_root(), "delallpeds", { "latiaodelallpeds" }, "delallpeds.", function()
    for k, ent in pairs(entities.get_all_peds_as_handles()) do
        entities.delete_by_handle(ent)
    end
end)



menu.action(menu.my_root(), "delallvehicles", { "latiaodelallvehicles" }, "delallvehicles.", function()
    for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
        entities.delete_by_handle(ent)
    end
end)

menu.action(menu.my_root(), "delallpickups", { "latiaodelallvehicles" }, "delallvehicles.", function()
    for k, ent in pairs(entities.get_all_pickups_as_handles()) do
        entities.delete_by_handle(ent)
    end
end)

menu.action(menu.my_root(), "delall", { "latiaodelall" }, "delall.", function()
    local targets = {}

    for _, ped in ipairs(entities.get_all_peds_as_handles()) do
        table.insert(targets, ped)
    end

    for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
        table.insert(targets, vehicle)
    end

    for _, object in ipairs(entities.get_all_objects_as_handles()) do
        table.insert(targets, object)
    end

    for _, object in ipairs(entities.get_all_pickups_as_handles()) do
        table.insert(targets, pickups)
    end

    for _, target in ipairs(targets) do
        entities.delete_by_handle(target)
    end
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
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, 1000, 0, 2147483647, false, true, 0.0)
            ::out::
        end
    end)

menu.toggle_loop(menu.my_root(), "tppedto 00", { "latiaotppedto00" }, "latiaotpped00.", function()
    -- local pos = players.get_position(players.user())
    for _, ped in entities.get_all_peds_as_handles() do
        if IS_PLAYER_PED(ped) then goto out end
        ENTITY.SET_ENTITY_COORDS(ped, 0, 0, -200, false)
        ::out::
    end
end)

-- menu.toggle_loop(menu.my_root(), "TASK_FOLLOW_TO_OFFSET_OF_ENTITY all", { "latiaoTASK_FOLLOW_TO_OFFSET_OF_ENTITY" },
-- "TASK_FOLLOW_TO_OFFSET_OF_ENTITY.", function()
--     print(PLAYER.GET_PLAYER_PED())
--     for _, ped in entities.get_all_peds_as_handles() do
--         if IS_PLAYER_PED(ped) then goto out end
--         TASK.TASK_FOLLOW_TO_OFFSET_OF_ENTITY(ped, PLAYER.GET_PLAYER_PED(), 0.0, 0.0, 0.0, 10.0, 10, 0.0, true)

--         ::out::
--     end

-- end)

menu.toggle_loop(menu.my_root(), "SET_PED_TO_RAGDOLL_WITH_FALL ped", { "latiaoSET_PED_TO_RAGDOLL_WITH_FALL" },
    "latiaoSET_PED_TO_RAGDOLL_WITH_FALL.", function()
        for _, ped in entities.get_all_peds_as_handles() do
            PED.SET_PED_TO_RAGDOLL(ped, 10000, 0, 0, true, true, false);
            ::out::
        end
    end)

-- menu.toggle_loop(menu.my_root(), "up ped", { "latiaotppedto00" }, "latiaotpped00.", function()
--     local pos = players.get_position(players.user())
--     for _, ped in entities.get_all_peds_as_handles() do
--         if IS_PLAYER_PED(ped) then goto out end
--         ENTITY.SET_ENTITY_COORDS(ped, pos.x, pos.y, 10000, false)
--         ::out::
--     end
-- end)



-- menu.toggle_loop(menu.my_root(), "tpall 00", { "latiaotpallto00" }, "latiaotpall00.", function()
--     local targets = {}

--     for _, ped in ipairs(entities.get_all_peds_as_handles()) do
--         table.insert(targets, ped)
--     end

--     for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
--         table.insert(targets, vehicle)
--     end

--     for _, object in ipairs(entities.get_all_objects_as_handles()) do
--         table.insert(targets, object)
--     end

--     for _, object in ipairs(entities.get_all_pickups_as_handles()) do
--         table.insert(targets, pickups)
--     end

--     for _, target in ipairs(targets) do
--         ENTITY.SET_ENTITY_COORDS(targets, 0, 0, 0, false)
--     end
-- end)

-- local function tp(getHandlesFn)
--     local pos = players.get_position(players.user())
--     pos:add(v3.new(0, 0, 100))
--     -- if IS_PLAYER_PED(entities.get_all_peds_as_handles()) then goto out end
--     for k, ent in pairs(getHandlesFn()) do
--         ENTITY.SET_ENTITY_COORDS(ent, pos.x, pos.y, pos.z, false)
--     end
-- end

-- menu.toggle_loop(menu.my_root(), "tpall to me", { "latiaotpalltome" }, "latiaotpalltome.", function()
--     local pos = players.get_position(players.user())
--     pos:add(v3.new(0, 0, 100))
--     local targets = {}

--     for _, ped in ipairs(entities.get_all_peds_as_handles()) do
--         table.insert(targets, ped)
--     end

--     for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
--         table.insert(targets, vehicle)
--     end

--     for _, object in ipairs(entities.get_all_objects_as_handles()) do
--         table.insert(targets, object)
--     end

--     for _, object in ipairs(entities.get_all_pickups_as_handles()) do
--         table.insert(targets, pickups)
--     end

--     for _, target in ipairs(targets) do
--         ENTITY.SET_ENTITY_COORDS(ent, pos.x, pos.y, pos.z, false)(target)
--     end
-- end)

menu.toggle_loop(menu.my_root(), "Ped Ignore", { "latiaopedIgnore" }, ("all ped Ignore you."), function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(players.user(), true)
end, function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(players.user(), false)
end)

menu.toggle_loop(menu.my_root(), "killaura all no wall", { "latiaokillaura" }, ("SHOOT ALL"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        -- 如果目标已经死亡，就跳过
        if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
        if ped == players.user_ped() then goto out end
        -- 获取目标的位置
        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        -- 获取玩家的位置，并向上偏移一点，避免射击地面
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(players.user_ped()))
        AddPos:add(v3.new(0, 0, 1))
        -- 判断目标是否在玩家的视线中，如果不是，就跳过
        if not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(players.user_ped(), ped, 17) then goto out end
        -- 在玩家和目标之间射出一颗子弹，造成伤害
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
            true,
            0x6E7DDDEC, players.user_ped(), false, true, 1)
        ::out::
    end
end)



menu.toggle_loop(menu.my_root(), "killaura ped no wall no vehicle", { "latiaokillaura" }, ("SHOOT ALL"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if IS_PLAYER_PED(ped) then goto out end
        if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
        if ped == players.user_ped() then goto out end
        if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then goto out end
        if not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(players.user_ped(), ped, 17) then goto out end

        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))

        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(players.user_ped()))

        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
            true,
            0x6E7DDDEC, players.user_ped(), false, true, 1)
        ::out::
    end
end)

menu.toggle_loop(menu.my_root(), "killaura all", { "latiaokillaura" }, ("SHOOT ALL"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
            true,
            0x6E7DDDEC, players.user_ped(), false, true, 1)
        ::out::
    end
end)

menu.toggle_loop(menu.my_root(), "killaura player", { "latiaokillaura" }, ("SHOOT ALL"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
            true,
            0x6E7DDDEC, players.user_ped(), false, true, 1)
        ::out::
    end
end)

menu.toggle_loop(menu.my_root(), "nick EXPLOSION killaura all", { "latiaonickEXPLOSIONkillauraall" }, ("SHOOT ALL"),
    function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            -- if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
            local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            FIRE.ADD_EXPLOSION(PedPos.x, PedPos.y, PedPos.z, 0, 2147483647, false, true, 0.0)
        end
    end)

menu.toggle_loop(menu.my_root(), "killaura all by EXPLOSION", { "latiaokillauraEXPLOSION" }, ("use EXPLOSION kill all"),
    function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
        end
    end)



menu.toggle_loop(menu.my_root(), "killaura PED by EXPLOSION", { "latiaokillauraEXPLOSIONPed" },
    ("use EXPLOSION kill all Ped"), function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if IS_PLAYER_PED(ped) then goto out end
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
            ::out::
        end
    end)

menu.toggle_loop(menu.my_root(), "killaura all exclude VEHICLE", { "latiaokillauraexcludeVEHICLE" },
    ("killaura all exclude VEHICLE"), function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if PED.GET_VEHICLE_PED_IS_USING(ped) ~= 0 then goto out end


            local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            AddPos:add(v3.new(0, 0, 1))
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
                true,
                0x6E7DDDEC, players.user_ped(), false, true, 1)
            ::out::
        end
    end)

menu.toggle_loop(menu.my_root(), "CLEAR_PED_TASKS_IMMEDIATELY", { "latiaoCLEAR_PED_TASKS_IMMEDIATELY" },
    "CLEAR_PED_TASKS_IMMEDIATELY.", function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if IS_PLAYER_PED(ped) then goto out end

            TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
            ::out::
        end
    end)

menu.toggle_loop(menu.my_root(), "killaura ped", { "latiaokillauraped" }, ("killauraped"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if IS_PLAYER_PED(ped) then goto out end

        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
            true,
            0x6E7DDDEC, players.user_ped(), false, true, 1)
        ::out::
    end
end)

menu.toggle_loop(menu.my_root(), "killaura ped exclude VEHICLE", { "latiaokillaurapedexcludeVEHICLE" },
    ("killaurapedexcludeVEHICLE"), function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if IS_PLAYER_PED(ped) or PED.GET_VEHICLE_PED_IS_USING(ped) ~= 0 then goto out end


            local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            AddPos:add(v3.new(0, 0, 1))
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
                true,
                0x6E7DDDEC, players.user_ped(), false, true, 1)
            ::out::
        end
    end)



menu.toggle_loop(menu.my_root(), "tp Picked", { "LatiaoTpPicked" }, ("TpPicked for you"), function()
    local pos = players.get_position(players.user())
    for _, pickup in entities.get_all_pickups_as_handles() do
        ENTITY.SET_ENTITY_COORDS(pickup, pos.x, pos.y, pos.z, false)
    end
end)

menu.divider(menu.my_root(), "server")



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
                util.yield(1000)
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

menu.toggle_loop(menu.my_root(), "hostkickallmoder(NETWORK_SESSION_KICK_PLAYER)", { "latiaohostkickallmoder" },
    "latiaohostkickallmoder.",
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
        ::out::
    end
end)

menu.action(menu.my_root(), "kickall exclude hosts", { "latiaokickallexcludehost" }, "latiaokickallexcludehost",
    function()
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
    util.toast(PLAYER.PLAYER_ID())
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



menu.divider(menu.my_root(), "test")


menu.action(menu.my_root(), "latiao insfin fm_mission_controller_2020", { "latiaoinsfm_mission_controller_2020" },
    "fm_mission_controller_2020",
    function()
        SET_INT_LOCAL("fm_mission_controller_2020", 42279 + 1, 51338752)

        SET_INT_LOCAL("fm_mission_controller_2020", 42279 + 1375 + 1, 100000000)
    end)

menu.action(menu.my_root(), "latiaoinsfin Casino Aggressive / Classic", { "latiaoinsfinClassic" }, "latiaoinsfin",
    function()
        SET_INT_LOCAL("fm_mission_controller", 19707 + 1741, 233)

        SET_INT_LOCAL("fm_mission_controller", 19707 + 2686, 233333333)

        SET_INT_LOCAL("fm_mission_controller", 28329 + 1, 100000000)

        SET_INT_LOCAL("fm_mission_controller", 31585 + 69, 100000000)
    end)


menu.action(menu.my_root(), "latiao insfin Doomsday fm_mission_controller",
    { "latiaobestDoomsdayfm_mission_controller" },
    "latiaobestDoomsdayfm_mission_controller",
    function()
        SET_INT_LOCAL("fm_mission_controller", 19707 + 1741, 233) -- Casino Aggressive Kills & Act 3

        SET_INT_LOCAL("fm_mission_controller", 19707, 12)         -- ???, 'fm_mission_controller' instant finish variable?


        SET_INT_LOCAL("fm_mission_controller", 28329 + 1, 100000000)  -- 'fm_mission_controller' instant finish variable?

        SET_INT_LOCAL("fm_mission_controller", 31585 + 69, 100000000) -- 'fm_mission_controller' instant finish variable?
        -- SET_INT_LOCAL("fm_mission_controller", 31585 + 97, 80) -- Act 1 Kills? Seem not to work
    end)

menu.toggle_loop(menu.my_root(), "lock Casino Aggressive", { "latiaobestCasinoAggressive" },
    "latiaobestCasinoAggressive",
    function()
        SET_INT_LOCAL("fm_mission_controller", 19707 + 2686, 100000000)
    end)

menu.action(menu.my_root(), "Bunker gb_gunrunning", { "gb_gunrunning" }, "latiaofreezeallplayer.", function()
    SET_INT_LOCAL("gb_gunrunning", 1205 + 774, 0)
end)

menu.action(menu.my_root(), "Air gb_smuggler", { "gb_smuggler" }, "latiaofreezeallplayer.", function()
    SET_INT_LOCAL("gb_smuggler", 1928 + 1035, GET_INT_LOCAL("gb_smuggler", 1928 + 1078))
end)

menu.action(menu.my_root(), "Acid Lab fm_content_acid_lab_sell", { "fm_content_acid_lab_sell" }, "latiaofreezeallplayer.",
    function()
        SET_INT_LOCAL("fm_content_acid_lab_sell", 5192 + 1357 + 2, 9)
        SET_INT_LOCAL("fm_content_acid_lab_sell", 5192 + 1357 + 3, 10)
        SET_INT_LOCAL("fm_content_acid_lab_sell", 5192 + 1293, 2)
    end)
menu.action(menu.my_root(), "fm_mission_controller host test", { "latiaofm_mission_controllertest" },
    "latiaofm_mission_controllertest.", function()
        util.toast("fm_mission_controller host is " ..
            PLAYER.GET_PLAYER_NAME(NETWORK.NETWORK_GET_HOST_OF_SCRIPT("fm_mission_controller")))
    end)
menu.action(menu.my_root(), "fm_mission_controller_2020 host test", { "latiaofm_mission_controller_2020test" },
    "latiaofm_mission_controller_2020test.", function()
        util.toast("fm_mission_controller_2020 host is " ..
            PLAYER.GET_PLAYER_NAME(NETWORK.NETWORK_GET_HOST_OF_SCRIPT("FM_Mission_Controller_2020")))
    end)
menu.action(menu.my_root(), "freemode host test", { "latiaofreemodetest" }, "latiaofreemodetest.", function()
    util.toast("freemode host is " .. PLAYER.GET_PLAYER_NAME(NETWORK.NETWORK_GET_HOST_OF_SCRIPT("freemode", -1, 0)))
end)





menu.toggle_loop(menu.my_root(), "APPLY_DAMAGE_TO_PED ped", { "latiaoAPPLY_DAMAGE_TO_PED" }, "latiaoAPPLY_DAMAGE_TO_PED.",
    function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if IS_PLAYER_PED(ped) then goto out end

            PED.APPLY_DAMAGE_TO_PED(ped, 100000000, true)
            ::out::
        end
    end)
-- menu.toggle_loop(menu.my_root(), "EXPLODE_VEHICLE ped", { "latiaoAPPLY_DAMAGE_TO_PED" }, "latiaoAPPLY_DAMAGE_TO_PED.",
--     function()
--         for _, vehicles in pairs(entities.get_all_vehicles_as_handles()) do
--             VEHICLE.EXPLODE_VEHICLE(vehicles, true, true, 0)
--             ::out::
--         end
--     end)


menu.toggle_loop(menu.my_root(), "REQUES_ENTITY ped", { "latiaoREQUES_ENTITYped" },
    "latiaoREQUES_ENTITYped.", function()
        for _, target in ipairs(entities.get_all_peds_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
        end
    end)


menu.toggle_loop(menu.my_root(), "REQUES_ENTITY objects", { "latiaoREQUES_ENTITYobjects" },
    "REQUES_ENTITYobjects.", function()
        for _, target in ipairs(entities.get_all_objects_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
        end
    end)

menu.toggle_loop(menu.my_root(), "REQUES_ENTITY vehicles", { "latiaoREQUES_ENTITYvehicles" },
    "REQUES_ENTITYvehicles.", function()
        for _, target in ipairs(entities.get_all_vehicles_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
        end
    end)


-- menu.toggle_loop(menu.my_root(), "NETWORK_REQUEST_CONTROL_OF_ENTITY all", { "latiaoNETWORK_REQUEST_CONTROL_OF_ENTITY" },
--     "latiaoNETWORK_REQUEST_CONTROL_OF_ENTITY.", function()
--         local targets = {}

--         for _, ped in ipairs(entities.get_all_peds_as_handles()) do
--             table.insert(targets, ped)
--         end

--         for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
--             if PED.GET_VEHICLE_PED_IS_USING(IS_PLAYER_PED(entities.get_all_peds_as_handles())) ~= 0 then goto out end
--             table.insert(targets, vehicle)
--             ::out::
--         end

--         for _, object in ipairs(entities.get_all_objects_as_handles()) do
--             table.insert(targets, object)
--         end

--         for _, target in ipairs(targets) do
--             NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)

--         end
--     end)





menu.toggle_loop(menu.my_root(), "REMOVE_ALL_PED_WEAPONS", { "latiaoREMOVE_ALL_PED_WEAPONS" },
    "REMOVE_ALL_PED_WEAPONS.", function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if IS_PLAYER_PED(ped) then goto out end
            -- if IS_PLAYER_PED(ped) then goto out end

            WEAPON.REMOVE_ALL_PED_WEAPONS(ped)

            ::out::
        end
    end)
menu.toggle_loop(menu.my_root(), "FREEZE_ENTITY_POSITION", { "latiaoFREEZE_ENTITY_POSITION" },
    "FREEZE_ENTITY_POSITION.", function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if IS_PLAYER_PED(ped) then goto out end

            ENTITY.FREEZE_ENTITY_POSITION(ped, true)
            ::out::
        end
    end, function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if IS_PLAYER_PED(ped) then goto out end

            ENTITY.FREEZE_ENTITY_POSITION(ped, false)
            ::out::
        end
    end)

menu.toggle_loop(menu.my_root(), "SET_NO_LOADING_SCREEN", { "latiaoSET_NO_LOADING_SCREEN" },
    "SET_NO_LOADING_SCREEN.", function()
        SCRIPT.SET_NO_LOADING_SCREEN(true)
    end, function()
        SCRIPT.SET_NO_LOADING_SCREEN(false)
    end)

menu.action(menu.my_root(), "NETWORK_SESSION_END", { "latiaoNETWORK_SESSION_END" },
    "NETWORK_SESSION_END.", function()
        NETWORK.NETWORK_SESSION_END(0, 0);
    end)


menu.action(menu.my_root(), "IS_SCRIPTED_CONVERSATION_ONGOING", { "latiaoIS_SCRIPTED_CONVERSATION_ONGOING" },
    "IS_SCRIPTED_CONVERSATION_ONGOING.", function()
        AUDIO.STOP_SCRIPTED_CONVERSATION(false)
    end)
menu.toggle_loop(menu.my_root(), "killaura all", { "latiaokillaura" }, ("SHOOT ALL"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        -- if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
            true,
            0x6E7DDDEC, players.user_ped(), false, true, 1)
        ::out::
    end
end)







-- player root
local function testMenuSetup(pid)
    menu.divider(menu.player_root(pid), "test")

    local testMenu = menu.list(menu.player_root(pid), "test", {}, "")






    local test = false
    menu.toggle(testMenu, "test", {}, "", function(on)
        test = on
        while test and NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) and
            not util.is_session_transition_active() do
            print(pid)

            util.yield(100)
        end
    end)


    local SHOOT = false
    menu.toggle(testMenu, "SHOOT", {}, "", function(on)
        SHOOT = on
        while SHOOT and NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) and
            not util.is_session_transition_active() do
            local playerPed = PLAYER.GET_PLAYER_PED(pid)
            local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
            local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
            AddPos:add(v3.new(0, 0, 1))
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
                true,
                0x6E7DDDEC, players.user_ped(), false, true, 1)
            util.yield(100)
            -- end
        end
    end)

    local menukill = false

    menu.toggle(testMenu, "menukill", { "latiaobanmoder" }, "ban moder.", function(on)
        menukill = on
        while menukill and NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) and
            not util.is_session_transition_active() do
            -- local playerPed = PLAYER.GET_PLAYER_PED(pid)
            menu.trigger_commands("kill" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(100)
        end
    end)
    local EXPLOSION = false
    menu.toggle(testMenu, "EXPLOSION", { "latiaobanmoder" }, "ban moder.", function(on)
        EXPLOSION = on
        while menukill and NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) and
            not util.is_session_transition_active() do
                local playerPed = PLAYER.GET_PLAYER_PED(pid)
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
        util.yield(100)
            end
    end)
end




for k, p in pairs(players.list(true, true, true)) do
    testMenuSetup(p)
end
players.on_join(function(pid)
    testMenuSetup(pid)
end)
