for i,v in pairs(getconnections(game.ScriptContext.Error)) do -- No
    v:Disable()
end
if game.PlaceId == 379614936 or game.PlaceId == 379614936 or game.PlaceId == 5006801542 or game.PlaceId == 860428890 or game.PlaceId == 866472074 then
    _G.oldpcall = getrenv().pcall
    old = getrenv().pcall
    getrenv().pcall = newcclosure(function(...)
        args = {...}
        if not checkcaller() then
            for _, c in pairs(getconstants(args[1])) do
                if c == "FindService" or c == "GetService" then
                    return
                end
            end
        end
        return old(...)
    end)
end
