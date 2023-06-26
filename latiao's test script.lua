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
    local DatePTR = memory.alloc(8*7) -- Thanks for helping memory stuffs, aaronlink127#0127
    memory.write_int(DatePTR, year)
    memory.write_int(DatePTR+8, month)
    memory.write_int(DatePTR+16, day)
    memory.write_int(DatePTR+24, hour)
    memory.write_int(DatePTR+32, min)
    memory.write_int(DatePTR+40, 0) -- Seconds
    memory.write_int(DatePTR+48, 0) -- Milliseconds
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
    local DatePTR = memory.alloc(8*7)
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



local self = menu.list(menu.my_root(), "self", {}, "")


menu.toggle_loop(self, "heal/armour", {}, "", function()
    local current_health = ENTITY.GET_ENTITY_HEALTH(PLAYER.PLAYER_PED_ID())
    local max_health = PED.GET_PED_MAX_HEALTH(PLAYER.PLAYER_PED_ID())
    local current_armour = PED.GET_PED_ARMOUR(PLAYER.PLAYER_PED_ID())
    local max_armour = PLAYER.GET_PLAYER_MAX_ARMOUR(PLAYER.PLAYER_ID())
    local text = "heal: " .. current_health .. "/" .. max_health ..
        "\narmour: " .. current_armour .. "/" .. max_armour
    util.draw_debug_text(text)
end)
menu.toggle_loop(self, "EVERYONE IGNORE PLAYER", {}, "", function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(PLAYER.PLAYER_ID(), true)
end, function()
    PLAYER.SET_EVERYONE_IGNORE_PLAYER(PLAYER.PLAYER_ID(), false)
end)
menu.toggle_loop(self, "silence", {}, "", function()
    PLAYER.SET_PLAYER_NOISE_MULTIPLIER(PLAYER.PLAYER_ID(), 0.0)
    PLAYER.SET_PLAYER_SNEAKING_NOISE_MULTIPLIER(PLAYER.PLAYER_ID(), 0.0)
end)




local world = menu.list(menu.my_root(), "world", {}, "")


menu.action(world, "delallobjects", { "latiaodelallobjects" }, "delallobjects.", function()
    for k, ent in pairs(entities.get_all_objects_as_handles()) do
        entities.delete_by_handle(ent)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
    end
end)

menu.action(world, "delallpeds", { "latiaodelallpeds" }, "delallpeds.", function()
    for k, ent in pairs(entities.get_all_peds_as_handles()) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
        entities.delete_by_handle(ent)
    end
end)



menu.action(world, "delallvehicles", { "latiaodelallvehicles" }, "delallvehicles.", function()
    for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
        entities.delete_by_handle(ent)
    end
end)

menu.action(world, "delallpickups", { "latiaodelallvehicles" }, "delallvehicles.", function()
    for k, ent in pairs(entities.get_all_pickups_as_handles()) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
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
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
        entities.delete_by_handle(target)
        menu.trigger_commands("deleteropes")
    end
end)



menu.toggle_loop(world, "TPALL 0 0 0", { "latiaodelallvehicles" }, "delallvehicles.", function()
    local targets = {}

    for _, ped in ipairs(entities.get_all_peds_as_handles()) do
        if PED.GET_PED_TYPE(ped) < 4 then goto out end
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
        if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
        end
    end
end)




menu.toggle_loop(world, "remove DEAD(ped)", { "latiaoremoveDEADped" }, ("latiaoremoveDEADped"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then
            entities.delete_by_handle(ped)
        end
    end
end)

menu.toggle_loop(world, "REMOVE_ALL_PED_WEAPONS", { "latiaoREMOVE_ALL_PED_WEAPONS" },
    "REMOVE_ALL_PED_WEAPONS.", function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if PED.GET_PED_TYPE(ped) < 4 then goto out end


            WEAPON.REMOVE_ALL_PED_WEAPONS(ped)

            ::out::
        end
    end)
menu.toggle_loop(world, "FREEZE_ENTITY_POSITION", { "latiaoFREEZE_ENTITY_POSITION" },
    "FREEZE_ENTITY_POSITION.", function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if PED.GET_PED_TYPE(ped) < 4 then goto out end

            ENTITY.FREEZE_ENTITY_POSITION(ped, true)
            ::out::
        end
    end, function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if PED.GET_PED_TYPE(ped) < 4 then goto out end

            ENTITY.FREEZE_ENTITY_POSITION(ped, false)
            ::out::
        end
    end)

menu.toggle_loop(world, "tppedtome", { "latiaotppedtome" }, "latiaotppedtome.", function()
    local pos = players.get_position(players.user())
    for _, ped in entities.get_all_peds_as_handles() do
        if PED.GET_PED_TYPE(ped) < 4 then goto out end
        ENTITY.SET_ENTITY_COORDS(ped, pos.x, pos.y, pos.z, false)
        ::out::
    end
end)

menu.toggle_loop(world, "silencekillallped", { "latiaosilencekillallped" }, "latiaotsilencekillallped.",
    function()
        local pos = players.get_position(players.user())
        for _, ped in entities.get_all_peds_as_handles() do
            if PED.GET_PED_TYPE(ped) < 4 then goto out end
            ENTITY.SET_ENTITY_COORDS(ped, pos.x, pos.y, 1000, false)
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, 1000, 0, 2147483647, false, true, 0.0)
            ::out::
        end
    end)

