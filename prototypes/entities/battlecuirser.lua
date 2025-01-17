---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by heyqule.
--- DateTime: 2/9/2021 6:53 PM
---
require('__stdlib__/stdlib/utils/defines/time')
local Sprites = require('__stdlib__/stdlib/data/modules/sprites')

require('__erm_terran__/global')

local ERM_UnitTint = require('__enemyracemanager__/lib/rig/unit_tint')

local ERM_Config = require('__enemyracemanager__/lib/global_config')
local ERMDataHelper = require('__enemyracemanager__/lib/rig/data_helper')
local ERMPlayerUnitHelper = require('__enemyracemanager__/lib/rig/player_unit_helper')
local TerranSound = require('__erm_terran__/prototypes/sound')
local name = 'battlecruiser'


local attack_range = 24

-- Misc Settings
local vision_distance = 35
local pollution_to_join_attack = 250
local distraction_cooldown = 30

-- Animation Settings
local unit_scale = 1.75

local collision_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
local selection_box = { { -2.0, -2.0 }, { 2.0, 2.0 } }

function battlecruiser_animation(color)
    return  {
        layers = {
            {
                filename = "__erm_terran__/graphics/entity/units/" .. name .. "/" .. name .. "-" .. color .. "-run.png",
                width = 120,
                height = 120,
                frame_count = 1,
                repeat_count = 2,
                axially_symmetrical = false,
                direction_count = 16,
                scale = unit_scale,
                animation_speed = 0.6,
            },
            {
                filename = "__erm_terran__/graphics/entity/units/" .. name .. "/" .. name .. "-effect.png",
                width = 120,
                height = 120,
                frame_count = 2,
                axially_symmetrical = false,
                direction_count = 16,
                scale = unit_scale,
                animation_speed = 0.6,
                draw_as_glow = true,
                blend_mode = 'additive-soft',
                tint = ERM_UnitTint.tint_plane_burner(),
            },
            {
                filename = "__erm_terran__/graphics/entity/units/" .. name .. "/" .. name .. "-" .. color .. "-run.png",
                width = 120,
                height = 120,
                frame_count = 1,
                repeat_count = 2,
                axially_symmetrical = false,
                direction_count = 16,
                scale = unit_scale,
                tint = ERM_UnitTint.tint_shadow(),
                animation_speed = 0.6,
                draw_as_shadow = true,
                shift = { 6, 0 }
            }
        }
    }
end

function battlecruiser_light()
    local light
    if settings.startup['erm_terran-add-light'].value then
        light = {
            {
                type = "oriented",
                minimum_darkness = 0.3,
                picture =
                {
                    filename = "__core__/graphics/light-cone.png",
                    flags = { "light"},
                    scale = 2,
                    width = 200,
                    height = 200
                },
                shift = {0, -18},
                size = 3,
                intensity = 0.6,
                color = {r = 0.92, g = 0.77, b = 0.3}
            }
        }
    end
    return light
end


