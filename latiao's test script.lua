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

menu.action(menu.my_root(), "restart lua", { "latiaorestartlua" }, "restartlua", function()
    util.restart_script()
end)
util.keep_running()

util.require_natives("1681379138")


local killaura = menu.list(menu.my_root(), "killaura", {}, "")
local self = menu.list(menu.my_root(), "self", {}, "")
local world = menu.list(menu.my_root(), "world", {}, "")
local server = menu.list(menu.my_root(), "server", {}, "")
local test = menu.list(menu.my_root(), "test", {}, "")
local dividends = menu.list(menu.my_root(), "dividends", {}, "")
local admin = menu.list(menu.my_root(), "admin", {}, "")
-- local Multipliers = menu.list(menu.my_root(), "Multipliers", {}, "")






kill_aura_peds = false
kill_aura_player = false
kill_aura_in_vehicle = false
kill_aura_through_walls = false
kill_aura_explosion = false
kill_aura_nick_explosion = false
kill_aura_F_Loop = false
IS_ENTITY_DEAD = false
menu.toggle(killaura, "kill_aura_peds", {}, "", function(on)
    kill_aura_peds = on
end)

menu.toggle(killaura, "killaura_player", {}, "", function(on)
    kill_aura_player = on
end)

menu.toggle(killaura, "killaura_in_vehicle", {}, "", function(on)
    kill_aura_in_vehicle = on
end)

menu.toggle(killaura, "killaura_attack_walls_back", {}, "", function(on)
    kill_aura_through_walls = on
end)

menu.toggle(killaura, "killaura_explosion", {}, "", function(on)
    kill_aura_explosion = on
end)
menu.toggle(killaura, "killaura_nick_explosion", {}, "", function(on)
    kill_aura_nick_explosion = on
end)
menu.toggle(killaura, "kill_aura_F_Loop", {}, "", function(on)
    kill_aura_F_Loop = on
end)
local time = menu.slider(killaura, "time", { "time" }, "", 0,
    2147483647, 0, 1,
    function() end)

menu.toggle_loop(killaura, "killaura all", { "latiaokillaura" }, ("SHOOT ALL"), function()
    if kill_aura_peds or kill_aura_player or kill_aura_in_vehicle then
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if ENTITY.IS_ENTITY_DEAD(ped) or

                (PED.IS_PED_IN_ANY_VEHICLE(ped, false) and not kill_aura_in_vehicle) or
                (PED.GET_PED_TYPE(ped) >= 3 and not kill_aura_peds) or
                (PED.GET_PED_TYPE(ped) < 3 and not kill_aura_player) or

                (not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(players.user_ped(), ped, 17) and not kill_aura_through_walls) or
                (DEAD and IS_ENTITY_DEAD)
            then
                goto continue
            end

            local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            AddPos:add(v3.new(0, 0, 1))
            if kill_aura_F_Loop then
                FIRE.ADD_EXPLOSION(PedPos.x, PedPos.y, PedPos.z, 12, 2147483647, false, true, 0.0)
            else
                if kill_aura_nick_explosion then
                    FIRE.ADD_EXPLOSION(PedPos.x, PedPos.y, PedPos.z, 0, 2147483647, false, true, 0.0)
                else
                    if kill_aura_explosion then
                        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), PedPos.x, PedPos.y, PedPos.z, 0, 2147483647, false,
                            true,
                            0.0)
                    else
                        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y,
                            PedPos.z,
                            100,
                            true,
                            0x6E7DDDEC, players.user_ped(), false, true, 1)
                        util.yield(menu.get_value(time))
                    end
                end
            end
            ::continue::
        end
    end
end)







menu.toggle_loop(self, "heal/armour", {}, "", function()
    util.draw_debug_text("heal: " ..
        ENTITY.GET_ENTITY_HEALTH(players.user_ped()) .. "/" .. PED.GET_PED_MAX_HEALTH(players.user_ped()) ..
        "\narmour: " .. PED.GET_PED_ARMOUR(players.user_ped()) .. "/" .. PLAYER.GET_PLAYER_MAX_ARMOUR(players.user()))
end)
menu.toggle_loop(self, "EVERYONE IGNORE PLAYER", {}, "", function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(players.user(), true)
end, function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(players.user(), false)
end)
menu.toggle_loop(self, "silence", {}, "", function()
    PLAYER.SET_PLAYER_NOISE_MULTIPLIER(players.user(), 0.0)
    PLAYER.SET_PLAYER_SNEAKING_NOISE_MULTIPLIER(players.user(), 0.0)
end)



menu.toggle_loop(world, "delallobjects", { "latiaodelallobjects" }, "delallobjects.", function()
    for k, ent in pairs(entities.get_all_objects_as_handles()) do
        entities.delete_by_handle(ent)
    end
end)

menu.toggle_loop(world, "delallpeds", { "latiaodelallpeds" }, "delallpeds.", function()
    for k, ent in pairs(entities.get_all_peds_as_handles()) do
        entities.delete_by_handle(ent)
    end
end)



menu.toggle_loop(world, "delallvehicles", { "latiaodelallvehicles" }, "delallvehicles.", function()
    for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
        entities.delete_by_handle(ent)
    end
end)

menu.toggle_loop(world, "delallpickups", { "latiaodelallvehicles" }, "delallvehicles.", function()
    for k, ent in pairs(entities.get_all_pickups_as_handles()) do
        entities.delete_by_handle(ent)
    end
end)

menu.action(world, "delall", { "latiaodelall" }, "delall.", function()
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

    for _, pickups in ipairs(entities.get_all_pickups_as_handles()) do
        table.insert(targets, pickups)
    end

    for _, target in ipairs(targets) do
        entities.delete_by_handle(target)
        menu.trigger_commands("deleteropes")
    end
end)



menu.toggle_loop(world, "TPALL 0 0 0", { "latiaodelallvehicles" }, "delallvehicles.", function()
    local targets = {}

    for _, ped in ipairs(entities.get_all_peds_as_handles()) do
        if PED.GET_PED_TYPE(ped) <= 3 then goto out end
        table.insert(targets, ped)
        ::out::
    end

    for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
        table.insert(targets, vehicle)
    end
    for _, object in ipairs(entities.get_all_objects_as_handles()) do
        table.insert(targets, object)
    end

    for _, pickups in ipairs(entities.get_all_pickups_as_handles()) do
        table.insert(targets, pickups)
    end

    for _, target in ipairs(targets) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
        ENTITY.SET_ENTITY_COORDS(target, 0, 0, 2600, false)
    end
end)