menu.toggle_loop(world, "tppedto 00", { "latiaotppedto00" }, "latiaotpped00.", function()
    for _, ped in entities.get_all_peds_as_handles() do
        if PED.GET_PED_TYPE(ped) < 4 then goto out end
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




menu.toggle_loop(world, "killaura all no wall", { "latiaokillaura" }, ("SHOOT ALL"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
        if ped == players.user_ped() then goto out end
        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))

        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))

        if not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(players.user_ped(), ped, 17) then goto out end

        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
            true,
            0x6E7DDDEC, players.user_ped(), false, true, 1)
        ::out::
    end
end)



menu.toggle_loop(world, "killaura ped no wall no vehicle", { "latiaokillaura" }, ("SHOOT ALL"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if PED.GET_PED_TYPE(ped) < 4 then goto out end
        if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
        if ped == players.user_ped() then goto out end
        if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then goto out end
        if not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(players.user_ped(), ped, 17) then goto out end

        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))

        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
            true,
            0x6E7DDDEC, players.user_ped(), false, true, 1)
        ::out::
    end
end)

menu.toggle_loop(world, "killaura all", { "latiaokillaura" }, ("SHOOT ALL"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
        if ped == players.user_ped() then goto out end
        local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        AddPos:add(v3.new(0, 0, 1))
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
            true,
            0x6E7DDDEC, players.user_ped(), false, true, 1)
        ::out::
    end
end)



menu.toggle_loop(world, "NICKFlameLoopALL", { "latiaoFlameLoopALL" }, "", function(on)
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
        if ped == players.user_ped() then goto out end
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 12, 2147483647, false, true, 0.0)
        ::out::
    end
end)

menu.toggle_loop(world, "nick EXPLOSION killaura all", { "latiaonickEXPLOSIONkillauraall" }, ("SHOOT ALL"),
    function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
            if ped == players.user_ped() then goto out end
            local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            FIRE.ADD_EXPLOSION(PedPos.x, PedPos.y, PedPos.z, 0, 2147483647, false, true, 0.0)

            ::out::
        end
    end)

menu.toggle_loop(world, "killaura all by EXPLOSION", { "latiaokillauraEXPLOSION" }, ("use EXPLOSION kill all"),
    function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
            if ped == players.user_ped() then goto out end
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
            ::out::
        end
    end)



menu.toggle_loop(world, "killaura PED by EXPLOSION", { "latiaokillauraEXPLOSIONPed" },
    ("use EXPLOSION kill all Ped"), function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
            if PED.GET_PED_TYPE(ped) < 4 then goto out end
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
            ::out::
        end
    end)

