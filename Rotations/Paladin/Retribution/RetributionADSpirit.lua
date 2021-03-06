local rotationName = "ADSpirit" -- Based on Fiskee's CR
---------------
--- Toggles ---
---------------
local function createToggles()
	-- Rotation Button
	RotationModes = {
	[1] = { mode = "Auto", value = 1 , overlay = "Automatic Rotation", tip = "Swaps between Single and Multiple based on number of targets in range.", highlight = 1, icon = br.player.spell.divineStorm },
	[2] = { mode = "Mult", value = 2 , overlay = "Multiple Target Rotation", tip = "Multiple target rotation used.", highlight = 0, icon = br.player.spell.divineStorm },
	[3] = { mode = "Sing", value = 3 , overlay = "Single Target Rotation", tip = "Single target rotation used.", highlight = 0, icon = br.player.spell.crusaderStrike },
	[4] = { mode = "Off", value = 4 , overlay = "DPS Rotation Disabled", tip = "Disable DPS Rotation", highlight = 0, icon = br.player.spell.flashOfLight }
	}
	CreateButton("Rotation",1,0)
	-- Cooldown Button
	CooldownModes = {
	[1] = { mode = "Auto", value = 1 , overlay = "Cooldowns Automated", tip = "Automatic Cooldowns - Boss Detection.", highlight = 1, icon = br.player.spell.avengingWrath },
	[2] = { mode = "On", value = 1 , overlay = "Cooldowns Enabled", tip = "Cooldowns used regardless of target.", highlight = 0, icon = br.player.spell.avengingWrath },
	[3] = { mode = "Off", value = 3 , overlay = "Cooldowns Disabled", tip = "No Cooldowns will be used.", highlight = 0, icon = br.player.spell.avengingWrath }
	};
	CreateButton("Cooldown",2,0)
	-- Defensive Button
	DefensiveModes = {
	[1] = { mode = "On", value = 1 , overlay = "Defensive Enabled", tip = "Includes Defensive Cooldowns.", highlight = 1, icon = br.player.spell.flashOfLight },
	[2] = { mode = "Off", value = 2 , overlay = "Defensive Disabled", tip = "No Defensives will be used.", highlight = 0, icon = br.player.spell.flashOfLight }
	};
	CreateButton("Defensive",3,0)
	-- Interrupt Button
	InterruptModes = {
	[1] = { mode = "On", value = 1 , overlay = "Interrupts Enabled", tip = "Includes Basic Interrupts.", highlight = 1, icon = br.player.spell.hammerOfJustice },
	[2] = { mode = "Off", value = 2 , overlay = "Interrupts Disabled", tip = "No Interrupts will be used.", highlight = 0, icon = br.player.spell.hammerOfJustice }
	};
	CreateButton("Interrupt",4,0)
-- Hold Wake
    WakeModes = {
        [1] = { mode = "On", value = 1 , overlay = "Use wake", tip = "Use wake", highlight = 1, icon = br.player.spell.wakeOfAshes},
        [2] = { mode = "Off", value = 2 , overlay = "Don't use wake", tip = "Don't use wake", highlight = 0, icon = br.player.spell.wakeOfAshes}
    };
    CreateButton("Wake",5,0)