menu.toggle_loop(world, "kick ped vehicle", { "latiaokickpedvehicle" }, ("kickpedvehicle"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if PED.GET_PED_TYPE(ped) <= 3 then goto out end
        if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
        end
        ::out::
    end
end)




menu.toggle_loop(world, "remove DEAD(ped)", { "latiaoremoveDEADped" }, ("latiaoremoveDEADped"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then
            entities.delete_by_handle(ped)
        end
    end
end)

menu.toggle_loop(world, "tp DEAD(ped) to me", { "latiaoremoveDEADped" }, ("latiaoremoveDEADped"), function()
    local pos = players.get_position(players.user())
    -- Pos:add(v3.new(0, 0, 1))
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then
            ENTITY.SET_ENTITY_COORDS(ped, pos.x, pos.y, pos.z + 1, false)
        end
    end
end)


menu.toggle_loop(world, "REMOVE_ALL_PED_WEAPONS", { "latiaoREMOVE_ALL_PED_WEAPONS" }, "REMOVE_ALL_PED_WEAPONS.",
    function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if PED.GET_PED_TYPE(ped) <= 3 then goto out end


            WEAPON.REMOVE_ALL_PED_WEAPONS(ped)

            ::out::
        end
    end)
menu.toggle_loop(world, "FREEZE_ENTITY_POSITION", { "latiaoFREEZE_ENTITY_POSITION" }, "FREEZE_ENTITY_POSITION.",
    function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if PED.GET_PED_TYPE(ped) <= 3 then goto out end

            ENTITY.FREEZE_ENTITY_POSITION(ped, true)
            ::out::
        end
    end, function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if PED.GET_PED_TYPE(ped) <= 3 then goto out end

            ENTITY.FREEZE_ENTITY_POSITION(ped, false)
            ::out::
        end
    end)

menu.toggle_loop(world, "tppedtome", { "latiaotppedtome" }, "latiaotppedtome.", function()
    local pos = players.get_position(players.user())
    pos:add(v3.new(0, 0, 2.5))
    for _, ped in entities.get_all_peds_as_handles() do
        if PED.GET_PED_TYPE(ped) <= 3 then goto out end
        ENTITY.SET_ENTITY_COORDS(ped, pos.x, pos.y, pos.z, false)
        ::out::
    end
end)

menu.toggle_loop(world, "silencekillallped", { "latiaosilencekillallped" }, "latiaotsilencekillallped.", function()
    local pos = players.get_position(players.user())
    for _, ped in entities.get_all_peds_as_handles() do
        if PED.GET_PED_TYPE(ped) <= 3 then goto out end
        ENTITY.SET_ENTITY_COORDS(ped, pos.x, pos.y, 1000, false)
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, 1000, 0, 2147483647, false, true, 0.0)
        ::out::
    end
end)

menu.toggle_loop(world, "tppedto 00", { "latiaotppedto00" }, "latiaotpped00.", function()
    for _, ped in entities.get_all_peds_as_handles() do
        if PED.GET_PED_TYPE(ped) <= 3 then goto out end
        ENTITY.SET_ENTITY_COORDS(ped, 0, 0, -200, false)
        ::out::
    end
end)


menu.toggle_loop(world, "SET_PED_TO_RAGDOLL_WITH_FALL ped", { "latiaoSET_PED_TO_RAGDOLL_WITH_FALL" },
    "latiaoSET_PED_TO_RAGDOLL_WITH_FALL.", function()
        for _, ped in entities.get_all_peds_as_handles() do
            PED.SET_PED_TO_RAGDOLL(ped, 10000, 0, 0, true, true, false);
        end
    end)







menu.toggle_loop(world, "NICKFlameLoopALL", { "latiaoFlameLoopALL" }, "", function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
        if ped == players.user_ped() then goto out end
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 12, 2147483647, false, true, 0.0)
        ::out::
    end
end)


menu.toggle_loop(world, "CLEAR_PED_TASKS_IMMEDIATELY", { "latiaoCLEAR_PED_TASKS_IMMEDIATELY" },
    "CLEAR_PED_TASKS_IMMEDIATELY.", function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if PED.GET_PED_TYPE(ped) <= 3 then goto out end

            TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
            ::out::
        end
    end)



menu.toggle_loop(world, "all ped ROP MONEY", { "latiaoallpedROPMONEY" }, "latiaoallpedROPMONEY.", function()
    PED.SET_AMBIENT_PEDS_DROP_MONEY(true)
end)

menu.toggle_loop(world, "maxpedVEHICLE", { "latiaomaxpedVEHICLE" }, "latiaomaxpedVEHICLE.", function()
    PED.INSTANTLY_FILL_PED_POPULATION()
    VEHICLE.INSTANTLY_FILL_VEHICLE_POPULATION()
end)
menu.toggle_loop(world, "maxpedgod", { "latiaomaxpedgod" }, "latiaomaxpedgod.", function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        PED.SET_PED_RELATIONSHIP_GROUP_HASH(ped, PED.GET_PED_RELATIONSHIP_GROUP_HASH(players.user_ped()))
    end
end, function()
end)

menu.toggle_loop(world, "no new cops", { "" }, "", function()
    PLAYER.SET_DISPATCH_COPS_FOR_PLAYER(players.user(), false)
end)



menu.toggle_loop(world, "tp Pickedup", { "LatiaoTpPicked" }, ("TpPicked for you"), function()
    local pos = players.get_position(players.user())
    pos:add(v3.new(0, 0, 1))
    for _, pickup in entities.get_all_pickups_as_handles() do
        ENTITY.SET_ENTITY_COORDS(pickup, pos.x, pos.y, pos.z, false)
    end
end)
menu.toggle_loop(world, "tp Picked", { "LatiaoTpPicked" }, ("TpPicked for you"), function()
    local pos = players.get_position(players.user())
    -- pos:add(v3.new(0, 0, 1))
    for _, pickup in entities.get_all_pickups_as_handles() do
        ENTITY.SET_ENTITY_COORDS(pickup, pos.x, pos.y, pos.z, false)
    end
end)

-- menu.toggle_loop(world, "SET_VEHICLE_DOORS_LOCKED", { "latiaoSET_VEHICLE_DOORS_LOCKED" }, ("SET_VEHICLE_DOORS_LOCKED"),
--     function()
--         for k, v in pairs(entities.get_all_vehicles_as_handles()) do
--             VEHICLE.SET_VEHICLE_FIXED(v)
--             VEHICLE.SET_VEHICLE_ENGINE_HEALTH(v, 1000)
--         end
--     end)




menu.toggle_loop(world, "del cops", { "latiaodelcops" }, "latiaodelcops", function()
    for k, ent in pairs(entities.get_all_peds_as_handles()) do
        for _, copsModels in ipairs(
            {
                util.joaat("s_m_y_cop_01"),
                util.joaat("s_m_y_sheriff_01"),
                util.joaat("s_m_y_swat_01"),
                util.joaat("s_m_y_hwaycop_01"),
            }
        ) do
            if ENTITY.GET_ENTITY_MODEL(ent) ==

                copsModels

            then
                entities.delete_by_handle(ent)
                break
            end
        end
    end
end)






menu.toggle_loop(server, "auto host", { "latiaoautohost" }, ("autohost"), function()
    if not (players.get_host() == players.user()) then
        menu.trigger_commands("kick" .. PLAYER.GET_PLAYER_NAME(players.get_host()))
    end
end)
menu.toggle_loop(server, "auto Script host", { "latiaoautoScripthost" }, ("autoScripthost"), function()
    if not (players.get_script_host() == players.user()) then
        util.request_script_host("freemode")
    end
end)


menu.toggle_loop(server, "kickall exclude hosts", { "latiaokickallexcludehost" }, "latiaokickallexcludehost", function()
    for k, pid in pairs(players.list()) do
        if pid == players.get_host() or pid == players.user() then goto out end
        util.trigger_script_event(1 << pid, { -1544003568, pid })
        ::out::
    end
end)



menu.toggle_loop(server, "LOVEkick all moder", { "latiaocrashkickmod" }, "crash and kickmod.", function()
    for k, pid in pairs(players.list()) do
        if pid == players.get_host() or pid == players.user() then goto out end
        if players.is_marked_as_modder(pid) then
            local attack = PLAYER.GET_PLAYER_NAME(pid)
            if pid == players.user() then goto out end
            -- util.toast(attack .. "moder kick ing")
            -- menu.trigger_commands("crash" .. attack)
            -- util.yield(1000)
            menu.trigger_commands("loveletterkick" .. attack)
        end
        ::out::
    end
end)

-- menu.action(server, "crash all", { "latiaocrashall" }, "latiaocrashall", function()
--     for k, pid in pairs(players.list()) do
--         local attack = PLAYER.GET_PLAYER_NAME(pid)
--         if pid == players.user() then goto out end
--         util.toast(attack .. "crash ing")
--         menu.trigger_commands("crash" .. attack)
--         util.yield(1000)
--     end
--     ::out::
-- end)