menu.toggle_loop(world, "killaura all exclude VEHICLE", { "latiaokillauraexcludeVEHICLE" },
    ("killaura all exclude VEHICLE"), function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then goto out end
            if ped == players.user_ped() then goto out end
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

menu.toggle_loop(world, "CLEAR_PED_TASKS_IMMEDIATELY", { "latiaoCLEAR_PED_TASKS_IMMEDIATELY" },
    "CLEAR_PED_TASKS_IMMEDIATELY.", function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if PED.GET_PED_TYPE(ped) < 4 then goto out end

            TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
            ::out::
        end
    end)

menu.toggle_loop(world, "killaura ped", { "latiaokillauraped" }, ("killauraped"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if PED.GET_PED_TYPE(ped) < 4 then goto out end
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

menu.toggle_loop(world, "killaura ped exclude VEHICLE", { "latiaokillaurapedexcludeVEHICLE" },
    ("killaurapedexcludeVEHICLE"), function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if PED.GET_PED_TYPE(ped) < 4 then goto out end
            if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then goto out end
            if ENTITY.IS_ENTITY_DEAD(ped) then goto out end
            local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            AddPos:add(v3.new(0, 0, 1))
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100,
                true,
                0x6E7DDDEC, players.user_ped(), false, true, 1)
            util.yield(100)
            ::out::
        end
    end)
    
    menu.toggle_loop(world, "all ped ROP MONEY", { "latiaoallpedROPMONEY" },
    "latiaoallpedROPMONEY.", function()
        PED.SET_AMBIENT_PEDS_DROP_MONEY(true)
    end)

    menu.toggle_loop(world, "maxpedVEHICLE", { "latiaomaxpedVEHICLE" },
    "latiaomaxpedVEHICLE.", function()
        PED.INSTANTLY_FILL_PED_POPULATION()
        VEHICLE.INSTANTLY_FILL_VEHICLE_POPULATION()
    end)
    menu.toggle_loop(world, "maxpedgod", { "latiaomaxpedgod" },
    "latiaomaxpedgod.", function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
        PED.SET_PED_RELATIONSHIP_GROUP_HASH(ped, PED.GET_PED_RELATIONSHIP_GROUP_HASH(players.user_ped()))
        end
    end)

    menu.toggle_loop(world, "no new cops", { "" }, ""
    , function()
        PLAYER.SET_DISPATCH_COPS_FOR_PLAYER(PLAYER.PLAYER_ID(), false)
    end)
    
    

menu.toggle_loop(world, "tp Picked", { "LatiaoTpPicked" }, ("TpPicked for you"), function()
    local pos = players.get_position(players.user())
    for _, pickup in entities.get_all_pickups_as_handles() do
        ENTITY.SET_ENTITY_COORDS(pickup, pos.x, pos.y, pos.z, false)
    end
end)


local server = menu.list(menu.my_root(), "server", {}, "")



menu.toggle_loop(server, "auto host", { "latiaoautohost" }, ("autohost"), function()
    if not (players.get_host() == PLAYER.PLAYER_ID()) then
        menu.trigger_commands("kick" .. PLAYER.GET_PLAYER_NAME(players.get_host()))
    end
end)
menu.toggle_loop(server, "auto Script host", { "latiaoautoScripthost" }, ("autoScripthost"), function()
    if not (players.get_script_host() == PLAYER.PLAYER_ID()) then
        menu.trigger_commands("Scripthost")
    end
end)


menu.action(server, "kickall exclude hosts", { "latiaokickallexcludehost" }, "latiaokickallexcludehost",
    function()
        for k, pid in pairs(players.list()) do
            if pid == players.get_host() then goto out end
            local player = PLAYER.GET_PLAYER_NAME(pid)
            util.toast(player .. "kicking")
            menu.trigger_commands("nonhostkick" .. player)
            ::out::
        end
    end)



menu.toggle_loop(server, "super crash and kick all moder", { "latiaocrashkickmod" }, "crash and kickmod.",
    function()
        for k, pid in pairs(players.list()) do
            if players.is_marked_as_modder(pid) then
                local attack = PLAYER.GET_PLAYER_NAME(pid)
                if pid == PLAYER.PLAYER_ID() then goto out end
                util.toast(attack .. "moder kick ing")
                menu.trigger_commands("crash" .. attack)
                util.yield(1000)
                menu.trigger_commands("loveletterkick" .. attack)
            end
            ::out::
        end
    end)

menu.action(server, "crash all", { "latiaocrashall" }, "latiaocrashall",
    function()
        for k, pid in pairs(players.list()) do
            local attack = PLAYER.GET_PLAYER_NAME(pid)
            if pid == PLAYER.PLAYER_ID() then goto out end
            util.toast(attack .. "crash ing")
            menu.trigger_commands("crash" .. attack)
            util.yield(1000)
        end
        ::out::
    end)



menu.toggle_loop(server, "kick chinese", { "latiaocrashall" }, "",
    function()
        for k, pid in pairs(players.list()) do
            local language = players.get_language(pid)
            if language and language == 12 then
                local attack = PLAYER.GET_PLAYER_NAME(pid)
                if pid == PLAYER.PLAYER_ID() then goto out end
                menu.trigger_commands("loveletterkick" .. attack)
                util.yield(100)
            end
            ::out::
        end
    end)


menu.toggle_loop(server, "loveletterkickallmoder", { "latiaoloveletterkickallmoder" }, "loveletterkickallmoder.",
    function()
        for k, pid in pairs(players.list()) do
            if pid == PLAYER.PLAYER_ID() then goto out end
            if players.is_marked_as_modder(pid) then
                local attack = PLAYER.GET_PLAYER_NAME(pid)
                util.toast(attack .. "kick ing")
                menu.trigger_commands("loveletterkick" .. attack)
            end
            ::out::
        end
    end)

menu.toggle_loop(server, "hostkickallmoder(NETWORK_SESSION_KICK_PLAYER)", { "latiaohostkickallmoder" },
    "latiaohostkickallmoder.",
    function()
        for k, pid in pairs(players.list()) do
            if pid == PLAYER.PLAYER_ID() then goto out end
            if players.is_marked_as_modder(pid) then
                NETWORK.NETWORK_SESSION_KICK_PLAYER(pid)
                local attack = PLAYER.GET_PLAYER_NAME(pid)
                util.toast(attack .. "kick ing")
            end
            ::out::
        end
    end)



menu.action(server, "love letter kick all", { "latiaoloveletterkickall" }, "loveletter kick all.", function()
    for k, pid in pairs(players.list()) do
        if pid == PLAYER.PLAYER_ID() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)

        util.toast(player .. "love kick")
        menu.trigger_commands("loveletterkick" .. player)
        ::out::
    end
end)





menu.action(server, "hostkickall", { "latiaohostkickall" }, "latiaohostkickall.", function()
    for k, pid in pairs(players.list()) do
        if pid == PLAYER.PLAYER_ID() then goto out end
        NETWORK.NETWORK_SESSION_KICK_PLAYER(pid)
        ::out::
    end
end)


menu.action(server, "timeoutall", { "latiaotimeout" }, "latiaotimeout.", function()
    for k, pid in pairs(players.list()) do
        if pid == PLAYER.PLAYER_ID() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)
        menu.trigger_commands("timeout" .. player)
        ::out::
    end
end)

