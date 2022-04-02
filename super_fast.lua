local nodenames = { 
            "technic:wind_mill_frame", 
            "trunks:spruce_trunkroot",
            "trunks:treeroot",
            "trunks:sequoia_trunkroot",
            "molehills:molehill",
            "trunks:pine_treeroot",
            "trunks:rubber_tree_trunkroot",
            "trunks:jungletree_root",
            "trunks:apple_tree_trunkroot",
            "trunks:palm_trunkroot",
    }
    
for key,value in pairs(nodenames) do
    minetest.register_alias(value, "air")
    
end
            
