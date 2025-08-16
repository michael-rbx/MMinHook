-- Copyright (c) 2025 michael-rbx
-- Licensed under the MIT License. See LICENSE file in the project root for details.

local mmin_hook = loadstring(game:HttpGet("https://raw.githubusercontent.com/michael-rbx/MMinHook/refs/heads/main/MMinHook.lua"))()
mmin_hook:init()

local skin_hook = mmin_hook.index:new("CurrentSkin", "Value", function(this, key, original)
    return "MLG"
end)
skin_hook:enable() -- hooks start disabled!

local gun_mod_hook = mmin_hook.name_call:new("M4", "GetAttribute", function(this, original, args)
    if args[1] == "rateOfFire" then
        return 1500
    end

    if args[1] == "recoilMax" then
        return Vector2.new(0, 0)
    end

    if args[1] == "recoilMin" then
        return Vector2.new(0, 0)
    end

    if args[1] == "spread" then
        return 0
    end

    return original(this, unpack(args))
end)
gun_mod_hook:enable() -- hooks start disabled!