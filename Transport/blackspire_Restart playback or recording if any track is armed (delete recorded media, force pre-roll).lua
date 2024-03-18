-- @description Restart playback or recording if any track is armed (delete recorded media, force pre-roll)
-- @version 1.0
-- @author BlackSpire


--------------------------------------------------
--------------------PARAMS------------------------
--------------------------------------------------
local force_pre_roll = true
local save_recorded_media = 0
local undo_message = 'Restart playback or recording if any track is armed (delete recorded media, force pre-roll)'


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
if not BSLoadLibraries(1.0, { "track_properties.lua", "transport.lua" }) then return end

--------------------------------------------------
---------------------MAIN-------------------------
--------------------------------------------------
reaper.Undo_BeginBlock()
RestartPlayRecord(AnyTrackArmed(), force_pre_roll, save_recorded_media)
reaper.Undo_EndBlock(undo_message, 4)