menu.action(server, "kick me", { "latiaokickme" }, "latiaokickme.", function()
    NETWORK.NETWORK_SESSION_KICK_PLAYER(PLAYER.PLAYER_ID())
end)

menu.toggle_loop(server, "if you host reportall", { "latiaoreportall" },
    "reportall.", function()
        util.yield(1000)
        if NETWORK.NETWORK_IS_HOST() then
            menu.trigger_commands("reportgriefingall")
            menu.trigger_commands("reportexploitsall")
            menu.trigger_commands("reportbugabuseall")
        else
        end
    end)



    menu.toggle_loop(server, "bad SOUND for all", { "latiaobedsoundforall" }, "latiaobedsoundforall",
    function()
        -- for k, pid in pairs(players.list()) do

        --     local pos = players.get_position(pid)

            
            AUDIO.PLAY_SOUND_FROM_COORD(-1, "MP_Flash", 0,100,0,  "WastedSounds", true, 100000000, true)
        -- end
    end)


local test = menu.list(menu.my_root(), "test", {}, "")


menu.action(test, "fm_mission_controller host test", { "latiaofm_mission_controllertest" },
    "latiaofm_mission_controllertest.", function()
        util.toast("fm_mission_controller host is " ..
            PLAYER.GET_PLAYER_NAME(NETWORK.NETWORK_GET_HOST_OF_SCRIPT("fm_mission_controller")))
    end)
menu.action(test, "fm_mission_controller_2020 host test", { "latiaofm_mission_controller_2020test" },
    "latiaofm_mission_controller_2020test.", function()
        util.toast("fm_mission_controller_2020 host is " ..
            PLAYER.GET_PLAYER_NAME(NETWORK.NETWORK_GET_HOST_OF_SCRIPT("FM_Mission_Controller_2020")))
    end)
menu.action(test, "freemode host test", { "latiaofreemodetest" }, "latiaofreemodetest.", function()
    util.toast("freemode host is " .. PLAYER.GET_PLAYER_NAME(NETWORK.NETWORK_GET_HOST_OF_SCRIPT("freemode", -1, 0)))
end)







