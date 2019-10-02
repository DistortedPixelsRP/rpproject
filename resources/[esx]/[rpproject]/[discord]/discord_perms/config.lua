Config = {
	DiscordToken = "NTk3NTYwMzI1NDA3MTEzMjE2.XTTULg.MeAKMgr8h0CafYG0V7ArSTGsTJ8",
	GuildId = "564390094111244298",
	Loop = true, -- Should we automatically refresh perms incase someone loses a role?
	LoopDelay = 60000, -- How often to automatically refresh user permissions
	
	-- Format: ["Role Nickname"] = "Role ID" You can get role id by doing \@RoleName
	Roles = {
		["whitelist"] = "564929504410337282" -- This would be checked by doing exports.discord_perms:IsRolePresent(user, "TestRole")
	}
}
