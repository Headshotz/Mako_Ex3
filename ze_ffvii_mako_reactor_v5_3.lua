-- CREDIT TO HEASHOT FOR MAKO LUA  //  https://steamcommunity.com/id/zs_is_over_man/

hook.Add("EntityKeyValue", "ChangeSettings", function(ent, key, value)
	if not TrueFixRound then
		GAMEMODE.KatanaDamageNum = 100
		GAMEMODE.MKStageNumber = 0
		GAMEMODE.Ex3Once = 0
		GAMEMODE.StartBridgeRotate = false
		GAMEMODE.SkipToEx3 = false
		TrueFixRound = true
	end

	if ent:GetName() == "kill_all_button" and ent:GetClass() == "func_button" then
		if key == "OnPressed" then
			if value == "consola,Command,say ** ADMIN PRESSED KILL ALL BUTTON **,0,-1" then
				return "dificultad_inicio_extremo,Enable,,0,-1"
			end
		end
	end

	if ent:GetName() == "kill_all_button" and ent:GetClass() == "func_button" then
		if key == "OnPressed" then
			if value == "boom2,Enable,,0,-1" then
				return "dificultad_inicio_extremo2,Disable,,0,-1"
			end
		end
	end

	-- Only Focus Replay to Extreme 2 if it's win at end of extreme 2.
	if ent:GetName() == "trigger_n_e2" and ent:GetClass() == "trigger_once" then
		if key == "OnStartTouch" then
			if value == "dificultad_inicio_extremo2,Enable,,0,-1" then
				return ",,,,"
			end
		end
	end

	if ent:GetName() == "trigger_n_e2" and ent:GetClass() == "trigger_once" then
		if key == "OnStartTouch" then
			if value == "dificultad_inicio_zm,Disable,,0,-1" then
				return ",,,,"
			end
		end
	end

	-- Disable Normal at start.
	if ent:GetName() == "dificultad_inicio_medio" and ent:GetClass() == "func_brush" then
		if key == "StartDisabled" then
			if value == "1" then
				return "0"
			end
		end
	end
	-- Force to EX1 at begin
	if ent:GetName() == "dificultad_inicio_extremo" and ent:GetClass() == "func_brush" then
		if key == "StartDisabled" then
			if value == "0" then
				return "1"
			end
		end
	end

	-- buff electro materia dmg
	if ent:GetName() == "rayo_hurt" and ent:GetClass() == "trigger_hurt" then
		if key == "damage" then
			if value == "2" then
				return "50"
			end
		end
	elseif ent:GetName() == "rayo_hurt2" and ent:GetClass() == "trigger_hurt" then
		if key == "damage" then
			if value == "2" then
				return "50"
			end
		end
	elseif ent:GetName() == "rayo_hurt3" and ent:GetClass() == "trigger_hurt" then
		if key == "damage" then
			if value == "2" then
				return "50"
			end
		end
	end

	-- another fire materia buff
	if ent:GetName() == "fuego_a1" and ent:GetClass() == "trigger_hurt" then
		if key == "damage" then
			if value == "2" then
				return "32"
			end
		elseif key == "damagecap" then
			if value == "20" then
				return "32"
			end
		end
	elseif ent:GetName() == "fuego_a2" and ent:GetClass() == "trigger_hurt" then
		if key == "damage" then
			if value == "2" then
				return "32"
			end
		elseif key == "damagecap" then
			if value == "20" then
				return "32"
			end
		end
	elseif ent:GetName() == "fuego_a3" and ent:GetClass() == "trigger_hurt" then
		if key == "damage" then
			if value == "2" then
				return "32"
			end
		elseif key == "damagecap" then
			if value == "20" then
				return "32"
			end
		end
	end

	-- Change 1x to 3x Bullets.
	if ent:GetClass() == "prop_dynamic" then
		if key == "OnHealthChanged" then
			if value == "bahamut_vida,Subtract,1,0,-1" then
				return "bahamut_vida,Subtract,3,0,-1"
			end
		end
	end

	-- Fix Earth Health
	if ent:GetClass() == "prop_physics_override" and ent:GetName()=="mt" then
		if key == "health" then
			if value == "1000" then
				return "3000"
			end
		end
	end

	-- Remove these "RemoveHealth" at end part.
	if ent:GetName() == "case4ex" and ent:GetClass() == "trigger_hurt" then
		if key == "OnStartTouch" then
			if value == "bahamutend1,RemoveHealth,150,0,-1" then
				return ",,,,"
			end
		end
	end

	if ent:GetName() == "case3ex" and ent:GetClass() == "trigger_hurt" then
		if key == "OnStartTouch" then
			if value == "bahamutend1,RemoveHealth,150,0,-1" then
				return ",,,,"
			end
		end
	end

	if ent:GetName() == "case2ex" and ent:GetClass() == "trigger_hurt" then
		if key == "OnStartTouch" then
			if value == "bahamutend1,RemoveHealth,150,0,-1" then
				return ",,,,"
			end
		end
	end

	if ent:GetName() == "case1ex" and ent:GetClass() == "trigger_hurt" then
		if key == "OnStartTouch" then
			if value == "bahamutend1,RemoveHealth,150,0,-1" then
				return ",,,,"
			end
		end
	end

	-- Change Timer
	if ent:GetName() == "comienza_huida" and ent:GetClass() == "trigger_once" then
		if key == "OnStartTouch" then
			if value == "huida_e,Trigger,,0.5,-1" then
				return "huida_e,Trigger,,10,-1"
			end
		end
	end

	if GAMEMODE.MKStageNumber== 0 then -- Extreme 1 Setup
		if ent:GetClass() == "logic_relay" then
			if key == "OnTrigger" then
				if value == "bahamut_vida,Subtract,1750,0,-1" then
					return "bahamut_vida,subtract,5000,0,-1"
				end
			end
		elseif ent:GetClass() == "trigger_hurt" then
			if key == "OnStartTouch" then
				if value == "!activator,AddOutput,health 225,0,-1" then
					return "!activator,AddOutput,health 150,0,-1"
				end
			end
		end
	elseif GAMEMODE.MKStageNumber==1 then -- Extreme 2 Setup.
		if ent:GetClass() == "logic_relay" then
			if key == "OnTrigger" then
				if value == "bahamut_vida,Subtract,1750,0,-1" then
					return "bahamut_vida,subtract,4500,0,-1"
				end
			end
		elseif ent:GetClass() == "trigger_hurt" then
			if key == "OnStartTouch" then
				if value == "!activator,AddOutput,health 225,0,-1" then
					return "!activator,AddOutput,health 125,0,-1"
				end
			end
		elseif ent:GetName() == "trigger_extreme2_ex" and ent:GetClass() == "logic_relay" then
			if key == "OnTrigger" then
				if value == "baha_vida,Disable,,0.75,1" then
					return ",,,,"
				end
			end
		end
	elseif GAMEMODE.MKStageNumber==2 then -- Extreme 3 Setup
		if ent:GetClass() == "logic_relay" then
			if key == "OnTrigger" then
				if value == "bahamut_vida,Subtract,1750,0,-1" then
					return "bahamut_vida,subtract,4000,0,-1"
				end
			end
		elseif ent:GetClass() == "trigger_hurt" then
			if key == "OnStartTouch" then
				if value == "!activator,AddOutput,health 225,0,-1" then
					return "!activator,AddOutput,health 100,0,-1"
				end
			end
		elseif ent:GetName() == "trigger_extreme2_ex" and ent:GetClass() == "logic_relay" then
			if key == "OnTrigger" then
				if value == "baha_vida,Disable,,0.75,1" then
					return ",,,,"
				end
			end
		elseif ent:GetName() == "dificultad_i_t_extreme2" and ent:GetClass() == "trigger_multiple" then
			if key == "OnStartTouch" then
				if value == "consola,Command,say **CURRENT DIFFICULTY ** >> EXTREME II << **,10,-1" then
					return "consola,Command,say **CURRENT DIFFICULTY ** >> EXTREME III << **,10,-1"
				end
			end
		end
	end
end)

