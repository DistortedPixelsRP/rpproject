--Truck
Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 300



-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:

Config.localWeight = {
	bread = 125,
    water = 330,
    gazbottle = 2000,
    fixtool = 1500,
    carotool = 1000,
    blowpipe = 1200,
    fixkit = 1500,
    carokit = 1000,
    alive_chicken = 1000,
    slaughtered_chicken = 800,
    packaged_chicken = 600,
    fish = 350,
    stone = 500,
    washed_stone = 450,
    copper = 400,
    iron = 450,
    gold = 350,
    diamond = 480,
    wood = 1000,
    cutted_wood = 750,
    packaged_plank = 550,
    petrol = 600,
    petrol_raffin = 500,
    essence = 250,
    whool = 300,
    clothe = 200,
    fabric = 220,
    weed = 350,
    marijuana = 700,
    weed_pooch = 650,
    coke = 600,
    coke_pooch = 500,
    meth = 600,
    meth_pooch = 500,
    opium = 600,
    opium_pooch = 500,
    permis = 500,
    bandage = 250,
    medikit = 500,
    lsd = 600,
    lsd_pooch = 500,
    codeine = 250,
    essence = 250,
    disolvant = 250,
    phosphorerouge = 250,
    heroine = 250,
    iode = 250,
    kroko_pooch = 500,
    silencieux = 1000,
    flashlight = 1200,
    grip = 800,
    yusuf = 500,
    meat = 350,
    leather = 250,
    turtle = 1500,
    shark = 2500,
    fishingrod = 4500,
    clip = 1000,
    drill = 15000,
	WEAPON_COMBATPISTOL = 1000, -- poid poir une munnition
    black_money = 1, -- poids pour un argent
    weed_pooch = 250,
    WEAPON_PETROLCAN = 1000
}

Config.VehicleLimit = {
    [0] = 50000, --Compact
    [1] = 40000, --Sedan
    [2] = 70000, --SUV
    [3] = 25000, --Coupes
    [4] = 50000, --Muscle
    [5] = 10000, --Sports Classics
    [6] = 5000, --Sports
    [7] = 5000, --Super
    [8] = 5000, --Motorcycles
    [9] = 180000, --Off-road
    [10] = 500000, --Industrial
    [11] = 70000, --Utility
    [12] = 150000, --Vans
    [13] = 0, --Cycles
    [14] = 5000, --Boats
    [15] = 20000, --Helicopters
    [16] = 0, --Planes
    [17] = 40000, --Service
    [18] = 40000, --Emergency
    [19] = 0, --Military
    [20] = 500000, --Commercial
    [21] = 0, --Trains
}
