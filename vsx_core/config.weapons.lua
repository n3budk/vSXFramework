Config = {}

Config.DefaultWeaponTints = {
	[0] = 'tint_default',
	[1] = 'tint_green',
	[2] = 'tint_gold',
	[3] = 'tint_pink',
	[4] = 'tint_army',
	[5] = 'tint_lspd',
	[6] = 'tint_orange',
	[7] = 'tint_platinum'
}

Config.Weapons = {
	{
		name = 'WEAPON_PISTOL',
		label = 'weapon_pistol',
		ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_PISTOL_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_PISTOL_CLIP_02`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_PI_SUPP_02`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_PISTOL_VARMOD_LUXE`}
		}
	},

	{
		name = 'WEAPON_COMBATPISTOL',
		label = 'weapon_combatpistol',
		ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_COMBATPISTOL_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_COMBATPISTOL_CLIP_02`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_PI_SUPP`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER`}
		}
	},

	{
		name = 'WEAPON_APPISTOL',
		label = 'weapon_appistol',
		ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_APPISTOL_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_APPISTOL_CLIP_02`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_PI_SUPP`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_APPISTOL_VARMOD_LUXE`}
		}
	},

	{
		name = 'WEAPON_PISTOL50',
		label = 'weapon_pistol50',
		ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_PISTOL50_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_PISTOL50_CLIP_02`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_PISTOL50_VARMOD_LUXE`}
		}
	},

	{
		name = 'WEAPON_SNSPISTOL',
		label = 'weapon_snspistol',
		ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_SNSPISTOL_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_SNSPISTOL_CLIP_02`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_SNSPISTOL_VARMOD_LOWRIDER`}
		}
	},

	{
		name = 'WEAPON_HEAVYPISTOL',
		label = 'weapon_heavypistol',
		ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_HEAVYPISTOL_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_HEAVYPISTOL_CLIP_02`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_PI_SUPP`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_HEAVYPISTOL_VARMOD_LUXE`}
		}
	},

	{
		name = 'WEAPON_VINTAGEPISTOL',
		label = 'weapon_vintagepistol',
		ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_VINTAGEPISTOL_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_VINTAGEPISTOL_CLIP_02`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_PI_SUPP`}
		}
	},

	{
		name = 'WEAPON_MACHINEPISTOL',
		label = 'weapon_machinepistol',
		ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_MACHINEPISTOL_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_MACHINEPISTOL_CLIP_02`},
			{name = 'clip_drum', label = 'component_clip_drum', hash = `COMPONENT_MACHINEPISTOL_CLIP_03`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_PI_SUPP`}
		}
	},
	
	{
		name = 'WEAPON_CERAMICPISTOL',
		label = 'weapon_ceramicpistol',
		ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_CERAMICPISTOL_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_CERAMICPISTOL_CLIP_02`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_CERAMICPISTOL_SUPP`}
		}
	},

	{
		name = 'WEAPON_NAVYREVOLVER',
		label = 'weapon_navyrevolver',
		ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_NAVYREVOLVER_CLIP_01`}
		}
	},

	{name = 'WEAPON_REVOLVER', label = 'weapon_revolver', tints = Config.DefaultWeaponTints, components = {}, ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`}},
	{name = 'WEAPON_MARKSMANPISTOL', label = 'weapon_marksmanpistol', tints = Config.DefaultWeaponTints, components = {}, ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`}},
	{name = 'WEAPON_DOUBLEACTION', label = 'weapon_doubleaction', components = {}, ammo = {label = 'ammo_rounds', hash = `AMMO_PISTOL`}},

	{
		name = 'WEAPON_SMG',
		label = 'weapon_smg',
		ammo = {label = 'ammo_rounds', hash = `AMMO_SMG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_SMG_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_SMG_CLIP_02`},
			{name = 'clip_drum', label = 'component_clip_drum', hash = `COMPONENT_SMG_CLIP_03`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_MACRO_02`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_PI_SUPP`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_SMG_VARMOD_LUXE`}
		}
	},

	{
		name = 'WEAPON_ASSAULTSMG',
		label = 'weapon_assaultsmg',
		ammo = {label = 'ammo_rounds', hash = `AMMO_SMG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_ASSAULTSMG_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_ASSAULTSMG_CLIP_02`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_MACRO`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER`}
		}
	},

	{
		name = 'WEAPON_MICROSMG',
		label = 'weapon_microsmg',
		ammo = {label = 'ammo_rounds', hash = `AMMO_SMG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_MICROSMG_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_MICROSMG_CLIP_02`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_MACRO`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_MICROSMG_VARMOD_LUXE`}
		}
	},

	{
		name = 'WEAPON_MINISMG',
		label = 'weapon_minismg',
		ammo = {label = 'ammo_rounds', hash = `AMMO_SMG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_MINISMG_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_MINISMG_CLIP_02`}
		}
	},

	{
		name = 'WEAPON_COMBATPDW',
		label = 'weapon_combatpdw',
		ammo = {label = 'ammo_rounds', hash = `AMMO_SMG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_COMBATPDW_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_COMBATPDW_CLIP_02`},
			{name = 'clip_drum', label = 'component_clip_drum', hash = `COMPONENT_COMBATPDW_CLIP_03`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_SMALL`}
		}
	},

	{
		name = 'WEAPON_PUMPSHOTGUN',
		label = 'weapon_pumpshotgun',
		ammo = {label = 'ammo_shells', hash = `AMMO_SHOTGUN`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_SR_SUPP`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER`}
		}
	},

	{
		name = 'WEAPON_SAWNOFFSHOTGUN',
		label = 'weapon_sawnoffshotgun',
		ammo = {label = 'ammo_shells', hash = `AMMO_SHOTGUN`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE`}
		}
	},

	{
		name = 'WEAPON_ASSAULTSHOTGUN',
		label = 'weapon_assaultshotgun',
		ammo = {label = 'ammo_shells', hash = `AMMO_SHOTGUN`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_ASSAULTSHOTGUN_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_ASSAULTSHOTGUN_CLIP_02`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP`}
		}
	},

	{
		name = 'WEAPON_BULLPUPSHOTGUN',
		label = 'weapon_bullpupshotgun',
		ammo = {label = 'ammo_shells', hash = `AMMO_SHOTGUN`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP`}
		}
	},

	{
		name = 'WEAPON_HEAVYSHOTGUN',
		label = 'weapon_heavyshotgun',
		ammo = {label = 'ammo_shells', hash = `AMMO_SHOTGUN`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_HEAVYSHOTGUN_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_HEAVYSHOTGUN_CLIP_02`},
			{name = 'clip_drum', label = 'component_clip_drum', hash = `COMPONENT_HEAVYSHOTGUN_CLIP_03`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP`}
		}
	},

	{name = 'WEAPON_DBSHOTGUN', label = 'weapon_dbshotgun', tints = Config.DefaultWeaponTints, components = {}, ammo = {label = 'ammo_shells', hash = `AMMO_SHOTGUN`}},
	{name = 'WEAPON_AUTOSHOTGUN', label = 'weapon_autoshotgun', tints = Config.DefaultWeaponTints, components = {}, ammo = {label = 'ammo_shells', hash = `AMMO_SHOTGUN`}},
	{name = 'WEAPON_MUSKET', label = 'weapon_musket', tints = Config.DefaultWeaponTints, components = {}, ammo = {label = 'ammo_rounds', hash = `AMMO_SHOTGUN`}},

	{
		name = 'WEAPON_ASSAULTRIFLE',
		label = 'weapon_assaultrifle',
		ammo = {label = 'ammo_rounds', hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_ASSAULTRIFLE_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_ASSAULTRIFLE_CLIP_02`},
			{name = 'clip_drum', label = 'component_clip_drum', hash = `COMPONENT_ASSAULTRIFLE_CLIP_03`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_MACRO`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_ASSAULTRIFLE_VARMOD_LUXE`}
		}
	},

	{
		name = 'WEAPON_CARBINERIFLE',
		label = 'weapon_carbinerifle',
		ammo = {label = 'ammo_rounds', hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_CARBINERIFLE_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_CARBINERIFLE_CLIP_02`},
			{name = 'clip_box', label = 'component_clip_box', hash = `COMPONENT_CARBINERIFLE_CLIP_03`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_MEDIUM`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_CARBINERIFLE_VARMOD_LUXE`}
		}
	},

	{
		name = 'WEAPON_ADVANCEDRIFLE',
		label = 'weapon_advancedrifle',
		ammo = {label = 'ammo_rounds', hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_ADVANCEDRIFLE_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_ADVANCEDRIFLE_CLIP_02`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_SMALL`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE`}
		}
	},

	{
		name = 'WEAPON_SPECIALCARBINE',
		label = 'weapon_specialcarbine',
		ammo = {label = 'ammo_rounds', hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_SPECIALCARBINE_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_SPECIALCARBINE_CLIP_02`},
			{name = 'clip_drum', label = 'component_clip_drum', hash = `COMPONENT_SPECIALCARBINE_CLIP_03`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_MEDIUM`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER`}
		}
	},

	{
		name = 'WEAPON_BULLPUPRIFLE',
		label = 'weapon_bullpuprifle',
		ammo = {label = 'ammo_rounds', hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_BULLPUPRIFLE_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_BULLPUPRIFLE_CLIP_02`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_SMALL`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_BULLPUPRIFLE_VARMOD_LOW`}
		}
	},

	{
		name = 'WEAPON_COMPACTRIFLE',
		label = 'weapon_compactrifle',
		ammo = {label = 'ammo_rounds', hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_COMPACTRIFLE_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_COMPACTRIFLE_CLIP_02`},
			{name = 'clip_drum', label = 'component_clip_drum', hash = `COMPONENT_COMPACTRIFLE_CLIP_03`}
		}
	},

	{
		name = 'WEAPON_MG',
		label = 'weapon_mg',
		ammo = {label = 'ammo_rounds', hash = `AMMO_MG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_MG_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_MG_CLIP_02`},
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_SMALL_02`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_MG_VARMOD_LOWRIDER`}
		}
	},

	{
		name = 'WEAPON_COMBATMG',
		label = 'weapon_combatmg',
		ammo = {label = 'ammo_rounds', hash = `AMMO_MG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_COMBATMG_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_COMBATMG_CLIP_02`},
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_MEDIUM`},
			{name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_COMBATMG_VARMOD_LOWRIDER`}
		}
	},

	{
		name = 'WEAPON_GUSENBERG',
		label = 'weapon_gusenberg',
		ammo = {label = 'ammo_rounds', hash = `AMMO_MG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_GUSENBERG_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_GUSENBERG_CLIP_02`},
		}
	},

	{
		name = 'WEAPON_SNIPERRIFLE',
		label = 'weapon_sniperrifle',
		ammo = {label = 'ammo_rounds', hash = `AMMO_SNIPER`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_LARGE`},
			{name = 'scope_advanced', label = 'component_scope_advanced', hash = `COMPONENT_AT_SCOPE_MAX`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_SNIPERRIFLE_VARMOD_LUXE`}
		}
	},

	{
		name = 'WEAPON_HEAVYSNIPER',
		label = 'weapon_heavysniper',
		ammo = {label = 'ammo_rounds', hash = `AMMO_SNIPER`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_LARGE`},
			{name = 'scope_advanced', label = 'component_scope_advanced', hash = `COMPONENT_AT_SCOPE_MAX`}
		}
	},

	{
		name = 'WEAPON_MARKSMANRIFLE',
		label = 'weapon_marksmanrifle',
		ammo = {label = 'ammo_rounds', hash = `AMMO_SNIPER`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_MARKSMANRIFLE_CLIP_01`},
			{name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_MARKSMANRIFLE_CLIP_02`},
			{name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM`},
			{name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'luxary_finish', label = 'component_luxary_finish', hash = `COMPONENT_MARKSMANRIFLE_VARMOD_LUXE`}
		}
	},

	{
		name = 'WEAPON_PISTOL_MK2',
		label = 'weapon_pistol_mk2',
		components = {
			{ name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_PISTOL_MK2_CLIP_01` },
			{ name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_PISTOL_MK2_CLIP_02` },
			{ name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_PI_FLSH` },
			{ name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_PI_SUPP_02` },
		
			{ name = 'rounds_tracer', label = 'component_round_tracer', hash = `COMPONENT_PISTOL_MK2_CLIP_TRACER` },
			{ name = 'rounds_hollow', label = 'component_round_hollow', hash = `COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'rounds_incendiary', label = 'component_round_incendiary', hash = `COMPONENT_PISTOL_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_fullmetal', label = 'component_round_fullmetal', hash = `COMPONENT_PISTOL_MK2_CLIP_FMJ` },
		
			{ name = 'compensator', label = 'component_compensator', hash = `COMPONENT_AT_PI_COMP` },
			
			{ name = 'skin_camo', label = 'component_skin_camo', hash = `COMPONENT_PISTOL_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = 'component_skin_brushstroke', hash = `COMPONENT_PISTOL_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = 'component_skin_woodland', hash = `COMPONENT_PISTOL_MK2_CAMO_03` },
			{ name = 'skin_skull', label = 'component_skin_skull', hash = `COMPONENT_PISTOL_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = 'component_skin_sessanta', hash = `COMPONENT_PISTOL_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = 'component_skin_perseus', hash = `COMPONENT_PISTOL_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = 'component_skin_leopard', hash = `COMPONENT_PISTOL_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = 'component_skin_zebra', hash = `COMPONENT_PISTOL_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = 'component_skin_geometric', hash = `COMPONENT_PISTOL_MK2_CAMO_09` },
			{ name = 'skin_boom', label = 'component_skin_boom', hash = `COMPONENT_PISTOL_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = 'component_skin_patriotic', hash = `COMPONENT_PISTOL_MK2_CAMO_IND_01` },
		}
	},

	{	
		name = 'WEAPON_REVOLVER_MK2',
		label = 'weapon_revolver_mk2',
		components = {
			{ name = 'clip', label = 'component_clip_default', hash = `COMPONENT_REVOLVER_MK2_CLIP_01` },
			
			{ name = 'rounds_tracer', label = 'component_round_tracer', hash = `COMPONENT_REVOLVER_MK2_CLIP_TRACER` },
			{ name = 'rounds_hollow', label = 'component_round_hollow', hash = `COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'rounds_incendiary', label = 'component_round_incendiary', hash = `COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_fullmetal', label = 'component_round_fullmetal', hash = `COMPONENT_REVOLVER_MK2_CLIP_FMJ` },


			{ name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_PI_FLSH` },

			{ name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_macro', label = 'component_scope_macro', hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_small', label = 'component_scope_small', hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },
			
			{ name = 'compensator', label = 'component_compensator', hash = `COMPONENT_AT_PI_COMP_03` },
			
			{ name = 'skin_camo', label = 'component_skin_camo', hash = `COMPONENT_REVOLVER_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = 'component_skin_brushstroke', hash = `COMPONENT_REVOLVER_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = 'component_skin_woodland', hash = `COMPONENT_REVOLVER_MK2_CAMO_03` },
			{ name = 'skin_skull', label = 'component_skin_skull', hash = `COMPONENT_REVOLVER_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = 'component_skin_sessanta', hash = `COMPONENT_REVOLVER_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = 'component_skin_perseus', hash = `COMPONENT_REVOLVER_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = 'component_skin_leopard', hash = `COMPONENT_REVOLVER_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = 'component_skin_zebra', hash = `COMPONENT_REVOLVER_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = 'component_skin_geometric', hash = `COMPONENT_REVOLVER_MK2_CAMO_09` },
			{ name = 'skin_boom', label = 'component_skin_boom', hash = `COMPONENT_REVOLVER_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = 'component_skin_patriotic', hash = `COMPONENT_REVOLVER_MK2_CAMO_IND_01` },
		}
	},

	{	
		name = 'WEAPON_SNSPISTOL_MK2',
		label = 'weapon_snspistol_mk2',
		components = {
			{ name = 'clip', label = 'component_clip_default', hash = `COMPONENT_SNSPISTOL_MK2_CLIP_01` },
			{ name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_SNSPISTOL_MK2_CLIP_02` },

			{ name = 'rounds_tracer', label = 'component_round_tracer', hash = `COMPONENT_SNSPISTOL_MK2_CLIP_TRACER` },
			{ name = 'rounds_hollow', label = 'component_round_hollow', hash = `COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'rounds_incendiary', label = 'component_round_incendiary', hash = `COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_fullmetal', label = 'component_round_fullmetal', hash = `COMPONENT_SNSPISTOL_MK2_CLIP_FMJ` },


			{ name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_PI_FLSH` },

			{ name = 'scope_mounted', label = 'component_scope_mounted', hash = `COMPONENT_AT_PI_RAIL_02` },
			
			{ name = 'compensator', label = 'component_compensator', hash = `COMPONENT_AT_PI_COMP_02` },
			
			{ name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_PI_SUPP_02` },

			{ name = 'skin_camo', label = 'component_skin_camo', hash = `COMPONENT_SNSPISTOL_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = 'component_skin_brushstroke', hash = `COMPONENT_SNSPISTOL_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = 'component_skin_woodland', hash = `COMPONENT_SNSPISTOL_MK2_CAMO_03` },
			{ name = 'skin_skull', label = 'component_skin_skull', hash = `COMPONENT_SNSPISTOL_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = 'component_skin_sessanta', hash = `COMPONENT_SNSPISTOL_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = 'component_skin_perseus', hash = `COMPONENT_SNSPISTOL_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = 'component_skin_leopard', hash = `COMPONENT_SNSPISTOL_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = 'component_skin_zebra', hash = `COMPONENT_SNSPISTOL_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = 'component_skin_geometric', hash = `COMPONENT_SNSPISTOL_MK2_CAMO_09` },
			{ name = 'skin_boom', label = 'component_skin_boom', hash = `COMPONENT_SNSPISTOL_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = 'component_skin_boom', hash = `COMPONENT_SNSPISTOL_MK2_CAMO_IND_01_SLIDE` },
		}
	},

	{	
		name = 'WEAPON_PUMPSHOTGUN_MK2',
		label = 'weapon_pumpshotgun_mk2',
		components = {
			{ name = 'clip', label = 'component_clip_default', hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_01` },
			
			{ name = 'rounds_piercing', label = 'component_round_piercing', hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_hollow', label = 'component_round_hollow', hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'rounds_explosive', label = 'component_round_explosive', hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE` },
			{ name = 'rounds_incendiary', label = 'component_round_incendiary', hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY` },
			
			{ name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_macro', label = 'component_scope_macro', hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_small', label = 'component_scope_small', hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },

			{ name = 'barrel', label = 'component_barrel', hash = `COMPONENT_AT_SC_BARREL_01` },
			{ name = 'barrel_heavy', label = 'component_barrel_heavy', hash = `COMPONENT_AT_SC_BARREL_02` },
			
			{ name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_SR_SUPP_03` },
			
			{ name = 'muzzle_flat', label = 'component_muzzle_squared', hash = `COMPONENT_AT_MUZZLE_08` },
			
			{ name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'skin_camo', label = 'component_skin_camo', hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = 'component_skin_brushstroke', hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = 'component_skin_woodland', hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_03` },
			{ name = 'skin_skull', label = 'component_skin_skull', hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = 'component_skin_sessanta', hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = 'component_skin_perseus', hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = 'component_skin_leopard', hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = 'component_skin_zebra', hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = 'component_skin_geometric', hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_09` },
			{ name = 'skin_boom', label = 'component_skin_boom', hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = 'component_skin_patriotic', hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01` },
		}
	},


	{	
		name = 'WEAPON_COMBATSHOTGUN',
		label = 'weapon_combatshotgun',
		components = {
			{ name = 'clip', label = 'component_clip_default', hash = `COMPONENT_COMBATSHOTGUN_CLIP_01` },
			
		}
	},

	{	
		name = 'WEAPON_ASSAULTRIFLE_MK2',
		label = 'weapon_assaultrifle_mk2',
		components = {
			{ name = 'clip', label = 'component_clip_default', hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_01` },
			{ name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_02` },
			
			{ name = 'rounds_tracer', label = 'component_round_tracer', hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER` },
			{ name = 'rounds_incendiary', label = 'component_round_incendiary', hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = 'component_round_piercing', hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = 'component_round_fullmetal', hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ` },
			
			{ name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_macro', label = 'component_scope_macro', hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_medium', label = 'component_scope_medium', hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },

			{ name = 'barrel', label = 'component_barrel', hash = `COMPONENT_AT_SC_BARREL_01` },
			{ name = 'barrel_heavy', label = 'component_barrel_heavy', hash = `COMPONENT_AT_SC_BARREL_02` },
			
			{ name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP_02` },
			
			{ name = 'muzzle_flat', label = 'component_muzzle_flat', hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tatical', label = 'component_muzzle_tatical', hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat', label = 'component_muzzle_fat', hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = 'component_muzzle_precision', hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy', label = 'component_muzzle_heavy', hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted', label = 'component_muzzle_slanted', hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split', label = 'component_muzzle_split', hash = `COMPONENT_AT_MUZZLE_07` },
			
			{ name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'skin_camo', label = 'component_skin_camo', hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = 'component_skin_brushstroke', hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = 'component_skin_woodland', hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_03` },
			{ name = 'skin_skull', label = 'component_skin_skull', hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = 'component_skin_sessanta', hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = 'component_skin_perseus', hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = 'component_skin_leopard', hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = 'component_skin_zebra', hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = 'component_skin_geometric', hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_09` },
			{ name = 'skin_boom', label = 'component_skin_boom', hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = 'component_skin_patriotic', hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01` },
		}
	},

	{	
		name = 'WEAPON_CARBINERIFLE_MK2',
		label = 'weapon_carbinerifle_mk2',
		components = {
			{ name = 'clip', label = 'component_clip_default', hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_01` },
			{ name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_02` },
			
			{ name = 'rounds_tracer', label = 'component_round_tracer', hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER` },
			{ name = 'rounds_incendiary', label = 'component_round_incendiary', hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = 'component_round_piercing', hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = 'component_round_fullmetal', hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ` },
			
			{ name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_macro', label = 'component_scope_macro', hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_medium', label = 'component_scope_medium', hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },

			{ name = 'barrel', label = 'component_barrel', hash = `COMPONENT_AT_CR_BARREL_01` },
			{ name = 'barrel_heavy', label = 'component_barrel_heavy', hash = `COMPONENT_AT_CR_BARREL_02` },
			
			{ name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP_02` },
			
			{ name = 'muzzle_flat', label = 'component_muzzle_flat', hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tatical', label = 'component_muzzle_tatical', hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat', label = 'component_muzzle_fat', hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = 'component_muzzle_precision', hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy', label = 'component_muzzle_heavy', hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted', label = 'component_muzzle_slanted', hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split', label = 'component_muzzle_split', hash = `COMPONENT_AT_MUZZLE_07` },
			
			{ name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'skin_camo', label = 'component_skin_camo', hash = `COMPONENT_CARBINERIFLE_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = 'component_skin_brushstroke', hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = 'component_skin_woodland', hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_03` },
			{ name = 'skin_skull', label = 'component_skin_skull', hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = 'component_skin_sessanta', hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = 'component_skin_perseus', hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = 'component_skin_leopard', hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = 'component_skin_zebra', hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = 'component_skin_geometric', hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_09` },
			{ name = 'skin_boom', label = 'component_skin_boom', hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = 'component_skin_patriotic', hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01` },
		}
	},

	{	
		name = 'WEAPON_MILITARYRIFLE',
		label = 'weapon_militaryrifle',
		components = {
			{ name = 'clip', label = 'component_clip_default', hash = `COMPONENT_MILITARYRIFLE_CLIP_01` },
			{ name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_MILITARYRIFLE_CLIP_02` },

			{ name = 'scope', label = 'component_scope', hash = `COMPONENT_MILITARYRIFLE_SIGHT_01` },
		}
	},

	{	
		name = 'WEAPON_SPECIALCARBINE_MK2',
		label = 'weapon_specialcarbine_mk2',
		components = {
			{ name = 'clip', label = 'component_clip_default', hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_01` },
			{ name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_02` },
			
			{ name = 'rounds_tracer', label = 'component_round_tracer', hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER` },
			{ name = 'rounds_incendiary', label = 'component_round_incendiary', hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = 'component_round_piercing', hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = 'component_round_fullmetal', hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ` },
			
			{ name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_macro', label = 'component_scope_macro', hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_medium', label = 'component_scope_medium', hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },

			{ name = 'barrel', label = 'component_barrel', hash = `COMPONENT_AT_SC_BARREL_01` },
			{ name = 'barrel_heavy', label = 'component_barrel_heavy', hash = `COMPONENT_AT_SC_BARREL_02` },
			
			{ name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP_02` },
			
			{ name = 'muzzle_flat', label = 'component_muzzle_flat', hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tatical', label = 'component_muzzle_tatical', hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat', label = 'component_muzzle_fat', hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = 'component_muzzle_precision', hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy', label = 'component_muzzle_heavy', hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted', label = 'component_muzzle_slanted', hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split', label = 'component_muzzle_split', hash = `COMPONENT_AT_MUZZLE_07` },
			
			{ name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'skin_camo', label = 'component_skin_camo', hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = 'component_skin_brushstroke', hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = 'component_skin_woodland', hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_03` },
			{ name = 'skin_skull', label = 'component_skin_skull', hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = 'component_skin_sessanta', hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = 'component_skin_perseus', hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = 'component_skin_leopard', hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = 'component_skin_zebra', hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = 'component_skin_geometric', hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_09` },
			{ name = 'skin_boom', label = 'component_skin_boom', hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = 'component_skin_patriotic', hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01` },
		}
	},

	{
		name = 'WEAPON_BULLPUPRIFLE_MK2',
		label = 'weapon_bullpuprifle_mk2',
		components = {
			{ name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_01` },
			{ name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_02` },
			
			{ name = 'rounds_tracer', label = 'component_round_tracer', hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER` },
			{ name = 'rounds_incendiary', label = 'component_round_incendiary', hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = 'component_round_piercing', hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = 'component_round_fullmetal', hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ` },
			
			{ name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_macro', label = 'component_scope_macro', hash = `COMPONENT_AT_SCOPE_MACRO_02_MK2` },
			{ name = 'scope_small', label = 'component_scope_small', hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },

			{ name = 'barrel', label = 'component_barrel', hash = `COMPONENT_AT_BP_BARREL_01` },
			{ name = 'barrel_heavy', label = 'component_barrel_heavy', hash = `COMPONENT_AT_BP_BARREL_02` },
			
			{ name = 'suppressor', label = 'component_scope', hash = `COMPONENT_AT_AR_SUPP` },
			
			{ name = 'muzzle_flat', label = 'component_muzzle_flat', hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tatical', label = 'component_muzzle_tatical', hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat', label = 'component_muzzle_fat', hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = 'component_muzzle_precision', hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy', label = 'component_muzzle_heavy', hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted', label = 'component_muzzle_slanted', hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split', label = 'component_muzzle_split', hash = `COMPONENT_AT_MUZZLE_07` },
			
			{ name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'skin_camo', label = 'component_skin_camo', hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = 'component_skin_brushstroke', hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = 'component_skin_woodland', hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_03` },
			{ name = 'skin_skull', label = 'component_skin_skull', hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = 'component_skin_sessanta', hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = 'component_skin_perseus', hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = 'component_skin_leopard', hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = 'component_skin_zebra', hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = 'component_skin_geometric', hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_09` },
			{ name = 'skin_boom', label = 'component_skin_boom', hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = 'component_skin_patriotic', hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01` },
		}
	},

	{
		name = 'WEAPON_COMBATMG_MK2',
		label = 'weapon_combatmg_mk2',
		components = {
			{ name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_COMBATMG_MK2_CLIP_02` },

			{ name = 'rounds_tracer', label = 'component_round_tracer', hash = `COMPONENT_COMBATMG_MK2_CLIP_TRACER` },
			{ name = 'rounds_incendiary', label = 'component_round_incendiary', hash = `COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = 'component_round_piercing', hash = `COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = 'component_round_fullmetal', hash = `COMPONENT_COMBATMG_MK2_CLIP_FMJ` },
			
			{ name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_medium', label = 'component_scope_medium', hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
			{ name = 'scope_small', label = 'component_scope_small', hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },

			{ name = 'barrel', label = 'component_barrel', hash = `COMPONENT_AT_MG_BARREL_01` },
			{ name = 'barrel_heavy', label = 'component_barrel_heavy', hash = `COMPONENT_AT_MG_BARREL_02` },
					
			{ name = 'muzzle_flat', label = 'component_muzzle_flat', hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tatical', label = 'component_muzzle_tatical', hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat', label = 'component_muzzle_fat', hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = 'component_muzzle_precision', hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy', label = 'component_muzzle_heavy', hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted', label = 'component_muzzle_slanted', hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split', label = 'component_muzzle_split', hash = `COMPONENT_AT_MUZZLE_07` },
						
			{ name = 'skin_camo', label = 'component_skin_camo', hash = `COMPONENT_COMBATMG_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = 'component_skin_brushstroke', hash = `COMPONENT_COMBATMG_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = 'component_skin_woodland', hash = `COMPONENT_COMBATMG_MK2_CAMO_03` },
			{ name = 'skin_skull', label = 'component_skin_skull', hash = `COMPONENT_COMBATMG_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = 'component_skin_sessanta', hash = `COMPONENT_COMBATMG_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = 'component_skin_perseus', hash = `COMPONENT_COMBATMG_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = 'component_skin_leopard', hash = `COMPONENT_COMBATMG_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = 'component_skin_zebra', hash = `COMPONENT_COMBATMG_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = 'component_skin_geometric', hash = `COMPONENT_COMBATMG_MK2_CAMO_09` },
			{ name = 'skin_boom', label = 'component_skin_boom', hash = `COMPONENT_COMBATMG_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = 'component_skin_patriotic', hash = `COMPONENT_COMBATMG_MK2_CAMO_IND_01` },
		}
	},

	{
		name = 'WEAPON_HEAVYSNIPER_MK2',
		label = 'weapon_heavysniper_mk2',
		components = {
			{ name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_01` },
			{ name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_02` },

			{ name = 'rounds_incendiary', label = 'component_round_incendiary', hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = 'component_round_piercing', hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = 'component_round_fullmetal', hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ` },
			{ name = 'rounds_explosive', label = 'component_round_explosive', hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE` },

			{ name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_SR_SUPP_03` },

			{ name = 'scope_large', label = 'component_scope_medium', hash = `COMPONENT_AT_SCOPE_LARGE_MK2` },
			{ name = 'scope_zoom', label = 'component_scope_zoom', hash = `COMPONENT_AT_SCOPE_MAX` },
			{ name = 'scope_nightvision', label = 'component_scope_nightvision', hash = `COMPONENT_AT_SCOPE_NV` },
			{ name = 'scope_thermal', label = 'component_scope_nightvision', hash = `COMPONENT_AT_SCOPE_THERMAL` },


			{ name = 'barrel', label = 'component_barrel', hash = `COMPONENT_AT_SR_BARREL_01` },
			{ name = 'barrel_heavy', label = 'component_barrel_heavy', hash = `COMPONENT_AT_SR_BARREL_02` },
					
			{ name = 'muzzle_squared', label = 'component_muzzle_squared', hash = `COMPONENT_AT_MUZZLE_08` },
			{ name = 'muzzle_bellend', label = 'component_muzzle_split', hash = `COMPONENT_AT_SR_BARREL_01` },
			
			
			{ name = 'skin_camo', label = 'component_skin_camo', hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = 'component_skin_brushstroke', hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = 'component_skin_woodland', hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_03` },
			{ name = 'skin_skull', label = 'component_skin_skull', hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = 'component_skin_sessanta', hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = 'component_skin_perseus', hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = 'component_skin_leopard', hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = 'component_skin_zebra', hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = 'component_skin_geometric', hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_09` },
			{ name = 'skin_boom', label = 'component_skin_boom', hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = 'component_skin_patriotic', hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01` },
		}
	},

	{
		name = 'WEAPON_MARKSMANRIFLE_MK2',
		label = 'weapon_marksmanrifle_mk2',
		components = {
			{ name = 'clip_default', label = 'component_clip_default', hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_01` },
			{ name = 'clip_extended', label = 'component_clip_extended', hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_02` },
			{ name = 'rounds_tracer', label = 'component_round_tracer', hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER` },
			{ name = 'rounds_incendiary', label = 'component_round_incendiary', hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = 'component_round_piercing', hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = 'component_round_fullmetal', hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ` },
			{ name = 'grip', label = 'component_grip', hash = `COMPONENT_AT_AR_AFGRIP_02` },
			{ name = 'flashlight', label = 'component_flashlight', hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'suppressor', label = 'component_suppressor', hash = `COMPONENT_AT_AR_SUPP` },
			{ name = 'scope', label = 'component_scope', hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_medium', label = 'component_scope_medium', hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
			{ name = 'scope_zoom', label = 'component_scope_zoom', hash = `COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2` },
			{ name = 'barrel', label = 'component_barrel', hash = `COMPONENT_AT_MRFL_BARREL_01` },
			{ name = 'barrel_heavy', label = 'component_barrel_heavy', hash = `COMPONENT_AT_MRFL_BARREL_02` },	
			{ name = 'muzzle_flat', label = 'component_muzzle_flat', hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tatical', label = 'component_muzzle_tatical', hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat', label = 'component_muzzle_fat', hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = 'component_muzzle_precision', hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy', label = 'component_muzzle_heavy', hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted', label = 'component_muzzle_slanted', hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split', label = 'component_muzzle_split', hash = `COMPONENT_AT_MUZZLE_07` },
			{ name = 'skin_camo', label = 'component_skin_camo', hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = 'component_skin_brushstroke', hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = 'component_skin_woodland', hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_03` },
			{ name = 'skin_skull', label = 'component_skin_skull', hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = 'component_skin_sessanta', hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = 'component_skin_perseus', hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = 'component_skin_leopard', hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = 'component_skin_zebra', hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = 'component_skin_geometric', hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_09` },
			{ name = 'skin_boom', label = 'component_skin_boom', hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = 'component_skin_patriotic', hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01` },
		}
	},
	{name = 'WEAPON_MINIGUN', label = 'weapon_minigun', tints = Config.DefaultWeaponTints, components = {}, ammo = {label = 'ammo_rounds', hash = `AMMO_MINIGUN`}},
	{name = 'WEAPON_RAILGUN', label = 'weapon_railgun', tints = Config.DefaultWeaponTints, components = {}, ammo = {label = 'ammo_rounds', hash = `AMMO_RAILGUN`}},
	{name = 'WEAPON_STUNGUN', label = 'weapon_stungun', tints = Config.DefaultWeaponTints, components = {}},
	{name = 'WEAPON_RPG', label = 'weapon_rpg', tints = Config.DefaultWeaponTints, components = {}, ammo = {label = 'ammo_rockets', hash = `AMMO_RPG`}},
	{name = 'WEAPON_HOMINGLAUNCHER', label = 'weapon_hominglauncher', tints = Config.DefaultWeaponTints, components = {}, ammo = {label = 'ammo_rockets', hash = `AMMO_HOMINGLAUNCHER`}},
	{name = 'WEAPON_GRENADELAUNCHER', label = 'weapon_grenadelauncher', tints = Config.DefaultWeaponTints, components = {}, ammo = {label = 'ammo_grenadelauncher', hash = `AMMO_GRENADELAUNCHER`}},
	{name = 'WEAPON_COMPACTLAUNCHER', label = 'weapon_compactlauncher', tints = Config.DefaultWeaponTints, components = {}, ammo = {label = 'ammo_grenadelauncher', hash = `AMMO_GRENADELAUNCHER`}},
	{name = 'WEAPON_FLAREGUN', label = 'weapon_flaregun', tints = Config.DefaultWeaponTints, components = {}, ammo = {label = 'ammo_flaregun', hash = `AMMO_FLAREGUN`}},
	{name = 'WEAPON_FIREEXTINGUISHER', label = 'weapon_fireextinguisher', components = {}, ammo = {label = 'ammo_charge', hash = `AMMO_FIREEXTINGUISHER`}},
	{name = 'WEAPON_PETROLCAN', label = 'weapon_petrolcan', components = {}, ammo = {label = 'ammo_petrol', hash = `AMMO_PETROLCAN`}},
	{name = 'WEAPON_FIREWORK', label = 'weapon_firework', components = {}, ammo = {label = 'ammo_firework', hash = `AMMO_FIREWORK`}},
	{name = 'WEAPON_FLASHLIGHT', label = 'weapon_flashlight', components = {}},
	{name = 'GADGET_PARACHUTE', label = 'gadget_parachute', components = {}},
	{name = 'WEAPON_KNUCKLE', label = 'weapon_knuckle', components = {}},
	{name = 'WEAPON_HATCHET', label = 'weapon_hatchet', components = {}},
	{name = 'WEAPON_MACHETE', label = 'weapon_machete', components = {}},
	{name = 'WEAPON_SWITCHBLADE', label = 'weapon_switchblade', components = {}},
	{name = 'WEAPON_BOTTLE', label = 'weapon_bottle', components = {}},
	{name = 'WEAPON_DAGGER', label = 'weapon_dagger', components = {}},
	{name = 'WEAPON_POOLCUE', label = 'weapon_poolcue', components = {}},
	{name = 'WEAPON_WRENCH', label = 'weapon_wrench', components = {}},
	{name = 'WEAPON_BATTLEAXE', label = 'weapon_battleaxe', components = {}},
	{name = 'WEAPON_KNIFE', label = 'weapon_knife', components = {}},
	{name = 'WEAPON_NIGHTSTICK', label = 'weapon_nightstick', components = {}},
	{name = 'WEAPON_HAMMER', label = 'weapon_hammer', components = {}},
	{name = 'WEAPON_BAT', label = 'weapon_bat', components = {}},
	{name = 'WEAPON_GOLFCLUB', label = 'weapon_golfclub', components = {}},
	{name = 'WEAPON_CROWBAR', label = 'weapon_crowbar', components = {}},
	{name = 'WEAPON_GRENADE', label = 'weapon_grenade', components = {}, ammo = {label = 'ammo_grenade', hash = `AMMO_GRENADE`}},
	{name = 'WEAPON_SMOKEGRENADE', label = 'weapon_smokegrenade', components = {}, ammo = {label = 'ammo_smokebomb', hash = `AMMO_SMOKEGRENADE`}},
	{name = 'WEAPON_STICKYBOMB', label = 'weapon_stickybomb', components = {}, ammo = {label = 'ammo_stickybomb', hash = `AMMO_STICKYBOMB`}},
	{name = 'WEAPON_PIPEBOMB', label = 'weapon_pipebomb', components = {}, ammo = {label = 'ammo_pipebomb', hash = `AMMO_PIPEBOMB`}},
	{name = 'WEAPON_BZGAS', label = 'weapon_bzgas', components = {}, ammo = {label = 'ammo_bzgas', hash = `AMMO_BZGAS`}},
	{name = 'WEAPON_MOLOTOV', label = 'weapon_molotov', components = {}, ammo = {label = 'ammo_molotov', hash = `AMMO_MOLOTOV`}},
	{name = 'WEAPON_PROXMINE', label = 'weapon_proxmine', components = {}, ammo = {label = 'ammo_proxmine', hash = `AMMO_PROXMINE`}},
	{name = 'WEAPON_SNOWBALL', label = 'weapon_snowball', components = {}, ammo = {label = 'ammo_snowball', hash = `AMMO_SNOWBALL`}},
	{name = 'WEAPON_BALL', label = 'weapon_ball', components = {}, ammo = {label = 'ammo_ball', hash = `AMMO_BALL`}},
	{name = 'WEAPON_FLARE', label = 'weapon_flare', components = {}, ammo = {label = 'ammo_flare', hash = `AMMO_FLARE`}}
}