hook.Add( "PlayerUse", "PlayerUse.SkipToNumStage", function( ply, ent )
	if ent:IsValid() and ply:IsValid() and ent:GetClass() == "func_button" and ent:GetName() == "kill_all_button" and not GAMEMODE.SkipToEx3 then
		GAMEMODE.SkipToEx3 = true
		GAMEMODE.MKStageNumber = 2

		timer.SimpleEx(5, hook.Call, "PreRestartRound", GAMEMODE)
		timer.SimpleEx(8, hook.Call, "RestartRound", GAMEMODE)
	elseif ent:IsValid() and ply:IsValid() and ent:GetClass() == "func_button" and ent:GetKeyValues()["hammerid"] == 140676 and not ent.SkipToEx2 then
		ent.SkipToEx2 = true
		GAMEMODE.MKStageNumber = 1

		timer.SimpleEx(5, hook.Call, "PreRestartRound", GAMEMODE)
		timer.SimpleEx(8, hook.Call, "RestartRound", GAMEMODE)		
	end
end)

function RemoveStuff()
	for _, ent in pairs(ents.FindInBox(Vector(-4684.86, -4060.53, 1001.90), Vector(-4944.52, -3182.01, 1323.94))) do
		if ent:GetClass() == "func_button" and (ent:GetKeyValues()["hammerid"] == 140688 or ent:GetKeyValues()["hammerid"] == 140684 or ent:GetKeyValues()["hammerid"] == 140680 or ent:GetKeyValues()["hammerid"] == 140668) then
			ent:Remove()
		end
	end

	for _, ent in pairs(ents.GetAll()) do
		if ent:GetName()=="puerta1" then
			ent:Remove() -- Remove stupid door
		end
	end
