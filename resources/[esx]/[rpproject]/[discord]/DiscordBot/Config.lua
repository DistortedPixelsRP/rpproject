DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/573239265459437568/NPb3RgOEai5vqbROgQxoKRvfeJsrDSqKO52YMS5keeDSH7iCVpHZVLFfMYfva5tYYTUX'
DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/573239257783730203/ThYYlnQ8pRKZuZa8g9kRNx-GLbJaSZjqrnB-aNApHl03ji1RBj1KRafss46fsLZargON'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/573247693921583125/-SQOfmVs--R2Y4imVvMhIie_mGJ5UkguieHtSj3OBPi1KeKs6EdYwgEOn9e5U5Z4Z59S'

SystemAvatar = 'https://wiki.fivem.net/w/images/d/db/FiveM-Wiki.png'

UserAvatar = 'https://i.imgur.com/KIcqSYs.png'

SystemName = 'RPProject System'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
	{'/ooc', '**[OOC]: **'},
	{'/twt', '**[Tweet]: **'},
	{'/job', '**[Trabajo]: **'},
	{'/report', '**[Report]: **'},
	{'/do', '**[Accion]: **'},
	{'/me', '**[Pensamiento]: **'},
}

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
	'/cardel',
	'/car',
	'/goto',
	'/tp',
}

-- These Commands will use their own webhook
OwnWebhookCommands = {
	{'/report', 'https://discordapp.com/api/webhooks/573251710181572609/MT6iiOvCnCbDtX5kORrtPOlZ61b6mT7GTvsctu69QcUrYWjHNF4MTL1L9sFfNi3L-l5G'},
}

-- These Commands will be sent as TTS messages
TTSCommands = {
	'/Whatever',
	'/Whatever2',
}

