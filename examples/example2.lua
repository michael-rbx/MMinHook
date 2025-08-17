-- Copyright (c) 2025 michael-rbx
-- Licensed under the MIT License. See LICENSE file in the project root for details.

local mmin_hook = loadstring(game:HttpGet("https://raw.githubusercontent.com/michael-rbx/MMinHook/refs/heads/main/MMinHook.lua"))()
mmin_hook:init()

local viewmodels = game:GetService("ReplicatedStorage").GunSystem.GunClientAssets.Viewmodels
local primary = viewmodels.Primary:GetChildren()
local secondary = viewmodels.Secondary:GetChildren()

local local_player = game:GetService("Players").LocalPlayer

local function find_item(instance_table, item)
    for idx, instance in next, instance_table do
        if instance.Name == item then return idx end
    end

    return nil
end

local unlock_all_hook = mmin_hook.name_call:new("ManageInventory", "InvokeServer", function(this, original, args)
    local ret_val = original(this, unpack(args))

    -- for some reason the server takes the target player through an arg.
    -- could just call this remote with someone elses name and see all the stuff they got :shrug:
    if args[1][2] ~= local_player then return ret_val end

    -- this unlock all could be server sided but idrk. the client sends a remote to the server telling it what skins we are using,
    -- so if the developer is dumb he would just make it so that the server would take our word on it and not check anything.
    if args[1][1] == "GetPlayerInventory" then
        -- loop over our current inventory
        for item, skins in next, ret_val do
            -- check if this item is a primary
            local primary_idx = find_item(primary, item)
            if primary_idx then
                print(string.format("found %s", item))
                
                -- loop over all of the skins for this primary
                for _, skin in next, primary[primary_idx].Skins:GetChildren() do
                    -- finally push the name of the current skin into the primary's skin table
                    -- note: skin is a model or what ever its called, we just need the name
                    table.insert(skins, skin.Name)
                end

                continue
            end
            
            -- not primary, check for secondary
            local secondary_idx = find_item(secondary, item)
            if secondary_idx then
                print(string.format("found %s", item))

                -- loop over all of the skins for this secondary
                for _, skin in next, secondary[secondary_idx].Skins:GetChildren() do
                    -- finally push the name of the current skin into the secondary's skin table
                    -- note: skin is a model or what ever its called, we just need the name
                    table.insert(skins, skin.Name)
                end
                
                continue
            end

            -- oh no
            print(string.format("bug for %s %s", item, tostring(skins)))
        end

        return ret_val
    end

    -- kinda jank but it works. there is one more remote that checks if we have actually have the skin. i could
    -- just hook that as well and patch it but this is way easier lmao
    if args[1][1] == "EquipItem" then
        local skin = args[1][3]
        local target_item = "EquippedWeaponSkin" .. skin:match("^(.-)_")

        -- idc anymore
        if target_item == "EquippedWeaponSkinGoldenFlower" or target_item == "EquippedWeaponSkinDoubleKnife" then
            target_item = "EquippedWeaponSkinKnife"
        end

        local_player:SetAttribute(target_item, skin)
        return true
    end

    return ret_val
end)
unlock_all_hook:enable()
