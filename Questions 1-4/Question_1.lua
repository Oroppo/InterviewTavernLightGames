-- Q1 - Fix or improve the implementation of the below method

-- Created a definition for addEvent for my sanity with intellisense
local function addEvent(storage, index, target)
    --Do the function
    end

-- Some syntax corrections
local function releaseStorage(player)
    player.setStorageValue(1000, -1)   
    end

-- Some syntax corrections
-- releaseStorage() requires a <player> reference
function onLogout(player)
    if player.getStorageValue(1000) == 1 then
        addEvent(releaseStorage(player), 1000, player)
    end
    return true
    end