data:extend({
    {
        type = "unit",
        name = MOD_NAME .. '/' .. name .. '/yamato',
        localised_name = { 'entity-name.' .. MOD_NAME .. '/' .. name .. '/yamato' },
        icons = {
            {
                icon = "__erm_terran__/graphics/entity/icons/units/"..name..".png",
                icon_size = 64,
            },
            {
                icon = "__base__/graphics/icons/signal/signal_Y.png",
                icon_size = 64,
                scale = 0.25,
                shift = {-9,-9}
            },
        },
        flags = { "placeable-enemy", "placeable-player", "placeable-off-grid", "player-creation", "not-flammable" },
        has_belt_immunity = true,
        max_health = 500 * ERMPlayerUnitHelper.get_health_multiplier(),
        order = MOD_NAME .. name,
        subgroup = "erm_controllable_units",
        shooting_cursor_size = 2,
        resistances = {
            { type = "acid", percent = 90 },
            { type = "poison", percent = 100 },
            { type = "physical", percent = 90 },
            { type = "fire", percent = 90 },
            { type = "explosion", percent = 90 },
            { type = "laser", percent = 90 },
            { type = "electric", percent = 90 },
            { type = "cold", percent = 90 }
        },
        healing_per_tick = 0,
        collision_mask = ERMDataHelper.getFlyingCollisionMask(),
        collision_box = collision_box,
        selection_box = selection_box,
        sticker_box = selection_box,
        vision_distance = vision_distance,
        movement_speed = 0.225 * ERMPlayerUnitHelper.get_speed_multiplier(),
        repair_speed_modifier = 1,
        pollution_to_join_attack = pollution_to_join_attack,
        distraction_cooldown = distraction_cooldown,
        --ai_settings = biter_ai_settings,
        radar_range = 2,
        attack_parameters = {
            type = "projectile",
            range_mode = "bounding-box-to-bounding-box",
            ammo_category = 'laser',
            range = attack_range,
            min_attack_distance = attack_range - 4,
            cooldown = 360,
            cooldown_deviation = 0.1,
            damage_modifier = ERMPlayerUnitHelper.get_damage_multiplier(),
            warmup = 6,
            ammo_type = {
                category = "laser",
                target_type = "direction",
                action = {
                    type = "direct",
                    action_delivery = {
                        type = "projectile",
                        projectile = name .. "-yamato-projectile",
                        starting_speed = 0.25,
                        max_range = ERM_Config.get_max_projectile_range(2),
                    }
                }
            },
            animation = battlecruiser_animation('orange'),
            sound = TerranSound.attack(name, 0.66, 0.66),
        },
        render_layer = "wires-above",
        distance_per_frame = 0.5,
        run_animation = battlecruiser_animation('orange'),
        dying_explosion = 'erm-fire-explosion-air_large-1',
        dying_sound = TerranSound.death(name, 0.75),
        corpse = name .. '-corpse',
        map_color = ERM_UnitTint.tint_army_color(),
        enemy_map_color = { r=1, b=0, g=0 },
        light = battlecruiser_light()
    },
    {
        type = "unit",
        name = MOD_NAME .. '/' .. name .. '/laser',
        localised_name = { 'entity-name.' .. MOD_NAME .. '/' .. name .. '/laser' },
        icons = {
            {
                icon = "__erm_terran__/graphics/entity/icons/units/"..name..".png",
                icon_size = 64,
            },
            {
                icon = "__base__/graphics/icons/signal/signal_L.png",
                icon_size = 64,
                scale = 0.25,
                shift = {-9,-9}
            },
        },
        flags = { "placeable-enemy", "placeable-player", "placeable-off-grid", "player-creation","not-flammable" },
        has_belt_immunity = true,
        max_health = 350 * ERMPlayerUnitHelper.get_health_multiplier(),
        order = MOD_NAME .. name,
        subgroup = "erm_controllable_units",
        shooting_cursor_size = 2,
        resistances = {
            { type = "acid", percent = 80 },
            { type = "poison", percent = 100 },
            { type = "physical", percent = 80 },
            { type = "fire", percent = 80 },
            { type = "explosion", percent = 80 },
            { type = "laser", percent = 80 },
            { type = "electric", percent = 80 },
            { type = "cold", percent = 80 }
        },
        healing_per_tick = 0,
        collision_mask = ERMDataHelper.getFlyingCollisionMask(),
        collision_box = collision_box,
        selection_box = selection_box,
        sticker_box = selection_box,
        vision_distance = vision_distance,
        movement_speed = 0.225 * ERMPlayerUnitHelper.get_speed_multiplier(),
        repair_speed_modifier = 1,
        pollution_to_join_attack = pollution_to_join_attack,
        distraction_cooldown = distraction_cooldown,
        --ai_settings = biter_ai_settings,
        radar_range = 1,
        attack_parameters = {
            type = "projectile",
            range_mode = "bounding-box-to-bounding-box",
            ammo_category = 'laser',
            range = attack_range,
            min_attack_distance = attack_range - 4,
            cooldown = 60,
            cooldown_deviation = 0.1,
            damage_modifier = ERMPlayerUnitHelper.get_damage_multiplier(),
            warmup = 6,
            ammo_type = {
                category = "laser",
                target_type = "direction",
                action = {
                    type = "direct",
                    action_delivery = {
                        type = "projectile",
                        projectile = name .. "-laser-projectile",
                        starting_speed = 0.5,
                        max_range = ERM_Config.get_max_projectile_range(2),
                    }
                }
            },
            sound = TerranSound.laser_attack(name, 0.6, 0.6),
            animation = battlecruiser_animation('yellow'),
        },
        render_layer = "wires-above",
        distance_per_frame = 0.5,
        run_animation = battlecruiser_animation('yellow'),
        dying_explosion = 'erm-fire-explosion-air_large-1',
        dying_sound = TerranSound.death(name, 0.75),
        corpse = name .. '-corpse',
        map_color = ERM_UnitTint.tint_army_color(),
        enemy_map_color = { r=1, b=0, g=0 },
        light = battlecruiser_light()
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
    }
})