menu.toggle_loop(test, "REQUES_ENTITY ped", { "latiaoREQUES_ENTITYped" },
    "latiaoREQUES_ENTITYped.", function()
        for _, target in ipairs(entities.get_all_peds_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
        end
    end)


menu.toggle_loop(test, "REQUES_ENTITY objects", { "latiaoREQUES_ENTITYobjects" },
    "REQUES_ENTITYobjects.", function()
        for _, target in ipairs(entities.get_all_objects_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
        end
    end)

menu.toggle_loop(test, "REQUES_ENTITY vehicles", { "latiaoREQUES_ENTITYvehicles" },
    "REQUES_ENTITYvehicles.", function()
        for _, target in ipairs(entities.get_all_vehicles_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
        end
    end)







menu.toggle_loop(test, "SET_NO_LOADING_SCREEN", { "latiaoSET_NO_LOADING_SCREEN" },
    "SET_NO_LOADING_SCREEN.", function()
        SCRIPT.SET_NO_LOADING_SCREEN(true)
    end, function()
        SCRIPT.SET_NO_LOADING_SCREEN(false)
    end)

menu.action(test, "NETWORK_SESSION_END", { "latiaoNETWORK_SESSION_END" },
    "NETWORK_SESSION_END.", function()
        NETWORK.NETWORK_SESSION_END(0, 0);
    end)


menu.action(test, "IS_SCRIPTED_CONVERSATION_ONGOING", { "latiaoIS_SCRIPTED_CONVERSATION_ONGOING" },
    "IS_SCRIPTED_CONVERSATION_ONGOING.", function()
        AUDIO.STOP_SCRIPTED_CONVERSATION(false)
    end)




menu.action(test, "autoDRIVE", { "latiaoautoDRIVE" },
    "autoDRIVE.", function()
        local pos = v3.new(HUD.GET_BLIP_COORDS(HUD.GET_FIRST_BLIP_INFO_ID(8)))
        TASK.TASK_VEHICLE_DRIVE_TO_COORD(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID()),
            entities.get_user_vehicle_as_handle(), pos.x, pos.y, pos.z, 1000.0, 1.0,
            ENTITY.GET_ENTITY_MODEL(entities.get_user_vehicle_as_handle()), 787004, 1.0, 1)
    end)


menu.action(test, "stopautoDRIVE", { "latiaostopautoDRIVE" },
    "stopautoDRIVE.", function()
        TASK.CLEAR_PED_TASKS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID()))
    end)

menu.action(test, "Bad PARACHUTE_MODEL Crash All", { "latiaocrashall" },
    "crashall.", function()
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 2186304526)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID()), 0, 0, 500, 0, 0, 0)
        util.yield(1000)
        PED.FORCE_PED_TO_OPEN_PARACHUTE(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID()))
        util.yield(5000)
        menu.trigger_commands("tpmazehelipad")
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 0)
    end)


menu.action(test, "tp test", { "latiaotptest" },
    "latiaotptest.", function()
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID()), 10000, 10000, -100, 0,
            0, 0)
    end)

menu.action(server, "print all", { "latiaoprintall" }, "latiaocprintall",
    function()
        for k, pid in pairs(players.list()) do
            local attack = PLAYER.GET_PLAYER_NAME(pid)
            -- if pid == PLAYER.PLAYER_ID() then goto out end
            print(attack)
        end
        -- ::out::
    end)


    menu.action(test, "casino all 150%", { "latiaocasinoall150" },
    "latiaocasinoall150.", function()
        SET_INT_GLOBAL(1971696 + 1497 + 736 + 92 + 1,150)
        SET_INT_GLOBAL(1971696 + 1497 + 736 + 92 + 2,150)
        SET_INT_GLOBAL(1971696 + 1497 + 736 + 92 + 3,150)
        SET_INT_GLOBAL(1971696 + 1497 + 736 + 92 + 4,150)
    end)

    menu.action(test, "Doomsday all 100%", { "latiaoDoomsdayall100" },
    "latiaoDoomsdayall100.", function()
        SET_INT_GLOBAL(1967630 + 812 + 50 + 1,100)
        SET_INT_GLOBAL(1967630 + 812 + 50 + 2,100)
        SET_INT_GLOBAL(1967630 + 812 + 50 + 3,100)
        SET_INT_GLOBAL(1967630 + 812 + 50 + 4,100)
    end)
    menu.action(test, "Perico all 100%", { "latiaoPericoall100" },
    "latiaoPericoall100.", function()
        SET_INT_GLOBAL(1978495 + 825 + 56 + 1,100)
        SET_INT_GLOBAL(1978495 + 825 + 56 + 2,100)
        SET_INT_GLOBAL(1978495 + 825 + 56 + 3,100)
        SET_INT_GLOBAL(1978495 + 825 + 56 + 4,100)
    end)



   