end
---------------
--- OPTIONS ---
---------------
local function createOptions()
	local optionTable

	local function rotationOptions()
		-----------------------
		--- GENERAL OPTIONS ---
		-----------------------
		section = br.ui:createSection(br.ui.window.profile,  "General - Version 1.020")
		-- APL
		br.ui:createDropdownWithout(section, "APL Mode", {"|cffFFFFFFSimC"}, 1, "|cffFFFFFFSet APL Mode to use.")
		-- Boss Encounter
		br.ui:createCheckbox(section, "Boss Encounter Case")
		-- Dummy DPS Test
		br.ui:createSpinner(section, "DPS Testing",  5,  5,  60,  5,  "|cffFFFFFFSet to desired time for test in minuts. Min: 5 / Max: 60 / Interval: 5")
		-- Opener
		br.ui:createCheckbox(section, "Opener")
		-- Greater Blessing of Kings
		br.ui:createCheckbox(section, "Greater Blessing of Kings")
		-- Greater Blessing of Wisdom
		br.ui:createCheckbox(section, "Greater Blessing of Wisdom")
		-- Blessing of Freedom
		br.ui:createCheckbox(section, "Blessing of Freedom")
		-- Hand of Hindeance
		br.ui:createCheckbox(section, "Hand of Hinderance")
		-- Wake of Ashes
		br.ui:createDropdownWithout(section,"Wake of Ashes", {"|cff00FF00Everything","|cffFFFF00Cooldowns"}, 1, "|cffFFFFFFWhen to use Wake of Ashes talent.")
		-- Wake of Ashes Target
		br.ui:createDropdownWithout(section,"Wake of Ashes Target", {"|cff00FF00Target","|cff00FF00Best"}, 1, "|cffFFFFFFUse on target or best cone angle.")
		br.ui:checkSectionState(section)
		-----------------------
		--- 	Essence 	---
		-----------------------
		section = br.ui:createSection(br.ui.window.profile,  "Essences")
        -- Essences Usage
        br.ui:createDropdownWithout(section, "Use Essences", {"|cff00FF00Everything","|cffFFFF00Cooldowns","|cffFF0000Never"}, 1, "|cffFFBB00When to use Essences.")
        -- Focused Azerite Beam
        br.ui:createSpinner(section, "Focused Azerite Beam",  3,  1,  10,  1,  "|cffFFBB00 Min. units hit to use Focused Azerite Beam")
        -- Guardian of Azeroth
        br.ui:createCheckbox(section, "Guardian of Azeroth", "|cffFFBB00 Use Guardian of Azeroth (During CDs)")
        -- Memory of Lucid Dreams
        br.ui:createCheckbox(section, "Memory of Lucid Dreams", "|cffFFBB00 Use Memory of Lucid Dreams as per SimC Logic")
        -- Purifying Blast
        br.ui:createCheckbox(section, "Purifying Blast", "|cffFFBB00 Use Purifying Blast as per SimC Logic")
        -- Ripple in Space
        br.ui:createCheckbox(section, "Ripple in Space", "|cffFFBB00 Use Ripple in Space as per SimC Logic")
        -- Concentrated Flame
        br.ui:createCheckbox(section, "Concentrated Flame DPS", "|cffFFBB00 Use Concentrated Flame for DPS")
        br.ui:createSpinner(section, "Concentrated Flame HP", 30, 0, 100, 5, "|cffFFBB00 Use Concentrated Flame for healing")
        -- The Unbound Force
        br.ui:createCheckbox(section, "The Unbound Force", "|cffFFBB00 Use The Unbound Force as per SimC Logic")
        -- Worldvein Resonance
        br.ui:createCheckbox(section, "Worldvein Resonance", "|cffFFBB00 Use Worldvein Resonance as per SimC Logic")
        -- Blood of the Enemy
        br.ui:createCheckbox(section, "Blood of the Enemy", "|cffFFBB00 Use Blood of the Enemy")
        -- Reaping Flames
        br.ui:createCheckbox(section, "Reaping Flames", "|cffFFBB00 Use Reaping Flames")
        br.ui:checkSectionState(section)
        ------------------------
		---    CORRUPTION    ---
		------------------------
		section = br.ui:createSection(br.ui.window.profile,  "Corruption")
        -- Cloak
        br.ui:createDropdownWithout(section, "Use Cloak", { "snare", "Eye", "THING", "Everything", "never" }, 5, "", "")
        br.ui:createSpinnerWithout(section, "Eye Stacks", 3, 1, 10, 1, "How many stacks before using cloak")
        br.ui:createCheckbox(section, "HOJ the thing", "|cffFFBB00Use Hammer of Justice on the thing")
        br.ui:checkSectionState(section)
		------------------------
		--- COOLDOWN OPTIONS ---
		------------------------
		section = br.ui:createSection(br.ui.window.profile,  "Cooldowns")
		-- Potion
		br.ui:createCheckbox(section,"Potion")
		-- Elixir
		br.ui:createDropdownWithout(section,"Elixir", {"Flask of the Undertow","None"}, 1, "|cffFFFFFFSet Elixir to use.")
		-- Racial
		br.ui:createCheckbox(section,"Racial")
		-- Trinkets
        br.ui:createDropdownWithout(section, "Trinkets", {"|cff00FF00Everything","|cffFFFF00Cooldowns","|cffFF0000Never"}, 1, "|cffFFFFFFWhen to use trinkets.")
        br.ui:createCheckbox(section, "Trinket 1")
        br.ui:createCheckbox(section, "Trinket 2")
		-- Avenging Wrath
		br.ui:createCheckbox(section,"Avenging Wrath")
		-- Cruusade
		br.ui:createCheckbox(section,"Crusade")
		-- Shield of Vengeance
		br.ui:createCheckbox(section,"Shield of Vengeance - CD")
		br.ui:checkSectionState(section)
		-------------------------
		--- DEFENSIVE OPTIONS ---
		-------------------------
		section = br.ui:createSection(br.ui.window.profile, "Defensive")
		-- Healthstone
		br.ui:createSpinner(section, "Pot/Stoned",  60,  0,  100,  5,  "|cffFFFFFFHealth Percent to Cast At")
		-- Heirloom Neck
		br.ui:createSpinner(section, "Heirloom Neck",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.");
		-- Gift of The Naaru
		if br.player.race == "Draenei" then
			br.ui:createSpinner(section, "Gift of the Naaru",  50,  0,  100,  5,  "|cffFFFFFFHealth Percent to Cast At")
		end
		-- Blessing of Protection
		br.ui:createSpinner(section, "Blessing of Protection",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
		-- Blinding Light
		br.ui:createSpinner(section, "Blinding Light - HP", 50, 0, 100, 5, "|cffFFFFFFHealth Percent to Cast At")
		br.ui:createSpinner(section, "Blinding Light - AoE", 3, 0, 10, 1, "|cffFFFFFFNumber of Units in 5 Yards to Cast At")
		-- Cleanse Toxin
		br.ui:createDropdown(section, "Clease Toxin", {"|cff00FF00Player Only","|cffFFFF00Selected Target","|cffFF0000Mouseover Target"}, 1, "|cffFFFFFFTarget to Cast On")
		-- Divine Shield
		br.ui:createSpinner(section, "Divine Shield",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
		-- Eye for an Eye
		br.ui:createSpinner(section, "Eye for an Eye", 50, 0 , 100, 5, "|cffFFBB00Health Percentage to use at.")
		-- Shield of Vengeance
		br.ui:createSpinner(section,"Shield of Vengeance", 90, 0 , 100, 5, "|cffFFBB00Health Percentage to use at.")
		-- Flash of Light
		br.ui:createSpinner(section, "Flash of Light",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
		-- Hammer of Justice
		br.ui:createSpinner(section, "Hammer of Justice - HP",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
		br.ui:createCheckbox(section, "Hammer of Justice - Legendary")
		-- Justicar's Vengeance
		br.ui:createSpinner(section, "Justicar's Vengeance",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at over Templar's Verdict.")
		-- Lay On Hands
		br.ui:createSpinner(section, "Lay On Hands", 20, 0, 100, 5, "","Health Percentage to use at")
		br.ui:createDropdownWithout(section, "Lay on Hands Target", {"|cffFFFFFFPlayer", "|cffFFFFFFTarget", "|cffFFFFFFMouseover", "|cffFFFFFFTank", "|cffFFFFFFHealer", "|cffFFFFFFHealer/Tank", "|cffFFFFFFHealer/Damage", "|cffFFFFFFAny"}, 8, "|cffFFFFFFTarget for Lay On Hands")
		-- Selfless Healer
		br.ui:createSpinner(section, "Selfless Healer", 60, 0, 100, 5, "","Health Percentage to use at")
		br.ui:createDropdownWithout(section, "Selfless Healer Target", {"|cffFFFFFFPlayer", "|cffFFFFFFTarget", "|cffFFFFFFMouseover", "|cffFFFFFFTank", "|cffFFFFFFHealer", "|cffFFFFFFHealer/Tank", "|cffFFFFFFHealer/Damage", "|cffFFFFFFAny"}, 8, "|cffFFFFFFTarget for Selfless Healer")
		-- Word of Glory
		br.ui:createSpinner(section, "Word of Glory", 60, 0, 100, 5, "","Health Percentage to use at")
		br.ui:createDropdownWithout(section, "Word of Glory Target", {"|cffFFFFFFPlayer", "|cffFFFFFFTarget", "|cffFFFFFFMouseover", "|cffFFFFFFTank", "|cffFFFFFFHealer", "|cffFFFFFFHealer/Tank", "|cffFFFFFFHealer/Damage", "|cffFFFFFFAny"}, 8, "|cffFFFFFFTarget for Word of Glory")
		-- Redemption
		br.ui:createDropdown(section, "Redemption", {"|cffFFFF00Selected Target","|cffFF0000Mouseover Target"}, 1, "|cffFFFFFFTarget to Cast On")
		br.ui:checkSectionState(section)
		-------------------------
		--- INTERRUPT OPTIONS ---
		-------------------------
		section = br.ui:createSection(br.ui.window.profile, "Interrupts")
		-- Blinding Light
		br.ui:createCheckbox(section, "Blinding Light")
		-- Hammer of Justice
		br.ui:createCheckbox(section, "Hammer of Justice")
		-- Rebuke
		br.ui:createCheckbox(section, "Rebuke")
		-- Interrupt Percentage
		br.ui:createSpinner(section,  "Interrupt At",  0,  0,  95,  5,  "|cffFFBB00Cast Percentage to use at.")
		br.ui:checkSectionState(section)
		----------------------
		--- TOGGLE OPTIONS ---
		----------------------
		section = br.ui:createSection(br.ui.window.profile,  "Toggle Keys")
		-- Single/Multi Toggle
		br.ui:createDropdown(section,  "Rotation Mode", br.dropOptions.Toggle,  4)
		--Cooldown Key Toggle
		br.ui:createDropdown(section,  "Cooldown Mode", br.dropOptions.Toggle,  3)
		--Defensive Key Toggle
		br.ui:createDropdown(section,  "Defensive Mode", br.dropOptions.Toggle,  6)
		-- Interrupts Key Toggle
		br.ui:createDropdown(section,  "Interrupt Mode", br.dropOptions.Toggle,  6)
		-- Pause Toggle
		br.ui:createDropdown(section,  "Pause Mode", br.dropOptions.Toggle,  6)
		br.ui:checkSectionState(section)
	end
	optionTable = {{
	[1] = "Rotation Options",
	[2] = rotationOptions,
	}}
	return optionTable
end

----------------
--- ROTATION ---
----------------
local function runRotation()
	-- if br.timer:useTimer("debugRetribution", math.random(0.15,0.3)) then -- Change debugSpec tp name of Spec IE: debugFeral or debugWindwalker
	--Print("Running: "..rotationName)

	---------------
	--- Toggles ---
	---------------
	UpdateToggle("Rotation",0.25)
	UpdateToggle("Cooldown",0.25)
	UpdateToggle("Defensive",0.25)
	UpdateToggle("Interrupt",0.25)
	UpdateToggle("Wake",0.25)
    br.player.mode.wake = br.data.settings[br.selectedSpec].toggles["Wake"]

	--------------
	--- Locals ---
	--------------
	local buff          = br.player.buff
	local cast          = br.player.cast
	local cd            = br.player.cd
	local charges       = br.player.charges
	local combatTime    = getCombatTime()
	local debuff        = br.player.debuff
    local enemies       = br.player.enemies
    local essence       = br.player.essence
    local equiped       = br.player.equiped
    local gcd           = br.player.gcd
    local has           = br.player.has
	local hastar        = GetObjectExists("target")
	local healPot       = getHealthPot()
	local holyPower     = br.player.power.holyPower.amount()
	local holyPowerMax  = br.player.power.holyPower.max()
	local inCombat      = br.player.inCombat
	local item          = br.player.items
    local level         = br.player.level
    local leftCombat    = GetTime()
    local mode          = br.player.mode
    local opener        = br.player.opener
    local profileStop   = false
	local php           = br.player.health
	local race          = br.player.race
	local racial        = br.player.getRacial()
	local resable       = UnitIsPlayer("target") and UnitIsDeadOrGhost("target") and UnitIsFriend("target","player")
	local solo          = GetNumGroupMembers() == 0
	local spell         = br.player.spell
	local talent        = br.player.talent
	local thp           = getHP("target")
	local trait         = br.player.traits
	local ttd           = getTTD("target")
	local units         = br.player.units
    local use           = br.player.use

	units.get(5)
	units.get(8)
	enemies.get(5)
	enemies.get(8)
	enemies.get(8,"player",false,true) -- makes enemies.yards8f
	enemies.get(10)
	enemies.get(30)

    local StunsBlackList = {
		-- Atal'Dazar
		[87318] = "Dazar'ai Colossus",
		[122984] = "Dazar'ai Colossus",
		[128455] = "T'lonja",
		[129553] = "Dinomancer Kish'o",
		[129552] = "Monzumi",
		-- Freehold
		[129602] = "Irontide Enforcer",
		[130400] = "Irontide Crusher",
		-- King's Rest
		[133935] = "Animated Guardian",
		[134174] = "Shadow-Borne Witch Doctor",
		[134158] = "Shadow-Borne Champion",
		[137474] = "King Timalji",
		[137478] = "Queen Wasi",
		[137486] = "Queen Patlaa",
		[137487] = "Skeletal Hunting Raptor",
		[134251] = "Seneschal M'bara",
		[134331] = "King Rahu'ai",
		[137484] = "King A'akul",
		[134739] = "Purification Construct",
		[137969] = "Interment Construct",
		[135231] = "Spectral Brute",
		[138489] = "Shadow of Zul",
		-- Shrine of the Storm
		[134144] = "Living Current",
		[136214] = "Windspeaker Heldis",
		[134150] = "Runecarver Sorn",
		[136249] = "Guardian Elemental",
		[134417] = "Deepsea Ritualist",
		[136353] = "Colossal Tentacle",
		[136295] = "Sunken Denizen",
		[136297] = "Forgotten Denizen",
		-- Siege of Boralus
		[129369] = "Irontide Raider",
		[129373] = "Dockhound Packmaster",
		[128969] = "Ashvane Commander",
		[138255] = "Ashvane Spotter",
		[138465] = "Ashvane Cannoneer",
		[135245] = "Bilge Rat Demolisher",
		-- Temple of Sethraliss
		[134991] = "Sandfury Stonefist",
		[139422] = "Scaled Krolusk Tamer",
		[136076] = "Agitated Nimbus",
		[134691] = "Static-charged Dervish",
		[139110] = "Spark Channeler",
		[136250] = "Hoodoo Hexer",
		[139946] = "Heart Guardian",
		-- MOTHERLODE!!
		[130485] = "Mechanized Peacekeeper",
		[136139] = "Mechanized Peacekeeper",
		[136643] = "Azerite Extractor",
		[134012] = "Taskmaster Askari",
		[133430] = "Venture Co. Mastermind",
		[133463] = "Venture Co. War Machine",
		[133436] = "Venture Co. Skyscorcher",
		[133482] = "Crawler Mine",
		-- Underrot
		[131436] = "Chosen Blood Matron",
		[133912] = "Bloodsworn Defiler",
		[138281] = "Faceless Corruptor",
		-- Tol Dagor
		[130025] = "Irontide Thug",
		-- Waycrest Manor
		[131677] = "Heartsbane Runeweaver",
		[135329] = "Matron Bryndle",
		[131812] = "Heartsbane Soulcharmer",
		[131670] = "Heartsbane Vinetwister",
		[135365] = "Matron Alma"
	}
	local HOJ_unitList = {
		[131009] = "Spirit of Gold",
		[134388] = "A Knot of Snakes",
		[129758] = "Irontide Grenadier"
	}

    -- Opener reset
	if opener == nil or (not inCombat and not GetObjectExists("target")) then
		opener = false
		OPN1 = false
		OPN2 = false
		OPN3 = false
		OPN4 = false
		OPN5 = false
		OPN6 = false
		OPN7 = false
		OPN8 = false
		OPN9 = false
	end

	--actions.finishers=variable,name=ds_castable,value=spell_targets.divine_storm>=2&!talent.righteous_verdict.enabled|spell_targets.divine_storm>=3&talent.righteous_verdict.enabled
    local dsCastable = (mode.rotation == 1 and ((not talent.righteousVerdict and #enemies.yards8 >= 2) or (talent.righteousVerdict and #enemies.yards8 >= 3))) or mode.rotation == 2
	--actions.generators=variable,name=HoW,value=(!talent.hammer_of_wrath.enabled|target.health.pct>=20&(buff.avenging_wrath.down|buff.crusade.down))
	local HoW = (not talent.hammer_of_wrath or thp >= 20 and ((not talent.crusade and not buff.avengingWrath.exists()) or (not isChecked("Crusade") or (talent.crusade and not buff.crusade.exists()))))

	local lowestUnit
	local lowestTank
	local lowestHealer
	local lowestDps
	local kingsUnit
	local wisdomUnit

	for i = 1, #br.friend do
		local thisUnit = br.friend[i].unit
		local thisHP = getHP(thisUnit)
		local thisRole = UnitGroupRolesAssigned(thisUnit)
		if not UnitIsDeadOrGhost(thisUnit) and getDistance(thisUnit) < 40 then
			if lowestUnit == nil or getHP(lowestUnit) > thisHP then
				lowestUnit = thisUnit
			end
			if thisRole == "TANK" and (lowestTank == nil or getHP(lowestTank) > thisHP) then
				lowestTank = thisUnit
			end
			if thisRole == "HEALER" and (lowestHealer == nil or getHP(lowestHealer) > thisHP) then
				lowestHealer = thisUnit
			end
			if (thisRole == "DAMAGER" or thisRole == "NONE") and (lowestDps == nil or getHP(lowestDps) > thisHP) then
				lowestDps = thisUnit
			end
		end
		if not UnitIsDeadOrGhost(thisUnit) then
			if thisRole == "TANK" and ((not buff.greaterBlessingOfKings.exists(thisUnit, "any") and kingsUnit == nil and getDistance(thisUnit) < 30) or buff.greaterBlessingOfKings.exists(thisUnit)) then
				kingsUnit = thisUnit
			end
			if thisRole == "HEALER" and ((not buff.greaterBlessingOfWisdom.exists(thisUnit, "any") and wisdomUnit == nil and getDistance(thisUnit) < 30) or buff.greaterBlessingOfWisdom.exists(thisUnit)) then
				wisdomUnit = thisUnit
			end
		end
	end
	if lowestTank == nil then lowestTank = "player" end
	if lowestHealer == nil then lowestHealer = "player" end
	if lowestDps == nil then lowestDps = "player" end
	if lowestUnit == nil then lowestUnit = "player" end
	if kingsUnit == nil then kingsUnit = "player" end
	if wisdomUnit == nil then wisdomUnit = "player" end

	local function castBestConeAngle(spell,range,angle,minUnits,checkNoCombat,pool)
		if not isKnown(spell) or getSpellCD(spell) ~= 0 then
			return false
		end
		range = range or 10
		angle = angle or 45
		minUnits = minUnits or 1
		checkNoCombat = checkNoCombat or false
		pool = pool or false
		local curFacing = ObjectFacing("player")
		local enemiesTable = getEnemies("player",range,checkNoCombat)
		local playerX, playerY, playerZ = ObjectPosition("player")
		local coneTable = {}
		for i = 1, #enemiesTable do
			local unitX, unitY, unitZ = ObjectPosition(enemiesTable[i])
			if playerX and unitX then
				local angleToUnit = getAngles(playerX,playerY,playerZ,unitX,unitY,unitZ)
				tinsert(coneTable, angleToUnit)
			end
		end
		local facing, bestAngle, mostHit = 0, 0, 0
		while facing <= 6.2 do
			local units = 0
			for i = 1, #coneTable do
				local angleToUnit = coneTable[i]
				local angleDifference = facing > angleToUnit and facing - angleToUnit or angleToUnit - facing
				local shortestAngle = angleDifference < math.pi and angleDifference or math.pi*2 - angleDifference
				local finalAngle = shortestAngle/math.pi*180
				if finalAngle < angle/2 then
					units = units + 1
				end
			end
			if units > mostHit then
				mostHit = units
				bestAngle = facing
			end
			facing = facing + 0.05
		end
		if mostHit >= minUnits then
			if pool and energy < getSpellCost(spell) then
				return true
			end
			FaceDirection(bestAngle, true)
			CastSpellByName(GetSpellInfo(spell))
			FaceDirection(curFacing, true)
			return true
		end
		return false
	end
	--------------------
	--- Action Lists ---
	--------------------
	-- Action List - Extras
	local function actionList_Extras()
		-- Hand of Freedom
		if isChecked("Blessing of Freedom") and hasNoControl(spell.blessingOfFreedom) then
			if cast.blessingOfFreedom() then return end
		end
		-- Hand of Hinderance
		if isChecked("Hand of Hinderance") and isMoving("target") and not getFacing("target","player") and getDistance("target") > 8 and getHP("target") < 25 then
			if cast.handOfHinderance("target") then return end
		end
		-- Greater Blessing of Kings
		if isChecked("Greater Blessing of Kings") and buff.greaterBlessingOfKings.remain(kingsUnit) < 600 and not IsMounted() and getDistance(kingsUnit) < 30 then
			if cast.greaterBlessingOfKings(kingsUnit) then return end
		end
		-- Greater Blessing of Wisdom
		if isChecked("Greater Blessing of Wisdom") and buff.greaterBlessingOfWisdom.remain(wisdomUnit) < 600 and not IsMounted() and getDistance(wisdomUnit) < 30 then
			if cast.greaterBlessingOfWisdom(wisdomUnit) then return end
		end
	end -- End Action List - Extras
	local function BossEncounterCase()
        local blessingOfFreedomCase = nil
        local hammerOfJusticeCase = nil
		local blessingOfProtectionCase = nil
		local cleanseToxinsCase = nil
		local cleanseToxinsCase2 = nil
		for i = 1, #br.friend do
            if getDebuffRemain(br.friend[i].unit, 268896) ~= 0 or getDebuffRemain(br.friend[i].unit, 264526) ~= 0 or getDebuffRemain(br.friend[i].unit, 258058) ~= 0 then
                blessingOfFreedomCase = br.friend[i].unit
            end
            if (getDebuffRemain(br.friend[i].unit, 255421) ~= 0 and br.friend[i].unit ~= "player") or (getDebuffRemain(br.friend[i].unit, 256038) ~= 0 and br.friend[i].unit ~= "player") or (getDebuffRemain(br.friend[i].unit, 260741) ~= 0) or (getDebuffRemain(br.friend[i].unit, 258875) ~= 0) then
                blessingOfProtectionCase = br.friend[i].unit
            end
			if (getDebuffRemain(br.friend[i].unit,269686) ~= 0 and UnitGroupRolesAssigned(br.friend[i].unit) == "HEALER") or getDebuffRemain(br.friend[i].unit,257777) ~= 0 then
				cleanseToxinsCase = br.friend[i].unit
			end
			if getDebuffRemain(br.friend[i].unit,261440) >= 2 and #getAllies(br.friend[i].unit,5) <= 1 then
				cleanseToxinsCase2 = br.friend[i].unit
            end
            if UnitIsCharmed(br.friend[i].unit) and getDebuffRemain(br.friend[i].unit, 272407) == 0 and br.friend[i].distance <= 10 then
                hammerOfJusticeCase = br.friend[i].unit
            end
		end
		-- Flash of Light
		if GetObjectID("target") == 133392 and inCombat then
			if getHP("target") < 100 and getBuffRemain("target",274148) == 0 then
				if CastSpellByName(GetSpellInfo(19750),"target") then return end
			end
		end
		-- Hammer of Justice
		if cast.able.hammerOfJustice() then
			for i = 1, #enemies.yards10 do
				local thisUnit = enemies.yards10[i]
				local distance = getDistance(thisUnit)
				if (GetObjectID(thisUnit) == 131009 or GetObjectID(thisUnit) == 134388 or GetObjectID("target") == 129158) and distance <= 10 then
					if cast.hammerOfJustice(thisUnit) then return end
				end
			end
		end
		-- Blessing of Freedom
		if cast.able.blessingOfFreedom() then
			if getDebuffRemain("player",267899) ~= 0 or getDebuffRemain("player",268896) ~= 0 then
				if cast.blessingOfFreedom("player") then return end
			end
			if blessingOfFreedomCase ~= nil then
				if cast.blessingOfFreedom(blessingOfFreedomCase) then return end
			end
		end
		-- Blessing of Protection
		if blessingOfProtectionCase ~= nil and cast.able.blessingOfProtection() then
			if cast.blessingOfProtection(blessingOfProtectionCase) then return end
		end
		-- Cleanse Toxins
		if cast.able.cleanseToxins() then
			if cleanseToxinsCase ~= nil then
				if cast.cleanseToxins(cleanseToxinsCase) then return end
			end
			if cleanseToxinsCase2 ~= nil then
				if cast.cleanseToxins(cleanseToxinsCase2) then return end
			end
        end
        -- Hammer of Justice
		if cast.able.hammerOfJustice() then
			local HOJ_list = {
				274400,
				274383,
				257756,
				276292,
				268273,
				256897,
				272542,
				272888,
				269266,
				258317,
				258864,
				259711,
				258917,
				264038,
				253239,
				269931,
				270084,
				270482,
				270506,
				270507,
				267433,
				267354,
				268702,
				268846,
				268865,
				258908,
				264574,
				272659,
				272655,
				267237,
				265568,
				277567,
				265540
			}
			for i = 1, #enemies.yards10 do
				local thisUnit = enemies.yards10[i]
				local distance = getDistance(thisUnit)
				for k, v in pairs(HOJ_list) do
					if (HOJ_unitList[GetObjectID(thisUnit)] ~= nil or UnitCastingInfo(thisUnit) == GetSpellInfo(v) or UnitChannelInfo(thisUnit) == GetSpellInfo(v)) and getBuffRemain(thisUnit, 226510) == 0 and distance <= 10 then
						if cast.hammerOfJustice(thisUnit) then
							return
						end
					end
				end
			end
			if inCombat then
				local HOJ = "Hammer of Justice"
				if cast.able.hammerOfJustice then
					HOJ = "Hammer of Justice"
				end
				for i = 1, GetObjectCount() do
					local object = GetObjectWithIndex(i)
					local ID = ObjectID(object)
					if isChecked("HOJ the thing") then
						if ID == 161895 then
							local x1, y1, z1 = ObjectPosition("player")
							local x2, y2, z2 = ObjectPosition(object)
							local distance = math.sqrt(((x2 - x1) ^ 2) + ((y2 - y1) ^ 2) + ((z2 - z1) ^ 2))
							if distance <= 10 then
								CastSpellByName(HOJ, object)
								return true
							end	
						end
					end -- end the thing
				end
			end
			if hammerOfJusticeCase ~= nil then
				if cast.hammerOfJustice(hammerOfJusticeCase) then
					return
				end
			end
		end
	end
	-- -- Action List - Defensives
	local function actionList_Defensive()
		if useDefensive() then
			-- Lay On Hands
			if isChecked("Lay On Hands") and inCombat and getHP(lowestUnit) <= getValue("Lay On Hands") then
				-- Player
				if getOptionValue("Lay on Hands Target") == 1 then
					if php <= getValue("Lay On Hands") then
						if cast.layOnHands("player") then return true end
					end
					-- Target
				elseif getOptionValue("Lay on Hands Target") == 2 then
					if getHP("target") <= getValue("Lay On Hands") then
						if cast.layOnHands("target") then return true end
					end
					-- Mouseover
				elseif getOptionValue("Lay on Hands Target") == 3 then
					if getHP("mouseover") <= getValue("Lay On Hands") then
						if cast.layOnHands("mouseover") then return true end
					end
					-- Tank
				elseif getOptionValue("Lay on Hands Target") == 4 then
					if getHP(lowestTank) <= getValue("Lay On Hands") and UnitGroupRolesAssigned(lowestTank) == "TANK" then
						if cast.layOnHands(lowestTank) then return true end
					end
					-- Healer
				elseif getOptionValue("Lay on Hands Target") == 5 then
					if getHP(lowestHealer) <= getValue("Lay On Hands") and UnitGroupRolesAssigned(lowestHealer) == "HEALER" then
						if cast.layOnHands(lowestHealer) then return true end
					end
					-- Healer/Tank
				elseif getOptionValue("Lay on Hands Target") == 6 then
					if lowestHealer < lowestTank and getHP(lowestHealer) <= getValue("Lay On Hands") and UnitGroupRolesAssigned(lowestHealer) == "HEALER" then
						if cast.layOnHands(lowestHealer) then return true end
					elseif getHP(lowestTank) <= getValue("Lay On Hands") and UnitGroupRolesAssigned(lowestTank) == "TANK" then
						if cast.layOnHands(lowestTank) then return true end
					end
					-- Healer/Damager
				elseif getOptionValue("Lay on Hands Target") == 7 then
					if lowestHealer < lowestDps and getHP(lowestHealer) <= getValue("Lay On Hands") and UnitGroupRolesAssigned(lowestHealer) == "HEALER" then
						if cast.layOnHands(lowestHealer) then return true end
					elseif getHP(lowestDps) <= getValue("Lay On Hands") and (UnitGroupRolesAssigned(lowestDps) == "DAMAGER" or UnitGroupRolesAssigned(lowestDps) == "NONE") then
						if cast.layOnHands(lowestDps) then return true end
					end
					-- Any
				elseif getOptionValue("Lay on Hands Target") == 8 then
					if cast.layOnHands(lowestUnit) then return true end
				end
			end
			-- Selfless Healer
			if isChecked("Selfless Healer") and buff.selflessHealer.stack() == 4 and getHP(lowestUnit) <= getValue("Selfless Healer") then
				-- Player
				if getOptionValue("Selfless Healer Target") == 1 then
					if php <= getValue("Selfless Healer") then
						if cast.flashOfLight("player") then return true end
					end
					-- Target
				elseif getOptionValue("Selfless Healer Target") == 2 then
					if getHP("target") <= getValue("Selfless Healer") then
						if cast.flashOfLight("target") then return true end
					end
					-- Mouseover
				elseif getOptionValue("Selfless Healer Target") == 3 then
					if getHP("mouseover") <= getValue("Selfless Healer") then
						if cast.flashOfLight("mouseover") then return true end
					end
					-- Tank
				elseif getOptionValue("Selfless Healer Target") == 4 then
					if getHP(lowestTank) <= getValue("Selfless Healer") and UnitGroupRolesAssigned(lowestTank) == "TANK" then
						if cast.flashOfLight(lowestTank) then return true end
					end
					-- Healer
				elseif getOptionValue("Selfless Healer Target") == 5 then
					if getHP(lowestHealer) <= getValue("Selfless Healer") and UnitGroupRolesAssigned(lowestHealer) == "HEALER" then
						if cast.flashOfLight(lowestHealer) then return true end
					end
					-- Healer/Tank
				elseif getOptionValue("Selfless Healer Target") == 6 then
					if lowestHealer < lowestTank and getHP(lowestHealer) <= getValue("Selfless Healer") and UnitGroupRolesAssigned(lowestHealer) == "HEALER" then
						if cast.flashOfLight(lowestHealer) then return true end
					elseif getHP(lowestTank) <= getValue("Selfless Healer") and UnitGroupRolesAssigned(lowestTank) == "TANK" then
						if cast.flashOfLight(lowestTank) then return true end
					end
					-- Healer/Damager
				elseif getOptionValue("Selfless Healer Target") == 7 then
					if lowestHealer < lowestDps and getHP(lowestHealer) <= getValue("Selfless Healer") and UnitGroupRolesAssigned(lowestHealer) == "HEALER" then
						if cast.flashOfLight(lowestHealer) then return true end
					elseif getHP(lowestDps) <= getValue("Selfless Healer") and (UnitGroupRolesAssigned(lowestDps) == "DAMAGER" or UnitGroupRolesAssigned(lowestDps) == "NONE") then
						if cast.flashOfLight(lowestDps) then return true end
					end
					-- Any
				elseif getOptionValue("Selfless Healer Target") == 8 then
					if cast.flashOfLight(lowestUnit) then return true end
				end
			end
			-- Word of Glory
			if isChecked("Word of Glory") and talent.wordOfGlory and getHP(lowestUnit) <= getValue("Word of Glory") and inCombat then
				-- Player
				if getOptionValue("Word of Glory Target") == 1 then
					if php <= getValue("Word of Glory") then
						if cast.wordOfGlory("player") then return true end
					end
					-- Target
				elseif getOptionValue("Word of Glory Target") == 2 then
					if getHP("target") <= getValue("Word of Glory") then
						if cast.wordOfGlory("target") then return true end
					end
					-- Mouseover
				elseif getOptionValue("Word of Glory Target") == 3 then
					if getHP("mouseover") <= getValue("Word of Glory") then
						if cast.wordOfGlory("mouseover") then return true end
					end

				elseif getOptionValue("Word of Glory Target") == 4 then
					if getHP(lowestTank) <= getValue("Word of Glory") and UnitGroupRolesAssigned(lowestTank) == "TANK" then
						if cast.wordOfGlory(lowestTank) then return true end
					end
					-- Healer
				elseif getOptionValue("Word of Glory Target") == 5 then
					if getHP(lowestHealer) <= getValue("Word of Glory") and UnitGroupRolesAssigned(lowestHealer) == "HEALER" then
						if cast.wordOfGlory(lowestHealer) then return true end
					end
					-- Healer/Tank
				elseif getOptionValue("Word of Glory Target") == 6 then
					if lowestHealer < lowestTank and getHP(lowestHealer) <= getValue("Word of Glory") and UnitGroupRolesAssigned(lowestTank) == "TANK" then
						if cast.wordOfGlory(lowestHealer) then return true end
					elseif getHP(lowestTank) <= getValue("Word of Glory") and UnitGroupRolesAssigned(lowestHealer) == "HEALER" then
						if cast.wordOfGlory(lowestTank) then return true end
					end
					-- Healer/Damager
				elseif getOptionValue("Word of Glory Target") == 7 then
					if lowestHealer < lowestDps and getHP(lowestHealer) <= getValue("Word of Glory") and UnitGroupRolesAssigned(lowestHealer) == "HEALER" then
						if cast.wordOfGlory(lowestHealer) then return true end
					elseif getHP(lowestDps) <= getValue("Word of Glory") and (UnitGroupRolesAssigned(lowestDps) == "DAMAGER" or UnitGroupRolesAssigned(lowestDps) == "NONE") then
						if cast.wordOfGlory(lowestDps) then return true end
					end
					-- Any
				elseif getOptionValue("Word of Glory Target") == 8 then
					if cast.wordOfGlory(lowestUnit) then return true end
				end
			end
			-- Divine Shield
			if isChecked("Divine Shield") then
				if php <= getOptionValue("Divine Shield") and inCombat then
					if cast.divineShield() then return end
				end
			end
			-- Pot/Stoned
			if isChecked("Pot/Stoned") and php <= getOptionValue("Pot/Stoned")
				and inCombat and (hasHealthPot() or hasItem(5512))
				then
				if canUseItem(5512) then
					useItem(5512)
				elseif canUseItem(healPot) then
					useItem(healPot)
				end
			end
			-- Heirloom Neck
			if isChecked("Heirloom Neck") and php <= getOptionValue("Heirloom Neck") then
				if hasEquiped(122667) then
					if GetItemCooldown(122667)==0 then
						useItem(122667)
					end
				end
			end
			-- Gift of the Naaru
			if isChecked("Gift of the Naaru") and php <= getOptionValue("Gift of the Naaru") and php > 0 and race == "Draenei" then
				if castSpell("player",racial,false,false,false) then return end
			end
			-- Blessing of Protection
			if isChecked("Blessing of Protection") then
				if getHP(lowestUnit) < getOptionValue("Blessing of Protection") and inCombat and not UnitGroupRolesAssigned(lowestUnit) == "TANK" then
					if cast.blessingOfProtection(lowestUnit) then return end
				end
			end
			-- Blinding Light
			if isChecked("Blinding Light - HP") and php <= getOptionValue("Blinding Light - HP") and inCombat and #enemies.yards10 > 0 then
				if cast.blindingLight() then return end
			end
			if isChecked("Blinding Light - AoE") and #enemies.yards5 >= getOptionValue("Blinding Light - AoE") and inCombat then
				if cast.blindingLight() then return end
			end
			-- Cleanse Toxins
			if isChecked("Cleanse Toxins") and cast.able.cleanseToxins() then
				if getOptionValue("Cleanse Toxins")==1 and canDispel("player",spell.cleanseToxins) and getDebuffRemain("player",261440) == 0 then
					if cast.cleanseToxins("player") then return end
				end
				if getOptionValue("Cleanse Toxins")==2 and canDispel("target",spell.cleanseToxins) then
					if cast.cleanseToxins("target") then return end
				end
				if getOptionValue("Cleanse Toxins")==3 and canDispel("mouseover",spell.cleanseToxins) then
					if cast.cleanseToxins("mouseover") then return end
				end
			end
			-- Eye for an Eye
			if isChecked("Eye for an Eye") then
				if php <= getOptionValue("Eye for an Eye") and inCombat then
					if cast.eyeForAnEye() then return end
				end
			end
			-- Shield of Vengeance
			if isChecked("Shield of Vengeance") then
				if php <= getOptionValue("Shield of Vengeance") and inCombat then
					if cast.shieldOfVengeance() then return end
				end
			end
			-- Hammer of Justice
			if isChecked("Hammer of Justice - HP") and php <= getOptionValue("Hammer of Justice - HP") and inCombat then
				if cast.hammerOfJustice() then return end
			end
			if isChecked("Hammer of Justice - Legendary") and getHP("target") >= 75 and inCombat then
				if cast.hammerOfJustice() then return end
			end
			if isChecked("Hammer of Justice - HP") and isChecked("Justicar's Vengeance") and php <= getOptionValue("Justicar's Vengeance") and inCombat then
				if cast.hammerOfJustice() then return end
			end
			-- Redemption
			if isChecked("Redemption") then
				if getOptionValue("Redemption")==1 and not isMoving("player") and resable then
					if cast.redemption("target","dead") then return end
				end
				if getOptionValue("Redemption")==2 and not isMoving("player") and resable then
					if cast.redemption("mouseover","dead") then return end
				end
			end
			-- Flash of Light
			if isChecked("Flash of Light") then
				if (forceHeal or (inCombat and php <= getOptionValue("Flash of Light") / 2) or (not inCombat and php <= getOptionValue("Flash of Light"))) and not isMoving("player") then
					if cast.flashOfLight() then return end
				end
			end
		end
	end -- End Action List - Defensive
	-- Action List - Interrupts
	local function actionList_Interrupts()
		if useInterrupts() then
			for i = 1, #enemies.yards10 do
				local thisUnit = enemies.yards10[i]
				local distance = getDistance(thisUnit)
				if canInterrupt(thisUnit,getOptionValue("Interrupt At")) then
					-- Hammer of Justice
					if isChecked("Hammer of Justice") and distance < 10 and (not cast.able.rebuke() or distance >= 5) and StunsBlackList[GetObjectID(thisUnit)] == nil then
						if cast.hammerOfJustice(thisUnit) then return end
					end
					-- Rebuke
					if isChecked("Rebuke") and distance < 5 then
						if cast.rebuke(thisUnit) then return end
					end
					-- Blinding Light
					if isChecked("Blinding Light") and distance < 10 and (not cast.able.rebuke() or distance >= 5 or #enemies.yards10 > 1) and StunsBlackList[GetObjectID(thisUnit)] == nil then
						if cast.blindingLight() then return end
					end
				end
			end
		end
	end -- End Action List - Interrupts
	-- Action List - Cooldowns
    local function actionList_Cooldowns()
        -- Trinkets
		-- Trinket 1
		if (getOptionValue("Trinkets") == 1 or (getOptionValue("Trinkets") == 2 and useCDs())) and inCombat then
            if isChecked("Trinket 1") and canUseItem(13) and not hasEquiped(151190, 13) then br.addonDebug("Using Trinket 1")
                    useItem(13)
            end
        -- Trinket 2
            if isChecked("Trinket 2") and canUseItem(14) and not hasEquiped(151190, 14) then br.addonDebug("Using Trinket 2")
                    useItem(14)
			end
		end
		if (useCDs() or burst) and getDistance(units.dyn5) < 5 then
		-- 	-- Specter of Betrayal
		-- 	-- use_item,name=specter_of_betrayal,if=(buff.crusade.up&buff.crusade.stack>=15|cooldown.crusade.remains>gcd*2)|(buff.avenging_wrath.up|cooldown.avenging_wrath.remains>gcd*2)
			if (getOptionValue("Trinket 1") == 1 or (getOptionValue("Trinket 1") == 2 and useCDs())) or  (getOptionValue("Trinket 2") == 1 or (getOptionValue("Trinket 2") == 2 and useCDs()))
			and hasEquiped(151190) and canUseItem(151190) then
				if ((buff.crusade.exists() and buff.crusade.stack() >= 15) or cd.crusade.remain() > gcd * 2) or (buff.avengingWrath.exists() or cd.avengingWrath.remain() > gcd * 2) then
					useItem(151190)
				end
			end
			-- Potion
			-- potion,name=old_war,if=(buff.bloodlust.react|buff.avenging_wrath.up|buff.crusade.up&buff.crusade.remains<25|target.time_to_die<=40)
			if isChecked("Potion") and canUseItem(127844) and inRaid then
				if (hasBloodlust() or buff.avengingWrath.exists() or (buff.crusade.exists() and buff.crusade.remain() < 25) or ttd(units.dyn5) <= 40) then
					useItem(127844)
				end
			end
			-- Racial
			-- blood_fury
			-- berserking
			-- arcane_torrent,if=(buff.crusade.up|buff.avenging_wrath.up)&holy_power=2&(cooldown.blade_of_justice.remains>gcd|cooldown.divine_hammer.remains>gcd)
			if isChecked("Racial") and (race == "Orc" or race == "Troll"
				or (race == "BloodElf" and (buff.crusade.exists() or buff.avengingWrath.exists()) and holyPower == 2 and (cd.bladeOfJustice.remain() > gcd --[[or cd.divineHammer.remain() > gcd]]))
				or (race == "LightforgedDraenei"))
				then
				if cast.racial() then br.addonDebug("Casting Racial") return end
			end
			-- -- Holy Wrath
			-- -- holy_wrath
			-- if isChecked("Holy Wrath") then
			-- 	if cast.holyWrath() then return end
			-- end
			-- Shield of Vengenace
			-- shield_of_vengeance
			if isChecked("Shield of Vengeance - CD") and cast.able.shieldOfVengeance then
				if cast.shieldOfVengeance() then br.addonDebug("Shield of Vengeance (CD)") return end
			end
			-- Avenging Wrath
			-- avenging_wrath
			if isChecked("Avenging Wrath") and not talent.crusade then
				if cast.avengingWrath() then br.addonDebug("Avenging Wrath") return end
			end
			-- Crusade
			-- crusade,if=holy_power>=3|((equipped.137048|race.blood_elf)&holy_power>=2)
			if isChecked("Crusade") and talent.crusade and (holyPower >= 3 or ((hasEquiped(137048) or race == "BloodElf") and holyPower >= 2)) and cd.crusade.remain() <= gcd then
				if cast.avengingWrath() then br.addonDebug("Crusade") return end
			end
		end -- End Cooldown Usage Check
		-- Concentrated Flame
		if ttd > 3 then
			if cast.concentratedFlame("target") then br.addonDebug("Concentrated Flame Snipe") return true end
        end
        -- Corruption stuff
        -- 1 = snare  2 = eye  3 = thing 4 = Everything 5 = never  -- snare = 315176
        if br.player.equiped.shroudOfResolve and canUseItem(br.player.items.shroudOfResolve) then
            if getValue("Use Cloak") == 1 and debuff.graspingTendrils.exists("player")
                    or getValue("Use Cloak") == 2 and debuff.eyeOfCorruption.stack("player") >= getValue("Eye Stacks")
                    or getValue("Use Cloak") == 3 and debuff.grandDelusions.exists("player")
                    or getValue("Use Cloak") == 4 and (debuff.graspingTendrils.exists("player") or debuff.eyeOfCorruption.stack("player") >= getValue("Eye Stacks") or debuff.grandDelusions.exists("player")) then
                if br.player.use.shroudOfResolve() then br.addonDebug("Using Cloak")
                end
            end
        end
	end -- End Action List - Cooldowns
	-- Action List - Essences
	local function actionList_Essences()
        --actions.cooldowns+=/guardian_of_azeroth,if=!talent.crusade.enabled&(cooldown.avenging_wrath.remains<5&holy_power>=3&(buff.inquisition.up|!talent.inquisition.enabled)|cooldown.avenging_wrath.remains>=45)|(talent.crusade.enabled&cooldown.crusade.remains<gcd&holy_power>=4|holy_power>=3&time<10&talent.wake_of_ashes.enabled|cooldown.crusade.remains>=45)
        if isChecked("Guardian of Azeroth") and cast.able.guardianOfAzeroth() and (getOptionValue("Use Essences") == 1 or (getOptionValue("Use Essences") == 2 and useCDs()))
        and ((not talent.crusade and ((cd.avengingWrath.remain() < 5 and holyPower >= 3 and (buff.inquisition.exists() or not talent.inquisition))
        or cd.avengingWrath.remain() >= 45)) or ((talent.crusade and cd.crusade.remain() < gcd and holyPower >= 4)
        or (holyPower >= 3 and combatTime < 10 and talent.wakeOfAshes) or cd.crusade.remain() >= 45)) then
            if cast.guardianOfAzeroth() then br.addonDebug("Guardian of Azeroth") return true end
        end
        --actions.cooldowns+=/focused_azerite_beam,if=(!raid_event.adds.exists|raid_event.adds.in>30|spell_targets.divine_storm>=2)&!(buff.avenging_wrath.up|buff.crusade.up)&(cooldown.blade_of_justice.remains>gcd*3&cooldown.judgment.remains>gcd*3)
		if isChecked("Focused Azerite Beam") and cast.able.focusedAzeriteBeam() and (getOptionValue("Use Essences") == 1 or (getOptionValue("Use Essences") == 2 and useCDs())) and essence.focusedAzeriteBeam.active 
		and cd.focusedAzeriteBeam.remains() <= gcd and ((essence.focusedAzeriteBeam.rank < 3 and not moving)
        or essence.focusedAzeriteBeam.rank >= 3) and getFacing("player","target") and (getEnemiesInRect(10,25,false,false) >= getOptionValue("Focused Azerite Beam") or (isBoss("target")))
        then
            if cast.focusedAzeriteBeam() then br.addonDebug("Focused Azerite Beam") return true end
        end
        -- actions.essences+=/memory_of_lucid_dreams,if=active_enemies<5&(buff.icicles.stack<=1|!talent.glacial_spike.enabled)&cooldown.frozen_orb.remains>10
        if isChecked("Memory of Lucid Dreams") and cast.able.memoryOfLucidDreams() and (getOptionValue("Use Essences") == 1 or (getOptionValue("Use Essences") == 2 and useCDs()))
        and ((not talent.crusade and buff.avengingWrath.exists())
        or (talent.crusade and buff.crusade.exists() and buff.crusade.stack() == 10))
        and holyPower <= 3 then
            if cast.memoryOfLucidDreams() then br.addonDebug("Memory of Lucid Dreams") return true end
        end
        --actions.cooldowns+=/purifying_blast,if=(!raid_event.adds.exists|raid_event.adds.in>30|spell_targets.divine_storm>=2)
        if isChecked("Purifying Blast") and cast.able.purifyingBlast() and (getOptionValue("Use Essences") == 1 or (getOptionValue("Use Essences") == 2 and useCDs())) then
            if cast.purifyingBlast("best", nil, 1, 8) then br.addonDebug("Purifying Blast") return true end
        end
        if isChecked("Ripple in Space") and cast.able.rippleInSpace() and (getOptionValue("Use Essences") == 1 or (getOptionValue("Use Essences") == 2 and useCDs())) then
            if cast.rippleInSpace() then br.addonDebug("Ripple In Space") return true end
        end
        -- actions.cooldowns+=/worldvein_resonance,if=cooldown.avenging_wrath.remains<gcd&holy_power>=3|talent.crusade.enabled&cooldown.crusade.remains<gcd&holy_power>=4|cooldown.avenging_wrath.remains>=45|cooldown.crusade.remains>=45
        if isChecked("Worldvein Resonance") and cast.able.worldveinResonance() and (getOptionValue("Use Essences") == 1 or (getOptionValue("Use Essences") == 2 and useCDs()))
        and ((not talent.crusade and cd.avengingWrath.remain() < gcd and holyPower >= 3)
        or (talent.crusade and cd.crusade.remain() < gcd and holyPower >= 4)
        or (not talent.crusade and cd.avengingWrath.remain() >= 45)
        or (talent.crusade and cd.crusade.remain() >= 45)) then
            if cast.worldveinResonance() then br.addonDebug("Worldvein Resonance") return true end
        end
            -- actions.essences+=/concentrated_flame
        if isChecked("Concentrated Flame DPS") and cast.able.concentratedFlame() and essence.concentratedFlame.active and cd.concentratedFlame.remain() <= gcd and (not debuff.concentratedFlame.exists("target") and not cast.last.concentratedFlame()
        or charges.concentratedFlame.timeTillFull() < gcd) and not buff.runeOfPower.exists("player") then
            if cast.concentratedFlame() then br.addonDebug("Concentrated Flame (DPS)") return true end
        end
        if isChecked("Concentrated Flame HP") and cast.able.concentratedFlame() and cd.concentratedFlame.remain() <= gcd and php <= getValue("Concentrated Flame HP") then
            if cast.concentratedFlame("player") then br.addonDebug("Concentrated Flame (HP)") return true end
        end
        -- actions.essences+=/the_unbound_force,if=buff.reckless_force.up
        if isChecked("The Unbound Force") and cast.able.theUnboundForce() and (combatTime <= 2 or buff.recklessForce.exists()) and (getOptionValue("Use Essences") == 1 or (getOptionValue("Use Essences") == 2 and useCDs())) then
            if cast.theUnboundForce() then br.addonDebug("The Unbound Force") return true end
        end
        --actions.cooldowns+=/blood_of_the_enemy,if=buff.avenging_wrath.up|buff.crusade.up&buff.crusade.stack=10
        if isChecked("Blood of the Enemy") and cast.able.bloodOfTheEnemy() and (getOptionValue("Use Essences") == 1 or (getOptionValue("Use Essences") == 2 and useCDs()))
        and ((not talent.crusade and buff.avengingWrath.exists())
        or (talent.crusade and buff.crusade.exists() and buff.crusade.stack() == 10)) then
            if cast.bloodOfTheEnemy() then br.addonDebug("Blood of The Enemy") return true end
        end
        --actions.essences+=/reaping_flames
        if isChecked("Reaping Flames") and cast.able.reapingFlames() then
            if cast.reapingFlames() then br.addonDebug("Reaping Flames") return true end
        end
    end
    -- 	-- Action List - Opener
	local function actionList_Opener()
		if isChecked("Opener") and useCDs() and opener == false then
            if isValidUnit("target") and getDistance("target") < 40
            and getFacing("player","target") and getSpellCD(61304) == 0 then
				if not OPN1 then
					Print("Starting Opener")
					OPN1 = true
				elseif OPN1 and not OPN2 then
					if castOpener("shieldOfVengeance","OPN2",1) then return end

				elseif OPN2 and not OPN3 and getDistance("target") < 5 then
					if castOpener("bladeOfJustice","OPN3",2) then return end

				elseif OPN3 and not OPN4 then
					if castOpener("judgment","OPN4",3) then return end

				elseif OPN4 and not OPN5 then
					if talent.crusade then
						if castOpener("crusade","OPN5",4) then return end
					elseif talent.inquisition then
						if castOpener("inquisition","OPN5",4) then return end
					elseif talent.divinePurpose then
						if castOpener("avengingWrath","OPN5",4) then return end
					else
						OPN5 = true
					end
				elseif OPN5 and not OPN6 then
					if talent.inquisition then
						if castOpener("avengingWrath","OPN6",5) then return end
					else
						if castOpener("templarsVerdict","OPN6",5) then return end
					end
				elseif OPN6 and not OPN7 then
					if castOpener("wakeOfAshes","OPN7",6) then return end

				elseif OPN7 and not OPN8 then
					if talent.hammerOfWrath then
						if castOpener("hammerOfWrath","OPN8",7) then return end
					else
						if castOpener("crusaderStrike","OPN8",7) then return end
					end
				elseif OPN8 and not OPN9 then
					if talent.executionSentence then
						if castOpener("executionSentence","OPN9",8) then return end
					else
						if castOpener("templarsVerdict","OPN9",8) then return end
					end
				elseif OPN9 then
					opener = true;
					Print("Opener Complete")
					return
				end
			end
		elseif (UnitExists("target") and not useCDs()) or not isChecked("Opener") then
			opener = true return end
	end -- End Action List - Opener
	-- Action List - PreCombat
	local function actionList_PreCombat()
		if not inCombat and not (IsFlying() or IsMounted()) then
			-- Flask
			-- flask,type=flask_of_the_countless_armies
			if getOptionValue("Elixir") == 1 and inRaid and not buff.flaskOfTheUndertow.exists() and canUseItem(item.flaskOfTheUndertow) then
				if buff.whispersOfInsanity.exists() then buff.whispersOfInsanity.cancel() end
				if buff.felFocus.exists() then buff.felFocus.cancel() end
				if use.flaskOfTheUndertow() then return end
			end
			if isValidUnit("target") and (not isBoss("target") or (not isChecked("Opener") or talent.divinePurpose)) then
				-- -- Divine Hammer
				-- if talent.divineHammer and #enemies.yards8 >= 3 then
				-- 	if cast.divineHammer() then return end
				-- end
				-- Judgment
				if cast.judgment("target") then return end

				-- if not talent.divineHammer then
					if cast.bladeOfJustice("target") then return end
				-- end

				if cast.crusaderStrike("target") then return end

				-- Start Attack
				if getDistance("target") < 5 then StartAttack() end
			end
        end
        -- Opener
        if actionList_Opener() then return true end
	end -- End Action List - PreCombat
	-- Action List - Finisher
	local function actionList_Finisher()
		--actions.finishers+=/inquisition,if=buff.inquisition.down|buff.inquisition.remains<5&holy_power>=3|talent.execution_sentence.enabled&cooldown.execution_sentence.remains<10&buff.inquisition.remains<15|cooldown.avenging_wrath.remains<15&buff.inquisition.remains<20&holy_power>=3
		if talent.inquisition and not buff.inquisition.exists() or (buff.inquisition.remain() < 5 and holyPower >= 3) or (talent.executionSentence and cd.executionSentence.remain() < 10 and buff.inquisition.remain() < 15) or (cd.avengingWrath.remain() < 15 and buff.inquisition.remain() < 20 and holyPower >= 3) then
			if cast.inquisition() then br.addonDebug("Inquisition") return end
		end
		-- actions.finishers+=/execution_sentence,if=spell_targets.divine_storm<=3&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)
		if ((mode.rotation == 1 and #enemies.yards8 <= 3 or mode.rotation == 3) and (not talent.crusade or (not useCDs() or not isChecked("Crusade") or cd.crusade.remain() > gcd*2))) then
			if cast.executionSentence() then return br.addonDebug("Execution Sentence") end
		end
		-- actions.finishers+=/divine_storm,if=variable.ds_castable&buff.divine_purpose.react
		if dsCastable and buff.divinePurpose.exists() then
			if cast.divineStorm("player") then br.addonDebug("Divine Storm (Buff Devine Purpose)") return end
		end
		if #enemies.yards10 > 1 and (mode.rotation == 2 or mode.rotation == 1) then
			if holyPower > 3 or buff.empyreanPower.exists("player") then
    	        if cast.divineStorm() then br.addonDebug("Divine Storm (AOE)") return end
			end
		end
		-- actions.finishers+=/divine_storm,if=variable.ds_castable&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)|buff.empyrean_power.up&debuff.judgment.down&buff.divine_purpose.down
		if (dsCastable and (not talent.crusade or cd.crusade.remain() > gcd*2 or not useCDs() or not isChecked("Crusade"))) or (buff.empyreanPower.exists() and not debuff.judgment.exists("target") and not buff.divinePurpose.exists()) then
            if cast.divineStorm("player") then br.addonDebug("Divine Storm (Buff EmpyreanPower)") return end
		end
		-- actions.finishers+=/templars_verdict,if=buff.divine_purpose.react&(!talent.execution_sentence.enabled|cooldown.execution_sentence.remains>gcd)
		if not dsCastable and buff.divinePurpose.exists() and (not talent.executionSentence or cd.executionSentence.remain() > gcd) then
			if cast.templarsVerdict() then br.addonDebug("Templars Verdict (Buff Devine Purpose)") return end
		end
		-- actions.finishers+=/templars_verdict,if=(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)&(!talent.execution_sentence.enabled|buff.crusade.up&buff.crusade.stack<10|cooldown.execution_sentence.remains>gcd*2)
		if not dsCastable and (not talent.crusade or (not useCDs() or not isChecked("Crusade") or cd.crusade.remain() > gcd*2)) and (not talent.executionSentence or (buff.crusade.exists() and buff.crusade.stack() < 10) or (talent.executionSentence and cd.executionSentence.remain() > gcd*2)) then
            if cast.templarsVerdict() then br.addonDebug("Templars Verdict") return end
		end

	end
	-- Action List - Generator
	local function actionList_Generator()

		-- actions.generators+=/call_action_list,name=finishers,if=holy_power>=5
		if holyPower >= 5 then
			if actionList_Finisher() then return end
		end
		-- actions.generators+=/wake_of_ashes,if=(!raid_event.adds.exists|raid_event.adds.in>20)&(holy_power<=0|holy_power=1&cooldown.blade_of_justice.remains>gcd)
		if mode.wake == 1 and talent.wakeOfAshes and (getOptionValue("Wake of Ashes") == 1 or (getOptionValue("Wake of Ashes") == 2 and useCDs())) and (holyPower <= 0 or (holyPower == 1 and cd.bladeOfJustice.remain() > gcd)) then
			if getOptionValue("Wake of Ashes Target") == 1 and getFacing("player","target") and getDistance("target") < 8 then
				if cast.wakeOfAshes("player") then br.addonDebug("Wake of Ashes (Everything)") return end
			elseif getOptionValue("Wake of Ashes Target") == 2 then
				if castBestConeAngle(spell.wakeOfAshes, 12, 60, 1, false) then br.addonDebug("Wake of Ashes (Cooldowns)") return true end
			end
		end
		-- actions.generators+=/blade_of_justice,if=holy_power<=2|(holy_power=3&(cooldown.hammer_of_wrath.remains>gcd*2|variable.HoW))
		if holyPower <= 2 or (holyPower == 3 and (cd.hammerOfWrath.remain() > gcd*2 or HoW)) then
			if cast.bladeOfJustice() then br.addonDebug("Blade of Justice") return end
		end
		-- actions.generators+=/judgment,if=holy_power<=2|(holy_power<=4&(cooldown.blade_of_justice.remains>gcd*2|variable.HoW))
		if holyPower <= 2 or (holyPower <= 4 and (cd.hammerOfJustice.remain() > gcd*2 or HoW)) then
			if cast.judgment() then br.addonDebug("Judgment") return end
		end
		-- actions.generators+=/hammer_of_wrath,if=holy_power<=4
		if talent.hammerOfWrath and holyPower <= 4 and (thp <= 20 or buff.crusade.exists() or buff.avengingWrath.exists()) then
			if cast.hammerOfWrath() then br.addonDebug("Hammer of Wrath") return end
		end
		-- actions.generators+=/consecration,if=holy_power<=2|holy_power<=3&cooldown.blade_of_justice.remains>gcd*2|holy_power=4&cooldown.blade_of_justice.remains>gcd*2&cooldown.judgment.remains>gcd*2
		if talent.consecration and holyPower <= 2 or (holyPower <= 3 and cd.bladeOfJustice.remain() > gcd*2) or (holyPower <= 4 and cd.bladeOfJustice.remain() > gcd*2 and cd.judgment.remain() > gcd*2) and getDistance("target") < 5 and isValidUnit("target") and not isMoving("player") then
			if cast.consecration() then br.addonDebug("Consecration") return end
		end
		-- actions.generators+=/call_action_list,name=finishers,if=talent.hammer_of_wrath.enabled&(target.health.pct<=20|buff.avenging_wrath.up|buff.crusade.up)
		if talent.hammerOfWrath and (thp <= 20 or buff.crusade.exists() or buff.avengingWrath.exists()) then
			if actionList_Finisher() then return end
		end
		-- actions.generators+=/crusader_strike,if=cooldown.crusader_strike.charges_fractional>=1.75&(holy_power<=2|holy_power<=3&cooldown.blade_of_justice.remains>gcd*2|holy_power=4&cooldown.blade_of_justice.remains>gcd*2&cooldown.judgment.remains>gcd*2&cooldown.consecration.remains>gcd*2)
		if charges.crusaderStrike.frac() >= 1.75 and (holyPower <= 2 or (holyPower <= 3 and cd.bladeOfJustice.remain() > gcd*2) or (holyPower == 4 and cd.bladeOfJustice.remain() > gcd*2 and cd.judgment.remain() > gcd*2 and cd.consecration.remain() > gcd*2))
			then
			if cast.crusaderStrike() then br.addonDebug("Crusader Strike") return end
		end
		-- actions.generators+=/call_action_list,name=finishers
		if actionList_Finisher() then return end
		-- actions.generators+=/crusader_strike,if=holy_power<=4
		if holyPower <= 4 then
			if cast.crusaderStrike() then return end
		end
		-- actions.generators+=/arcane_torrent,if=holy_power<=4
		if isChecked("Racial") and useCDs() and race == "BloodElf" and holyPower <= 4 then
			if cast.racial() then return end
		end
	end
	---------------------
	--- Begin Profile ---
	---------------------
	-- Profile Stop | Pause
	if not inCombat and not hastar and profileStop==true then
		profileStop = false
	elseif (inCombat and profileStop==true) or pause() or mode.rotation==4 then
		return true
	else
		-----------------------
		--- Extras Rotation ---
		-----------------------
		if actionList_Extras() then return end
		---------------------------
		--- Boss Encounter Case ---
		---------------------------
		if isChecked("Boss Encounter Case") then
			if BossEncounterCase() then return end
		end
		--------------------------
		--- Defensive Rotation ---
		--------------------------
		if actionList_Defensive() then return end
		------------------------------
		--- Out of Combat Rotation ---
		------------------------------
		if actionList_PreCombat() then return end
		--------------------------
		--- In Combat Rotation ---
		--------------------------
		if inCombat and isValidUnit("target") or isDummy() and opener == true then

			----------------------------------
			--- In Combat - Begin Rotation ---
			----------------------------------
			--------------------------------
			--- In Combat - SimCraft APL ---
			--------------------------------
			if getOptionValue("APL Mode") == 1 then
				local startTime = debugprofilestop()
				-- Start Attack
				-- auto_attack
				if getDistance(units.dyn5) < 5 then
					if not IsCurrentSpell(6603) then
						StartAttack(units.dyn5)
					end
				end
				-- Action List - Interrupts
				-- rebuke
				if actionList_Interrupts() then return end
				if isChecked("Racial") and race == "LightforgedDraenei" and #enemies.yards5 >= 3 then
					if cast.racial() then return end
				end
				-- Action List - Essences
				if actionList_Essences() then return end
				-- Action List - Cooldowns
				if actionList_Cooldowns() then return end
				-- Action List - Priority
				if actionList_Generator() then return end
			end
		end -- End In Combat
	end -- End Profile
end -- runRotation
local id = 70
if br.rotations[id] == nil then br.rotations[id] = {} end
tinsert(br.rotations[id],{
name = rotationName,
toggles = createToggles,
options = createOptions,
run = runRotation,
})
