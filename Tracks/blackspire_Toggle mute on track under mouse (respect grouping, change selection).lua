-- @description Toggle mute on track under mouse (respect grouping, change selection)
-- @version 1.0
-- @author BlackSpire

--------------------------------------------------
--------------------PARMS-------------------------
--------------------------------------------------
local mouse = true
local select = true
local group = true
local exclusive = false
local undo_message = 'Toggle mute on track under mouse (respect grouping, change selection)'


--------------------------------------------------
------------------LOAD LIBRARIES------------------
--------------------------------------------------
local lib_path = reaper.GetExtState("BlackSpire_Scripts", "lib_path")
if not lib_path or lib_path == "" then
    reaper.MB(
        "Couldn't load the BlackSpire_Scripts library. Please run 'blackspire_Set library path.lua' in the BlackSpire Scripts.",
        "Whoops!", 0)
    return
end
dofile(lib_path .. "core.lua")
if not BSLoadLibraries(1.0, { "helper_functions.lua", "rprw.lua", "track_properties.lua" }) then return end

--------------------------------------------------
---------------------MAIN-------------------------
--------------------------------------------------
reaper.Undo_BeginBlock()
ToggleMuteOnTargetTrack(mouse, select, group, exclusive)
reaper.Undo_EndBlock(undo_message, 4)
