Config = {}
Config.Locale = 'en'

Config.RequiredCopsRob = 5
Config.RequiredCopsSell = 3

Stores = {
	["jewelry"] = {
		position = { ['x'] = -629.99, ['y'] = -236.542, ['z'] = 38.05 },       
		reward = math.random(150000,300000),
		nameofstore = "jewelry",
		lastrobbed = 0
	}
}