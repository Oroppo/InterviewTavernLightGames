

-- Q2 - Fix or improve the implementation of the below method

-- I'm assuming that guilds[] is a list of <guild> objects 
-- that hold their own max_members variable and that
-- db.storeQuery() returns a table with data of that guild.

-- This method is supposed to print names of all guilds that have less than memberCount max members
function printSmallGuildNames(memberCount)  
    --local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    for i = #guilds, 1, -1
    do
        if(guilds[i].max_members<memberCount) then
            local selectGuildQuery = guilds[i]
            resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
        end
    end
    local guildName = resultId.getString("name")
    print(guildName)
    end

