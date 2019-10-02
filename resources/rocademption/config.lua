Config = {}

----------------------------------------------------
-------- Intervalles en secondes -------------------
----------------------------------------------------

-- Temps d'attente Antispam / Waiting time for antispam
Config.AntiSpamTimer = 2

-- Vérification et attribution d'une place libre / Verification and allocation of a free place
Config.TimerCheckPlaces = 3

-- Mise à jour du message (emojis) et accès à la place libérée pour l'heureux élu / Update of the message (emojis) and access to the free place for the lucky one
Config.TimerRefreshClient = 3

-- Mise à jour du nombre de points / Number of points updating
Config.TimerUpdatePoints = 6

----------------------------------------------------
------------ Nombres de points ---------------------
----------------------------------------------------

-- Nombre de points gagnés pour ceux qui attendent / Number of points earned for those who are waiting
Config.AddPoints = 1

-- Nombre de points perdus pour ceux qui sont entrés dans le serveur / Number of points lost for those who entered the server
Config.RemovePoints = 1

-- Nombre de points gagnés pour ceux qui ont 3 emojis identiques (loterie) / Number of points earned for those who have 3 identical emojis (lottery)
Config.LoterieBonusPoints = 25

-- Accès prioritaires / Priority access
Config.Points = {
	-- {'steamID', points},

	-- prioridad staff
	{'steam:11000010227ac1a', 10000}, -- sonny
	{'steam:110000104540a5b', 10000}, -- bestia
	{'steam:110000112c18d36', 10000}, -- agustin

	-- prioridad 1 Diamante
	{'steam:110000104750126', 9000}, -- duende
	{'steam:11000010cff9531', 9000}, -- Tuny - Vence 03/08*
	--{'steam:11000010617d31b', 9000}, -- Bauti - Vence 03/07
	{'steam:11000010ae420f0', 9000}, -- Keev - Vence 03/08*
	{'steam:1100001079e9e4c', 9000}, -- Jamaican - Vence 03/07
	--{'steam:1100001053e252d', 9000}, -- Simbe - Vence 03/07
	--{'steam:11000010fafa368', 9000}, -- Loveyourdreams - Vence 03/07
	--{'steam:1100001068d63f2', 9000}, -- Duxon - Vence 03/07
	--{'steam:11000010200adb1', 9000}, -- Dean - Vence 03/07
	--{'steam:1100001067a3127', 9000}, -- Erzier - Vence 03/07
	{'steam:11000010778dee2', 9000}, -- Chukychu - Vence 10/08
	--{'steam:11000010981429c', 9000}, -- Koorvan - Vence 03/07
	--{'steam:11000010a069867', 9000}, -- Sora - Vence 03/07 
	{'steam:1100001197b6b2b', 9000}, -- Carlita - Vence 03/07
	--{'steam:110000107cb48d2', 9000}, -- Ceratus - Vence 03/07
	--{'steam:1100001076dd527', 9000}, -- Starboy - Vence 03/07
	{'steam:11000011af17b03', 9000}, -- ElGordoLG - Vence 03/08*
	--{'steam:1100001064720f2', 9000}, -- Labosso - Vence 03/07
	--{'steam:110000108426c5a', 9000}, -- Amelia - Vence 03/07
	--{'steam:1100001048ec402', 9000}, -- sebbba - Vence 05/07
	--{'steam:110000107245109', 9000}, -- berna - Vence 08/07
	--{'steam:110000108d7affe', 9000}, -- Axeeeel - Vence 09/08*
	--{'steam:1100001322019a7', 9000}, -- KiddBoss - Vence el 08/07
	--{'steam:1100001058da937', 9000}, -- salvatore - Vence el 10/07
	--{'steam:11000010d9f203b', 9000}, -- Roba - Vence el 11/07
	--{'steam:11000010a163caf', 9000}, -- enzomatre#3135 - Vence el 12/07
	--{'steam:1100001069f6b41', 9000}, -- mikz - Vence el 12/07
	--{'steam:11000010368cf0a', 9000}, -- koolder - Vence el 12/07
	--{'steam:1100001047075fa', 9000}, -- Lumy - Vence 17/07
	--{'steam:1100001099b84f8', 9000}, --  Dialoff Vence 17/07
	--{'steam:1100001137d3d68', 9000}, -- BrahiaNL - Vence 17/07
	--{'steam:11000010896460e', 9000}, -- LLyrac - Vence 25/07
	--{'steam:110000105cbac14', 9000}, --  Monki - Vence 25/07
	{'steam:1100001098be029', 9000}, -- johnny sins - Vence 08/09
	{'steam:11000010353cf1a', 9000}, -- MartinSith - Vence 08/09
	--{'steam:1100001170b18d6', 9000}, -- LucsF - Vence 25/07
	--{'steam:1100001066b2961', 9000}, -- Jhon Wick - Petter Quill - Vence 28/07 
	--{'steam:110000102224a19', 9000}, -- Markogamba - Vence 28/07
	{'steam:11000010eef18e4', 9000}, -- KaysaGG - Vence 28/06
	--{'steam:110000106ae0472', 9000}, -- Seninguen Vence 28 /07
	--{'steam:110000131caf603', 9000}, -- RicardoVlza	-  Vence 29/07
	{'steam:11000010ad4d343', 9000}, -- Taine	-  Vence 29/07
	--{'steam:11000013bcaaf18', 9000}, -- Sierraso - Vence 07/08/2019
	--{'steam:11000010bc3f6cb', 9000}, -- Vankurt - Vence 07/08/2019
	--{'steam:1100001182a53ae', 9000}, -- Emege - Vence 07/08
	--{'steam:11000010f023465', 9000}, -- Matty - Vence 07/08
	--{'steam:11000010c63280a', 9000}, -- Pandalz	Vence 07/08
	{'steam:110000107015372', 9000}, -- Sophie - VENCE 10/07
	--{'', 9000}, -- 
	--{'', 9000}, -- 
	--{'', 9000}, -- 
	--{'', 9000}, -- 
	--{'', 9000}, -- 
	--{'', 9000}, -- 
	--{'', 9000}, -- 
	

	
	-- prioridad 2 ORO
	--{'steam:11000011730614c', 8000}, -- dysar -- STAFF
	--{'steam:11000010525ac9a', 8000}, -- Laciel - Vence 03/07
	--{'steam:1100001383f08c0', 8000}, -- Tripaloski - Vence 03/07
	--{'steam:11000010fb428f8', 8000}, -- Devilman - Vence el 03/07
	--{'steam:1100001323c68b6', 8000}, -- Karuchita - Vence el 03/07
	--{'steam:11000010ae5b682', 8000}, -- sumoSK - Vence el 08/07
	--{'steam:110000106b45f52', 8000}, -- fulambia - Vence el 14/07
	--{'steam:110000109d2cee1', 8000}, -- MikHawk - Vence el 17/07
	--{'steam:110000111ebcb86', 8000}, -- Bruspol Vence el 17/07
	--{'steam:110000104073ccc', 8000}, -- RR - Vence 25/07
	--{'steam:11000011ca9f182', 8000}, -- Andrea - Vence 09/08
	--{'', 8000}, -- 
	--{'', 8000}, -- 
	--{'', 8000}, -- 
	--{'', 8000}, -- 
	--{'', 8000}, -- 
	--{'', 8000}, -- 
	--{'', 8000}, -- 


	-- prioridad 3
	--{'steam:11000010a069867', 7000}, -- sora
	--{'steam:11000011797de36', 7000}, -- insane
	--{'steam:11000011a78d15e', 7000}, -- sosa
	--{'steam:1100001021a906a', 7000}, -- Damus - Vence 03/07
	--{'steam:11000011b7a065e', 7000}, -- Durmiente - Vence 04/07
	--{'steam:110000107b9bbb8', 7000}, -- Skowers#2313 07/08
	--{'', 7000}, -- 
	--{'', 7000}, -- 
	--{'', 7000}, -- 
	--{'', 7000}, -- 
	--{'', 7000}, -- 
	--{'', 7000}, -- 
	--{'', 7000}, -- 

	-- prioridad 4
	--{'steam:11000010592a501', 6000}, -- Gonza (Rickyforte)
	--{'steam:110000108dd1de9', 6000}, -- Vowe
	{'steam:11000010451cb9a', 6000}, -- DarkozTV
	--{'steam:1100001105fe890', 6000}, -- capi
	--{'steam:110000102fc1232', 6000}, -- Pancho
	--{'steam:1100001128ef729', 6000}, -- Agushmar
	--{'steam:1100001059b53e6', 6000}, -- haratadara
	--{'steam:11000010602a0c6', 6000}, -- Mysterionsito
	--{'steam:110000111a817f5', 6000}, -- YSY (rencab)
	
	

}

