---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by heyqule.
--- DateTime: 12/3/2022 11:00 PM
---

---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by heyqule.
--- DateTime: 2/9/2021 6:53 PM
---
require('__stdlib__/stdlib/utils/defines/time')
require('util')
local Sprites = require('__stdlib__/stdlib/data/modules/sprites')

require('__erm_terran__/global')

local ERM_UnitTint = require('__enemyracemanager__/lib/rig/unit_tint')

local ERM_Config = require('__enemyracemanager__/lib/global_config')
local ERMPlayerUnitHelper = require('__enemyracemanager__/lib/rig/player_unit_helper')
local TerranSound = require('__erm_terran__/prototypes/sound')
local DataHelper = require('__erm_terran__/prototypes/data_helper')
local name = 'firebat'

-- Misc Settings
local vision_distance = 30
local pollution_to_join_attack = 250
local distraction_cooldown = 30

-- Animation Settings
local unit_scale = 1.5

local collision_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
local selection_box = { { -0.75, -0.75 }, { 0.75, 0.75 } }

local mk1_resist = DataHelper.getResistance(55)
table.insert(mk1_resist,{type='fire', percent=100})
local mk2_resist = DataHelper.getResistance(75)
table.insert(mk2_resist,{type='fire', percent=100})
-- Firebat MK 1 --
data:extend({
    {
        type = "unit",
        name = MOD_NAME .. '/' .. name .. '/mk1',
        localised_name = { 'entity-name.' .. MOD_NAME .. '/' .. name, 'MK 1'},
        icons = {
            {
                icon = "__erm_terran__/graphics/entity/icons/units/"..name..".png",
                icon_size = 64,
            },
            {
                icon = "__base__/graphics/icons/signal/signal_1.png",
                icon_size = 64,
                scale = 0.25,
                shift = {-9,-9}
            },
        },
        flags = { "placeable-enemy", "placeable-player", "placeable-off-grid", "player-creation", "breaths-air" },
        has_belt_immunity = false,
        max_health = 60 * ERMPlayerUnitHelper.get_health_multiplier(),
        order = MOD_NAME .. name,
        subgroup = "erm_controllable_units",
        shooting_cursor_size = 2,
        resistances = mk1_resist,
        healing_per_tick = 0,
        collision_box = collision_box,
        selection_box = selection_box,
        sticker_box = selection_box,
        vision_distance = vision_distance,
        movement_speed = 0.175 * ERMPlayerUnitHelper.get_speed_multiplier(),
        repair_speed_modifier = 1,
        pollution_to_join_attack = pollution_to_join_attack,
        distraction_cooldown = distraction_cooldown,
        can_open_gates = true,
        --ai_settings = biter_ai_settings,
        radar_range = 1,
        attack_parameters = {
            type = "projectile",
            range_mode = "bounding-box-to-bounding-box",
            ammo_category = 'flamethrower',
            range = 2,
            cooldown = 60,
            cooldown_deviation = 0.1,
            damage_modifier = ERMPlayerUnitHelper.get_damage_multiplier(),
            sound = TerranSound.firebat_attack(0.66, 0.33),
            ammo_type =
            {
                category = "flamethrower",
                action = {
                    type = "line",
                    force = 'not-same',
                    range = 3,
                    width = 1,
                    ignore_collision_condition = true,
                    action_delivery = {
                        type = "instant",
                        target_effects =
                        {
                            {
                                type = "damage",
                                damage = { amount = 100, type = "fire"}
                            },
                            {
                                type = "damage",
                                damage = { amount = 100, type = "explosion"}
                            },
                            {
                                type = "create-sticker",
                                sticker = "fire-sticker",
                                show_in_tooltip = true
                            },
                        }
                    }
                },
            },
            animation = {
                layers = {
                    {
                        filename = "__erm_terran__/graphics/entity/units/" .. name .. "/".. name .."-effect-flamer.png",
                        width = 256,
                        height = 256,
                        frame_count = 13,
                        axially_symmetrical = false,
                        direction_count = 16,
                        animation_speed = 0.65,
                        scale = unit_scale,
                        draw_as_glow = true,
                        priority = "extra-high",
                    },
                    {
                        filename = "__erm_terran__/graphics/entity/units/" .. name .. "/" .. name .. "-attack.png",
                        width = 256,
                        height = 256,
                        frame_count = 13,
                        axially_symmetrical = false,
                        direction_count = 16,
                        scale = unit_scale,
                        frame_sequence = { 1,2,2,2,2,2,2,2,2,1,1,1,1 },
                        animation_speed = 0.65,
                        draw_as_glow = true,
                    },
                    {
                        filename = "__erm_terran__/graphics/entity/units/" .. name .. "/" .. name .. "-attack.png",
                        width = 256,
                        height = 256,
                        frame_count = 13,
                        axially_symmetrical = false,
                        direction_count = 16,
                        scale = unit_scale,
                        frame_sequence = { 1,2,2,2,2,2,2,2,2,1,1,1,1 },
                        animation_speed = 0.65,
                        draw_as_shadow = true,
                        shift = { 0.25, 0 },
                        tint = ERM_UnitTint.tint_shadow(),
                    },
                }
            }
        },
        distance_per_frame = 0.2,
        run_animation = {
            layers = {
                {
                    filename = "__erm_terran__/graphics/entity/units/" .. name .. "/" .. name .. "-run.png",
                    width = 256,
                    height = 256,
                    frame_count = 8,
                    axially_symmetrical = false,
                    direction_count = 16,
                    scale = unit_scale,
                },
                {
                    filename = "__erm_terran__/graphics/entity/units/" .. name .. "/" .. name .. "-run.png",
                    width = 256,
                    height = 256,
                    frame_count = 8,
                    axially_symmetrical = false,
                    direction_count = 16,
                    scale = unit_scale,
                    draw_as_shadow = true,
                    shift = { 0.25, 0 },
                    tint = ERM_UnitTint.tint_shadow(),
                }
            }
        },
        dying_trigger_effect = {
            {
                type = "nested-result",
                action =
                {
                    type = "area",
                    radius = 4,
                    force = 'not-same',
                    action_delivery =
                    {
                        type = "instant",
                        target_effects =
                        {
                            {
                                type = "damage",
                                damage = {amount = 200 * ERMPlayerUnitHelper.get_damage_multiplier() , type = "fire"}
                            },
                            {
                                type = "damage",
                                damage = {amount = 400 * ERMPlayerUnitHelper.get_damage_multiplier() , type = "explosion"}
                            }
                        }
                    }
                }
            }
        },
        dying_sound = TerranSound.firebat_death(1),
        corpse = name .. '-corpse',
        map_color = ERM_UnitTint.tint_army_color(),
        enemy_map_color = { r=1, b=0, g=0 },
        light = DataHelper.getLight()
    },
    {
        type = "corpse",
        name = name .. '-corpse',
        icon = "__erm_terran__/graphics/entity/icons/units/" .. name .. ".png",
        icon_size = 64,
        flags = { "placeable-off-grid", "building-direction-8-way", "not-on-map" },
        selection_box = selection_box,
        selectable_in_game = false,
        dying_speed = 0.04,
        time_before_removed = defines.time.second,
        subgroup = "corpses",
        order = "x" .. name,
        animation = Sprites.empty_pictures(),
    },
})