menu.toggle_loop(server, "if you host kick chinese", { "latiaocrashall" }, "", function()
    if NETWORK.NETWORK_IS_HOST() then
        for k, pid in pairs(players.list()) do
            local language = players.get_language(pid)
            if language and language == 12 then
                local attack = PLAYER.GET_PLAYER_NAME(pid)
                if pid == players.user() then goto out end
                menu.trigger_commands("loveletterkick" .. attack)
                util.yield(100)
            end
            ::out::
        end
    end
end)

menu.toggle_loop(server, "if you host loveletterkick all mod", { "latiaobankallmoder" }, "latiaobankallmoder.",
    function()
        if NETWORK.NETWORK_IS_HOST() then
            for k, pid in pairs(players.list()) do
                if pid == players.user() then goto out end
                if players.is_marked_as_modder(pid) then
                    local attack = PLAYER.GET_PLAYER_NAME(pid)
                    util.toast(attack .. "kick ing")
                    menu.trigger_commands("loveletterkick" .. attack)
                end
                ::out::
            end
        end
    end)





menu.toggle_loop(server, "if you host NETWORK_SESSION_KICK_PLAYER attack mod", { "latiaobankallmoder" },
    "latiaobankallmoder.",
    function()
        if NETWORK.NETWORK_IS_HOST() then
            for k, pid in pairs(players.list()) do
                if pid == players.user() then goto out end
                if players.is_marked_as_attacker(pid) then
                    local attack = PLAYER.GET_PLAYER_NAME(pid)
                    util.toast(attack .. "kick ing")
                    NETWORK.NETWORK_SESSION_KICK_PLAYER(pid)
                end
                ::out::
            end
        end
    end)

menu.toggle_loop(server, "if you host hostkick attack mod", { "latiaobankallmoder" }, "latiaobankallmoder.",
    function()
        if NETWORK.NETWORK_IS_HOST() then
            for k, pid in pairs(players.list()) do
                if pid == players.user() then goto out end
                if players.is_marked_as_attacker(pid) then
                    local attack = PLAYER.GET_PLAYER_NAME(pid)
                    util.toast(attack .. "kick ing")
                    menu.trigger_commands("hostkick" .. attack)
                end
                ::out::
            end
        end
    end)

menu.toggle_loop(server, "if you host loveletterkick attack mod", { "latiaobankallmoder" }, "latiaobankallmoder.",
    function()
        if NETWORK.NETWORK_IS_HOST() then
            for k, pid in pairs(players.list()) do
                if pid == players.user() then goto out end
                if players.is_marked_as_attacker(pid) then
                    local attack = PLAYER.GET_PLAYER_NAME(pid)
                    util.toast(attack .. "kick ing")
                    menu.trigger_commands("loveletterkick" .. attack)
                end
                ::out::
            end
        end
    end)


menu.toggle_loop(server, "if you host ban all moder", { "latiaobankallmoder" }, "latiaobankallmoder.",
    function()
        if NETWORK.NETWORK_IS_HOST() then
            for k, pid in pairs(players.list()) do
                if pid == players.user() then goto out end
                if players.is_marked_as_modder(pid) then
                    local attack = PLAYER.GET_PLAYER_NAME(pid)
                    util.toast(attack .. "kick ing")
                    menu.trigger_commands("ban" .. attack)
                end
                ::out::
            end
        end
    end)

menu.toggle_loop(server, "loveletterkick attack mod", { "latiaobankallmoder" }, "latiaobankallmoder.",
    function()
        for k, pid in pairs(players.list()) do
            if pid == players.user() then goto out end
            if players.is_marked_as_attacker(pid) then
                local attack = PLAYER.GET_PLAYER_NAME(pid)
                util.toast(attack .. "kick ing")
                menu.trigger_commands("loveletterkick" .. attack)
            end
            ::out::
        end
    end)



menu.toggle_loop(server, "if you no host kick for attack you cheat", { "raidallplayer" }, "", function()
    if NETWORK.NETWORK_IS_HOST() then goto out end
    for k, pid in pairs(players.list()) do
        if pid == players.get_host() or pid == players.user() then goto out end
        if players.is_marked_as_attacker(pid) then
            util.toast(PLAYER.GET_PLAYER_NAME(pid) .. "kick ing")
            menu.trigger_commands("loveletterkick" .. PLAYER.GET_PLAYER_NAME(pid))
        end
        ::out::
    end
    ::out::
end)




menu.action(server, "love letter kick all", { "latiaoloveletterkickall" }, "loveletter kick all.", function()
    for k, pid in pairs(players.list()) do
        if pid == players.user() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)

        util.toast(player .. "love kick")
        menu.trigger_commands("loveletterkick" .. player)
        ::out::
    end
end)




menu.action(server, "hostkickall", { "latiaohostkickall" }, "latiaohostkickall.", function()
    if NETWORK.NETWORK_IS_HOST() then
        for k, pid in pairs(players.list()) do
            if pid == players.user() then goto out end
            NETWORK.NETWORK_SESSION_KICK_PLAYER(pid)
            ::out::
        end
    end
end)


menu.action(server, "timeoutall", { "latiaotimeout" }, "latiaotimeout.", function()
    for k, pid in pairs(players.list()) do
        if pid == players.user() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)
        menu.trigger_commands("timeout" .. player)
        ::out::
    end
end)

menu.action(server, "kick me", { "latiaokickme" }, "latiaokickme.", function()
    NETWORK.NETWORK_SESSION_KICK_PLAYER(players.user())
end)

menu.toggle_loop(server, "if you host reportall", { "latiaoreportall" }, "reportall.", function()
    util.yield(1000)
    if NETWORK.NETWORK_IS_HOST() then
        menu.trigger_commands("reportexploitsall")
    end
end)

menu.toggle_loop(server, "kick all for vehicle script_event", { "latiaoreportall" }, "reportall.", function()
    -- util.yield(500)
    for k, pid in pairs(players.list()) do
        util.trigger_script_event(1 << pid, { -503325966 })
    end
end)
menu.toggle_loop(test, "keep script_event", { "latiaoreportall" }, "reportall.", function()
    -- util.yield(500)
    for k, pid in pairs(players.list()) do
        util.trigger_script_event(1 << pid, { 0 })
        -- ::out::
    end
end)
menu.toggle_loop(server, "fake hack attack all no host", { "latiaofackhackattackall" }, "reportall.", function()
    -- util.yield(500)
    for k, pid in pairs(players.list()) do
        if pid == players.get_host() or pid == players.user() then goto out end
        util.trigger_script_event(1 << pid, { -901348601 })
        util.trigger_script_event(1 << pid, { -1638522928 })
        util.trigger_script_event(1 << pid, { -800157557 })
        util.trigger_script_event(1 << pid, { -1496371358 })
        util.trigger_script_event(1 << pid, { 259469385, pid, -1 })

        ::out::
    end
end)

menu.toggle_loop(server, "if you HOST fake hack attack all ", { "latiaofackhackattackall" }, "reportall.", function()
    util.yield(500)
    if NETWORK.NETWORK_IS_HOST() then
        for k, pid in pairs(players.list()) do
            if pid == players.user() then goto out end
            -- menu.trigger_commands("reportexploitsall")
            util.trigger_script_event(1 << pid, { -901348601 })
            util.trigger_script_event(1 << pid, { -1638522928 })
            util.trigger_script_event(1 << pid, { -800157557 })
            util.trigger_script_event(1 << pid, { -1496371358 })
            util.trigger_script_event(1 << pid, { 259469385, pid, -1 })

            ::out::
        end
    end
end)

