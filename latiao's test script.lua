menu.action(menu.my_root(), "restart lua", { "latiaorestartlua" }, "restartlua", function()
    util.restart_script()
end)
util.keep_running()
util.require_natives("1672190175")



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

