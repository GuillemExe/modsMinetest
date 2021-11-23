-- TOOLS

-- TOOL PEAK ORICHALCUM
minetest.register_tool("mymod:peak_orichalcum", {
    description = "Pico de oricalco",
    inventory_image = "tool_orichalcumpick.png",
    range = 4.2,
    tool_capabilities = {
        full_punch_interval = 0.88,
        max_drop_level=1,
        groupcaps = {
            cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
        },
        damage_groups = {fleshy=6},
    },
    sound = {breaks = "default_tool_breaks"},
})

-- CRAFTS PEAK ORICHALCUM
minetest.register_craft({
	output = 'mymod:peak_orichalcum',
	recipe = {
		{'mymod:orichalcum_bar', 'mymod:orichalcum_bar', 'mymod:orichalcum_bar'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

-- TOOL SWORD ORICHALCUM
minetest.register_tool("mymod:sword_orichalcum", {
    description = "Espada de oricalco",
    inventory_image = "tool_orichalcumsword.png",
    range = 4.2,
    tool_capabilities = {
        full_punch_interval = 0.88,
        max_drop_level=1,
        groupcaps = {
            cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
        },
        damage_groups = {fleshy=6},
    },
    sound = {breaks = "default_tool_breaks"},
})

-- CRAFTS SWORD ORICHALCUM
minetest.register_craft({
	output = 'mymod:sword_orichalcum',
	recipe = {
		{'', 'mymod:orichalcum_bar', ''},
		{'', 'mymod:orichalcum_bar', ''},
		{'', 'group:stick', ''},
	}
})

-- TOOL AXE ORICHALCUM
minetest.register_tool("mymod:axe_orichalcum", {
    description = "Espada de oricalco",
    inventory_image = "tool_orichalcumaxe.png",
    range = 4.2,
    tool_capabilities = {
        full_punch_interval = 0.88,
        max_drop_level=1,
        groupcaps = {
            cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
        },
        damage_groups = {fleshy=6},
    },
    sound = {breaks = "default_tool_breaks"},
})

-- CRAFTS AXE ORICHALCUM X1
minetest.register_craft({
	output = 'mymod:axe_orichalcum',
	recipe = {
		{'mymod:orichalcum_bar', 'mymod:orichalcum_bar', ''},
		{'mymod:orichalcum_bar', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

-- CRAFTS AXE ORICHALCUM X2
minetest.register_craft({
	output = 'mymod:axe_orichalcum',
	recipe = {
		{'mymod:orichalcum_bar', 'mymod:orichalcum_bar', ''},
		{'', 'group:stick', 'mymod:orichalcum_bar'},
		{'', 'group:stick', ''},
	}
})

-- TOOL SHOVEL ORICHALCUM
minetest.register_tool("mymod:shovel_orichalcum", {
    description = "Espada de oricalco",
    inventory_image = "tool_orichalcumshovel.png",
    range = 4.2,
    tool_capabilities = {
        full_punch_interval = 0.88,
        max_drop_level=1,
        groupcaps = {
            cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
        },
        damage_groups = {fleshy=6},
    },
    sound = {breaks = "default_tool_breaks"},
})

-- CRAFTS SHOVEL ORICHALCUM
minetest.register_craft({
	output = 'mymod:shovel_orichalcum',
	recipe = {
		{'', 'mymod:orichalcum_bar', ''},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

-- TOOL HOE ORICHALCUM
minetest.register_tool("mymod:hoe_orichalcum", {
    description = "Espada de oricalco",
    inventory_image = "tool_orichalcumhoe.png",
    range = 4.2,
    tool_capabilities = {
        full_punch_interval = 0.88,
        max_drop_level=1,
        groupcaps = {
            cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
        },
        damage_groups = {fleshy=6},
    },
    sound = {breaks = "default_tool_breaks"},
})

-- CRAFTS HOE ORICHALCUM X1
minetest.register_craft({
	output = 'mymod:hoe_orichalcum',
	recipe = {
		{'mymod:orichalcum_bar', 'mymod:orichalcum_bar', ''},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

-- CRAFTS HOE ORICHALCUM X2 
minetest.register_craft({
	output = 'mymod:hoe_orichalcum',
	recipe = {
		{'', 'mymod:orichalcum_bar', 'mymod:orichalcum_bar'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})
