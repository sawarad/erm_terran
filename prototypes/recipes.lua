---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by heyqule.
--- DateTime: 2/9/2021 7:35 PM
---
require('__erm_terran__/global')

local marine = 'marine'
local tank = 'tank'
local wraith = 'wraith'
local battlecruiser = 'battlecruiser'

data:extend({
    {
        type = "recipe",
        name = MOD_NAME .. '/' .. marine .. '/mk1',
        enabled = false,
        energy_required = 60,
        ingredients =
        {
            {"heavy-armor", 1},
            {"submachine-gun", 1},
            {"firearm-magazine", 50},
            {"radar", 1},
        },
        result = MOD_NAME .. '/' .. marine .. '/mk1'
    },
    {
        type = "recipe",
        name = MOD_NAME .. '/' .. marine .. '/mk2',
        enabled = false,
        energy_required = 60,
        ingredients =
        {
            {"modular-armor", 1},
            {"submachine-gun", 1},
            {"piercing-rounds-magazine", 50},
            {"radar", 1},
        },
        result = MOD_NAME .. '/' .. marine .. '/mk2'
    },
    {
        type = "recipe",
        name = MOD_NAME .. '/' .. marine .. '/mk3',
        enabled = false,
        energy_required = 90,
        ingredients =
        {
            {"modular-armor", 1},
            {"submachine-gun", 1},
            {"uranium-rounds-magazine", 50},
            {"radar", 1},
        },
        result = MOD_NAME .. '/' .. marine .. '/mk3'
    },
    {
        type = "recipe",
        name = MOD_NAME .. '/' .. tank,
        enabled = false,
        energy_required = 90,
        ingredients =
        {
            {"tank", 1},
            {"explosive-cannon-shell", 100},
            {"low-density-structure", 20},
            {"solid-fuel", 50},
        },
        result = MOD_NAME .. '/' .. tank
    },
    {
        type = "recipe",
        name = MOD_NAME .. '/' .. tank .. '/mk2',
        enabled = false,
        energy_required = 180,
        ingredients =
        {
            {"tank", 1},
            {"rocket-control-unit", 10},
            {"uranium-cannon-shell", 100},
            {"low-density-structure", 40},
            {"rocket-fuel", 20},
        },
        result = MOD_NAME .. '/' .. tank .. '/mk2'
    },
    {
        type = "recipe",
        name = MOD_NAME .. '/' .. battlecruiser .. '/yamato',
        enabled = false,
        energy_required = 300,
        ingredients =
        {
            {"nuclear-reactor", 4},
            {"nuclear-fuel", 40},
            {"rocket-control-unit", 50},
            {"low-density-structure", 50},
            {"laser-turret", 20},
            {"flying-robot-frame", 50},
        },
        result = MOD_NAME .. '/' .. battlecruiser .. '/yamato'
    },
    {
        type = "recipe",
        name = MOD_NAME .. '/' .. battlecruiser .. '/laser',
        enabled = false,
        energy_required = 300,
        ingredients =
        {
            {"nuclear-reactor", 1},
            {"nuclear-fuel", 10},
            {"rocket-control-unit", 30},
            {"low-density-structure", 30},
            {"laser-turret", 10},
            {"flying-robot-frame", 30},
        },
        result = MOD_NAME .. '/' .. battlecruiser .. '/laser'
    },
    {
        type = "recipe",
        name = MOD_NAME .. '/' .. wraith,
        enabled = false,
        energy_required = 120,
        ingredients =
        {
            {"rocket-launcher", 2},
            {"rocket-control-unit", 10},
            {"rocket", 100},
            {"rocket-fuel", 20},
            {"low-density-structure", 10},
            {"flying-robot-frame", 10},
        },
        result = MOD_NAME .. '/' .. wraith
    },
    {
        type = "recipe",
        name = MOD_NAME .. '/' .. wraith .. '/scout',
        enabled = false,
        energy_required = 120,
        ingredients =
        {
            {"laser-turret", 5},
            {"rocket-control-unit", 10},
            {"battery", 50},
            {"rocket-fuel", 40},
            {"low-density-structure", 15},
            {"flying-robot-frame", 15},
        },
        result = MOD_NAME .. '/' .. wraith .. '/scout'
    },
    {
        type = "recipe",
        name = MOD_NAME .. '/' .. wraith .. '/cold',
        enabled = false,
        energy_required = 120,
        ingredients =
        {
            {"rocket-launcher", 2},
            {"rocket-control-unit", 10},
            {"slowdown-capsule", 100},
            {"rocket-fuel", 20},
            {"low-density-structure", 10},
            {"flying-robot-frame", 10},
        },
        result = MOD_NAME .. '/' .. wraith .. '/cold'
    },
    {
        type = "recipe",
        name = MOD_NAME .. '/' .. wraith  .. '/acid',
        enabled = false,
        energy_required = 120,
        ingredients =
        {
            {"rocket-launcher", 2},
            {"rocket-control-unit", 10},
            {"poison-capsule", 100},
            {"rocket-fuel", 20},
            {"low-density-structure", 10},
            {"flying-robot-frame", 10},
        },
        result = MOD_NAME .. '/' .. wraith  .. '/acid'
    },
})
