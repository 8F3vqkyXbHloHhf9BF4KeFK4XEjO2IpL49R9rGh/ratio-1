repeat task.wait() until game:IsLoaded() -- Could be more optimized but it's not gonna last very long so idc
_G.oldpcall = getrenv().pcall
old = getrenv().pcall
getrenv().pcall = newcclosure(function(...)
    args = {...}
    if not checkcaller() then
        for _, c in pairs(getconstants(args[1])) do
            if c == "FindService" or c == "GetService" then
                return old(function() end)
            end
        end
    end
    return old(...)
end)