----------------------------------------------------
------------- Textes des messages ------------------
----------------------------------------------------

-- Si steam n'est pas détecté / If steam is not detected
--Config.NoSteam = "Steam n'a pas été détecté. Veuillez (re)lancer Steam et FiveM, puis réessayer."
Config.NoSteam = "No se detectó Steam. Por favor (re)inicie Steam y FiveM, y vuelva a intentarlo."

-- Message d'attente / Waiting text
--Config.EnRoute = "Vous êtes en route. Vous avez déjà parcouru"
Config.EnRoute = "Estas en el camino Ya has viajado"

-- "points" traduits en langage RP / "points" for RP purpose
--Config.PointsRP = "kilomètres"
Config.PointsRP = "Kilometros"

-- Position dans la file / position in the queue
--Config.Position = "Vous êtes en position "
Config.Position = "Estas en posicion "

-- Texte avant les emojis / Text before emojis
--Config.EmojiMsg = "Si les emojis sont figés, relancez votre client : "
Config.EmojiMsg = "Si los emojis están congelados, reinicie su cliente: "

-- Quand le type gagne à la loterie / When the player win the lottery
--Config.EmojiBoost = "!!! Youpi, " .. Config.LoterieBonusPoints .. " " .. Config.PointsRP .. " gagnés !!!"
Config.EmojiBoost = "!!! Yippee, " .. Config.LoterieBonusPoints .. " " .. Config.PointsRP .. " gane !!!"