menu.toggle_loop(server, "if you host kick ad bot", { "latiaoifyouhostkickadbot" }, "reportall.", function()
    if NETWORK.NETWORK_IS_HOST() then
        menu.trigger_command(menu.ref_by_path("Online>Chat>Reactions>Advertisement>Love Letter Kick>Strangers"))
    else
        menu.trigger_command(menu.ref_by_path("Online>Chat>Reactions>Advertisement>Love Letter Kick>Disabled"))
    end
end)

menu.action(server, "bad SOUND for all", { "latiaobedsoundforall" }, "latiaobedsoundforall", function()
    for i = 1, 10 do
        for k, pid in pairs(players.list()) do
            AUDIO.PLAY_SOUND_FROM_ENTITY(-1, "MP_Flash", PLAYER.GET_PLAYER_PED(pid), "WastedSounds", true, true)
        end
    end
end)

menu.action(server, "print all", { "latiaoprintall" }, "latiaocprintall", function()
    for k, pid in pairs(players.list()) do
        local attack = PLAYER.GET_PLAYER_NAME(pid)
        print(attack)
    end
end)



menu.toggle_loop(server, "RandomPlayerEXPLOSION", { "latiaoRandomPlayerEXPLOSION" }, "", function()
    for k, pid in pairs(players.list()) do
        local randomPid = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.list()[math.random(1, #players.list())])



        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid)))
        FIRE.ADD_OWNED_EXPLOSION(randomPid, pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
    end
end)




menu.action(test, "test", { "test" }, "test.", function()

end)

menu.toggle_loop(server, "fm_mission_controller host test", { "latiaofm_mission_controllertest" },
    "latiaofm_mission_controllertest.", function()
        util.draw_debug_text("fm_mission_controller host is " ..
            NETWORK.NETWORK_GET_HOST_OF_SCRIPT("fm_mission_controller") ..
            "ID" .. PLAYER.GET_PLAYER_NAME(NETWORK.NETWORK_GET_HOST_OF_SCRIPT("fm_mission_controller")))
    end)
menu.toggle_loop(server, "fm_mission_controller_2020 host test", { "latiaofm_mission_controller_2020test" },
    "latiaofm_mission_controller_2020test.", function()
        util.draw_debug_text("fm_mission_controller_2020 host is " ..
            NETWORK.NETWORK_GET_HOST_OF_SCRIPT("fm_mission_controller_2020") ..
            "ID" .. PLAYER.GET_PLAYER_NAME(NETWORK.NETWORK_GET_HOST_OF_SCRIPT("fm_mission_controller_2020")))
    end)
menu.toggle_loop(server, "freemode host test", { "latiaofreemodetest" }, "latiaofreemodetest.", function()
    util.draw_debug_text("freemode host is " ..
        NETWORK.NETWORK_GET_HOST_OF_SCRIPT("freemode", -1, 0) ..
        "ID" .. PLAYER.GET_PLAYER_NAME(NETWORK.NETWORK_GET_HOST_OF_SCRIPT("freemode", -1, 0)))
end)



menu.toggle_loop(server, "fm_mission_controller GET_INT_LOCAL", { "latiaofm_mission_controllertest" },
    "latiaofm_mission_controllertest.", function()
        local function safe_get_int_local(variable, value)
            local result = GET_INT_LOCAL(variable, value)
            if result ~= nil then
                return result
            else
                return "error"
            end
        end

        local value1 = safe_get_int_local("fm_mission_controller", 28331 + 1)
        util.draw_debug_text("fm_mission_controller 28331 + 1 = " .. value1)

        local value2 = safe_get_int_local("fm_mission_controller", 31587 + 69)
        util.draw_debug_text("fm_mission_controller 31587 + 69 = " .. value2)
    end)

menu.toggle_loop(server, "fm_mission_controller_2020 GET_INT_LOCAL", { "latiaofm_mission_controllertest" },
    "latiaofm_mission_controllertest.", function()
        local function safe_get_int_local(variable, value)
            local result = GET_INT_LOCAL(variable, value)
            if result ~= nil then
                return result
            else
                return "error"
            end
        end

        local value1 = safe_get_int_local("fm_mission_controller_2020", 45450 + 1)
        util.draw_debug_text("fm_mission_controller_2020 45450 + 1 = " .. value1)

        local value2 = safe_get_int_local("fm_mission_controller_2020", 45450 + 1378 + 1)
        util.draw_debug_text("fm_mission_controller_2020 31587 + 45450 + 1378 + 1 = " .. value2)
    end)


menu.toggle_loop(server, "REQUES_ENTITY ped", { "latiaoREQUES_ENTITYped" }, "latiaoREQUES_ENTITYped.", function()
    for _, target in ipairs(entities.get_all_peds_as_handles()) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
    end
end)


menu.toggle_loop(server, "REQUES_ENTITY objects", { "latiaoREQUES_ENTITYobjects" }, "REQUES_ENTITYobjects.", function()
    for _, target in ipairs(entities.get_all_objects_as_handles()) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
    end
end)

menu.toggle_loop(server, "REQUES_ENTITY vehicles", { "latiaoREQUES_ENTITYvehicles" }, "REQUES_ENTITYvehicles.",
    function()
        for _, target in ipairs(entities.get_all_vehicles_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
        end
    end)

menu.toggle_loop(server, "REQUES_ENTITY pickups", { "" }, "", function()
    for k, target in pairs(entities.get_all_pickups_as_handles()) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
    end
end)





menu.action(test, "NETWORK_SESSION_END", { "latiaoNETWORK_SESSION_END" }, "NETWORK_SESSION_END.", function()
    NETWORK.NETWORK_SESSION_END(0, 0);
end)


menu.action(test, "IS_SCRIPTED_CONVERSATION_ONGOING", { "latiaoIS_SCRIPTED_CONVERSATION_ONGOING" },
    "IS_SCRIPTED_CONVERSATION_ONGOING.", function()
        AUDIO.STOP_SCRIPTED_CONVERSATION(false)
    end)




menu.action(world, "autoDRIVE", { "latiaoautoDRIVE" }, "autoDRIVE.", function()
    local pos = v3.new(HUD.GET_BLIP_COORDS(HUD.GET_FIRST_BLIP_INFO_ID(8)))
    TASK.TASK_VEHICLE_DRIVE_TO_COORD(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()),
        entities.get_user_vehicle_as_handle(), pos.x, pos.y, pos.z, 1000.0, 1.0,
        ENTITY.GET_ENTITY_MODEL(entities.get_user_vehicle_as_handle()), 787004, 1.0, 1)
end)


menu.action(world, "stopautoDRIVE", { "latiaostopautoDRIVE" }, "stopautoDRIVE.", function()
    TASK.CLEAR_PED_TASKS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()))
end)

menu.action(server, "Bad PARACHUTE_MODEL Crash All", { "latiaocrashall" }, "crashall.", function()
    STREAMING.REQUEST_MODEL(util.joaat("prop_beach_parasol_05"))
    while not STREAMING.HAS_MODEL_LOADED(util.joaat("prop_beach_parasol_05")) do util.yield() end
    PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(players.user(), util.joaat("prop_beach_parasol_05"))
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()), 0, 0, 500, 0, 0, 0)
    util.yield(1000)
    PED.FORCE_PED_TO_OPEN_PARACHUTE(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()))
    util.yield(5000)
    menu.trigger_commands("tpmazehelipad")
    PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(players.user(), 0)
end)


menu.action(test, "tp test", { "latiaotptest" }, "latiaotptest.", function()
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()), 2147483647, 2147483647, -100,
        0,
        0, 0)