end

-------------------- Settings --------------------

function MapSettings()
	GAMEMODE.ZombieSpeedMultiplier = 1.05
end

-- Make sure if timer is not exist then start the katana blade spinning.
local Timer = 0
local TimerRotBridge = 90
local TimerRotBridgeTroll = 90
if not timer.Exists( "BladeVectorLoop" ) then
	timer.Create("BladeVectorLoop", 0.01, 0, function()
		if GAMEMODE.MKStageNumber>=1 then
			Timer = Timer + 2 * GAMEMODE.MKStageNumber
			for _, ent in pairs(ents.GetAll()) do
				if ent:GetName() == "sephiroth_c1" or ent:GetName() == "sephiroth_c2" or ent:GetName() == "sephiroth_c3" or ent:GetName() == "sephiroth_c4" then
					ent:SetAngles(Angle(0,0,Timer))
				end
			end
		end
		
		if GAMEMODE.MKStageNumber>=2 then
			if GAMEMODE.StartBridgeRotate then
				if TimerRotBridge>-25 then
					TimerRotBridge = TimerRotBridge - 1
					for _, ent in pairs(ents.GetAll()) do
						if ent:GetName() == "puente_1" then
							ent:SetAngles(Angle(0,TimerRotBridge,0))
						end
					end
				elseif TimerRotBridge<-15 then
					if not timer.Exists( "TrollBridge" ) then
						timer.Create("TrollBridge", 4, 1, function()
							for _, ent in pairs(ents.GetAll()) do
								if ent:GetName() == "puente_1" then
									ent:SetAngles(Angle(0,0,0))
								end
							end
						end)
					end			
				end
			end	
		end
	end)
end

function ForceEnableKatanaEx1()
	for _, ent in pairs(ents.GetAll()) do 
		if ent:GetName() == "extreme2_trigger11" then
			ent:Fire("Enable","",4)
		end
	end
end

