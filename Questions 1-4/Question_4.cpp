// Q4 - Assume all method calls work fine. Fix the memory leak issue in below method

// Manual resource allocation is very error prone and easy to muck up.
// Normally i'd simply use smart pointers in order to get rid of possible memory leaks.
// Tools like std::unique_ptr and std::shared_ptr have been lifesavers for me
// since raw pointers are being used in the function I will follow suit, however,
// even this approach is undesirable. If it's absolutely necessary to use raw pointers,
// I would also setup regular Garbage Collection within the main game loop.
//
// Essentially the best solution to this problem is not to have it in the first place.
// Admittedly, this means I don't regularly deal with memory leaks so my approach is just to follow
// every logic path and free up the memory of every variable that uses the "new" keyword.
// It's not elegant or fancy, but it gets the job done.
void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);

    if (!player) {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            //memory leak here!
            delete player;
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);

    if (!item) {
        //memory leak here!
        delete player;
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }
    //Code Execution finished, free all heap memory.
    delete player;
}