-- Anti-spam message / anti-spam text
--Config.PleaseWait_1 = "Veuillez patienter "
--Config.PleaseWait_2 = " secondes. La connexion se lancera automatiquement !"
Config.PleaseWait_1 = "por favor espera "
Config.PleaseWait_2 = " segundos. La conexión se iniciará automáticamente!"

-- Me devrait jamais s'afficher / Should never be displayed
--Config.Accident = "Oups, vous venez d'avoir un accident... Si cela se reproduit, vous pouvez en informer le support :)"
Config.Accident = "OOps, acaba de tener un accidente ... Si vuelve a suceder, puede informar al soporte :)"

-- En cas de points négatifs / In case of negative points
--Config.Error = " ERREUR : RELANCEZ LA ROCADE ET CONTACTEZ LE SUPPORT DU SERVEUR "
Config.Error = " ERROR: REINICIE EL SISTEMA DE COLAS Y CONTACTE CON EL SOPORTE "


Config.EmojiList = {
	'🐌', 
	'🐍',
	'🐎', 
	'🐑', 
	'🐒',
	'🐘', 
	'🐙', 
	'🐛',
	'🐜',
	'🐝',
	'🐞',
	'🐟',
	'🐠',
	'🐡',
	'🐢',
	'🐤',
	'🐦',
	'🐧',
	'🐩',
	'🐫',
	'🐬',
	'🐲',
	'🐳',
	'🐴',
	'🐅',
	'🐈',
	'🐉',
	'🐋',
	'🐀',
	'🐇',
	'🐏',
	'🐐',
	'🐓',
	'🐕',
	'🐖',
	'🐪',
	'🐆',
	'🐄',
	'🐃',
	'🐂',
	'🐁',
	'🔥'
}