-- player root
local function testMenuSetup(pid)
    menu.divider(menu.player_root(pid), "test")

    local testMenu = menu.list(menu.player_root(pid), "test", {}, "")

    local test = false
    menu.toggle(testMenu, "test", {}, "", function(on)
        test = on
        while test and NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) and not util.is_session_transition_active() do
            print(pid)
            util.yield(1)
        end
    end)

    local SHOOT = false
    menu.toggle(testMenu, "SHOOT", {}, "", function(on)
        SHOOT = on
        while SHOOT and NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) and not util.is_session_transition_active() do
            local playerPed = PLAYER.GET_PLAYER_PED(pid)
            local PedPos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
            local AddPos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
            AddPos:add(v3.new(0, 0, 1))
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(AddPos.x, AddPos.y, AddPos.z, PedPos.x, PedPos.y, PedPos.z, 100, true,
                0x6E7DDDEC, players.user_ped(), false, true, 1)
            util.yield(100)
        end
    end)

    local menukill = false
    menu.toggle(testMenu, "menukill", { "latiaobanmoder" }, "", function(on)
        menukill = on
        while menukill and NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) and not util.is_session_transition_active() do
            menu.trigger_commands("kill" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(100)
        end
    end)

    local NICKEXPLOSION = false
    menu.toggle(testMenu, "NickEXPLOSION", { "latiaobanmoder" }, "", function(on)
        NICKEXPLOSION = on
        while NICKEXPLOSION and NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) and not util.is_session_transition_active() do
            local playerPed = PLAYER.GET_PLAYER_PED(pid)
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
            FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
            util.yield(100)
        end
    end)

    local MEEXPLOSION = false
    menu.toggle(testMenu, "MEEXPLOSION", { "latiaobanmoder" }, "", function(on)
        MEEXPLOSION = on
        while MEEXPLOSION and NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) and not util.is_session_transition_active() do
            local playerPed = PLAYER.GET_PLAYER_PED(pid)
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 2147483647, true, false, 0.0)
            util.yield(100)
        end
    end)

    local NickFlameLoop = false
    menu.toggle(testMenu, "NickFlameLoop", { "latiaoFlameLoop" }, "", function(on)
        NickFlameLoop = on
        while NickFlameLoop and NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) and not util.is_session_transition_active() do
            local playerPed = PLAYER.GET_PLAYER_PED(pid)
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
            FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 12, 2147483647, false, true, 0.0)
            util.yield(100)
        end
    end)
    local MEFlameLoop = false
    menu.toggle(testMenu, "FlameLoop", { "latiaoFlameLoop" }, "", function(on)
        MEFlameLoop = on
        while MEFlameLoop and NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) and not util.is_session_transition_active() do
            local playerPed = PLAYER.GET_PLAYER_PED(pid)
            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 12, 2147483647, true, false, 0.0)
            util.yield(100)
        end
    end)


    local CopLoop = false
    menu.toggle(testMenu, "CopLoop", { "latiaoFlameLoop" }, "", function(on)
        CopLoop = on
        while CopLoop and NETWORK.NETWORK_IS_PLAYER_ACTIVE(pid) and not util.is_session_transition_active() do
            local playerPed = PLAYER.GET_PLAYER_PED(pid)
            local pos = ENTITY.GET_ENTITY_COORDS(playerPed)
            pos.x = pos.x + math.random(-10, 10)
            pos.y = pos.y + math.random(-10, 10)
            -- pos.z = pos.z
            PED.CREATE_PED(0, 0x5E3DA4A4, pos.x, pos.y, pos.z, 0, true, true)
            -- print(pos.x, pos.y, pos.z)
            util.yield(100)
        end
    end)
end
for _, pid in ipairs(players.list(true, true, true)) do
    testMenuSetup(pid)
end

players.on_join(function(pid)
    testMenuSetup(pid)
end)