end)



menu.action(test, "getallplayerpedid", { "latiaogetallplayerpedid" }, "latiaogetallplayerpedid.", function()
    for k, pid in pairs(players.list()) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        print("Name " .. PLAYER.GET_PLAYER_NAME(pid) .. "PID " .. pid .. "PED " .. ped, true, true, true)
    end
end)
menu.toggle_loop(test, "clean chat", { "latiaocleanchat" }, "latiaocleanchat.", function()
    chat.send_message("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", false, true, true)
end)





menu.action(test, "CLEAR_ALL_HELP_MESSAGES", { "latiaoCLEAR_ALL_HELP_MESSAGES" }, "CLEAR_ALL_HELP_MESSAGES.", function()
    HUD.CLEAR_ALL_HELP_MESSAGES()
end)













menu.toggle_loop(dividends, "jump hack", { "latiaojumphack" }, "latiaojumphack.", function()
    SET_INT_LOCAL("fm_mission_controller_2020", 23669, 5)
    SET_INT_LOCAL("fm_mission_controller_2020", 28446, 6)
    SET_FLOAT_LOCAL("fm_mission_controller_2020", 29685 + 3, 100)
    SET_INT_LOCAL("fm_mission_controller_2020", 1718, GET_INT_LOCAL("fm_mission_controller_2020", 1719))
    SET_INT_LOCAL("fm_mission_controller", 52964, 5)
    SET_INT_LOCAL("fm_mission_controller", 54026, 5)
    SET_INT_LOCAL("fm_mission_controller", 10101 + 7, GET_INT_LOCAL("fm_mission_controller", 10101 + 37))
    SET_INT_LOCAL("fm_mission_controller", 1509, 3)
    SET_INT_LOCAL("fm_mission_controller", 1540, 2)
    SET_INT_LOCAL("fm_mission_controller", 1266 + 135, 3)
    SET_INT_LOCAL("fm_mission_controller", 11760 + 24, 7)
    SET_FLOAT_LOCAL("fm_mission_controller", 10061 + 11, 100)
    SET_LOCAL_BIT("fm_mission_controller", 9767, 9)
    SET_INT_LOCAL("fm_mission_controller_2020", 975 + 135, 3)
end)
menu.action(dividends, "MPPLY_H3_COOLDOWN", { "" }, "MPPLY_H3_COOLDOWN.", function()
    STAT_SET_INT("MPPLY_H3_COOLDOWN", -1)
end)

menu.action(dividends, "H3_COMPLETEDPOSIX", { "" }, "H3_COMPLETEDPOSIX.", function()
    STAT_SET_INT("H3_COMPLETEDPOSIX", -1)
end)

menu.action(dividends, "load casino Boards H3OPT_BITSET", { "" }, "H3OPT_BITSET1.", function()
    STAT_SET_INT("H3OPT_BITSET1", -1)
    STAT_SET_INT("H3OPT_BITSET0", -1)
end)

local nohostalldividends = menu.slider(dividends, "nohostalldividends", { "nohostcasino" }, "", -100000, 100000, 100, 5,
    function()

    end)

menu.toggle_loop(dividends, "casino and Perico and Doomsday for you(you not host)", { "" }, "latiaonohost.", function()
    SET_INT_GLOBAL(2684820 + 6606, menu.get_value(nohostalldividends))
end)



local casino = menu.slider(dividends, "casino", { "casino" }, "max 3600000", -100000, 100000, 100, 5, function() end)
menu.action(dividends, "casino all (you host)", { "latiaocasinoallhost" }, "latiaocasinoallhost.", function()
    SET_INT_GLOBAL(1971696 + 1497 + 736 + 92 + 1, menu.get_value(casino))

    SET_INT_GLOBAL(1971696 + 1497 + 736 + 92 + 2, menu.get_value(casino))

    SET_INT_GLOBAL(1971696 + 1497 + 736 + 92 + 3, menu.get_value(casino))

    SET_INT_GLOBAL(1971696 + 1497 + 736 + 92 + 4, menu.get_value(casino))
end)


menu.action(dividends, "casino Forced Launch", { "" }, "latiaonohost.", function()
    SET_INT_GLOBAL(1971696 + 1497 + 736 + 87 + 0, -1)
    SET_INT_GLOBAL(1971696 + 1497 + 736 + 87 + 1, -1)
    SET_INT_GLOBAL(1971696 + 1497 + 736 + 87 + 2, -1)
    SET_INT_GLOBAL(1971696 + 1497 + 736 + 87 + 3, -1)
end)
menu.action(dividends, "casino Board3", { "latiaoBoard3" }, "latiaoBoard3.", function()
    SET_INT_GLOBAL(1971696 + 1497 + 1017, 11)
    SET_INT_GLOBAL(1971696 + 1497 + 1018, 11)
    -- SET_INT_GLOBAL(1971696 + 1497 + 1017, 2, -1)
    -- SET_INT_GLOBAL(1971696 + 1497 + 1017, 3, -1)
    menu.trigger_commands("latiaoRefreshBoards")
end)
menu.action(dividends, "RefreshBoards", { "latiaoRefreshBoards" }, "",
    function()
        STAT_SET_INT("H3OPT_BITSET0", 0)
        STAT_SET_INT("H3OPT_BITSET1", 0)
        util.yield_once()
        STAT_SET_INT("H3OPT_BITSET0", -1)
        STAT_SET_INT("H3OPT_BITSET1", -1)
    end)




local Doomsday = menu.slider(dividends, "Doomsday", { "Doomsday" }, "2400000", -100000, 100000, 100, 5, function() end)

menu.action(dividends, "Doomsday all (you host)", { "latiaoDoomsdayallyouhost" }, "latiaoDoomsdayallyouhost.", function()
    SET_INT_GLOBAL(1967630 + 812 + 50 + 1, menu.get_value(Doomsday))

    SET_INT_GLOBAL(1967630 + 812 + 50 + 2, menu.get_value(Doomsday))

    SET_INT_GLOBAL(1967630 + 812 + 50 + 3, menu.get_value(Doomsday))

    SET_INT_GLOBAL(1967630 + 812 + 50 + 4, menu.get_value(Doomsday))
end)







menu.action(dividends, "load Perico", {}, "", function()
    STAT_SET_INT("H4_MISSIONS", -1)
    STAT_SET_INT("H4CNF_APPROACH", -1)
    STAT_SET_INT("H4CNF_BS_ENTR", 63)
    STAT_SET_INT("H4CNF_BS_GEN", 63)
    STAT_SET_INT("H4CNF_WEP_DISRP", 3)
    STAT_SET_INT("H4CNF_ARM_DISRP", 3)
    STAT_SET_INT("H4CNF_HEL_DISRP", 3)
end)

local Perico = menu.slider(dividends, "Perico", { "Perico" }, "2550000", -2147483647, 2147483647, 100, 5, function() end)

menu.action(dividends, "Perico all (you host)", { "" }, "latiaoPericoallyouhost.", function()
    SET_INT_GLOBAL(1978495 + 825 + 56 + 1, menu.get_value(Perico))
    SET_INT_GLOBAL(1978495 + 825 + 56 + 2, menu.get_value(Perico))
    SET_INT_GLOBAL(1978495 + 825 + 56 + 3, menu.get_value(Perico))
    SET_INT_GLOBAL(1978495 + 825 + 56 + 4, menu.get_value(Perico))
end)
local Pericotarget = menu.slider(dividends, "Pericotarget", { "Pericotarget" }, "", -2147483647, 2147483647, 1000, 5,
    function() end)
