--Q3 - Fix or improve the name and the implementation of the below method

-- Renamed Variables for readability
-- Indentation for Readability
-- No need to cache the entire <player> object if it's only use was to also cache the <party>.
-- Instead, I opted to cache the <party> by referencing the <player> in a single line.
-- this also allows me to use the "player" variable name within my generic for loop
-- the generic for loop only requires that we have access to the "values" within the key:value pairs
-- so I have omitted the key and denoted it with a "_" instead.
--
-- It's worth remarking that if the system was designed differently, we could simply remove the 
-- Party member at the index position  instead of doing a seperate operation to query for players' memberName
function removePlayerFromParty(playerId, memberName)

    local party = Player(playerId):getParty()

    for _, player in pairs(party:getMembers()) do
        if player == Player(memberName) then
            party:removeMember(Player(memberName))
        end
    end
end