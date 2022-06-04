Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = true -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 50

Config.Locale                     = 'fr'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 4
Config.PlateNumbers  = 4
Config.PlateUseSpace = false

Marker = {
	Type = 6,
	Color = {R = 0, G = 0, B = 255},
	Size =  {x = 1.0, y = 1.0, z = 1.0},
	DrawDistance = 10,
	DrawInteract = 1.5,
}


Config.Zones = {

	ShopEntering = {
		Pos   = { x = -781.473632, y = -210.9229, z = 37.30 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 20
	},

	ShopInside = {
		Pos     = { x = -776.32, y = -231.31, z = 36.50 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 209.67,
		Type    = -1
	},

	ShopOutside = {
		Pos     = {x = -774.1145, y = -233.0394, z = 36.50 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 126.49,
		Type    = -1
	},

	BossActions = {
		Pos   = { x = -809.84, y = -208.39, z = 37.12 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},


	--GiveBackVehicle = {
	--	Pos   = { x = -18.227, y = -1078.558, z = 25.675 },
	--	Size  = { x = 3.0, y = 3.0, z = 1.0 },
	--	Type  = (Config.EnablePlayerManagement and 1 or -1)
	--},

	ResellVehicle = {
		Pos   = { x = -44.630, y = -1080.738, z = -25.683 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = 1
	}

}