menu.action(dividends, "Pericotarget_money ", { "latiaoPericotarget_money" }, ".",
    function()
        SET_INT_GLOBAL(262145 + 30189 + 0, menu.get_value(Pericotarget))
        SET_INT_GLOBAL(262145 + 30189 + 1, menu.get_value(Pericotarget))
        SET_INT_GLOBAL(262145 + 30189 + 2, menu.get_value(Pericotarget))
        SET_INT_GLOBAL(262145 + 30189 + 3, menu.get_value(Pericotarget))
        SET_INT_GLOBAL(262145 + 30189 + 4, menu.get_value(Pericotarget))
        SET_INT_GLOBAL(262145 + 30189 + 5, menu.get_value(Pericotarget))
    end)
menu.action(dividends, "Pericoinfinite bag_size", { "latiaoPericoinfinitebag_size" }, "latiaoPericoinfinitebag_size.",
    function()
        SET_INT_GLOBAL(262145 + 29939, 100000000)
    end)

local Apartment = menu.slider(dividends, "Apartment", { "Apartment" }, "15000000", -2147483647, 2147483647, 100, 100,
    function() end)

menu.action(dividends, "Apartment all (you host)", { "latiaoApartmentallyouhost" }, "latiaoApartmentallyouhost.",
    function()
        SET_INT_GLOBAL(1938365 + 3008 + 1, menu.get_value(Apartment))
        SET_INT_GLOBAL(1938365 + 3008 + 2, menu.get_value(Apartment))
        SET_INT_GLOBAL(1938365 + 3008 + 3, menu.get_value(Apartment))
        SET_INT_GLOBAL(1938365 + 3008 + 4, menu.get_value(Apartment))
    end)
menu.action(dividends, "request_script_host", { "latiaoNrequest_script_host" }, "latiaoNrequest_script_host.", function()
    util.request_script_host("freemode")
    util.request_script_host("fm_mission_controller_2020")
    util.request_script_host("fm_mission_controller")
end)

menu.action(dividends, "fin fm_mission_controller_2020", { "fin fm_mission_controller_2020" },
    "finfm_mission_controller_2020",
    function()
        SET_INT_LOCAL("fm_mission_controller_2020", 45450 + 1, 51338752)
        SET_INT_LOCAL("fm_mission_controller_2020", 45450 + 1378 + 1, 50)
    end)

local money = menu.slider(dividends, "fm_mission_controller money", { "fm_mission_controllermoney" },
    "fm_mission_controllermoney", -2147483647,
    2147483647, 3000000, 100000,
    function() end)

menu.action(dividends, "moneyfm_mission_controller", { "moneyfm_mission_controller" }, "moneyfinfm_mission_controller",
    function()
        SET_INT_LOCAL("fm_mission_controller", 19710 + 2686, menu.get_value(money))
    end)





menu.action(dividends, "finfm_mission_controller", { "finfmc" }, "finfm_mission_controller", function()
    SET_INT_LOCAL("fm_mission_controller", 28331 + 1, 100000000)
    SET_INT_LOCAL("fm_mission_controller", 31587 + 69, 100000000)
end)


