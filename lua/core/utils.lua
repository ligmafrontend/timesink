local M = {}  
local merge_tbl = vim.tbl_deep_extend  
local config = require "core.default_config"  
  
-- Function to get config  
function M.get_config()  
    return config  
end  
 
function M.load_mappings(section, mapping_opt)  
    -- Schedule the function to prevent blocking the UI  
    vim.schedule(function()  
        -- Inner function to set the section map  
        local function set_section_map(section_values)  
            -- If section_values.plugin exists, stop the function  
            if section_values.plugin then  
                return  
            end  
    
            section_values.plugin = nil  
    
            -- Iterate over the section_values  
            for mode, mode_values in pairs(section_values) do  
                -- Merge the default options with the mapping options  
                local default_opts = merge_tbl("force", { mode = mode }, mapping_opt or {})  
                for keybind, mapping_info in pairs(mode_values) do  
                    local opts = merge_tbl("force", default_opts, mapping_info.opts or {})  
                    mapping_info.opts, opts.mode = nil, nil  
                    opts.desc = mapping_info[2]  
                    -- Set key mappings  
                    vim.keymap.set(mode, keybind, mapping_info[1], opts)
                end  
            end  
        end  
    
        local mappings = M.get_config().mappings  
    
        -- If the section is a string, get the specific section from the mappings  
        if type(section) == "string" then  
            mappings[section]["plugin"] = nil  
            mappings = { mappings[section] }  
        end  
    
        -- Iterate over the mappings and set the section map  
        for _, sect in pairs(mappings) do  
            set_section_map(sect)  
        end  
    end)  
end

-- M.lazy_load = function(plugin)
--     vim.api
-- end
  
-- Return the module M  
return M  