-- Firebat MK2 --
local firebat_mk2 = util.table.deepcopy(data.raw["unit"][MOD_NAME .. '/' .. name .. '/mk1'])

firebat_mk2.name = MOD_NAME .. '/' .. name .. '/mk2'
firebat_mk2.localised_name = { 'entity-name.' .. MOD_NAME .. '/' .. name, 'MK 2'}
firebat_mk2['icons'][2] = {
    icon = "__base__/graphics/icons/signal/signal_2.png",
    icon_size = 64,
    scale = 0.25,
    shift = {-9,-9}
}
firebat_mk2.movement_speed = 0.225 * ERMPlayerUnitHelper.get_speed_multiplier()
firebat_mk2.max_health = 125 * ERMPlayerUnitHelper.get_health_multiplier()
firebat_mk2.resistances = mk2_resist
firebat_mk2['attack_parameters']['cooldown'] = 60
firebat_mk2['attack_parameters']['damage_modifier'] = 1.2 + ERMPlayerUnitHelper.get_damage_multiplier()

firebat_mk2['dying_trigger_effect'] = {
    {
        type = "nested-result",
        action =
        {
            type = "area",
            radius = 4,
            force = 'not-same',
            action_delivery =
            {
                type = "instant",
                target_effects =
                {
                    {
                        type = "damage",
                        damage = {amount = 500 * ERMPlayerUnitHelper.get_damage_multiplier(), type = "fire"}
                    },
                    {
                        type = "damage",
                        damage = {amount = 1000 * ERMPlayerUnitHelper.get_damage_multiplier(), type = "explosion"}
                    }
                }
            }
        }
    }
},

data:extend({firebat_mk2})


