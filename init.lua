minetest.register_chatcommand("place", {
    description = "Place the node you're holding at your feet.",
    privs = {fly=true},
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        local pos = player:get_pos()
        local stack = player:get_wielded_item()
        if minetest.registered_nodes[stack:get_name()] then
            local stack, success = minetest.registered_nodes[stack:get_name()].on_place(stack, player, {type="node", under=pos, above=pos})
            player:set_wielded_item(stack)
        end
    end,
}) -- As you can see this is a very big mod