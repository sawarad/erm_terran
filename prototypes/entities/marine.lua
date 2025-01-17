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
local name = 'marine'

local attack_range = 12

-- Misc Settings
local vision_distance = 30
local pollution_to_join_attack = 250
local distraction_cooldown = 30

-- Animation Settings
local unit_scale = 1.5

local collision_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
local selection_box = { { -0.75, -0.75 }, { 0.75, 0.75 } }

-- Marine MK 1 --
data:extend({
    {
        type = "unit",
        name = MOD_NAME .. '/' .. name .. '/mk1',
        localised_name = { 'entity-name.' .. MOD_NAME .. '/' .. name, 'MK 1'},
        localised_description = { 'entity-description.' .. MOD_NAME .. '/' .. name},
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
        max_health = 40 * ERMPlayerUnitHelper.get_health_multiplier(),
        order = MOD_NAME .. name,
        subgroup = "erm_controllable_units",
        shooting_cursor_size = 2,
        resistances = DataHelper.getResistance(40),
        healing_per_tick = 0,
        collision_box = collision_box,
        selection_box = selection_box,
        sticker_box = selection_box,
        vision_distance = vision_distance,
        movement_speed = 0.15 * ERMPlayerUnitHelper.get_speed_multiplier(),
        repair_speed_modifier = 1,
        pollution_to_join_attack = pollution_to_join_attack,
        distraction_cooldown = distraction_cooldown,
        can_open_gates = true,
        --ai_settings = biter_ai_settings,
        radar_range = 1,
        attack_parameters = {
            type = "projectile",
            range_mode = "bounding-box-to-bounding-box",
            ammo_category = 'bullet',
            range = attack_range,
            min_attack_distance = attack_range - 4,
            cooldown = 75,
            cooldown_deviation = 0.1,
            damage_modifier = ERMPlayerUnitHelper.get_damage_multiplier(),
            ammo_type =
            {
                category = "bullet",
                action = {
                    {
                        type = "direct",
                        repeat_count = 4,
                        action_delivery =
                        {
                            type = "instant",
                            target_effects =
                            {
                                {
                                    type = "damage",
                                    damage = { amount = 10, type = "physical"}
                                }
                            }
                        }
                    },
                    {
                        type = "direct",
                        action_delivery =
                        {
                            type = "instant",
                            target_effects =
                            {
                                {
                                    type = "create-entity",
                                    entity_name = "explosion-hit",
                                    offsets = {{0, 1}},
                                    offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                                },
                            }
                        }
                    }
                }
            },
            sound = TerranSound.rapid_attack(name, 0.5, 0.5),
            animation = {
                layers = {
                    {
                        filename = "__erm_terran__/graphics/entity/units/" .. name .. "/" .. name .. "-attack-effect.png",
                        width = 64,
                        height = 64,
                        frame_count = 8,
                        axially_symmetrical = false,
                        animation_speed = 0.65,
                        direction_count = 16,
                        scale = unit_scale,
                        frame_sequence = { 1, 2, 3, 4, 3, 4, 3, 4 },
                        draw_as_glow = true,
                    },
                    {
                        filename = "__erm_terran__/graphics/entity/units/" .. name .. "/" .. name .. "-attack.png",
                        width = 64,
                        height = 64,
                        frame_count = 8,
                        axially_symmetrical = false,
                        direction_count = 16,
                        animation_speed = 0.65,
                        scale = unit_scale,
                        frame_sequence = { 1, 2, 3, 4, 3, 4, 3, 4 }
                    },
                    {
                        filename = "__erm_terran__/graphics/entity/units/" .. name .. "/" .. name .. "-attack.png",
                        width = 64,
                        height = 64,
                        frame_count = 8,
                        axially_symmetrical = false,
                        direction_count = 16,
                        animation_speed = 0.65,
                        scale = unit_scale,
                        frame_sequence = { 1, 2, 3, 4, 3, 4, 3, 4 },
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
                    width = 64,
                    height = 64,
                    frame_count = 9,
                    axially_symmetrical = false,
                    direction_count = 16,
                    scale = unit_scale,
                },
                {
                    filename = "__erm_terran__/graphics/entity/units/" .. name .. "/" .. name .. "-run.png",
                    width = 64,
                    height = 64,
                    frame_count = 9,
                    axially_symmetrical = false,
                    direction_count = 16,
                    scale = unit_scale,
                    draw_as_shadow = true,
                    shift = { 0.25, 0 },
                    tint = ERM_UnitTint.tint_shadow(),
                }
            }
        },
        dying_sound = TerranSound.marine_death(1),
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
        time_before_removed = defines.time.minute * settings.startup["enemyracemanager-enemy-corpse-time"].value,
        subgroup = "corpses",
        order = "x" .. name,
        final_render_layer = "lower-object-above-shadow",
        animation = {
            filename = "__erm_terran__/graphics/entity/units/" .. name .. "/" .. name .. "-death.png",
            width = 64,
            height = 64,
            frame_count = 8,
            direction_count = 1,
            axially_symmetrical = false,
            scale = unit_scale,
            animation_speed = 0.2
        },
    },
})

-- Marine MK2 --
local marine_mk2 = util.table.deepcopy(data.raw["unit"][MOD_NAME .. '/' .. name .. '/mk1'])

marine_mk2.name = MOD_NAME .. '/' .. name .. '/mk2'
marine_mk2.localised_name = { 'entity-name.' .. MOD_NAME .. '/' .. name, 'MK 2'}
marine_mk2['icons'][2] = {
    icon = "__base__/graphics/icons/signal/signal_2.png",
    icon_size = 64,
    scale = 0.25,
    shift = {-9,-9}
}
marine_mk2.movement_speed = 0.175 * ERMPlayerUnitHelper.get_speed_multiplier()
marine_mk2.max_health = 60 * ERMPlayerUnitHelper.get_health_multiplier()
marine_mk2.resistances = DataHelper.getResistance(55)
marine_mk2['attack_parameters']['ammo_type']['action'][1]['repeat_count'] = 5
marine_mk2['attack_parameters']['ammo_type']['action'][1]['action_delivery']['target_effects'][1] =
{
    type = "damage",
    damage = { amount = 15, type = "physical"}
}

data:extend({marine_mk2})

-- Marine MK3 --
local marine_mk3 = util.table.deepcopy(data.raw["unit"][MOD_NAME .. '/' .. name .. '/mk1'])

marine_mk3.name = MOD_NAME .. '/' .. name .. '/mk3'
marine_mk3.localised_name = { 'entity-name.' .. MOD_NAME .. '/' .. name, 'MK 3'}
marine_mk3['icons'][2] = {
    icon = "__base__/graphics/icons/signal/signal_3.png",
    icon_size = 64,
    scale = 0.25,
    shift = {-9,-9}
}
marine_mk3.max_health = 100 * ERMPlayerUnitHelper.get_health_multiplier()
marine_mk3.movement_speed = 0.225 * ERMPlayerUnitHelper.get_speed_multiplier()
marine_mk3.resistances = DataHelper.getResistance(75)
marine_mk3['attack_parameters']['ammo_type']['action'][1]['repeat_count'] = 6
marine_mk3['attack_parameters']['ammo_type']['action'][1]['action_delivery']['target_effects'][1] =
{
    type = "damage",
    damage = { amount = 42, type = "physical"}
}

data:extend({marine_mk3})