function CreateInvisibleWall()
	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-8063, 4088, 222))
		ent:SetAngles(Angle(-90, 90, 0))
		ent:SetModel("models/hunter/plates/plate8x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 20 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-8442, 4088, 222))
		ent:SetAngles(Angle(-90, 90, 0))
		ent:SetModel("models/hunter/plates/plate8x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 20 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-8821, 4088, 222))
		ent:SetAngles(Angle(-90, 90, 0))
		ent:SetModel("models/hunter/plates/plate8x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 20 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-9125, 4088, 222))
		ent:SetAngles(Angle(0, 0, 90))
		ent:SetModel("models/hunter/plates/plate4x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 20 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-8062, 3919, 222))
		ent:SetAngles(Angle(-90, 90, 0))
		ent:SetModel("models/hunter/plates/plate8x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 20 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-8441, 3919, 222))
		ent:SetAngles(Angle(-90, 90, 0))
		ent:SetModel("models/hunter/plates/plate8x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 20 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-8820, 3919, 222))
		ent:SetAngles(Angle(-90, 90, 0))
		ent:SetModel("models/hunter/plates/plate8x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 20 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-9119, 3919, 222))
		ent:SetAngles(Angle(0, 0, 90))
		ent:SetModel("models/hunter/plates/plate4x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 20 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-7817, 4110, 222))
		ent:SetAngles(Angle(0, 205, 90))
		ent:SetModel("models/hunter/plates/plate2x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 20 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-7822, 3891, 222))
		ent:SetAngles(Angle(0, 332, 90))
		ent:SetModel("models/hunter/plates/plate2x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 20 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end
end

function SetupStage()
	if GAMEMODE.MKStageNumber==0 then
		GAMEMODE.KatanaDamageNum = 100
		GAMEMODE:SetWaveOneZombies(0.2)
		ForceEnableKatanaEx1()
		GAMEMODE:AddBoss("Bahamut", "bahamut", "bahamut_vida")
	elseif GAMEMODE.MKStageNumber==1 then
		GAMEMODE.KatanaDamageNum = 100
		GAMEMODE:SetWaveOneZombies(0.25)
		GAMEMODE:AddBoss("Bahamut", "bahamut", "bahamut_vida")
	elseif GAMEMODE.MKStageNumber==2 then
		GAMEMODE.KatanaDamageNum = 45
		GAMEMODE:SetWaveOneZombies(0.25)
		GAMEMODE:CenterNotify(COLOR_CYAN,"EXTREME 3")
		GAMEMODE:AddBoss("Ex Bahamut", "bahamut", "bahamut_vida")

		for _, ent in pairs(ents.GetAll()) do
			if ent:GetName()=="pieza_b2" then
				ent:Remove() -- Disable Pipe
			elseif ent:GetName()=="escal" then
				ent:Remove()
			elseif ent:GetName() == "puente_1" then 
				ent:SetAngles(Angle(0,90,0)) 
			elseif ent:GetName() == "canciones_extreme2_1" then 
				ent:Remove()
			elseif ent:GetName() == "canciones_extreme2_2" then 
				ent:Remove()
			elseif ent:GetName() == "cancion_3" then 
				ent:Remove()
			elseif ent:GetName() == "cancion_3_extra" then 
				ent:Remove()
			elseif ent:GetName() == "cancion_1" then 
				ent:Remove()
			elseif ent:GetName() == "cancion_2" then 
				ent:Remove()
			elseif ent:GetName() == "normal_1de2" then 
				ent:Remove()
			elseif ent:GetName() == "bahamut" then
				ent:SetColor(Color(0, 255, 255, 255)) 
				ent:SetMaterial("FFVII/COWBELL")
			end
		end
	end
end

-- Credit Trazix for Music called Muzzy.
-- Credit Master ToF for Tutorial ah yes... its autist...
-- Take download music link: https://mega.nz/#!ksFwiAYY!mPXCZkMGYHhB0duqYh2DeIfaDqA6497Kz5cDF_PxnBQ
sound.Add( {
	name = "NewMusic1.Mako",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 100,
	pitch = 100,
	sound = "mako/ext3_music_1.mp3"
} )

sound.Add( {
	name = "NewMusic2.Mako",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 100,
	pitch = 100,
	sound = "mako/ext3_music_2.mp3"
} )

local OnlyOnce = 0
function AfterBossMusic()
	if OnlyOnce <= 0 then
		OnlyOnce = OnlyOnce + 1
		for k,v in pairs(player.GetAll()) do
			v:StopSound("NewMusic1.Mako")
			v:EmitSound("NewMusic2.Mako")
		end
	end
end

function ReplayMusicStop()
	for k,v in pairs(player.GetAll()) do
		v:StopSound("NewMusic1.Mako") 
		v:StopSound("NewMusic2.Mako")
	end
end

-- InitPosEntity
hook.Add("InitPostEntityMap", "ChangeStuff", function()
	CreateInvisibleWall()
    SetupStage()
	RemoveStuff()
	MapSettings()
	ReplayMusicStop()
end)

hook.Add("RestartRound", "DeleteShizy", function()
	GAMEMODE.Ex3Once = 0 -- Reset Value
	GAMEMODE.StartBridgeRotate = false -- stop bridge rotate
	TimerRotBridge = 90 -- restart
	AngleRequire = 20 -- restart
	OnlyTime = 0 -- restart value.....
	OnlyOnce = 0 -- same shit
				
	if ROUNDWINNER and (ROUNDWINNER == TEAM_HUMAN) then
		if not GAMEMODE.MKStageNumber then
			GAMEMODE.MKStageNumber = 0
		elseif GAMEMODE.MKStageNumber<= 1 then
			GAMEMODE.MKStageNumber = GAMEMODE.MKStageNumber+1
		end
	end
end)

--- The player is taken damage by a blade after the door is open.
hook.Add("EntityTakeDamage", "MateriaUltima", function( target, dmginfo )
local dmgent = dmginfo:GetInflictor()
	if dmgent~=nil and dmgent:GetName()=="case1ex" or dmgent:GetName()=="case2ex" or dmgent:GetName()=="case3ex" or dmgent:GetName()=="case4ex" then
		dmginfo:SetDamage(GAMEMODE.KatanaDamageNum)
		dmginfo:SetMaxDamage(GAMEMODE.KatanaDamageNum)
	end

	-- Boss hitbox bullet damage
	if not target:IsPlayer() and not target:IsWorld() then
		if target:GetName() == "bahamutend1" then
			dmginfo:ScaleDamage(0.38)
		elseif target:GetName()=="bahamutend" then
			dmginfo:ScaleDamage(2.5)
		elseif target:GetName()=="glassT" then
			dmginfo:ScaleDamage(10)
		end
	end
end)

-- fall dmg enable
hook.Add("OnPlayerHitGround", "ZE.OnPlayerHitGround", function(pl, inwater, hitfloater, speed)
	local damage = (0.1 * (speed - (525 * (pl.HasSuperJump or 1)))) ^ 1.45
		if math.floor(damage) > 0 then
			pl:TakeSpecialDamage(damage, DMG_FALL, game.GetWorld(), game.GetWorld(), pl:GetPos())
			pl:EmitSound("player/pl_fallpain"..(math.random(2) == 1 and 3 or 1)..".wav")
		end
	return true
end)

function OnceBladeEx1n2()
	if GAMEMODE.MKStageNumber==2 then return end

	for _, ent in pairs(ents.GetAll()) do 
		if ent:GetName() == "sephiroth_c1" then
			ent:Fire("StartForward","",4)
		elseif ent:GetName() == "espad" then
			ent:Fire("PlaySound","",4)
		end
	end
end

function OnceBladeEx3()
	if not GAMEMODE.MKStageNumber==2 then return end

	for _, ent in pairs(ents.GetAll()) do 
		if ent:GetName() == "sephiroth_c1" then
			ent:Fire("StartForward","",4)
		elseif ent:GetName() == "espad" then
			ent:Fire("PlaySound","",4)
		elseif ent:GetName() == "sephiroth_c2" then
			ent:Fire("StartForward","",6)
		elseif ent:GetName() == "sephiroth_c3" then
			ent:Fire("StartForward","",8)
		--elseif ent:GetName() == "sephiroth_c4" then  -- add extra katana if you want.
			--ent:Fire("StartForward","",10)
		end
	end

	GAMEMODE:CenterNotify({font = "CloseCaption_Bold"}, "", COLOR_YELLOW, "The bridge will start a rotate in 30 seconds!")
	timer.Simple( 30, function() GAMEMODE.StartBridgeRotate = true end)
end

function FinalBladeEx3()
	if not GAMEMODE.MKStageNumber==2 then return end

	for _, ent in pairs(ents.GetAll()) do
		if ent:GetName() == "trigger_extreme" then
			ent:Fire("Enable","",1)
			ent:Fire("Trigger","",5)
		end
	end
end

function RemoveElevatorFloor()
	if not GAMEMODE.MKStageNumber==2 then return end

	for _, ent in pairs(ents.GetAll()) do 
		if ent:GetName() == "escal2" then
			ent:Fire("Break","",20)
		end
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-9961, 4084, 173))
		ent:SetAngles(Angle(-90, 90, 0))
		ent:SetModel("models/hunter/plates/plate8x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-10340, 4084, 173))
		ent:SetAngles(Angle(-90, 90, 0))
		ent:SetModel("models/hunter/plates/plate8x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-10612, 4125, 173))
		ent:SetAngles(Angle(0, 154, -90))
		ent:SetModel("models/hunter/plates/plate4x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-10652, 4039, 30))
		ent:SetAngles(Angle(0, 154, 180))
		ent:SetModel("models/hunter/plates/plate4x4.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-10652, 3967, 30))
		ent:SetAngles(Angle(0, 112.5, 180))
		ent:SetModel("models/hunter/plates/plate4x4.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-10616, 3879, 173))
		ent:SetAngles(Angle(0, 202.5, -90))
		ent:SetModel("models/hunter/plates/plate4x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-10339, 3915, 173))
		ent:SetAngles(Angle(-90, 90, 0))
		ent:SetModel("models/hunter/plates/plate8x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-9960, 3915, 173))
		ent:SetAngles(Angle(-90, 90, 0))
		ent:SetModel("models/hunter/plates/plate8x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-9826, 4064, 173))
		ent:SetAngles(Angle(0, 205, -90))
		ent:SetModel("models/hunter/plates/plate2x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-9911, 4065, 173))
		ent:SetAngles(Angle(0, 154, -90))
		ent:SetModel("models/hunter/plates/plate2x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-10213, 4065, 173))
		ent:SetAngles(Angle(0, 205, -90))
		ent:SetModel("models/hunter/plates/plate2x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-10297, 4065, 173))
		ent:SetAngles(Angle(0, 154, -90))
		ent:SetModel("models/hunter/plates/plate2x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-10292, 3937, 173))
		ent:SetAngles(Angle(0, 25, -90))
		ent:SetModel("models/hunter/plates/plate2x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-10208, 3937, 173))
		ent:SetAngles(Angle(0, 334, -90))
		ent:SetModel("models/hunter/plates/plate2x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-9906, 3937, 173))
		ent:SetAngles(Angle(0, 25, -90))
		ent:SetModel("models/hunter/plates/plate2x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end

	local ent = ents.Create("prop_dynamic_override")
	if IsValid(ent) then
		ent:SetPos(Vector(-9821, 3937, 173))
		ent:SetAngles(Angle(0, 334, -90))
		ent:SetModel("models/hunter/plates/plate2x8.mdl")
		ent:SetSolid(SOLID_VPHYSICS)
		ent:Spawn()
		ent:SetColor( Color( 5, 5, 5, 170 ) )
		ent:SetRenderMode( RENDERMODE_TRANSALPHA )
	end
end

hook.Add("AcceptInput", "StuffMako", function( ent, input, activator, caller, value )
	local classname = ent:GetClass()

	if ent:GetName()=="bahamut_s1" and classname == "ambient_generic" and input== "PlaySound" and caller:GetName() == "bahamut_vida" then
		if GAMEMODE.MKStageNumber==2 then
			timer.Simple( 0.5, AfterBossMusic)
		end
	end

	if GAMEMODE.MKStageNumber<=2 then
		if ent:GetName() == "puerta5" and classname == "func_door" and input== "Open" then
			if GAMEMODE.Ex3Once == 0 then
				GAMEMODE.Ex3Once=GAMEMODE.Ex3Once+1
				if GAMEMODE.MKStageNumber<=1 then
					OnceBladeEx1n2()
				elseif GAMEMODE.MKStageNumber==2 then
					OnceBladeEx3()
				end
			end
		elseif ent:GetName() == "sephi2" and classname == "trigger_once" and input== "Enable" then
			if GAMEMODE.Ex3Once <= 2 then
				GAMEMODE.Ex3Once=GAMEMODE.Ex3Once+1
				GAMEMODE.KatanaDamageNum = 999999
			end
		elseif ent:GetName() == "boton2" and classname == "func_button" and input== "Lock" then
			if GAMEMODE.MKStageNumber==2 then
				RemoveElevatorFloor()
			end
		elseif ent:GetName() == "cortes2" and classname == "logic_timer" and input== "Disable" then
			if GAMEMODE.MKStageNumber==2 then
				FinalBladeEx3()
			end
		end
	end
end)
