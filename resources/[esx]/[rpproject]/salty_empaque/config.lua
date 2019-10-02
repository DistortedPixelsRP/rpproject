Config = {}

-- Ammo given by default to crafted weapons
--Config.WeaponAmmo = 42

Config.Recipes = {
	-- Can be a normal ESX item
	["weed_pooch"] = { 
		{item = "marijuana", quantity = 2 }, 
		{item = "bolsa", quantity = 1 },
	}
	
}

-- Enable a shop to access the crafting menu
Config.Shop = {
	useShop = true,
	shopCoordinates = { x=244.94, y=370.24, z=104.74 },
	shopName = "Empaquetado",
	--shopBlipID = 446,
	zoneSize = { x = 2.5, y = 2.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 }
}

-- Enable crafting menu through a keyboard shortcut
Config.Keyboard = {
	useKeyboard = false,
	keyCode = 303
}