-- player root
local function testMenuSetup(pid)
    menu.divider(menu.player_root(pid), "test")

    local testMenu = menu.list(menu.player_root(pid), "test", {}, "")


    menu.toggle_loop(testMenu, "test", {}, "", function()
        print(pid)
        if not players.exists(pid) then util.stop_thread() end
    end)


    menu.action(testMenu, "block join", { "laitaoblockjoin" }, "", function()
        local player = PLAYER.GET_PLAYER_NAME(pid)
        menu.trigger_command(menu.ref_by_path("Online>Player History>" .. pid .. ">Player Join Reactions>Notification"))
        menu.trigger_commands("historyblock" .. player .. " on")
        menu.trigger_commands("loveletterkick" .. player)
        menu.trigger_commands("historynote" .. player .. " latiaoblockjoin")
    end)



    menu.toggle_loop(testMenu, "SHOOT", {}, "", function()
        local playerPed = PLAYER.GET_PLAYER_PED(pid)
        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
        AddPos:add(v3.new(0, 0, 1))
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100, true,
            0x6E7DDDEC, players.user_ped(), false, true, 1)
        if not players.exists(pid) then util.stop_thread() end
    end)


    menu.toggle_loop(testMenu, "menukill", { "latiaobanmoder" }, "", function()
        menu.trigger_commands("kill" .. PLAYER.GET_PLAYER_NAME(pid))
        if not players.exists(pid) then util.stop_thread() end
    end)


    menu.toggle_loop(testMenu, "NickEXPLOSION", { "latiaobanmoder" }, "", function()
        local playerPed = PLAYER.GET_PLAYER_PED(pid)
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
        if not players.exists(pid) then util.stop_thread() end
        -- end)
    end)


    menu.toggle_loop(testMenu, "RandomPlayerEXPLOSION", { "latiaoRandomPlayerEXPLOSION" }, "", function()
        local randomPid = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.list()[math.random(1, #players.list())])



        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid)))
        FIRE.ADD_OWNED_EXPLOSION(randomPid, pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.toggle_loop(testMenu, "MEEXPLOSION", { "latiaobanmoder" }, "", function()
        local playerPed = PLAYER.GET_PLAYER_PED(pid)
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
        if not players.exists(pid) then util.stop_thread() end
        -- end
    end)


    menu.toggle_loop(testMenu, "NickFlameLoop", { "latiaoFlameLoop" }, "", function()
        local playerPed = PLAYER.GET_PLAYER_PED(pid)
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 12, 2147483647, false, true, 0.0)
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.toggle_loop(testMenu, "FlameLoop", { "latiaoFlameLoop" }, "", function()
        local playerPed = PLAYER.GET_PLAYER_PED(pid)
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 12, 2147483647, true, false, 0.0)
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.toggle_loop(testMenu, "CopLoop", { "latiaoFlameLoop" }, "", function()
        STREAMING.REQUEST_MODEL(util.joaat("s_m_y_cop_01"))
        while not STREAMING.HAS_MODEL_LOADED(util.joaat("s_m_y_cop_01")) do util.yield() end
        local playerPed = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(playerPed)
        pos.x = pos.x + math.random(-10, 10)
        pos.y = pos.y + math.random(-10, 10)
        -- pos.z = pos.z
        PED.CREATE_PED(0, util.joaat("s_m_y_cop_01"), pos.x, pos.y, pos.z, 0, true, true)
        -- print(pos.x, pos.y, pos.z)
        if not players.exists(pid) then util.stop_thread() end
        -- end
    end)



    menu.toggle_loop(testMenu, "summon gold", { "latiaosummongold" }, "latiaosummongold.", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        entities.create_object(
            util.joaat("ch_prop_gold_trolly_01a", "ch_prop_gold_trolly_01b", "ch_prop_gold_trolly_01c"),
            ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        if not players.exists(pid) then util.stop_thread() end
    end)






    menu.action(testMenu, "bad TASK crash", { "latiaobadTASKcrash" }, "", function()
        STREAMING.REQUEST_MODEL(util.joaat("a_c_rat"))
        while not STREAMING.HAS_MODEL_LOADED(util.joaat("a_c_rat")) do util.yield() end
        local TargetPPos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        local PED1 = entities.create_ped(28, util.joaat("a_c_rat"), TargetPPos, 0)

        WEAPON.GIVE_WEAPON_TO_PED(PED1, -1813897027, 1, true, true)

        util.yield(1000)

        TASK.TASK_THROW_PROJECTILE(PED1, TargetPPos.x, TargetPPos.y, TargetPPos.z, 0, 0)
    end)

    menu.action(testMenu, "bad BREAK_OBJECT crash", { "latiaobadBREAK_OBJECTcrash" }, "", function()
        STREAMING.REQUEST_MODEL(util.joaat("prop_fragtest_cnst_04"))
        while not STREAMING.HAS_MODEL_LOADED(util.joaat("prop_fragtest_cnst_04")) do util.yield() end
        entities.create_object(util.joaat("prop_fragtest_cnst_04"),
            ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid)))
        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
    end)


    menu.toggle_loop(testMenu, "freemode script crash kick", { "latiaoscriptkick" }, "", function()
        util.trigger_script_event(1 << pid, { -1544003568 })
        if not players.exists(pid) then util.stop_thread() end
    end)
    menu.action(testMenu, "NETWORK_SESSION_KICK_PLAYER", { "latiaoNETWORK_SESSION_KICK_PLAYER" }, "", function()
        NETWORK.NETWORK_SESSION_KICK_PLAYER(pid)
    end)


    menu.toggle_loop(testMenu, "tun spamm crash", { "latiaotunspammcrash" }, "", function()
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        STREAMING.REQUEST_MODEL(util.joaat("tug"))
        while not STREAMING.HAS_MODEL_LOADED(util.joaat("tug")) do util.yield() end
        entities.create_vehicle(util.joaat("tug"), pos, 0)
        for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
            if ENTITY.GET_ENTITY_MODEL(ent) == ipairs(util.joaat("tug")) then
                ENTITY.SET_ENTITY_COORDS(ent, pos.x, pos.y, pos.z, false)
            end
        end
        if not players.exists(pid) then util.stop_thread() end
    end)



    menu.action(testMenu, "del tun", { "latiaoNETWORK_SESSION_KICK_PLAYER" }, "", function()
        -- local tunModels = { util.joaat("tug"), }
        for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
            -- local entModel = ENTITY.GET_ENTITY_MODEL(ent)

            -- for _, tunModels in ipairs(util.joaat("tug")) do
            if ENTITY.GET_ENTITY_MODEL(ent) == util.joaat("tug") then
                entities.delete_by_handle(ent)
            end
            -- end
        end
    end)
    menu.toggle_loop(testMenu, "kick vehicles", { "latiaokickvehicles" }, "latiaokickvehicles.", function()
        -- util.yield(500)

        util.trigger_script_event(1 << pid, { -503325966 })
        if not players.exists(pid) then util.stop_thread() end
    end)
    menu.toggle_loop(testMenu, "fake hack attack", { "latiaofackhackattack" }, "latiaofackhackattack.", function()
        -- util.yield(500)
        util.trigger_script_event(1 << pid, { -901348601 })
        util.trigger_script_event(1 << pid, { -1638522928 })
        util.trigger_script_event(1 << pid, { -1321657966 })
        util.trigger_script_event(1 << pid, { -1496371358 })
        util.trigger_script_event(1 << pid, { 259469385, pid, -1 })
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.toggle_loop(testMenu, "host freeze", { "" }, ".", function()
        util.trigger_script_event(1 << pid, { -1321657966, 0, pid, 0, 0, 115 })

        if not players.exists(pid) then util.stop_thread() end
    end)
    menu.toggle_loop(testMenu, "kick host", { "" }, ".", function()
        util.trigger_script_event(1 << pid, { -1496371358, pid, -1 })

        if not players.exists(pid) then util.stop_thread() end
    end)
    menu.toggle_loop(testMenu, "wok freeze", { "" }, ".", function()
        util.yield(1000)
        util.trigger_script_event(1 << pid, { 259469385 })

        if not players.exists(pid) then util.stop_thread() end
    end)
    menu.toggle_loop(testMenu, "bad SOUND for all", { "latiaobedsoundforall" }, "latiaobedsoundforall", function()
        AUDIO.PLAY_SOUND_FROM_ENTITY(-1, "MP_Flash", PLAYER.GET_PLAYER_PED(pid), "WastedSounds", true, true)
        if not players.exists(pid) then util.stop_thread() end
        -- end
    end)




    menu.action(testMenu, "give_script_host", { "give_script_host" }, "give_script_host.", function()
        util.request_script_host("freemode")
        util.request_script_host("freemode")
        util.request_script_host("fm_mission_controller")
        util.yield(5000)
        util.give_script_host("freemode", pid)
        util.give_script_host("freemode", pid)
        util.give_script_host("fm_mission_controller", pid)
    end)

    menu.action(testMenu, "latiaoGHOSTModetrue", { "latiaoGHOSTMode" }, "", function()
        NETWORK.SET_REMOTE_PLAYER_AS_GHOST(pid, true)
    end)

    menu.action(testMenu, "latiaoGHOSTModefalse", { "latiaoGHOSTMode" }, "", function()
        NETWORK.SET_REMOTE_PLAYER_AS_GHOST(pid, false)
    end)
    menu.action(testMenu, "latiaoloadtest", { "latiaoGHOSTMode" }, "", function()
        local load = memory.read_int(memory.script_global(((2657704 + 1) + (pid * 463)) + 232)) -- Global_2657704[PLAYER::PLAYER_ID() /*463*/].f_232
        print(load)
    end)
end












for _, pid in ipairs(players.list()) do
    testMenuSetup(pid)
end

players.on_join(testMenuSetup)





menu.toggle_loop(world, "NICKFlameLoopALLPlayer", { "NICKFlameLoopALLPlayer" }, "", function()
    for k, pid in pairs(players.list()) do
        if ENTITY.IS_ENTITY_DEAD(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) then goto out end
        if PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid) == players.user_ped() then goto out end
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 12, 2147483647, false, true, 0.0)
        ::out::
    end
end)
menu.toggle_loop(test, "raidallplayer", { "raidallplayer" }, "", function()
    for k, pid in pairs(players.list()) do
        -- if pid == players.get_host() or pid == players.user() then goto out end
        util.trigger_script_event(1 << pid, { -1906536929, pid })
        ::out::
    end
end)








menu.toggle_loop(server, "tun spamm crash fake Location", { "latiaotunspammcrash" }, "", function()
    STREAMING.REQUEST_MODEL(util.joaat("tug"))
    while not STREAMING.HAS_MODEL_LOADED(util.joaat("tug")) do util.yield() end
    entities.create_vehicle(util.joaat("tug"), v3(10000.0, 10000.0, -100.0), 0)
end)



menu.toggle_loop(server, "bad post", { "latiaobadpost" }, ("latiaobadpost"), function()
    menu.trigger_commands("spoofpos")
end)



menu.toggle_loop(test, "debugshot", { "latiaodebugshot" }, ("latiaobadpost"), function()
    local outptr = memory.alloc(4)
    local aim_info = { handle = 0 }
    if PLAYER.GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(players.user(), outptr) then
        local handle = memory.read_int(outptr)
        aim_info.hash = ENTITY.GET_ENTITY_MODEL(handle)
        aim_info.model = util.reverse_joaat(aim_info.hash)
        aim_info.health = ENTITY.GET_ENTITY_HEALTH(handle)
        aim_info.OWNER = PLAYER.GET_PLAYER_NAME(entities.get_owner(handle))
        local text = "hash=" ..
            aim_info.hash ..
            "," .. "model=" .. aim_info.model .. "," .. "health=" .. aim_info.health .. "," .. "owner=" ..
            aim_info.OWNER .. ","
        directx.draw_text(0.5, 0.5, text, 5, 0.5, { r = 255, g = 0, b = 0, a = 255 }, true)
        print(text)
    end
end)



