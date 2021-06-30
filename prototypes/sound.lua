---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by heyqule.
--- DateTime: 2/9/2021 10:26 PM
---

local TerranSound = {}

function TerranSound.death(name, volume)
    return {
        filename = "__erm_terran__/sound/" .. name .. "/death.ogg",
        volume = volume
    }
end

function TerranSound.attack(name, volume, distance)
    return {
        filename = "__erm_terran__/sound/" .. name .. "/attack.ogg",
        volume = volume,
        audible_distance_modifier = distance
    }
end

function TerranSound.marine_death(volume)
    return {

        variations = {
            {
                filename = "__erm_terran__/sound/marine/death_1.ogg",
                volume = volume
            },
            {
                filename = "__erm_terran__/sound/marine/death_2.ogg",
                volume = volume
            },
        }
    }
end

return TerranSound;