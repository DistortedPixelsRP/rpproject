Config = {}

Config.BottleRecieve = { 2, 6 } -- This is the math random ex. math.random(1, 6) this will give you 1 - 6 bottles when searching a bin.
Config.BottleReward = { 5, 10 } -- This is the math random ex. math.random(1, 4) this will give a random payout between 1 - 4

-- Here you add all the bins you are going to search.
Config.BinsAvailable = {
    "prop_bin_01a",
    "prop_bin_02a",
    
    "prop_bin_03a",
    "prop_bin_05a",
    "prop_bin_06a",
    "prop_bin_07a",
    "prop_bin_07b",
    "prop_bin_07c",
    "prop_bin_08a",
    "prop_bin_08open",
    "prop_bin_09a",
    "prop_bin_14a",
}

-- This is where you add the locations where you sell the bottles.
Config.SellBottleLocations = {
    vector3(29.337753295898, -1770.3348388672, 29.607357025146),
    vector3(388.30194091797, -874.88238525391, 29.295169830322),
    vector3(26.877752304077, -1343.0764160156, 29.497024536133)
}