menu.action(world, "tp casino gold", { "" }, "", function()
    local pos = players.get_position(players.user())
    local Models = {
        util.joaat("ch_prop_gold_trolly_01a"),
        util.joaat("ch_prop_gold_trolly_01b"),
        util.joaat("ch_prop_gold_trolly_01c"),
        util.joaat("ch_prop_cash_low_trolly_01a"),
        util.joaat("ch_prop_cash_low_trolly_01b"),
        util.joaat("ch_prop_cash_low_trolly_01c"),
        util.joaat("ch_prop_ch_cash_trolly_01a"),
        util.joaat("ch_prop_ch_cash_trolly_01b"),
        util.joaat("ch_prop_ch_cash_trolly_01c"),
        util.joaat("ch_prop_diamond_trolly_01a"),
        util.joaat("ch_prop_diamond_trolly_01b"),
        util.joaat("ch_prop_diamond_trolly_01c"),
    }

    for _, ent in pairs(entities.get_all_objects_as_handles()) do
        local entModel = ENTITY.GET_ENTITY_MODEL(ent)

        for _, Model in ipairs(Models) do
            if entModel == Model then
                ENTITY.SET_ENTITY_COORDS(ent, pos.x, pos.y, pos.z, false)
                break
            end
        end
    end
end)

menu.action(world, "tp fingerprint_scanner", { "" }, "", function()
    local pos = players.get_position(players.user())
    pos:add(v3.new(0, 0, 0.5))
    local Models = {
        util.joaat("ch_prop_fingerprint_scanner_01a"),
        util.joaat("ch_prop_fingerprint_scanner_01b"),
        util.joaat("ch_prop_fingerprint_scanner_01c"),
        util.joaat("ch_prop_fingerprint_scanner_01d"),
        util.joaat("ch_prop_fingerprint_scanner_01e"),
    }

    for _, ent in pairs(entities.get_all_objects_as_handles()) do
        local entModel = ENTITY.GET_ENTITY_MODEL(ent)

        for _, Model in ipairs(Models) do
            if entModel == Model then
                ENTITY.SET_ENTITY_COORDS(ent, pos.x, pos.y, pos.z, false)
                break
            end
        end
    end
end)


menu.toggle_loop(world, "set cctv_cam tp 0,0,1000", { "" }, "", function()
    local Models = {
        util.joaat("xm_prop_x17_server_farm_cctv_01"),
        util.joaat("ch_prop_ch_cctv_cam_02a"),
        util.joaat("prop_cctv_cam_05a"),
    }

    for _, ent in pairs(entities.get_all_objects_as_handles()) do
        local entModel = ENTITY.GET_ENTITY_MODEL(ent)

        for _, Model in ipairs(Models) do
            if entModel == Model then
                ENTITY.SET_ENTITY_COORDS(ent, 0, 0, 1000, false)
                break
            end
        end
    end
end)

menu.toggle_loop(world, "del cctv_cam(pls use in solo if bug)", { "" }, "", function()
    local Models = {
        util.joaat("xm_prop_x17_server_farm_cctv_01"),
        util.joaat("ch_prop_ch_cctv_cam_02a"),
        util.joaat("prop_cctv_cam_05a"),
    }

    for _, ent in pairs(entities.get_all_objects_as_handles()) do
        local entModel = ENTITY.GET_ENTITY_MODEL(ent)

        for _, Model in ipairs(Models) do
            if entModel == Model then
                entities.delete_by_handle(ent)
                break
            end
        end
    end
end)

menu.action(test, "latiaoQUIT_GAME", { "latiaoQUIT_GAME" }, "", function()
    MISC.QUIT_GAME()
end)


menu.toggle_loop(server, "latiaoGHOSTMode", { "latiaoGHOSTMode" }, "", function()
    for k, pid in pairs(players.list()) do
        NETWORK.SET_REMOTE_PLAYER_AS_GHOST(pid, true)
    end
end, function()
    for k, pid in pairs(players.list()) do
        NETWORK.SET_REMOTE_PLAYER_AS_GHOST(pid, false)
    end
end)


menu.toggle_loop(server, "TALKING TEST", { "LATIAOTALKINGTEST" }, "", function()
    for k, pid in pairs(players.list()) do
        if NETWORK.NETWORK_IS_PLAYER_TALKING(pid) then
            util.draw_debug_text(players.get_name(pid) .. " TALKING")
        end
    end
end)

menu.toggle_loop(server, "block am_hunt_the_Beast", { "latiaoblockam_hunt_the_Beast" }, "latiaoblockam_hunt_the_Beast",
    function()
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(util.joaat("am_hunt_the_Beast")) > 0 then
            util.toast("am_hunt_the_Beast Start ID:" ..
                SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(util.joaat("am_hunt_the_Beast")))
            MISC.TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME("am_hunt_the_Beast")
        end
    end)

menu.toggle_loop(server, "block am_gang_call", { "latiaoblockam_gang_call" }, "latiaoblockam_gang_call",
    function()
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(util.joaat("am_gang_call")) > 0 then
            util.toast("am_gang_call Start ID:" ..
            SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(util.joaat("am_gang_call")))
            MISC.TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME("am_gang_call")
        end
    end)



menu.toggle(server, "NETWORK_START_SOLO_TUTORIAL_SESSION", { "latiaoNETWORK_START_SOLO_TUTORIAL_SESSION" },
    "NETWORK_START_SOLO_TUTORIAL_SESSION", function(on)
        if on then
            NETWORK.NETWORK_START_SOLO_TUTORIAL_SESSION()
        else
            NETWORK.NETWORK_END_TUTORIAL_SESSION()
        end
    end)

menu.toggle_loop(server, "block bounty", { "latiaoblockbounty" }, "latiaoblockbounty",
    function()
        if players.get_bounty(players.user()) ~= nil then
            menu.trigger_commands("removebounty")
            print("removebounty")
            util.yield(1000)
        end
    end)




menu.toggle_loop(world, "auto SET_ENTITY_HEALTH 0 ch_prop_ch_mobile_jammer_01x", { "" }, "", function()
    local Models = {
        util.joaat("ch_prop_ch_mobile_jammer_01x"),
    }

    for _, ent in pairs(entities.get_all_objects_as_handles()) do
        local entModel = ENTITY.GET_ENTITY_MODEL(ent)

        for _, Model in ipairs(Models) do
            if entModel == Model then
                ENTITY.SET_ENTITY_HEALTH(ent, 0)
                break
            end
        end
    end
end)


local HEALTH = menu.slider(world, "SET_ENTITY_HEALTH up", { "SET_ENTITY_HEALTH" },
    "SET_ENTITY_HEALTH", 0,
    2147483647, 100, 1,
    function() end)

menu.toggle_loop(world, "SET_ENTITY_HEALTH for get_all_objects_as_handles", { "" }, "", function()
    for _, ent in pairs(entities.get_all_objects_as_handles()) do
        ENTITY.SET_ENTITY_HEALTH(ent, menu.get_value(HEALTH))
    end
end)
menu.toggle_loop(world, "SET_ENTITY_HEALTH for get_all_peds_as_handles", { "" }, "", function()
    for k, ent in pairs(entities.get_all_peds_as_handles()) do
        if PED.GET_PED_TYPE(ent) <= 3 then goto out end
        ENTITY.SET_ENTITY_HEALTH(ent, menu.get_value(HEALTH))
        ::out::
    end
end)
menu.toggle_loop(world, "SET_ENTITY_HEALTH for get_all_vehicles_as_handles", { "" }, "", function()
    for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
        ENTITY.SET_ENTITY_HEALTH(ent, menu.get_value(HEALTH))
    end
end)
menu.toggle_loop(world, "SET_ENTITY_HEALTH for get_all_pickups_as_handles", { "" }, "", function()
    for k, ent in pairs(entities.get_all_pickups_as_handles()) do
        ENTITY.SET_ENTITY_HEALTH(ent, menu.get_value(HEALTH))
    end
end)
