local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")

local CFrameInterpolator = require(workspace.CFrameInterpolator)

print("Player Script Running")

local player = game.Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")
local gameGui = playerGui:WaitForChild("GameGui")

local char = player.Character or player.CharacterAdded:Wait()

local humanoid = char.Humanoid
local torso = char.Torso
local camera = workspace.CurrentCamera

local mouse = player:GetMouse()

local arms = { char:findFirstChild("Left Arm"), char:findFirstChild("Right Arm") }

local v12 = CFrame.new(1.2, 0.3, 0.55) * CFrame.Angles(-1.9198621771937625, 0.4363323129985824, 0)
local v13 = CFrame.new(-1.2, 0.3, 0.56) * CFrame.Angles(-1.9198621771937625, -0.4363323129985824, 0)

local crouchAnim = Instance.new("Animation")
crouchAnim.AnimationId = "rbxassetid://16359231199"

local crouchTrack = humanoid:LoadAnimation(crouchAnim)
crouchTrack.Looped = true
crouchTrack.Priority = Enum.AnimationPriority.Action

local TOOL_DATA = {
	None = {
		damage = 0,
		range = 0,
		type = "Normal",
		weldLA = CFrame.new(1.5, 0, 0) * CFrame.Angles(0, 0, 0),
		weldRA = CFrame.new(-1.5, 0, 0) * CFrame.Angles(0, 0, 0),
	},
	Wrench = {
		reticle = "NoTool",
		spread = 0,
		ammo = 30,
		damage = 20,
		range = 2,
		recoil = 0,
		type = "Melee",
		weldLA = v12,
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0),
		weldTool = CFrame.new(0.2, -1, -0.2) * CFrame.Angles(3.141592653589793, 0, -0.2617993877991494),
	},
	Hammer = {
		reticle = "NoTool",
		spread = 0,
		ammo = 30,
		damage = 20,
		range = 2,
		recoil = 0,
		type = "Melee",
		weldLA = v12,
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0),
		weldTool = CFrame.new(0.9, 0.1, -0.2) * CFrame.Angles(3.141592653589793, 0, -1.6580627893946132),
	},
	Mug = {
		reticle = "NoTool",
		spread = 0,
		ammo = 0,
		damage = 40,
		range = 2,
		recoil = 0,
		type = "Melee",
		weldLA = v12,
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0),
		weldTool = CFrame.new(0.4, 0, 1.1) * CFrame.Angles(1.5707963267948966, 0, 0),
	},
	Pistol = {
		reticle = "NormalGun",
		spread = 0.015,
		ammo = 16,
		damage = 20,
		range = 60,
		recoil = 0.02,
		type = "Ranged",
		weldLA = CFrame.new(1, 0.4, 0.45) * CFrame.Angles(-1.5707963267948966, 1.0471975511965976, 0),
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0),
		weldTool = CFrame.new(0.3, -0.2, 1.3) * CFrame.Angles(1.5707963267948966, 0, -0.2617993877991494),
	},
	["Machine Pistol"] = {
		reticle = "NormalGun",
		spread = 0.03,
		ammo = 30,
		damage = 12,
		range = 50,
		recoil = 0.02,
		type = "Ranged",
		weldLA = CFrame.new(1, 0.4, 0.45) * CFrame.Angles(-1.5707963267948966, 1.0471975511965976, 0),
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0),
		weldTool = CFrame.new(0.3, -1.2, 0) * CFrame.Angles(3.141592653589793, 0, -0.2617993877991494),
	},
	["Assault Rifle 1"] = {
		reticle = "NormalGun",
		spread = 0.02,
		ammo = 40,
		damage = 12,
		range = 70,
		recoil = 0.02,
		type = "Ranged",
		weldLA = CFrame.new(-0.39, 1.02, 0.8) * CFrame.Angles(-0.93, 0.13, -1.71),
		weldRA = CFrame.new(-1.06, -0.38, 0.53) * CFrame.Angles(-1.33, -0.46, 0.14),
		weldTool = CFrame.new(-0.15, 1.64, 0.39) * CFrame.Angles(-1.83, -1.36, -2.22),
	},
	Revolver = {
		reticle = "NormalGun",
		spread = 0.01,
		ammo = 8,
		damage = 40,
		range = 80,
		recoil = 0.04,
		type = "Ranged",
		weldLA = CFrame.new(0.63, 0.4, -0.54) * CFrame.Angles(-2.57, -0.07, 1.42),
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0),
		weldTool = CFrame.new(0.3, -1.5, -0.2) * CFrame.Angles(3.141592653589793, 0, -0.2617993877991494),
	},
	Shotgun = {
		reticle = "NormalGun",
		spread = 0.12,
		ammo = 10,
		damage = 10,
		range = 40,
		recoil = 0.04,
		type = "Ranged",
		weldLA = CFrame.new(-0.4, 1.04, 0.94) * CFrame.Angles(-0.93, 0.13, -1.71),
		weldRA = CFrame.new(-1.06, -0.38, 0.53) * CFrame.Angles(-1.33, -0.46, 0.14),
		weldTool = CFrame.new(0.4, -0.05, 1.53) * CFrame.Angles(1.36, -0.05, -0.4),
	},
	Chaingun = {
		reticle = "NormalGun",
		spread = 0.025,
		ammo = 60,
		damage = 12,
		range = 70,
		recoil = 0.03,
		type = "Ranged",
		weldLA = CFrame.new(0.33, -0.17, 0.78) * CFrame.Angles(-0.96, -0.1, -0.92),
		weldRA = CFrame.new(-1.08, -0.15, 0.64) * CFrame.Angles(-1.05, -0.26, 0.31),
		weldTool = CFrame.new(-0.5, 1.2, 0.66) * CFrame.Angles(1.06, -0.49, 0.79),
	},
	Turret = {
		reticle = "NormalGun",
		spread = 0.02,
		ammo = 80,
		damage = 12,
		range = 80,
		recoil = 0.03,
		type = "Ranged",
		weldLA = CFrame.new(1.22, -0.01, 0.53) * CFrame.Angles(-1.02, 0.3, -0.18),
		weldRA = CFrame.new(-1.22, -0.01, 0.53) * CFrame.Angles(-1.02, -0.3, 0.18),
		weldTool = CFrame.new(-1.38, 1.26, 1.15) * CFrame.Angles(1.57, -0.52, 1.22),
	},
	["Golden Pistol"] = {
		reticle = "NormalGun",
		spread = 0.01,
		ammo = 16,
		damage = 40,
		range = 60,
		recoil = 0.02,
		type = "Ranged",
		weldLA = CFrame.new(1, 0.4, 0.45) * CFrame.Angles(-1.5707963267948966, 1.0471975511965976, 0),
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0),
		weldTool = CFrame.new(0.3, -0.2, 1.3) * CFrame.Angles(1.5707963267948966, 0, -0.2617993877991494),
	},
	["Elite Assault Rifle 1"] = {
		reticle = "NormalGun",
		spread = 0.02,
		ammo = 48,
		damage = 16,
		range = 70,
		recoil = 0.02,
		type = "Ranged",
		weldLA = CFrame.new(-0.39, 1.02, 0.8) * CFrame.Angles(-0.93, 0.13, -1.71),
		weldRA = CFrame.new(-1.06, -0.38, 0.53) * CFrame.Angles(-1.33, -0.46, 0.14),
		weldTool = CFrame.new(-0.15, 1.64, 0.39) * CFrame.Angles(-1.83, -1.36, -2.22),
	},
	["Elite Revolver"] = {
		reticle = "NormalGun",
		spread = 0.01,
		ammo = 12,
		damage = 60,
		range = 80,
		recoil = 0.04,
		type = "Ranged",
		weldLA = CFrame.new(0.63, 0.4, -0.54) * CFrame.Angles(-2.57, -0.07, 1.42),
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0),
		weldTool = CFrame.new(0.3, -1.5, -0.2) * CFrame.Angles(3.141592653589793, 0, -0.2617993877991494),
	},
	["Elite Chaingun"] = {
		reticle = "NormalGun",
		spread = 0.025,
		ammo = 10000,
		damage = 16,
		range = 80,
		recoil = 0.03,
		type = "Ranged",
		weldLA = CFrame.new(0.33, -0.17, 0.78) * CFrame.Angles(-0.96, -0.1, -0.92),
		weldRA = CFrame.new(-1.08, -0.15, 0.64) * CFrame.Angles(-1.05, -0.26, 0.31),
		weldTool = CFrame.new(-0.5, 1.2, 0.66) * CFrame.Angles(1.06, -0.49, 0.79),
	},
	Reactor = {
		reticle = "NoTool",
		spread = 0,
		ammo = 0,
		damage = 20,
		range = 2,
		recoil = 0,
		type = "Melee",
		weldLA = v12,
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0),
		weldTool = CFrame.new(0.4, 0, 1.1) * CFrame.Angles(1.5707963267948966, 0, 0),
	},
	["Bad Reactor"] = {
		reticle = "NoTool",
		spread = 0,
		ammo = 0,
		damage = 20,
		range = 2,
		recoil = 0,
		type = "Melee",
		weldLA = v12,
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0),
		weldTool = CFrame.new(0.4, 0, 1.1) * CFrame.Angles(1.5707963267948966, 0, 0),
	},
	Missile = {
		reticle = "NoTool",
		spread = 0,
		ammo = 0,
		damage = 20,
		range = 2,
		recoil = 0,
		type = "Melee",
		weldLA = v12,
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0),
		weldTool = CFrame.new(0.4, 0, 1.1) * CFrame.Angles(1.5707963267948966, 0, 0),
	},
	["Light Stick"] = {
		reticle = "NoTool",
		spread = 0,
		ammo = 0,
		damage = 20,
		range = 2,
		recoil = 0,
		type = "Melee",
		weldLA = v12,
		weldRA = CFrame.new(-1.312, 0.12, 0.548) * CFrame.Angles(-1.345, -0.376, 0.067),
		weldTool = CFrame.new(0, -1, -0.2) * CFrame.Angles(math.pi, 0, 0),
	},
}

local menu = gameGui.Pause.Menu
local currentStatus = "Standing"
local statFolder = player.Stats

humanoid.Died:Connect(function()
	if gameGui.GamePause.Value then
		gameGui.GamePause.Value = false
	end
	currentStatus = "Dead"
	player.CameraMode = 0
	wait(1.2)
	statFolder.Restart.Value = true
end)

char.Parent = camera
statFolder.Restart.Value = false
camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
camera.CameraType = "Custom"
camera.FieldOfView = 70
local v18 = char:findFirstChild("Tool")
if not v18 then
	v18 = game.ReplicatedStorage.Tool:clone()
	v18.ToolLocal.Disabled = false
	v18.Parent = char
end
local v19 = Instance.new("Part")
v19.FormFactor = "Symmetric"
v19.Size = Vector3.new(1, 1, 1)
v19.Transparency = 1
v19.Name = "Sensor"
v19.CanCollide = false
local v20 = Instance.new("Weld")
v20.Name = "SensorWeld"
v20.Parent = torso
v20.Part0 = torso
v20.Part1 = v19
v19.Parent = v18
local u3 = false
v19.Touched:connect(function(p1)
	if u3 and p1 and p1.Parent then
		if not statFolder.Mode.Value then
			normalDamage(p1, 40, statFolder.Tool.Value)
		else
			normalDamage(p1, TOOL_DATA[statFolder.Tool.Value].damage, statFolder.Tool.Value)
		end
		u3 = false
	end
end)
local v21 = char:GetChildren()
for v22 = 1, #v21 do
	if not (not v21[v22]:IsA("CharacterMesh")) or not (not v21[v22]:IsA("Shirt")) or v21[v22]:IsA("Pants") then
		v21[v22]:Destroy()
	end
end
if torso:findFirstChild("roblox") then
	torso.roblox:Destroy()
end
if char:findFirstChild("Shirt Graphic") then
	char["Shirt Graphic"]:Destroy()
end
function addMeshes(p2, p3, p4)
	local v23 = Instance.new("CharacterMesh")
	v23.MeshId = p3
	v23.OverlayTextureId = p4
	v23.BodyPart = p2
	v23.Name = p2.Name .. "Mesh"
	v23.Parent = char
end

addMeshes(Enum.BodyPart.LeftArm, 27111419, 0)
addMeshes(Enum.BodyPart.RightArm, 27111864, 0)
addMeshes(Enum.BodyPart.Torso, 27111894, 0)
addMeshes(Enum.BodyPart.LeftLeg, 27111857, 0)
addMeshes(Enum.BodyPart.RightLeg, 27111882, 0)

local v24 = Instance.new("Shirt")
v24.Name = "Shirt"
v24.ShirtTemplate = "rbxassetid://104164809"
v24.Parent = char
local v25 = Instance.new("Pants")
v25.Name = "Pants"
v25.PantsTemplate = "rbxassetid://104163947"
v25.Parent = char
local v26 = arms[1]:clone()
local v27 = Instance.new("SpecialMesh")
v27.MeshId = "rbxassetid://" .. char.LeftArmMesh.MeshId
v27.Scale = Vector3.new(0.9, 0.9, 0.9)
v27.Parent = v26
local v28 = Instance.new("Weld")
v26.Parent = v18
v28.Parent = v26
v28.Part0 = v26
v28.Part1 = arms[1]
local v29 = arms[2]:clone()
local v30 = Instance.new("SpecialMesh")
v30.MeshId = "rbxassetid://" .. char.RightArmMesh.MeshId
v30.Scale = Vector3.new(0.9, 0.9, 0.9)
v30.Parent = v29
local v31 = Instance.new("Weld")
v29.Parent = v18
v31.Parent = v29
v31.Part0 = v29
v31.Part1 = arms[2]
local v32 = Instance.new("Weld")
v32.Part0 = torso
v32.Parent = torso
v32.Part1 = arms[1]
v32.C1 = v12
local v33 = Instance.new("Weld")
v33.Part0 = torso
v33.Parent = torso
v33.Part1 = arms[2]
v33.C1 = v13
torso["Left Shoulder"].Part1 = nil
torso["Right Shoulder"].Part1 = nil
for v34 = 1, #v21 do
	if v21[v34]:IsA("Part") then
		v21[v34].Transparency = 0.95
	end
end

function waitTime(p5)
	for i = 0, p5 do
		task.wait(0.03)
		--[[if script.LocalPause.Value then
			script.LocalPause.Changed:Wait()
		end]]
	end
end

function playSoundEffect(p6, p7)
	if script.Parent:FindFirstChild("SoundScript") then
		local v36 = Instance.new("StringValue")
		v36.Name = "Sound"
		v36.Value = p6
		local v37 = Instance.new("ObjectValue")
		v37.Name = "Location"
		v37.Value = p7
		v37.Parent = v36
		v36.Parent = script.Parent.SoundScript.Effects
	end
end
function breakGlass(p8)
	local l__X__38 = p8.Position.X
	local l__Y__39 = p8.Position.Y
	local l__Z__40 = p8.Position.Z
	local l__X__41 = p8.Size.X
	local l__Y__42 = p8.Size.Y
	local l__Z__43 = p8.Size.Z
	local v44 = p8.CFrame - p8.CFrame.p
	p8:Destroy()
	local v45 = Instance.new("Part")
	v45.Name = "Averter"
	v45.FormFactor = 0
	v45.Size = Vector3.new(1, 1, 1)
	v45.BrickColor = p8.BrickColor
	v45.Shape = 1
	v45.BottomSurface = 0
	v45.TopSurface = 0
	v45.Reflectance = p8.Reflectance
	v45.Transparency = p8.Transparency
	v45.CanCollide = false
	local v46 = l__X__41 - 1
	local v47 = 0 - 1
	while true do
		local v48 = l__Y__42 - 1
		local v49 = 0 - 1
		while true do
			local v50 = l__Z__43 - 1
			local v51 = 0 - 1
			while true do
				local v52 = v45:clone()
				v52.Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20))
				v52.CFrame = CFrame.new(
					l__X__38 - (l__X__41 - 1) / 2 + v47,
					l__Y__39 - (l__Y__42 - 1) / 2 + v49,
					l__Z__40 - (l__Z__43 - 1) / 2 + v51
				) * v44
				Debris:AddItem(v52, 0.5)
				v52.Parent = camera
				if 0 <= 1 then
					if v51 < v50 then
					else
						break
					end
				elseif v50 < v51 then
				else
					break
				end
				v51 = v51 + 1
			end
			if 0 <= 1 then
				if v49 < v48 then
				else
					break
				end
			elseif v48 < v49 then
			else
				break
			end
			v49 = v49 + 1
		end
		if 0 <= 1 then
			if v47 < v46 then
			else
				break
			end
		elseif v46 < v47 then
		else
			break
		end
		v47 = v47 + 1
	end
end
local gameItems = game.ReplicatedStorage.GameItems
function visualDamage(p9, p10, p11)
	local v53 = Instance.new("BillboardGui")
	v53.Size = UDim2.new(1, 0, 1, 0)
	v53.StudsOffset = Vector3.new(math.random(-2, 2) * 0.5, 1.65, math.random(-2, 2) * 0.5)
	local v54 = gameItems.MasterGuis.DamageFrame:clone()
	v54.Parent = v53
	if p10 == 0 then
		v54.TextLabel.Text = "-" .. p10
		v54.TextLabel.TextStrokeColor3 = Color3.new(0, 0, 1)
	elseif p10 < 0 then
		v54.TextLabel.Text = "+" .. p10
		v54.TextLabel.TextStrokeColor3 = Color3.new(0, 1, 0)
	else
		v54.TextLabel.Text = "-" .. p10
		v54.TextLabel.TextStrokeColor3 = Color3.new(1, 0, 0)
	end
	v53.Parent = p11
	v53.Adornee = p11
	local l__BillboardControl__55 = v54.BillboardControl
	l__BillboardControl__55.Billboard.Value = v53
	l__BillboardControl__55.Parent = gameGui
	l__BillboardControl__55.Disabled = false
	Debris:AddItem(v53, 5)
end
function tagHumanoid(p12, p13, p14)
	local v56 = p12:getChildren()

	for _, tag in v56 do
		if tag.Name == "creator" then
			if tag.Value == p13 then
				tag:Destroy()
			end
		end
	end
	local v59 = Instance.new("ObjectValue")
	v59.Value = p13
	v59.Name = "creator"
	local v60 = Instance.new("StringValue")
	v60.Value = p14
	v60.Parent = v59
	v59.Parent = p12
	Debris:AddItem(v59, 10)
end
function normalDamage(p15, p16, p17)
	local v61 = p15.Parent:findFirstChild("Humanoid")
	if not v61 then
		if p15.Parent.Parent then
			v61 = p15.Parent.Parent:findFirstChild("Humanoid")
			if not v61 then
				if p15.Parent.Parent.Parent then
					v61 = p15.Parent.Parent.Parent:findFirstChild("Humanoid")
				end
			end
		end
	end
	if v61 then
		if v61.Parent:findFirstChild("MainControlNPC") then
			if p15.Parent.Name == "TileTurret" then
				if p15.Name == "Torso" then
					return
				end
			end
			if v61.Parent.Name == "Flagship" then
				if p15.Parent.Name == "Flames" then
					if p15.BrickColor.Name == "Bright orange" then
						print(p15.Parent.Name)
						p15.Health.Value = p15.Health.Value - p16
						visualDamage(v61, p16, p15)
						return
					end
				end
				if string.sub(p15.Parent.Name, 1, 11) == "GaussCannon" then
					if p15.BrickColor.Name == "Bright orange" then
						print((string.sub(p15.Parent.Name, 1, 11)))
						p15.Parent.Health.Value = p15.Parent.Health.Value - p16
						visualDamage(v61, p16, p15)
						return
					end
				end
			elseif 0 < v61.Health then
				if not v61.Parent:findFirstChild("ForceField") then
					if v61.Parent:findFirstChild("Head") then
						if p17 == "ThrownMug" then
							print("Mean Muggin")
							if not statFolder.BadgeMeanMuggin.Value then
								statFolder.BadgeMeanMuggin.Value = true
							end
						end
						tagHumanoid(v61, player, p17)
						local v62 = p16
						if p15.Name == "Head" then
							v62 = math.ceil(v62 * 2)
							if statFolder then
								if statFolder:findFirstChild("Headshots") then
									statFolder.Headshots.Value = statFolder.Headshots.Value + 1
								end
							end
						elseif p15.Name == "Torso" then
							v62 = math.ceil(v62 * 1.5)
						end
						v61:TakeDamage(v62)
						visualDamage(v61, v62, v61.Parent.Head)
						return
					end
				end
			end
		else
			if p15.Name == "Glass" then
				breakGlass(p15)
				return
			end
			if p15.Name == "Explosive" then
				if p15:findFirstChild("Explode") then
					p15.Explode.Value = true
				end
			end
		end
	else
		if p15.Name == "Glass" then
			breakGlass(p15)
			return
		end
		if p15.Name == "Explosive" then
			if p15:findFirstChild("Explode") then
				p15.Explode.Value = true
			end
		end
	end
end
local u5 = false
local u6 = false
local u7 = nil
local u8 = v12
local u9 = nil
local u10 = nil
local u11 = v13
local u12 = nil
local u13 = 0
local u14 = nil
local head = char.Head
local u16 = nil
function normalThrow()
	u5 = false
	u6 = true
	u7 = u8
	u9 = v12
	u10 = u11
	u12 = CFrame.new(-1.6, 1.2, 0.55) * CFrame.Angles(-1.9198621771937625, -0.5235987755982988, -0.08726646259971647)
	u13 = 4
	local v63, v64 = CFrameInterpolator(u7, u9)
	local v65, v66 = CFrameInterpolator(u10, u12)
	local v67 = 1 - 1
	while true do
		u8 = v64(v67 / u13)
		u11 = v66(v67 / u13)
		waitTime(1)
		if 0 <= 1 then
			if v67 < u13 then
			else
				break
			end
		elseif u13 < v67 then
		else
			break
		end
		v67 = v67 + 1
	end
	u14:Destroy()
	local l__unit__68 = (mouse.Hit.p - head.Position).unit
	local v69 = u16:clone()
	v69.Velocity = Vector3.new(80 * l__unit__68.x, 80 * l__unit__68.y, 80 * l__unit__68.z)
	v69.CanCollide = true
	u16.Transparency = 1
	local v70 = Instance.new("IntValue")
	v70.Value = statFolder.Ammo.Value
	v70.Name = "SpecificAmmo"
	v70.Parent = v69
	v69.Parent = camera.Level.Tool
	coroutine.resume(coroutine.create(function()
		local u17 = true
		v69.Touched:connect(function(p18)
			if u17 then
				if p18 then
					if p18.Parent then
						if not p18:IsDescendantOf(char) then
							u17 = false
							if v69.Name == "Mug" then
								normalDamage(p18, 40, "ThrownMug")
								return
							end
							normalDamage(p18, 20, "Thrown")
						end
					end
				end
			end
		end)
		while true do
			wait(0.09)
			if not (v69.Velocity.magnitude < 0.1) then
			else
				break
			end
		end
		u17 = false
		v69.Anchored = true
	end))
	u16:Destroy()
	waitTime(1)
	u13 = 6
	local v71, v72 = CFrameInterpolator(u12, v13)
	local v73 = 1 - 1
	while true do
		u11 = v72(v73 / u13)
		waitTime(1)
		if 0 <= 1 then
			if v73 < u13 then
			else
				break
			end
		elseif u13 < v73 then
		else
			break
		end
		v73 = v73 + 1
	end
	statFolder.Tool.Value = "None"
	statFolder.Mode.Value = false
	u5 = true
end
local isSprinting = false
local l__Reticle__19 = gameGui.Reticle
local u20 = "NoTool"
local u21 = v12
local u22 = v13
local u23 = false
function normalZoom(p19, p20, p21, p22)
	if isSprinting then
		sprint()
	end
	l__Reticle__19[u20].Visible = false
	l__Reticle__19.NormalZoomed.Visible = true
	local v74, v75 = CFrameInterpolator(u21, p19)
	local v76, v77 = CFrameInterpolator(u22, p20)
	local v78, v79 = CFrameInterpolator(p21, p22)
	local v80 = 1 - 1
	while true do
		camera.FieldOfView = camera.FieldOfView - 5
		u14.C1 = v79(v80 / 4)
		u8 = v75(v80 / 4)
		u11 = v77(v80 / 4)
		waitTime(1)
		if 0 <= 1 then
			if v80 < 4 then
			else
				break
			end
		elseif 4 < v80 then
		else
			break
		end
		v80 = v80 + 1
	end
	u14.C1 = p22
	u8 = p19
	u11 = p20
	while true do
		if u23 then
		else
			break
		end
		if mouse then
		else
			break
		end
		if not isSprinting then
		else
			break
		end
		if u5 then
		else
			break
		end
		waitTime(1)
	end
	if u5 then
		if u16 then
			local v81, v82 = CFrameInterpolator(p19, u21)
			local v83, v84 = CFrameInterpolator(p20, u22)
			local v85, v86 = CFrameInterpolator(p22, p21)
			local v87 = 1 - 1
			while true do
				camera.FieldOfView = camera.FieldOfView + 5
				u14.C1 = v86(v87 / 4)
				u8 = v82(v87 / 4)
				u11 = v84(v87 / 4)
				waitTime(1)
				if 0 <= 1 then
					if v87 < 4 then
					else
						break
					end
				elseif 4 < v87 then
				else
					break
				end
				v87 = v87 + 1
			end
			u14.C1 = p21
			u8 = u21
			u11 = u22
			l__Reticle__19[u20].Visible = true
			l__Reticle__19.NormalZoomed.Visible = false
		end
	end
end
local v88 = Instance.new("Part")
v88.FormFactor = Enum.FormFactor.Custom
v88.Size = Vector3.new(0.2, 0.2, 1)
v88.BrickColor = BrickColor.new("Bright red")
v88.CanCollide = false
v88.Anchored = true
v88.Transparency = 0.3
v88.TopSurface = Enum.SurfaceType.Smooth
v88.BottomSurface = Enum.SurfaceType.Smooth
v88.Name = "Averter"
function RayIgnoreCheck(p23, p24)
	if p23 then
		if p23.Parent then
			if not (1 <= p23.Transparency) then
				if string.lower(p23.Name) ~= "water" then
					if p23.Name ~= "Effect" then
						if p23.Name ~= "Rocket" then
							if p23.Name ~= "Averter" then
								if p23.Parent.ClassName ~= "Hat" then
									if p23.Parent.ClassName ~= "Tool" then
										if p23:IsDescendantOf(char) then
										else
											return false
										end
									end
								end
							end
						end
					end
				end
			end
		else
			return false
		end
	else
		return false
	end
	return true
end
function RayCast(p25, p26, p27)
	local v89, v90 = game.Workspace:FindPartOnRay(Ray.new(p25 + p26 * 0.01, p26 * p27), char)
	if v89 then
		if v90 then
			local v91 = p27 - (v90 - p25).magnitude
			if v89 then
				if v89.Parent then
					if not v89.Parent:findFirstChild("MainControlNPC") then
						if v89.Parent.Parent:findFirstChild("MainControlNPC") then
							return v89, v90
						end
					else
						return v89, v90
					end
				end
			end
			if RayIgnoreCheck(v89, v90) then
				if 0 < v91 then
					return RayCast(v90, p26, v91)
				end
			end
		end
	end
	return v89, v90
end
local u24 = 0.1
function onFireNormal(p28, p29, p30)
	if not mouse.Hit then
		return
	end

	local v92 = (mouse.Hit.p - head.Position).unit

	local v93

	if p28 then
		v93 = (CFrame.new(Vector3.new(0, 0, 0), v92) * CFrame.Angles(0, 0, math.random() * 2 * math.pi) * CFrame.Angles(
			math.random() * u24 / 2,
			0,
			0
		)).lookVector
	else
		v93 = (CFrame.new(Vector3.new(0, 0, 0), v92) * CFrame.Angles(0, 0, math.random() * 2 * math.pi) * CFrame.Angles(
			math.random() * u24,
			0,
			0
		)).lookVector
	end

	local v94, v95 = RayCast(head.Position, v93, p30)
	local v96 = Instance.new("StringValue")
	v96.Name = "Sound"
	v96.Value = "LaserShot"
	v96.Parent = gameGui.SoundScript.Effects
	if v95 then
		local v97 = v88:clone()
		local v98 = (v95 - u16.Position).magnitude
		if p30 < v98 then
			v95 = (v95 - u16.Position).unit * p30
			v98 = (v95 - u16.Position).magnitude
		end
		v97.CFrame = CFrame.new(v95, u16.Position) * CFrame.new(0, 0, -v98 / 2)
		local v99 = Instance.new("BlockMesh")
		v99.Scale = Vector3.new(1, 1, v98 - 2)
		v99.Offset = Vector3.new(0, 0, 2)
		v99.Parent = v97
		v97.Parent = camera
		Debris:AddItem(v97, 0.06)
	end
	if v94 then
		if v94.Parent then
			if v95 then
				normalDamage(v94, p29, statFolder.Tool.Value)
			end
		end
	end
end
function reduceAmmo()
	if statFolder.Tool.Value ~= "Elite Chaingun" then
		statFolder.Ammo.Value = statFolder.Ammo.Value - 1
	end
end
local u25 = { true, true }
local u26 = false
local u27 = false
function fists(p31)
	if p31 == 1 then
		if not u25[2] then
			return
		else
			u25[1] = false
			while true do
				if u26 then
				else
					break
				end
				if mouse then
				else
					break
				end
				if not u27 then
				else
					break
				end
				u7 = u21
				u9 = CFrame.new(1.6, 1.2, 0.55)
					* CFrame.Angles(-1.9198621771937625, 0.6981317007977318, 0.2617993877991494)
				u10 = u22
				u12 = CFrame.new(-1.2, -0.6, -1.56)
					* CFrame.Angles(-2.792526803190927, 0.2617993877991494, -1.6580627893946132)
				u3 = true
				v20.Part0 = arms[1]
				v20.C1 = v20.C1 + Vector3.new(0, 1, 0)
				u13 = 6
				local v100, v101 = CFrameInterpolator(u7, u9)
				local v102, v103 = CFrameInterpolator(u10, u12)
				local v104 = 1 - 1
				while true do
					u8 = v101(v104 / u13)
					u11 = v103(v104 / u13)
					waitTime(1)
					if 0 <= 1 then
						if v104 < u13 then
						else
							break
						end
					elseif u13 < v104 then
					else
						break
					end
					v104 = v104 + 1
				end
				waitTime(1)
				u13 = 8
				local v105, v106 = CFrameInterpolator(u9, u7)
				local v107, v108 = CFrameInterpolator(u12, u10)
				local v109 = 1 - 1
				while true do
					u8 = v106(v109 / u13)
					u11 = v108(v109 / u13)
					waitTime(1)
					if 0 <= 1 then
						if v109 < u13 then
						else
							break
						end
					elseif u13 < v109 then
					else
						break
					end
					v109 = v109 + 1
				end
				v20.Part0 = torso
				v20.C1 = v20.C1 - Vector3.new(0, 1, 0)
				u3 = false
			end
			u25[1] = true
			return
		end
	end
	if not u25[1] then
		return
	end
	u25[2] = false
	while true do
		if u23 then
		else
			break
		end
		if mouse then
		else
			break
		end
		if not u27 then
		else
			break
		end
		u7 = u21
		u9 = CFrame.new(1.2, -0.6, -1.56) * CFrame.Angles(-2.792526803190927, -0.2617993877991494, 1.6580627893946132)
		u10 = u22
		u12 = CFrame.new(-1.6, 1.2, 0.55) * CFrame.Angles(-1.9198621771937625, -0.6981317007977318, -0.2617993877991494)
		u3 = true
		v20.Part0 = arms[2]
		v20.C1 = v20.C1 + Vector3.new(0, 1, 0)
		u13 = 6
		local v110, v111 = CFrameInterpolator(u7, u9)
		local v112, v113 = CFrameInterpolator(u10, u12)
		local v114 = 1 - 1
		while true do
			u8 = v111(v114 / u13)
			u11 = v113(v114 / u13)
			waitTime(1)
			if 0 <= 1 then
				if v114 < u13 then
				else
					break
				end
			elseif u13 < v114 then
			else
				break
			end
			v114 = v114 + 1
		end
		waitTime(1)
		u13 = 8
		local v115, v116 = CFrameInterpolator(u9, u7)
		local v117, v118 = CFrameInterpolator(u12, u10)
		local v119 = 1 - 1
		while true do
			u8 = v116(v119 / u13)
			u11 = v118(v119 / u13)
			waitTime(1)
			if 0 <= 1 then
				if v119 < u13 then
				else
					break
				end
			elseif u13 < v119 then
			else
				break
			end
			v119 = v119 + 1
		end
		v20.Part0 = torso
		v20.C1 = v20.C1 - Vector3.new(0, 1, 0)
		u3 = false
	end
	u25[2] = true
end
function wrench(p32)
	if not u25[math.abs(p32 - 2) + 1] then
		return
	end
	u25[p32] = false
	if p32 == 1 then
		while true do
			if u26 then
			else
				break
			end
			if mouse then
			else
				break
			end
			if not u27 then
			else
				break
			end
			if 0 < statFolder.Ammo.Value then
				reduceAmmo()
				u7 = u21
				u9 = CFrame.new(1.29, -0.06, 0.3) * CFrame.Angles(-0.52, 0.09, -0.15)
				u10 = u22
				u12 = CFrame.new(-1.1, 0.08, 0.49) * CFrame.Angles(-2.46, -1.05, -0.68)
				u3 = true
				v20.Part0 = arms[2]
				v20.C1 = v20.C1 + Vector3.new(0, 1, 1)
				u13 = 6
				local v120, v121 = CFrameInterpolator(u7, u9)
				local v122, v123 = CFrameInterpolator(u10, u12)
				local v124 = 1 - 1
				while true do
					u8 = v121(v124 / u13)
					u11 = v123(v124 / u13)
					waitTime(1)
					if 0 <= 1 then
						if v124 < u13 then
						else
							break
						end
					elseif u13 < v124 then
					else
						break
					end
					v124 = v124 + 1
				end
				waitTime(1)
				u13 = 5
				local v125, v126 =
					CFrameInterpolator(u12, CFrame.new(-1.32, 0.07, -0.46) * CFrame.Angles(0.22, -0.39, -0.032))
				local v127 = 1 - 1
				while true do
					u11 = v126(v127 / u13)
					waitTime(1)
					if 0 <= 1 then
						if v127 < u13 then
						else
							break
						end
					elseif u13 < v127 then
					else
						break
					end
					v127 = v127 + 1
				end
				waitTime(1)
				u13 = 6
				local v128, v129 = CFrameInterpolator(u9, u7)
				local v130, v131 =
					CFrameInterpolator(CFrame.new(-1.32, 0.07, -0.46) * CFrame.Angles(0.22, -0.39, -0.032), u10)
				local v132 = 1 - 1
				while true do
					u8 = v129(v132 / u13)
					u11 = v131(v132 / u13)
					waitTime(1)
					if 0 <= 1 then
						if v132 < u13 then
						else
							break
						end
					elseif u13 < v132 then
					else
						break
					end
					v132 = v132 + 1
				end
				v20.Part0 = torso
				v20.C1 = v20.C1 - Vector3.new(0, 1, 1)
				u3 = false
			else
				normalThrow()
				u26 = false
			end
		end
	else
		while true do
			if u23 then
			else
				break
			end
			if mouse then
			else
				break
			end
			if not u27 then
			else
				break
			end
			if 0 < statFolder.Ammo.Value then
				reduceAmmo()
				u7 = u21
				u9 = CFrame.new(1.29, -0.06, 0.3) * CFrame.Angles(-0.52, 0.09, -0.15)
				u10 = u22
				u12 = CFrame.new(-1.6, 1.2, 0.55)
					* CFrame.Angles(-1.9198621771937625, -0.6981317007977318, -0.2617993877991494)
				u3 = true
				v20.Part0 = arms[2]
				v20.C1 = v20.C1 + Vector3.new(0, 1, 1)
				u13 = 6
				local v133, v134 = CFrameInterpolator(u7, u9)
				local v135, v136 = CFrameInterpolator(u10, u12)
				local v137 = 1 - 1
				while true do
					u8 = v134(v137 / u13)
					u11 = v136(v137 / u13)
					waitTime(1)
					if 0 <= 1 then
						if v137 < u13 then
						else
							break
						end
					elseif u13 < v137 then
					else
						break
					end
					v137 = v137 + 1
				end
				waitTime(1)
				u13 = 8
				local v138, v139 = CFrameInterpolator(u9, u7)
				local v140, v141 = CFrameInterpolator(u12, u10)
				local v142 = 1 - 1
				while true do
					u8 = v139(v142 / u13)
					u11 = v141(v142 / u13)
					waitTime(1)
					if 0 <= 1 then
						if v142 < u13 then
						else
							break
						end
					elseif u13 < v142 then
					else
						break
					end
					v142 = v142 + 1
				end
				v20.Part0 = torso
				v20.C1 = v20.C1 - Vector3.new(0, 1, 1)
				u3 = false
			else
				normalThrow()
				u26 = false
			end
		end
	end
	u25[p32] = true
end
function hammer(p33)
	wrench(p33)
end
local sliding = false
local u29 = 0.3
local u30 = 0
local u31 = 0
function pistol(p34)
	u25[p34] = false
	if p34 == 1 then
		if 0 < statFolder.Ammo.Value then
			reduceAmmo()
			local v143 = TOOL_DATA[statFolder.Tool.Value].recoil / 2
			if isSprinting then
				v143 = v143 + 0.004
			elseif sliding then
				v143 = v143 - 0.003
			end
			if not u25[2] then
				v143 = v143 - 0.004
			end
			if currentStatus ~= "FreeFall" then
				if currentStatus == "Jumping" then
					v143 = v143 + 0.004
				end
			else
				v143 = v143 + 0.004
			end
			if currentStatus == "Standing" then
				v143 = 0.003
			end
			if u29 < u24 + v143 then
				u24 = u29
			else
				u24 = u24 + v143
			end
			onFireNormal(not u25[2], TOOL_DATA[statFolder.Tool.Value].damage, TOOL_DATA[statFolder.Tool.Value].range)
			u30 = TOOL_DATA[statFolder.Tool.Value].recoil
			u31 = math.random(-1, 1) * 0.01
			camera.CoordinateFrame = CFrame.new(camera.Focus.p)
				* (camera.CoordinateFrame - camera.CoordinateFrame.p)
				* CFrame.Angles(u30, u31, 0)
				* CFrame.new(0, 0, (camera.CoordinateFrame.p - camera.Focus.p).magnitude)
			camera.FieldOfView = camera.FieldOfView - u30 * 200
			waitTime(1)
			camera.FieldOfView = camera.FieldOfView + u30 * 200
			waitTime(4)
		else
			normalThrow()
		end
	else
		normalZoom(
			CFrame.new(1.2, 0.2, 0.65) * CFrame.Angles(-1.5707963267948966, 0.7853981633974483, 0),
			CFrame.new(-1.2, 0.2, 0.66) * CFrame.Angles(-1.5707963267948966, -0.7853981633974483, 0),
			u14.C1,
			CFrame.new(0.72, -0.32, 1) * CFrame.Angles(1.6057029118347832, 0, -0.7853981633974483)
		)
	end
	u25[p34] = true
end
function machinePistol(p35)
	if p35 == 1 then
	else
		u25[2] = false
		normalZoom(
			CFrame.new(1.2, 0.2, 0.65) * CFrame.Angles(-1.5707963267948966, 0.7853981633974483, 0),
			CFrame.new(-1.2, 0.2, 0.66) * CFrame.Angles(-1.5707963267948966, -0.7853981633974483, 0),
			u14.C1,
			CFrame.new(0.7, -1, 0) * CFrame.Angles(3.1764992386296798, 0, -0.7853981633974483)
		)
		u25[2] = true
		return
	end
	u25[1] = false
	while true do
		if u26 then
		else
			break
		end
		if not u27 then
		else
			break
		end
		if 0 < statFolder.Ammo.Value then
			reduceAmmo()
			local v144 = TOOL_DATA[statFolder.Tool.Value].recoil / 2
			if isSprinting then
				v144 = v144 + 0.004
			elseif sliding then
				v144 = v144 - 0.003
			end
			if not u25[2] then
				v144 = v144 - 0.004
			end
			if currentStatus ~= "FreeFall" then
				if currentStatus == "Jumping" then
					v144 = v144 + 0.004
				end
			else
				v144 = v144 + 0.004
			end
			if currentStatus == "Standing" then
				v144 = 0.003
			end
			if u29 < u24 + v144 then
				u24 = u29
			else
				u24 = u24 + v144
			end
			onFireNormal(not u25[2], TOOL_DATA[statFolder.Tool.Value].damage, TOOL_DATA[statFolder.Tool.Value].range)
			u30 = TOOL_DATA[statFolder.Tool.Value].recoil
			u31 = math.random(-2, 2) * 0.01
			camera.CoordinateFrame = CFrame.new(camera.Focus.p)
				* (camera.CoordinateFrame - camera.CoordinateFrame.p)
				* CFrame.Angles(u30, u31, 0)
				* CFrame.new(0, 0, (camera.CoordinateFrame.p - camera.Focus.p).magnitude)
			camera.FieldOfView = camera.FieldOfView - u30 * 200
			waitTime(1)
			camera.FieldOfView = camera.FieldOfView + u30 * 200
			waitTime(1)
			if not (statFolder.Ammo.Value < 1) then
			else
				break
			end
		else
			normalThrow()
			u26 = false
		end
	end
	u25[1] = true
end
function assaultRifle(p36)
	if p36 == 1 then
	else
		u25[2] = false
		normalZoom(
			CFrame.new(1.03, -0.1, 0.51) * CFrame.Angles(-1.45, 0.78, -0.09),
			CFrame.new(-1.03, -0.09, 0.51) * CFrame.Angles(-1.45, -0.78, 0.09),
			u14.C1,
			CFrame.new(-0.24, 1.56, 0.81) * CFrame.Angles(-1.57, -1.48, -2.36)
		)
		u25[2] = true
		return
	end

	u25[1] = false
	while true do
		if u26 then
		else
			break
		end
		if not u27 then
		else
			break
		end
		if 0 < statFolder.Ammo.Value then
			reduceAmmo()
			local v145 = TOOL_DATA[statFolder.Tool.Value].recoil / 2
			if isSprinting then
				v145 = v145 + 0.004
			elseif sliding then
				v145 = v145 - 0.003
			end
			if not u25[2] then
				v145 = v145 - 0.004
			end
			if currentStatus ~= "FreeFall" then
				if currentStatus == "Jumping" then
					v145 = v145 + 0.004
				end
			else
				v145 = v145 + 0.004
			end
			if currentStatus == "Standing" then
				v145 = 0.003
			end
			if u29 < u24 + v145 then
				u24 = u29
			else
				u24 = u24 + v145
			end
			onFireNormal(not u25[2], TOOL_DATA[statFolder.Tool.Value].damage, TOOL_DATA[statFolder.Tool.Value].range)
			u30 = TOOL_DATA[statFolder.Tool.Value].recoil
			u31 = math.random(-2, 2) * 0.01
			camera.CoordinateFrame = CFrame.new(camera.Focus.p)
				* (camera.CoordinateFrame - camera.CoordinateFrame.p)
				* CFrame.Angles(u30, u31, 0)
				* CFrame.new(0, 0, (camera.CoordinateFrame.p - camera.Focus.p).magnitude)
			camera.FieldOfView = camera.FieldOfView - u30 * 200
			waitTime(1)
			camera.FieldOfView = camera.FieldOfView + u30 * 200
			waitTime(2)
			if not (statFolder.Ammo.Value < 1) then
			else
				break
			end
		else
			normalThrow()
			u26 = false
		end
	end
	u25[1] = true
end
function revolver(p37)
	if p37 == 1 then
	else
		u25[2] = false
		normalZoom(
			CFrame.new(0.84, -0.1, -1.24) * CFrame.Angles(-2.57, -0.07, 1.42),
			CFrame.new(-1.2, 0.2, 0.66) * CFrame.Angles(-1.5707963267948966, -0.7853981633974483, 0),
			u14.C1,
			CFrame.new(0.7, -1, -0.2) * CFrame.Angles(3.1764992386296798, 0, -0.7853981633974483)
		)
		u25[2] = true
		return
	end
	u25[1] = false
	if 0 < statFolder.Ammo.Value then
		reduceAmmo()
		local v146 = TOOL_DATA[statFolder.Tool.Value].recoil / 2
		if isSprinting then
			v146 = v146 + 0.004
		elseif sliding then
			v146 = v146 - 0.003
		end
		if not u25[2] then
			v146 = v146 - 0.004
		end
		if currentStatus ~= "FreeFall" then
			if currentStatus == "Jumping" then
				v146 = v146 + 0.004
			end
		else
			v146 = v146 + 0.004
		end
		if currentStatus == "Standing" then
			v146 = 0.003
		end
		if u29 < u24 + v146 then
			u24 = u29
		else
			u24 = u24 + v146
		end
		onFireNormal(not u25[2], TOOL_DATA[statFolder.Tool.Value].damage, TOOL_DATA[statFolder.Tool.Value].range)
		u30 = TOOL_DATA[statFolder.Tool.Value].recoil
		u31 = math.random(-2, 2) * 0.01
		camera.CoordinateFrame = CFrame.new(camera.Focus.p)
			* (camera.CoordinateFrame - camera.CoordinateFrame.p)
			* CFrame.Angles(u30, u31, 0)
			* CFrame.new(0, 0, (camera.CoordinateFrame.p - camera.Focus.p).magnitude)
		camera.FieldOfView = camera.FieldOfView - u30 * 200
		waitTime(1)
		camera.FieldOfView = camera.FieldOfView + u30 * 200
		waitTime(1)
		u8 = u8 - Vector3.new(0.04, 0.04, 0)
		waitTime(1)
		u8 = u8 - Vector3.new(0.04, 0.04, 0)
		waitTime(1)
		u8 = u8 + Vector3.new(0.04, 0.04, 0)
		waitTime(1)
		u8 = u8 + Vector3.new(0.04, 0.04, 0)
	else
		normalThrow()
		u26 = false
	end
	u25[1] = true
end
function shotgun(p38)
	if p38 == 1 then
	else
		u25[2] = false
		normalZoom(
			CFrame.new(-0.099, 1.511, 1.418) * CFrame.Angles(-0.998, 0.278, -1.81),
			CFrame.new(-0.829, -0.263, 0.734) * CFrame.Angles(-1.408, -0.883, 0.301),
			u14.C1,
			CFrame.new(0.834, -0.256, 1.449) * CFrame.Angles(1.466, -0.174, -0.908)
		)
		u25[2] = true
		return
	end
	u25[1] = false
	if 0 < statFolder.Ammo.Value then
		reduceAmmo()
		local v147 = TOOL_DATA[statFolder.Tool.Value].recoil / 2
		if isSprinting then
			v147 = v147 + 0.004
		elseif sliding then
			v147 = v147 - 0.003
		end
		if not u25[2] then
			v147 = v147 - 0.004
		end
		if currentStatus ~= "FreeFall" then
			if currentStatus == "Jumping" then
				v147 = v147 + 0.004
			end
		else
			v147 = v147 + 0.004
		end
		if currentStatus == "Standing" then
			v147 = 0.003
		end
		if u29 < u24 + v147 then
			u24 = u29
		else
			u24 = u24 + v147
		end
		local v148 = 1 - 1
		while true do
			onFireNormal(false, TOOL_DATA[statFolder.Tool.Value].damage, TOOL_DATA[statFolder.Tool.Value].range)
			if 0 <= 1 then
				if v148 < 5 then
				else
					break
				end
			elseif 5 < v148 then
			else
				break
			end
			v148 = v148 + 1
		end
		u30 = TOOL_DATA[statFolder.Tool.Value].recoil
		u31 = math.random(-2, 2) * 0.01
		camera.CoordinateFrame = CFrame.new(camera.Focus.p)
			* (camera.CoordinateFrame - camera.CoordinateFrame.p)
			* CFrame.Angles(u30, u31, 0)
			* CFrame.new(0, 0, (camera.CoordinateFrame.p - camera.Focus.p).magnitude)
		camera.FieldOfView = camera.FieldOfView - u30 * 200
		waitTime(1)
		camera.FieldOfView = camera.FieldOfView + u30 * 200
		local v149 = 1 - 1
		while true do
			waitTime(1)
			u8 = u8 - Vector3.new(0, 0.06, 0.06)
			if 0 <= 1 then
				if v149 < 4 then
				else
					break
				end
			elseif 4 < v149 then
			else
				break
			end
			v149 = v149 + 1
		end
		local v150 = 1 - 1
		while true do
			waitTime(1)
			u8 = u8 + Vector3.new(0, 0.06, 0.06)
			if 0 <= 1 then
				if v150 < 4 then
				else
					break
				end
			elseif 4 < v150 then
			else
				break
			end
			v150 = v150 + 1
		end
	else
		normalThrow()
		u26 = false
	end
	u25[1] = true
end
function chaingun(p39)
	if p39 == 1 then
	else
		u25[2] = false
		normalZoom(
			CFrame.new(0.43, 0.3, 0.84) * CFrame.Angles(-0.54, 0.14, -0.86),
			CFrame.new(-1.39, 0.16, 0.34) * CFrame.Angles(-0.88, -0.13, -0.02),
			u14.C1,
			CFrame.new(0.29, 1.08, 1.04) * CFrame.Angles(0.57, -0.15, -0.08)
		)
		u25[2] = true
		return
	end
	u25[1] = false
	while true do
		if u26 then
		else
			break
		end
		if not u23 then
			if statFolder.Ammo.Value < 1 then
			else
				break
			end
		end
		if not u27 then
		else
			break
		end
		if 0 < statFolder.Ammo.Value then
			reduceAmmo()
			local v151 = TOOL_DATA[statFolder.Tool.Value].recoil / 2
			if isSprinting then
				v151 = v151 + 0.004
			elseif sliding then
				v151 = v151 - 0.003
			end
			if not u25[2] then
				v151 = v151 - 0.004
			end
			if currentStatus ~= "FreeFall" then
				if currentStatus == "Jumping" then
					v151 = v151 + 0.004
				end
			else
				v151 = v151 + 0.004
			end
			if currentStatus == "Standing" then
				v151 = 0.003
			end
			if u29 < u24 + v151 then
				u24 = u29
			else
				u24 = u24 + v151
			end
			onFireNormal(false, TOOL_DATA[statFolder.Tool.Value].damage, TOOL_DATA[statFolder.Tool.Value].range)
			u30 = TOOL_DATA[statFolder.Tool.Value].recoil
			u31 = math.random(-2, 2) * 0.01
			camera.CoordinateFrame = CFrame.new(camera.Focus.p)
				* (camera.CoordinateFrame - camera.CoordinateFrame.p)
				* CFrame.Angles(u30, u31, 0)
				* CFrame.new(0, 0, (camera.CoordinateFrame.p - camera.Focus.p).magnitude)
			camera.FieldOfView = camera.FieldOfView - u30 * 200
			waitTime(1)
			camera.FieldOfView = camera.FieldOfView + u30 * 200
			waitTime(2)
			if not (statFolder.Ammo.Value < 1) then
			else
				break
			end
		else
			normalThrow()
			u26 = false
		end
	end
	u25[1] = true
end
function turret(p40)
	u25[p40] = false
	if p40 == 1 then
		while true do
			if u26 then
			else
				break
			end
			if not u27 then
			else
				break
			end
			if 0 < statFolder.Ammo.Value then
				reduceAmmo()
				local v152 = TOOL_DATA[statFolder.Tool.Value].recoil / 2
				if isSprinting then
					v152 = v152 + 0.004
				elseif sliding then
					v152 = v152 - 0.003
				end
				if not u25[2] then
					v152 = v152 - 0.004
				end
				if currentStatus ~= "FreeFall" then
					if currentStatus == "Jumping" then
						v152 = v152 + 0.004
					end
				else
					v152 = v152 + 0.004
				end
				if currentStatus == "Standing" then
					v152 = 0.003
				end
				if u29 < u24 + v152 then
					u24 = u29
				else
					u24 = u24 + v152
				end
				onFireNormal(false, TOOL_DATA[statFolder.Tool.Value].damage, TOOL_DATA[statFolder.Tool.Value].range)
				u30 = TOOL_DATA[statFolder.Tool.Value].recoil
				u31 = math.random(-2, 2) * 0.01
				camera.CoordinateFrame = CFrame.new(camera.Focus.p)
					* (camera.CoordinateFrame - camera.CoordinateFrame.p)
					* CFrame.Angles(u30, u31, 0)
					* CFrame.new(0, 0, (camera.CoordinateFrame.p - camera.Focus.p).magnitude)
				camera.FieldOfView = camera.FieldOfView - u30 * 200
				waitTime(1)
				camera.FieldOfView = camera.FieldOfView + u30 * 200
				waitTime(3)
				if not (statFolder.Ammo.Value < 1) then
				else
					break
				end
			else
				normalThrow()
				u26 = false
			end
		end
	end
	u25[p40] = true
end
function runTool(p41)
	if u27 then
		if p41 ~= 1 then
			if TOOL_DATA[statFolder.Tool.Value].type ~= "Melee" then
				if not statFolder.Mode.Value then
					return
				end
			else
				return
			end
		else
			return
		end
	end
	if not statFolder.Mode.Value then
		fists(p41)
		return
	end
	if statFolder.Tool.Value == "Light Stick" then
		fists(p41)
		return
	end
	if statFolder.Tool.Value == "Wrench" then
		wrench(p41)
		return
	end
	if statFolder.Tool.Value == "Hammer" then
		hammer(p41)
		return
	end
	if statFolder.Tool.Value == "Mug" then
		normalThrow()
		return
	end
	if statFolder.Tool.Value ~= "Pistol" then
		if statFolder.Tool.Value == "Golden Pistol" then
			pistol(p41)
			return
		end
	else
		pistol(p41)
		return
	end
	if statFolder.Tool.Value == "Machine Pistol" then
		machinePistol(p41)
		return
	end
	if statFolder.Tool.Value ~= "Assault Rifle 1" then
		if statFolder.Tool.Value == "Elite Assault Rifle 1" then
			assaultRifle(p41)
			return
		end
	else
		assaultRifle(p41)
		return
	end
	if statFolder.Tool.Value ~= "Revolver" then
		if statFolder.Tool.Value == "Elite Revolver" then
			revolver(p41)
			return
		end
	else
		revolver(p41)
		return
	end
	if statFolder.Tool.Value == "Shotgun" then
		shotgun(p41)
		return
	end
	if statFolder.Tool.Value ~= "Chaingun" then
		if statFolder.Tool.Value == "Elite Chaingun" then
			chaingun(p41)
			return
		end
	else
		chaingun(p41)
		return
	end
	if statFolder.Tool.Value == "Turret" then
		turret(p41)
	end
end
function onButton1Down()
	if not u26 then
		if u25[1] then
			if u5 then
				if not script.LocalPause.Value then
					u26 = true
					runTool(1)
					u26 = false
				end
			end
		end
	end
end
function onButton2Down()
	if not u23 then
		if u25[2] then
			if u5 then
				if not script.LocalPause.Value then
					u23 = true
					runTool(2)
					u23 = false
				end
			end
		end
	end
end
local u32 = torso["Left Hip"]
local u33 = torso["Right Hip"]
local u34 = nil
local u35 = nil

function crouch()
	if sliding then
		sliding = false
		humanoid.HipHeight = 0
		crouchTrack:Stop()

		humanoidSpeed()

		return
	end

	if isSprinting then
		sprint()
	end

	sliding = true

	humanoid.HipHeight = -1.5
	crouchTrack:Play()

	humanoidSpeed()
end
function sprint()
	if not isSprinting then
		if 0 < statFolder.Power.Value then
			if sliding then
				crouch()
			end
			isSprinting = true
			humanoidSpeed()
			return
		end
	end
	if isSprinting then
		isSprinting = false
		humanoidSpeed()
	end
end
local u36 = -1
local l__TouchedInfo__37 = gameGui.TouchedInfo
local l__AmmoInfo__38 = gameGui.AmmoInfo
--interact function
function interact(obj)
	if not obj then
		return
	end
	if not obj.Parent then
		return
	end

	if gameItems.MasterTools:findFirstChild(obj.Name) then
		if u5 then
			if (head.Position - obj.Position).magnitude < 6 then
				if obj.Parent.Name == "Tool" then
					if statFolder.Tool.Value ~= "None" then
						local cloneTool = gameItems.MasterTools:findFirstChild(statFolder.Tool.Value):clone()
						cloneTool.CanCollide = true
						cloneTool.CFrame = torso.CFrame
						coroutine.resume(coroutine.create(function()
							while true do
								wait(0.09)
								if cloneTool.Velocity.magnitude < 0.1 then
									break
								end
							end
							cloneTool.Anchored = true
						end))
						local v155 = Instance.new("IntValue")
						v155.Value = statFolder.Ammo.Value
						v155.Name = "SpecificAmmo"
						v155.Parent = cloneTool
						cloneTool.Parent = obj.Parent
					end
					if obj:findFirstChild("SpecificAmmo") then
						u36 = obj.SpecificAmmo.Value
					else
						u36 = -1
					end
					if obj.Name == statFolder.Tool.Value then
						statFolder.Mode.Value = false
					end
					statFolder.Tool.Value = obj.Name
					statFolder.Mode.Value = true
					obj:Destroy()
					return
				end
			end
		end
	end

	if obj.Parent.Name == "Ammo" then
		if statFolder.Tool.Value ~= "None" then
			if statFolder.Mode.Value then
				if (head.Position - obj.Position).magnitude < 6 then
					if 0 < obj.Parent.MainPart.Amount.Value then
						if
							statFolder.Ammo.Value
							< TOOL_DATA[statFolder.Tool.Value].ammo
								* statFolder.AmmoBonus.Value
								* (statFolder.Difficulty.Value * 0.5)
						then
							local v156 = TOOL_DATA[statFolder.Tool.Value].ammo
									* statFolder.AmmoBonus.Value
									* (statFolder.Difficulty.Value * 0.5)
								- statFolder.Ammo.Value
							if v156 <= obj.Parent.MainPart.Amount.Value then
								obj.Parent.MainPart.Amount.Value = obj.Parent.MainPart.Amount.Value - v156
								statFolder.Ammo.Value = TOOL_DATA[statFolder.Tool.Value].ammo
									* statFolder.AmmoBonus.Value
									* (statFolder.Difficulty.Value * 0.5)
							else
								statFolder.Ammo.Value = statFolder.Ammo.Value + obj.Parent.MainPart.Amount.Value
								obj.Parent.MainPart.Amount.Value = 0
							end
							playSoundEffect("ElectronicReload", obj)
							obj.Parent.MainPart.SurfaceGui1.Text.Text = tostring(obj.Parent.MainPart.Amount.Value)
							obj.Parent.MainPart.SurfaceGui2.Text.Text = tostring(obj.Parent.MainPart.Amount.Value)
						end
					end
				end
			end
		end
	end
	if obj.Parent.Name == "FirstAid" then
		if (head.Position - obj.Position).magnitude < 6 then
			if 0 < obj.Parent.MainPart.Amount.Value then
				if humanoid.Health < humanoid.MaxHealth then
					local v157 = humanoid.MaxHealth - humanoid.Health
					if v157 <= obj.Parent.MainPart.Amount.Value then
						obj.Parent.MainPart.Amount.Value = obj.Parent.MainPart.Amount.Value - v157
						humanoid.Health = humanoid.MaxHealth
					else
						humanoid.Health = humanoid.Health + obj.Parent.MainPart.Amount.Value
						obj.Parent.MainPart.Amount.Value = 0
					end
					playSoundEffect("HealthPickup", obj)
					obj.Parent.MainPart.SurfaceGui1.Text.Text = tostring(obj.Parent.MainPart.Amount.Value)
					obj.Parent.MainPart.SurfaceGui2.Text.Text = tostring(obj.Parent.MainPart.Amount.Value)
				end
			end
		end
	end
	if (head.Position - obj.Position).magnitude < 6 then
		local targetModel = obj.Parent
		if targetModel.Name ~= "UnlockedSlidingDoor" then
			if targetModel.Name == "UnlockedVent" then
				if targetModel.Closed.Value then
					targetModel.Closed.Value = false
					playSoundEffect("SlideOpen", targetModel.UnlockedSlidingDoor)
					local v159 = 1 - 1
					while true do
						targetModel.UnlockedSlidingDoor.CFrame = obj.CFrame
							- (obj.Parent.ClosedPosition.Position - obj.Parent.OpenPosition.Position) / 12
						waitTime(1)
						if 0 <= 1 then
							if v159 < 12 then
							else
								break
							end
						elseif 12 < v159 then
						else
							break
						end
						v159 = v159 + 1
					end
					waitTime(60)
					playSoundEffect("SlideClosed", targetModel.UnlockedSlidingDoor)
					local v160 = 1 - 1
					while true do
						targetModel.UnlockedSlidingDoor.CFrame = obj.CFrame
							+ (obj.Parent.ClosedPosition.Position - obj.Parent.OpenPosition.Position) / 12
						waitTime(1)
						if 0 <= 1 then
							if v160 < 12 then
							else
								break
							end
						elseif 12 < v160 then
						else
							break
						end
						v160 = v160 + 1
					end
					targetModel.Closed.Value = true
					return
				end
			elseif targetModel.Name == "UnlockedDoubleDoor" then
				if targetModel.Closed.Value then
					targetModel.Closed.Value = false
					playSoundEffect("SlideOpen", targetModel.UnlockedSlidingDoor1)
					playSoundEffect("SlideOpen", targetModel.UnlockedSlidingDoor2)
					local v161 = 1 - 1
					while true do
						targetModel.UnlockedSlidingDoor1.CFrame = targetModel.UnlockedSlidingDoor1.CFrame
							- (targetModel.ClosedPosition1.Position - targetModel.OpenPosition1.Position) / 12
						targetModel.UnlockedSlidingDoor2.CFrame = targetModel.UnlockedSlidingDoor2.CFrame
							- (targetModel.ClosedPosition2.Position - targetModel.OpenPosition2.Position) / 12
						waitTime(1)
						if 0 <= 1 then
							if v161 < 12 then
							else
								break
							end
						elseif 12 < v161 then
						else
							break
						end
						v161 = v161 + 1
					end
					waitTime(60)
					playSoundEffect("SlideClosed", targetModel.UnlockedSlidingDoor1)
					playSoundEffect("SlideClosed", targetModel.UnlockedSlidingDoor2)
					local v162 = 1 - 1
					while true do
						if targetModel then
						else
							break
						end
						if targetModel.Parent then
						else
							break
						end
						if not targetModel:findFirstChild("UnlockedSlidingDoor1") then
							break
						end
						targetModel.UnlockedSlidingDoor1.CFrame = targetModel.UnlockedSlidingDoor1.CFrame
							+ (targetModel.ClosedPosition1.Position - targetModel.OpenPosition1.Position) / 12
						targetModel.UnlockedSlidingDoor2.CFrame = targetModel.UnlockedSlidingDoor2.CFrame
							+ (targetModel.ClosedPosition2.Position - targetModel.OpenPosition2.Position) / 12
						waitTime(1)
						if 0 <= 1 then
							if v162 < 12 then
							else
								targetModel.Closed.Value = true
								return
							end
						elseif 12 < v162 then
						else
							targetModel.Closed.Value = true
							return
						end
						v162 = v162 + 1
					end
					return
				end
			elseif targetModel:findFirstChild("Button") then
				if targetModel.Button:findFirstChild("Busy") then
					if not targetModel.Button.Busy.Value then
						targetModel.Button.Busy.Value = true
						return
					end
				elseif targetModel:findFirstChild("Head") then
					if targetModel:findFirstChild("Humanoid") then
						if targetModel.Head:findFirstChild("Dialogue") then
							if not gameGui.StoryScript.Busy.Value then
								if gameGui.CanPause.Value then
									script.LocalPause.Value = true
									pausePos = Instance.new("BodyPosition")
									pausePos.Name = "PausePos"
									pausePos.position = torso.Position
									pausePos.D = 200
									pausePos.maxForce = Vector3.new(4, 4, 4) * 1000000
									pausePos.P = 10000000
									pausePos.Parent = torso
									if l__TouchedInfo__37.Visible then
										l__TouchedInfo__37.Visible = false
									end
									if l__AmmoInfo__38.Visible then
										l__AmmoInfo__38.Visible = false
									end
									gameGui.Health.Visible = false
									gameGui.Ammo.Visible = false
									gameGui.Power.Visible = false
									gameGui.Reticle.Visible = false
									gameGui.Radar.Visible = false
									gameGui.Interface.Info.PauseText.Visible = false
									gameGui.StoryScript.Current.Value = targetModel.Head.Dialogue
									while true do
										wait()
										if gameGui.StoryScript.Busy.Value then
										else
											break
										end
									end
									gameGui.Health.Visible = true
									gameGui.Ammo.Visible = true
									gameGui.Power.Visible = true
									gameGui.Reticle.Visible = true
									gameGui.Radar.Visible = true
									pausePos:Destroy()
									script.LocalPause.Value = false
									gameGui.Interface.Info.PauseText.Visible = true
								end
							end
						end
					end
				end
			elseif targetModel:findFirstChild("Head") then
				if targetModel:findFirstChild("Humanoid") then
					if targetModel.Head:findFirstChild("Dialogue") then
						if not gameGui.StoryScript.Busy.Value then
							if gameGui.CanPause.Value then
								script.LocalPause.Value = true
								pausePos = Instance.new("BodyPosition")
								pausePos.Name = "PausePos"
								pausePos.position = torso.Position
								pausePos.D = 200
								pausePos.maxForce = Vector3.new(4, 4, 4) * 1000000
								pausePos.P = 10000000
								pausePos.Parent = torso
								if l__TouchedInfo__37.Visible then
									l__TouchedInfo__37.Visible = false
								end
								if l__AmmoInfo__38.Visible then
									l__AmmoInfo__38.Visible = false
								end
								gameGui.Health.Visible = false
								gameGui.Ammo.Visible = false
								gameGui.Power.Visible = false
								gameGui.Reticle.Visible = false
								gameGui.Radar.Visible = false
								gameGui.Interface.Info.PauseText.Visible = false
								gameGui.StoryScript.Current.Value = targetModel.Head.Dialogue
								while true do
									wait()
									if gameGui.StoryScript.Busy.Value then
									else
										break
									end
								end
								gameGui.Health.Visible = true
								gameGui.Ammo.Visible = true
								gameGui.Power.Visible = true
								gameGui.Reticle.Visible = true
								gameGui.Radar.Visible = true
								pausePos:Destroy()
								script.LocalPause.Value = false
								gameGui.Interface.Info.PauseText.Visible = true
							end
						end
					end
				end
			end
		elseif targetModel.Closed.Value then
			targetModel.Closed.Value = false
			playSoundEffect("SlideOpen", targetModel.UnlockedSlidingDoor)
			local v159 = 1 - 1
			while true do
				targetModel.UnlockedSlidingDoor.CFrame = obj.CFrame
					- (obj.Parent.ClosedPosition.Position - obj.Parent.OpenPosition.Position) / 12
				waitTime(1)
				if 0 <= 1 then
					if v159 < 12 then
					else
						break
					end
				elseif 12 < v159 then
				else
					break
				end
				v159 = v159 + 1
			end
			waitTime(60)
			playSoundEffect("SlideClosed", targetModel.UnlockedSlidingDoor)
			local v160 = 1 - 1
			while true do
				targetModel.UnlockedSlidingDoor.CFrame = obj.CFrame
					+ (obj.Parent.ClosedPosition.Position - obj.Parent.OpenPosition.Position) / 12
				waitTime(1)
				if 0 <= 1 then
					if v160 < 12 then
					else
						break
					end
				elseif 12 < v160 then
				else
					break
				end
				v160 = v160 + 1
			end
			targetModel.Closed.Value = true
			return
		end
	end
end

UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then
		return
	end

	if input.KeyCode == Enum.KeyCode.P then
		if not gameGui.GamePause.Value and gameGui.CanPause.Value then
			gameGui.GamePause.Value = true
		else
			gameGui.GamePause.Value = false
		end
		return
	end

	if script.LocalPause.Value then
		return
	end

	if input.KeyCode == Enum.KeyCode.E then
		interact(mouse.Target)
		return
	end

	if (input.KeyCode == Enum.KeyCode.Z) or (input.KeyCode == Enum.KeyCode.Four) then
		onButton2Down()
		return
	end

	if input.KeyCode == Enum.KeyCode.C then
		crouch()
		return
	end

	if (input.KeyCode == Enum.KeyCode.LeftShift) or (input.KeyCode == Enum.KeyCode.X) then
		sprint()
		return
	end

	if input.KeyCode == Enum.KeyCode.H and statFolder.Tool.Value ~= "None" and statFolder.Mode.Value then
		normalThrow()
		return
	end

	if (input.KeyCode == Enum.KeyCode.Q or input.KeyCode == Enum.KeyCode.F) and u5 and script.LocalCanSwitch.Value then
		statFolder.Mode.Value = not statFolder.Mode.Value
		return
	end

	if (input.KeyCode == Enum.KeyCode.J) and RunService:IsStudio() then
		statFolder.Checkpoint.Value = statFolder.Checkpoint.Value - 1
		return
	end

	if (input.KeyCode == Enum.KeyCode.K) and RunService:IsStudio() then
		statFolder.Checkpoint.Value = statFolder.Checkpoint.Value + 1
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		onButton1Down()
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		onButton2Down()
		return
	end

	--if p43 == "l" and (player.Name == "Venvious" or player.Name == "Devenvious" or game.Players.LocalPlayer.userId == -1) then
	--	statFolder.LoadingZone.Value = 0;
	--	statFolder.Checkpoint.Value = 1;
	--	if statFolder.Level.Value >= 3 then
	--		statFolder.Level.Value = 0;
	--		return;
	--	end;
	--	statFolder.Level.Value = statFolder.Level.Value + 1;
	--end;
end)

UserInputService.InputEnded:Connect(function(input, gpe)
	if gpe then
		return
	end

	if (input.KeyCode == Enum.KeyCode.Z) or (input.KeyCode == Enum.KeyCode.Four) then
		u23 = false
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		u26 = false
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		u23 = false
		return
	end
end)

function updateMode()
	if not isSprinting then
		if not sliding then
			if currentStatus ~= "Standing" then
				currentStatus = "Walking"
				return
			end
		end
	end
	if isSprinting then
		if currentStatus ~= "Standing" then
			currentStatus = "Running"
			return
		end
	end
	if sliding then
		if currentStatus ~= "Standing" then
			currentStatus = "Walking"
			return
		end
	end
	currentStatus = "Standing"
end
humanoid.Jumping:connect(function()
	if script.LocalPause.Value then
		torso.Velocity = Vector3.new(0, 0, 0)
		return
	end
	currentStatus = "Jumping"
	local v163, v164 = game.Workspace:findPartOnRay(Ray.new(head.Position, (Vector3.new(0, 200, 0))), char)
	local v165 = v164.y
	if statFolder.JumpHeight.Value < v165 then
		v165 = statFolder.JumpHeight.Value
	end
	local l__unit__166 = (mouse.Hit.p - head.Position).unit
	local v167 = Instance.new("BodyPosition")
	v167.Name = "JumpBodyPosition"
	v167.maxForce = Vector3.new(4, 4, 4) * 10000
	v167.D = 250
	v167.P = 2000
	v167.position = Vector3.new(
		torso.Position.x + l__unit__166.x * (v165 / 3),
		torso.Position.y + v165 - 7,
		torso.Position.z + l__unit__166.z * (v165 / 3)
	)
	v167.Parent = torso
	waitTime(7)
	v167:Destroy()
end)
function onRunning(p45)
	if 0 < p45 then
		currentStatus = "Running"
		return
	end
	currentStatus = "Standing"
end
local u39 = false
local u40 = true
function onFalling(p46)
	currentStatus = "FreeFall"
	u39 = p46
	if u39 then
		if u40 then
			u40 = false
			local v168 = 0
			while true do
				if u39 then
				else
					break
				end
				local v169 = math.abs(torso.Position.y)
				if v168 < v169 then
					v168 = v169
				end
				waitTime(2)
			end
			local v170 = v168 - torso.Position.y - 16
			if 0 < v170 then
				if not char:findFirstChild("ForceField") then
					local v171 = math.floor(v170 * (humanoid.MaxHealth / 32))
					if v171 < 500 then
						humanoid:TakeDamage(v171)
					end
				end
			end
			u40 = true
		end
	end
end
humanoid.Running:connect(onRunning)
humanoid.Swimming:connect(onRunning)
humanoid.FreeFalling:connect(onFalling)
humanoid.Climbing:connect(function()
	currentStatus = "Climbing"
end)
humanoid.GettingUp:connect(function()
	currentStatus = "GettingUp"
end)
humanoid.FallingDown:connect(function()
	currentStatus = "FallingDown"
end)
humanoid.Seated:connect(function()
	currentStatus = "Seated"
end)
humanoid.PlatformStanding:connect(function()
	currentStatus = "PlatformStanding"
end)
function moveJump()
	u33.MaxVelocity = 0.75
	u32.MaxVelocity = 0.75
	u33:SetDesiredAngle(0)
	u32:SetDesiredAngle(0)
end
function moveSit()
	u33.MaxVelocity = 0.15
	u32.MaxVelocity = 0.15
	u33:SetDesiredAngle(1.57)
	u32:SetDesiredAngle(1.57)
end
local u41 = true
local u42 = 0
local u43 = 4
function move(p47)
	updateMode()

	local v172 = 0
	local v173 = 0

	if currentStatus == "Standing" then
		if u41 then
			u42 = u42 + 2
			camera.CoordinateFrame = camera.CoordinateFrame * CFrame.new(0, 0.0002, 0)
		else
			u42 = u42 - 2
			camera.CoordinateFrame = camera.CoordinateFrame * CFrame.new(0, -0.0002, 0)
		end
		if 28 < u42 then
			u41 = false
		elseif u42 < -28 then
			u41 = true
		end
	end
	if isSprinting then
		if 0 < statFolder.Power.Value then
			if currentStatus ~= "Standing" then
				statFolder.Power.Value = statFolder.Power.Value - 1
			else
				sprint()
			end
		else
			sprint()
		end
	elseif not isSprinting then
		if statFolder.Power.Value < statFolder.PowerMax.Value then
			if u43 <= 0 then
				u43 = 4
				statFolder.Power.Value = statFolder.Power.Value + 1
			end
		end
	end
	u43 = u43 - 1
	if currentStatus ~= "Jumping" then
		if currentStatus == "FreeFall" then
			moveJump()
			return
		end
	else
		moveJump()
		return
	end
	if currentStatus == "Seated" then
		moveSit()
		return
	end
	if currentStatus == "Running" then
		if not (1.5 < u33.CurrentAngle) then
			if u33.CurrentAngle < -1.5 then
				u33.MaxVelocity = 0.75
			else
				u33.MaxVelocity = 0.15
			end
		else
			u33.MaxVelocity = 0.75
		end
		if not (1.5 < u32.CurrentAngle) then
			if u32.CurrentAngle < -1.5 then
				u32.MaxVelocity = 0.75
			else
				u32.MaxVelocity = 0.15
			end
		else
			u32.MaxVelocity = 0.75
		end
		v172 = 1
		v173 = 9
	elseif currentStatus == "Walking" then
		if not (1.5 < u33.CurrentAngle) then
			if u33.CurrentAngle < -1.5 then
				u33.MaxVelocity = 0.75
			else
				u33.MaxVelocity = 0.1
			end
		else
			u33.MaxVelocity = 0.75
		end
		if not (1.5 < u32.CurrentAngle) then
			if u32.CurrentAngle < -1.5 then
				u32.MaxVelocity = 0.75
			else
				u32.MaxVelocity = 0.1
			end
		else
			u32.MaxVelocity = 0.75
		end
		v172 = 0.8
		v173 = 12
	elseif currentStatus == "Climbing" then
		u33.MaxVelocity = 0.5
		u33.MaxVelocity = 0.5
		v172 = 1
		v173 = 9
	else
		v172 = 0.1
		v173 = 1
	end

	local v174 = v172 * math.sin(p47 * v173)
	u33:SetDesiredAngle(-v174)
	u32:SetDesiredAngle(-v174)
end
local l__Ammo__44 = gameGui.Ammo
function getCurrentTool()
	u5 = false
	u26 = false
	u23 = false

	while true do
		waitTime(1)
		if u25[1] then
			if not u25[2] then
			else
				break
			end
		end
	end

	local v175 = math.floor(camera.FieldOfView)
	if v175 ~= 70 then
		local v176 = 1 - 1
		while true do
			camera.FieldOfView = v175 + v176 * ((70 - v175) / 4)
			waitTime(1)
			if 0 <= 1 then
				if v176 < 4 then
				else
					break
				end
			elseif 4 < v176 then
			else
				break
			end
			v176 = v176 + 1
		end
		camera.FieldOfView = 70
	end
	if not u6 then
		u7 = u8
		u9 = CFrame.new(1.29, 0, 0.34) * CFrame.Angles(-0.52, 0, -0.17)
		u10 = u11
		u12 = CFrame.new(-1.29, 0, 0.34) * CFrame.Angles(-0.52, 0, 0.17)
		u13 = 6
		local v177, v178 = CFrameInterpolator(u7, u9)
		local v179, v180 = CFrameInterpolator(u10, u12)
		local v181 = 1 - 1
		while true do
			u8 = v178(v181 / u13)
			u11 = v180(v181 / u13)
			waitTime(1)
			if 0 <= 1 then
				if v181 < u13 then
				else
					break
				end
			elseif u13 < v181 then
			else
				break
			end
			v181 = v181 + 1
		end
	end
	if u16 then
		u16:Destroy()
	end
	if u14 then
		u14:Destroy()
	end
	if statFolder.Mode.Value then
		if statFolder.Tool.Value ~= "None" then
			u20 = TOOL_DATA[statFolder.Tool.Value].reticle
			statFolder.Spread.Value = TOOL_DATA[statFolder.Tool.Value].spread
			u24 = statFolder.Spread.Value
			u29 = statFolder.Spread.Value * (4 - statFolder.Spread.Value * 10)
			if u36 ~= -1 then
				statFolder.Ammo.Value = u36
			else
				statFolder.Ammo.Value = TOOL_DATA[statFolder.Tool.Value].ammo
					* statFolder.AmmoBonus.Value
					* (statFolder.Difficulty.Value * 0.5)
			end
			if statFolder.Tool.Value == "Elite Chaingun" then
				l__Ammo__44.AmmoText.Text = "Unlimited"
			else
				l__Ammo__44.AmmoText.Text = "" .. statFolder.Ammo.Value
			end
			l__Ammo__44.AmmoText.Visible = true
			if statFolder.Tool.Value == "Golden Pistol" then
				if not statFolder.BadgeGoldenGun.Value then
					statFolder.BadgeGoldenGun.Value = true
				end
			end
			u21 = TOOL_DATA[statFolder.Tool.Value].weldLA
			u22 = TOOL_DATA[statFolder.Tool.Value].weldRA
			u8 = u21
			u11 = u22
			u16 = gameItems.MasterTools[statFolder.Tool.Value]:clone()
			u14 = Instance.new("Weld")
			u14.Part0 = arms[2]
			u14.Parent = arms[2]
			u14.Part1 = u16
			u14.C1 = TOOL_DATA[statFolder.Tool.Value].weldTool
			u16.Parent = v18
			playSoundEffect("SwitchWeapon", u16)
			u7 = u8
			u10 = u11
			u13 = 6
			local v182, v183 = CFrameInterpolator(u9, u7)
			local v184, v185 = CFrameInterpolator(u12, u10)
			local v186 = 1 - 1
			while true do
				u8 = v183(v186 / u13)
				u11 = v185(v186 / u13)
				waitTime(1)
				if 0 <= 1 then
					if v186 < u13 then
					else
						break
					end
				elseif u13 < v186 then
				else
					break
				end
				v186 = v186 + 1
			end
		else
			u20 = "NoTool"
			statFolder.Spread.Value = 0
			u24 = statFolder.Spread.Value
			u29 = statFolder.Spread.Value * 4
			l__Ammo__44.AmmoText.Text = ""
			l__Ammo__44.AmmoText.Visible = false
			u21 = TOOL_DATA[statFolder.Tool.Value].weldLA
			u22 = TOOL_DATA[statFolder.Tool.Value].weldRA
			u8 = u21
			u11 = u22
			if not u6 then
				u7 = u8
				u10 = u11
				u13 = 6
				local v187, v188 = CFrameInterpolator(u9, u7)
				local v189, v190 = CFrameInterpolator(u12, u10)
				local v191 = 1 - 1
				while true do
					u8 = v188(v191 / u13)
					u11 = v190(v191 / u13)
					waitTime(1)
					if 0 <= 1 then
						if v191 < u13 then
						else
							break
						end
					elseif u13 < v191 then
					else
						break
					end
					v191 = v191 + 1
				end
			end
		end
	else
		u20 = "NoTool"
		statFolder.Spread.Value = 0
		u24 = statFolder.Spread.Value
		u29 = statFolder.Spread.Value * 4
		l__Ammo__44.AmmoText.Text = ""
		l__Ammo__44.AmmoText.Visible = false
		u21 = v12
		u22 = v13
		u8 = u21
		u11 = u22
		if statFolder.Tool.Value ~= "None" then
			u36 = statFolder.Ammo.Value
		end
		if not u6 then
			u7 = u8
			u10 = u11
			u13 = 6
			local v192, v193 = CFrameInterpolator(u9, u7)
			local v194, v195 = CFrameInterpolator(u12, u10)
			local v196 = 1 - 1
			while true do
				u8 = v193(v196 / u13)
				u11 = v195(v196 / u13)
				waitTime(1)
				if 0 <= 1 then
					if v196 < u13 then
					else
						break
					end
				elseif u13 < v196 then
				else
					break
				end
				v196 = v196 + 1
			end
		end
	end
	u6 = false
	local v197 = l__Reticle__19:getChildren()

	for _, item in v197 do
		if item.Name == u20 then
			item.Visible = true
		else
			item.Visible = false
		end
	end
	u5 = true
end
local u45 = false
function runGettingTool()
	if u45 then
		return
	end
	u45 = true
	getCurrentTool()

	waitTime(1)

	u45 = false
end
statFolder.Tool.Changed:connect(function()
	if statFolder.Mode.Value then
		runGettingTool()
		return
	end
	statFolder.Mode.Value = true
end)
statFolder.Mode.Changed:connect(function()
	runGettingTool()
end)
statFolder.Ammo.Changed:connect(function()
	if statFolder.Tool.Value == "None" then
		l__Ammo__44.AmmoText.Text = ""
		return
	end
	if statFolder.Tool.Value == "Elite Chaingun" then
		l__Ammo__44.AmmoText.Text = "Unlimited"
		return
	end
	l__Ammo__44.AmmoText.Text = "" .. statFolder.Ammo.Value
end)
local l__Power__46 = gameGui.Power
statFolder.Power.Changed:connect(function()
	l__Power__46.Position = UDim2.new(0, 0, 1 - statFolder.Power.Value / statFolder.PowerMax.Value, 0)
end)
local u47 = 0.07
local u48 = 0
local u49 = true
local u50 = 0.005
function getTransition()
	if u47 == 0 then
		if math.abs(u48) < 0.005 then
			return
		end
	end
	if u49 then
		u48 = u48 + u50
		if u47 < u48 then
		else
			return
		end
	else
		u48 = u48 - u50
		if u48 < -u47 then
			u49 = not u49
		end
		return
	end
	u49 = not u49
end
local l__InRange__51 = gameGui.InRange
function mouseTarget()
	local target = mouse.Target
	if target then
		if target.Parent then
			if not target.CanCollide then
				if target.Name ~= "Button" then
					if not target.Parent:findFirstChild("MainControlNPC") then
						if not target.Parent.Parent:findFirstChild("MainControlNPC") then
							mouse.TargetFilter = target
							return
						end
					end
				end
			end
			l__InRange__51.Visible = false
			l__TouchedInfo__37.Visible = false
			local v201 = target.Parent:findFirstChild("Humanoid")
				or (
					target.Parent.Parent:findFirstChild("Humanoid")
					or target.Parent.Parent.Parent:findFirstChild("Humanoid")
				)
			u27 = false
			if v201 then
				if v201.Parent:findFirstChild("MainControlNPC") then
					if 0 < v201.Health then
						if v201.Parent:findFirstChild("Head") then
							if not v201.Parent:findFirstChild("ForceField") then
								if statFolder.Tool.Value ~= "None" then
									if
										(mouse.Hit.p - u16.Position).magnitude <= TOOL_DATA[statFolder.Tool.Value].range
									then
										l__InRange__51.Visible = true
									end
								end
							elseif not v201.Parent:findFirstChild("MainControlNPC") then
								if v201.Parent:findFirstChild("Head") then
									if v201.Parent:findFirstChild("MainControlVRT") then
										if 0 < v201.Health then
											if (v201.Parent.Head.Position - head.Position).magnitude < 24 then
												u27 = true
											end
										end
									elseif (v201.Parent.Head.Position - head.Position).magnitude < 24 then
										u27 = true
									end
								end
							end
						elseif not v201.Parent:findFirstChild("MainControlNPC") then
							if v201.Parent:findFirstChild("Head") then
								if v201.Parent:findFirstChild("MainControlVRT") then
									if 0 < v201.Health then
										if (v201.Parent.Head.Position - head.Position).magnitude < 24 then
											u27 = true
										end
									end
								elseif (v201.Parent.Head.Position - head.Position).magnitude < 24 then
									u27 = true
								end
							end
						end
					elseif not v201.Parent:findFirstChild("MainControlNPC") then
						if v201.Parent:findFirstChild("Head") then
							if v201.Parent:findFirstChild("MainControlVRT") then
								if 0 < v201.Health then
									if (v201.Parent.Head.Position - head.Position).magnitude < 24 then
										u27 = true
									end
								end
							elseif (v201.Parent.Head.Position - head.Position).magnitude < 24 then
								u27 = true
							end
						end
					end
				elseif not v201.Parent:findFirstChild("MainControlNPC") then
					if v201.Parent:findFirstChild("Head") then
						if v201.Parent:findFirstChild("MainControlVRT") then
							if 0 < v201.Health then
								if (v201.Parent.Head.Position - head.Position).magnitude < 24 then
									u27 = true
								end
							end
						elseif (v201.Parent.Head.Position - head.Position).magnitude < 24 then
							u27 = true
						end
					end
				end
			end
			if (head.Position - target.Position).magnitude < 32 then
				if v201 then
					if v201.Parent:findFirstChild("Head") then
						if v201.Parent:findFirstChild("Stats") then
							if v201.Parent.Stats:findFirstChild("Invisible") then
								if v201.Parent.Stats.Invisible.Value then
									return
								end
							end
						end
						if v201.Parent.Head:findFirstChild("Dialogue") then
							l__TouchedInfo__37.Text01.Text = "" .. v201.Parent.Head.Dialogue.Value
							if (head.Position - target.Position).magnitude < 6 then
								if not string.match(v201.Parent.Head.Dialogue.Value, "Journal") then
									if not string.match(v201.Parent.Head.Dialogue.Value, "Plan") then
										if not string.match(v201.Parent.Head.Dialogue.Value, "Note") then
											if not string.match(v201.Parent.Head.Dialogue.Value, "Scribbles") then
												if not string.match(v201.Parent.Head.Dialogue.Value, "Reminder") then
													if string.match(v201.Parent.Head.Dialogue.Value, "News") then
														l__TouchedInfo__37.Text02.Text = "'E' Read"
													elseif string.match(v201.Parent.Head.Dialogue.Value, "Choice") then
														l__TouchedInfo__37.Text02.Text = "'E' Examine"
													elseif v201.Parent.Head.Dialogue.Value == "Secret Conversation" then
														l__TouchedInfo__37.Text02.Text = "'E' Listen"
													else
														l__TouchedInfo__37.Text02.Text = "'E' Talk"
													end
												else
													l__TouchedInfo__37.Text02.Text = "'E' Read"
												end
											else
												l__TouchedInfo__37.Text02.Text = "'E' Read"
											end
										else
											l__TouchedInfo__37.Text02.Text = "'E' Read"
										end
									else
										l__TouchedInfo__37.Text02.Text = "'E' Read"
									end
								else
									l__TouchedInfo__37.Text02.Text = "'E' Read"
								end
							else
								l__TouchedInfo__37.Text02.Text = ""
							end
						else
							if v201.Parent:findFirstChild("Torso") then
							else
								return
							end
							l__TouchedInfo__37.Text01.Text = "" .. v201.Parent.Name
							if v201.Parent:findFirstChild("MainControlNPC") then
								if 0 < v201.Health then
									l__TouchedInfo__37.Text02.Text = "Threat"
								else
									l__TouchedInfo__37.Text02.Text = "Non-Threat"
								end
							else
								l__TouchedInfo__37.Text02.Text = "Non-Threat"
							end
						end
						l__TouchedInfo__37.Visible = true
					end
				end
				if (head.Position - target.Position).magnitude < 6 then
					if gameItems.MasterTools:findFirstChild(target.Name) then
						if target.Parent.Name == "Tool" then
							if target.Anchored then
								l__TouchedInfo__37.Text01.Text = target.Name
								l__TouchedInfo__37.Text02.Text = "'E' Pick Up"
								l__TouchedInfo__37.Visible = true
								return
							end
						end
					end
					if target.Parent.Name == "Ammo" then
						l__TouchedInfo__37.Text01.Text = "Ammo Crate"
						if statFolder.Tool.Value == "None" then
							l__TouchedInfo__37.Text02.Text = "No Weapon"
						elseif
							statFolder.Ammo.Value
							== TOOL_DATA[statFolder.Tool.Value].ammo
								* statFolder.AmmoBonus.Value
								* (statFolder.Difficulty.Value * 0.5)
						then
							l__TouchedInfo__37.Text02.Text = "Weapon Full"
						elseif target.Parent.MainPart.Amount.Value <= 0 then
							l__TouchedInfo__37.Text02.Text = "Crate Empty"
						elseif not statFolder.Mode.Value then
							l__TouchedInfo__37.Text02.Text = "'Q' Switch Mode"
						else
							l__TouchedInfo__37.Text02.Text = "'E' Get Ammo"
						end
						l__TouchedInfo__37.Visible = true
						return
					end
					if target.Parent.Name == "FirstAid" then
						l__TouchedInfo__37.Text01.Text = "First Aid Kit"
						if target.Parent.MainPart.Amount.Value <= 0 then
							l__TouchedInfo__37.Text02.Text = "Kit Empty"
						elseif humanoid.Health < humanoid.MaxHealth then
							l__TouchedInfo__37.Text02.Text = "'E' Heal"
						else
							l__TouchedInfo__37.Text02.Text = "Health Full"
						end
						l__TouchedInfo__37.Visible = true
						return
					end
					if target.Name ~= "UnlockedSlidingDoor" then
						if target.Name ~= "UnlockedSlidingDoor1" then
							if target.Name == "UnlockedSlidingDoor2" then
								if target.Parent.Name ~= "nUnlockedSlidingDoor" then
									if target.Parent.Name ~= "nUnlockedDoubleDoor" then
										if target.Parent.Name ~= "nUnlockedVent" then
											if target.Parent:findFirstChild("Closed") then
												if target.Parent.Closed.Value then
													if target.Parent.Name == "UnlockedVent" then
														l__TouchedInfo__37.Text01.Text = "Unlocked Vent"
													else
														l__TouchedInfo__37.Text01.Text = "Unlocked Door"
													end
													l__TouchedInfo__37.Text02.Text = "'E' Open"
													l__TouchedInfo__37.Visible = true
													return
												end
											end
										elseif target.Name == "Button" then
											if target:findFirstChild("Busy") then
												if not target.Busy.Value then
													l__TouchedInfo__37.Text01.Text = "Button"
													l__TouchedInfo__37.Text02.Text = "'E' Press"
													l__TouchedInfo__37.Visible = true
													return
												end
											end
										end
									elseif target.Name == "Button" then
										if target:findFirstChild("Busy") then
											if not target.Busy.Value then
												l__TouchedInfo__37.Text01.Text = "Button"
												l__TouchedInfo__37.Text02.Text = "'E' Press"
												l__TouchedInfo__37.Visible = true
												return
											end
										end
									end
								elseif target.Name == "Button" then
									if target:findFirstChild("Busy") then
										if not target.Busy.Value then
											l__TouchedInfo__37.Text01.Text = "Button"
											l__TouchedInfo__37.Text02.Text = "'E' Press"
											l__TouchedInfo__37.Visible = true
											return
										end
									end
								end
							elseif target.Name == "Button" then
								if target:findFirstChild("Busy") then
									if not target.Busy.Value then
										l__TouchedInfo__37.Text01.Text = "Button"
										l__TouchedInfo__37.Text02.Text = "'E' Press"
										l__TouchedInfo__37.Visible = true
										return
									end
								end
							end
						elseif target.Parent.Name ~= "nUnlockedSlidingDoor" then
							if target.Parent.Name ~= "nUnlockedDoubleDoor" then
								if target.Parent.Name ~= "nUnlockedVent" then
									if target.Parent:findFirstChild("Closed") then
										if target.Parent.Closed.Value then
											if target.Parent.Name == "UnlockedVent" then
												l__TouchedInfo__37.Text01.Text = "Unlocked Vent"
											else
												l__TouchedInfo__37.Text01.Text = "Unlocked Door"
											end
											l__TouchedInfo__37.Text02.Text = "'E' Open"
											l__TouchedInfo__37.Visible = true
											return
										end
									end
								elseif target.Name == "Button" then
									if target:findFirstChild("Busy") then
										if not target.Busy.Value then
											l__TouchedInfo__37.Text01.Text = "Button"
											l__TouchedInfo__37.Text02.Text = "'E' Press"
											l__TouchedInfo__37.Visible = true
											return
										end
									end
								end
							elseif target.Name == "Button" then
								if target:findFirstChild("Busy") then
									if not target.Busy.Value then
										l__TouchedInfo__37.Text01.Text = "Button"
										l__TouchedInfo__37.Text02.Text = "'E' Press"
										l__TouchedInfo__37.Visible = true
										return
									end
								end
							end
						elseif target.Name == "Button" then
							if target:findFirstChild("Busy") then
								if not target.Busy.Value then
									l__TouchedInfo__37.Text01.Text = "Button"
									l__TouchedInfo__37.Text02.Text = "'E' Press"
									l__TouchedInfo__37.Visible = true
									return
								end
							end
						end
					elseif target.Parent.Name ~= "nUnlockedSlidingDoor" then
						if target.Parent.Name ~= "nUnlockedDoubleDoor" then
							if target.Parent.Name ~= "nUnlockedVent" then
								if target.Parent:findFirstChild("Closed") then
									if target.Parent.Closed.Value then
										if target.Parent.Name == "UnlockedVent" then
											l__TouchedInfo__37.Text01.Text = "Unlocked Vent"
										else
											l__TouchedInfo__37.Text01.Text = "Unlocked Door"
										end
										l__TouchedInfo__37.Text02.Text = "'E' Open"
										l__TouchedInfo__37.Visible = true
										return
									end
								end
							elseif target.Name == "Button" then
								if target:findFirstChild("Busy") then
									if not target.Busy.Value then
										l__TouchedInfo__37.Text01.Text = "Button"
										l__TouchedInfo__37.Text02.Text = "'E' Press"
										l__TouchedInfo__37.Visible = true
										return
									end
								end
							end
						elseif target.Name == "Button" then
							if target:findFirstChild("Busy") then
								if not target.Busy.Value then
									l__TouchedInfo__37.Text01.Text = "Button"
									l__TouchedInfo__37.Text02.Text = "'E' Press"
									l__TouchedInfo__37.Visible = true
									return
								end
							end
						end
					elseif target.Name == "Button" then
						if target:findFirstChild("Busy") then
							if not target.Busy.Value then
								l__TouchedInfo__37.Text01.Text = "Button"
								l__TouchedInfo__37.Text02.Text = "'E' Press"
								l__TouchedInfo__37.Visible = true
								return
							end
						end
					end
				end
			end
		else
			l__TouchedInfo__37.Visible = false
			l__InRange__51.Visible = false
			u27 = false
		end
	else
		l__TouchedInfo__37.Visible = false
		l__InRange__51.Visible = false
		u27 = false
	end
end
function mouseReticle()
	--local l__Y__202 = l__Reticle__19.Parent.AbsoluteSize.Y;
	--l__Reticle__19.Position = UDim2.new(0.5, (1 - u24 * l__Y__202 - 20) / 2, 0.5, (1 - u24 * l__Y__202 - 20) / 2);
	--l__Reticle__19.Size = UDim2.new(0, u24 * l__Y__202 + 20, 0, u24 * l__Y__202 + 20);
	--if not u26 then
	--	if statFolder.Spread.Value < u24 then
	--		u24 = u24 - 0.01;
	--		if u24 < statFolder.Spread.Value then
	--			u24 = statFolder.Spread.Value;
	--		end;
	--	end;
	--end;
	--local v203 = l__Reticle__19:GetChildren();

	--for _,item in v203 do
	--	if u27 then
	--		for _,item2 in item:GetChildren() do
	--			if item2.BackGroundTransparency < 0.6 then
	--				for _,item3 in
	--			end
	--		end
	--	end
	--end

	--local v204 = #v203;
	--local v205 = 1 - 1;
	--while true do
	--	local v206 = v203[v205]:getChildren();
	--	if u27 then
	--		if v206[1].BackgroundTransparency < 0.6 then
	--			local v207 = #v206;
	--			local v208 = 1 - 1;
	--			while true do
	--				v206[v208].BackgroundTransparency = 0.8;
	--				if 0 <= 1 then
	--					if v208 < v207 then

	--					else
	--						break;
	--					end;
	--				elseif v207 < v208 then

	--				else
	--					break;
	--				end;
	--				v208 = v208 + 1;
	--			end;
	--		elseif not u27 then
	--			if 0 < v206[1].BackgroundTransparency then
	--				local v209 = #v206;
	--				local v210 = 1 - 1;
	--				while true do
	--					v206[v210].BackgroundTransparency = 0;
	--					if 0 <= 1 then
	--						if v210 < v209 then

	--						else
	--							break;
	--						end;
	--					elseif v209 < v210 then

	--					else
	--						break;
	--					end;
	--					v210 = v210 + 1;
	--				end;
	--			end;
	--		end;
	--	elseif not u27 then
	--		if 0 < v206[1].BackgroundTransparency then
	--			v209 = #v206;
	--			v210 = 1 - 1;
	--			while true do
	--				v206[v210].BackgroundTransparency = 0;
	--				if 0 <= 1 then
	--					if v210 < v209 then

	--					else
	--						break;
	--					end;
	--				elseif v209 < v210 then

	--				else
	--					break;
	--				end;
	--				v210 = v210 + 1;
	--			end;
	--		end;
	--	end;
	--	if 0 <= 1 then
	--		if v205 < v204 then

	--		else
	--			break;
	--		end;
	--	elseif v204 < v205 then

	--	else
	--		break;
	--	end;
	--	v205 = v205 + 1;
	--end;
	--l__AmmoInfo__38.Visible = false;
	--if tools[statFolder.Tool.Value].type == "Ranged" then
	--	if statFolder.Mode.Value then
	--		if statFolder.Ammo.Value == 0 then
	--			l__AmmoInfo__38.Text01.Text = "No Ammo!";
	--			l__AmmoInfo__38.Text02.Text = "'Q' Switch Mode";
	--			l__AmmoInfo__38.Visible = true;
	--			return;
	--		end;
	--		if statFolder.Ammo.Value / tools[statFolder.Tool.Value].ammo < 0.2 then
	--			l__AmmoInfo__38.Text01.Text = "Ammo Low!";
	--			l__AmmoInfo__38.Text02.Text = "Remaining: " .. statFolder.Ammo.Value;
	--			l__AmmoInfo__38.Visible = true;
	--		end;
	--	end;
	--end;
end
function updateAnimationSpeed()
	u50 = 0.005

	if currentStatus ~= "Standing" then
		u47 = 0.03
		if currentStatus == "Running" then
			u47 = u47 * 5
			u50 = u50 * 4
		end
	else
		u47 = 0
	end

	getTransition()
end

local u52 = 0
local l__Neck__53 = torso.Neck
function updateAim()
	local v211 = camera.CoordinateFrame.lookVector + head.Position
	local l__Position__212 = head.Position
	local v213 = math.asin((l__Position__212 - v211).unit.y) / (l__Position__212 - v211).magnitude
	if u27 then
		if statFolder.Tool.Value == "None" then
			if not statFolder.Mode.Value then
				if v213 + 0.3 < u52 + 0.04 then
					v213 = v213 + 0.3
				elseif 1 < u52 + 0.04 then
					v213 = 1
				else
					v213 = u52 + 0.04
				end
			end
		elseif v213 + 0.3 < u52 + 0.04 then
			v213 = v213 + 0.3
		elseif 1 < u52 + 0.04 then
			v213 = 1
		else
			v213 = u52 + 0.04
		end
	end
	u52 = v213
	l__Neck__53.C0 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0) * CFrame.Angles(v213, 0, 0)
	if arms then
		v32.C1 = u8 * CFrame.new(u48, math.abs(v213), -v213) * CFrame.Angles(v213, u48 / 5, u48 / 4)
		v33.C1 = u11 * CFrame.new(u48, math.abs(v213), -v213) * CFrame.Angles(v213, u48 / 5, u48 / 4)
	end
end
function humanoidSpeed()
	if script.LocalPause.Value then
		humanoid.WalkSpeed = 0
		return
	end
	if sliding then
		humanoid.WalkSpeed = statFolder.WalkSpeed.Value - 4
		return
	end
	if isSprinting then
	else
		humanoid.WalkSpeed = statFolder.WalkSpeed.Value
		return
	end
	humanoid.WalkSpeed = statFolder.WalkSpeed.Value + 12
end
local u54 = humanoid.MaxHealth
local u55 = humanoid.Health
local u56 = 0
local u57 = false
local u58 = 0
local l__Health__59 = gameGui.Health
function humanoidHealth(p48)
	if humanoid.Health < u54 then
		if humanoid.Health < u55 then
			u56 = 8
			local v214 = 1 - humanoid.Health / humanoid.MaxHealth
			gameGui.HurtOverlay.Position = UDim2.new(-0.4 + 0.4 * v214, 0, -0.2 + 0.2 * v214, 0)
			gameGui.HurtOverlay.Size = UDim2.new(1.8 - 0.8 * v214, 0, 1.4 - 0.4 * v214, 0)
			u57 = false
			u54 = math.ceil(humanoid.Health / 20) * 20
		elseif 0 < u56 then
			u56 = u56 - p48
		elseif 0 < u58 then
			u58 = u58 - p48
		else
			humanoid.Health = humanoid.Health + 1
			u58 = 0.3
			u57 = false
		end
	elseif u54 < humanoid.Health then
		u54 = math.ceil(humanoid.Health / 20) * 20
		u57 = false
	elseif u55 < humanoid.Health then
		u57 = false
	end
	if gameGui.HurtOverlay.Size.X.Scale + 0.01 < 3 then
		if gameGui.HurtOverlay.Size.Y.Scale + 0.01 < 2 then
			if not u57 then
				u57 = true
				local v215 = humanoid.Health / humanoid.MaxHealth
				gameGui.HurtOverlay:TweenSizeAndPosition(
					UDim2.new(1 + 2 * v215, 0, 1 + 1 * v215, 0),
					UDim2.new(0 - 1 * v215, 0, 0 - 0.5 * v215, 0),
					"Out",
					"Quad",
					6 - 4 * v215,
					true
				)
			end
		end
	end
	l__Health__59.HealthText.Text = humanoid.Health
	u55 = humanoid.Health
end

gameGui.GamePause.Changed:connect(function()
	humanoidSpeed()
	if gameGui.GamePause.Value and humanoid.Health > 0 then
		script.LocalPause.Value = true
		gameGui.Pause.Visible = true
		l__Reticle__19.Visible = false
		gameGui.Interface.Info.PauseText.Text = "['P' to Resume]"
		camera.CameraType = "Scriptable"
		if not torso:findFirstChild("PausePos") then
			local v216 = torso:GetChildren()
			for v217 = 1, #v216 do
				if v216[v217].Name == "BodyPosition" then
					v216[v217]:Destroy()
				end
			end
			pausePos = Instance.new("BodyPosition")
			pausePos.Name = "PausePos"
			pausePos.position = torso.Position
			pausePos.D = 200
			pausePos.maxForce = Vector3.new(4, 4, 4) * 1000000
			pausePos.P = 10000000
			pausePos.Parent = torso
			return
		end
	else
		script.LocalPause.Value = false
		l__Reticle__19.Visible = true
		gameGui.Interface.Info.PauseText.Text = "['P' to Pause]"
		camera.CameraType = "Custom"
		if torso:findFirstChild("PausePos") then
			torso.PausePos:Destroy()
		end
		gameGui.Pause.Visible = false
	end
end)

script.LocalPause.Changed:connect(function()
	humanoidSpeed()
	if script.LocalPause.Value then
		gameGui.CanPause.Value = false
		return
	end
	gameGui.CanPause.Value = true
end)
menu.Options.MusicVolume.Selection.Text.Text = statFolder.MusicVolume.Value
local u60 = false
menu.Options.MusicVolume.Selection.Less.MouseButton1Click:connect(function()
	if u60 then
		return
	end
	u60 = true
	if statFolder.MusicVolume.Value > 0 then
		statFolder.MusicVolume.Value = statFolder.MusicVolume.Value - 1
		menu.Options.MusicVolume.Selection.Text.Text = statFolder.MusicVolume.Value
	end
	u60 = false
end)
menu.Options.MusicVolume.Selection.More.MouseButton1Click:connect(function()
	if u60 then
		return
	end
	u60 = true
	if statFolder.MusicVolume.Value < 10 then
		statFolder.MusicVolume.Value = statFolder.MusicVolume.Value + 1
		menu.Options.MusicVolume.Selection.Text.Text = statFolder.MusicVolume.Value
	end
	u60 = false
end)
menu.Options.ResetStats.Selection.Reset.MouseButton1Click:connect(function()
	if u60 then
		return
	end
	u60 = true
	if not menu.Options.ResetStats.AreYouSure.Visible then
		menu.Options.ResetStats.AreYouSure.Visible = true
	end
	u60 = false
end)
menu.Options.ResetStats.AreYouSure.Yes.MouseButton1Click:connect(function()
	if u60 then
		return
	end
	u60 = true
	if menu.Options.ResetStats.AreYouSure.Visible then
		menu.Options.ResetStats.AreYouSure.Visible = false
		statFolder.Tool.Value = "None"
		statFolder.Progress.Value = 0
		statFolder.Power.Value = statFolder.PowerMax.Value
		statFolder.LoadingZone.Value = 0
		statFolder.Checkpoint.Value = 1
		statFolder.Level.Value = 0
		player.FirstEnter.Value = true
		statFolder.Restart.Value = true
		gameGui.GamePause.Value = false
	end
	u60 = false
end)
menu.Options.ResetStats.AreYouSure.No.MouseButton1Click:connect(function()
	if u60 then
		return
	end
	u60 = true
	if menu.Options.ResetStats.AreYouSure.Visible then
		menu.Options.ResetStats.AreYouSure.Visible = false
	end
	u60 = false
end)
menu.Options.MainMenu.Selection.MainMenu.MouseButton1Click:connect(function()
	if u60 then
		return
	end
	u60 = true
	if not menu.Options.MainMenu.AreYouSure.Visible then
		menu.Options.MainMenu.AreYouSure.Visible = true
	end
	u60 = false
end)
menu.Options.MainMenu.AreYouSure.Yes.MouseButton1Click:connect(function()
	if u60 then
		return
	end
	u60 = true
	if menu.Options.MainMenu.AreYouSure.Visible then
		menu.Options.MainMenu.AreYouSure.Visible = false
		gameGui.GamePause.Value = false
		player.FirstEnter.Value = true
		statFolder.Restart.Value = true
	end
	u60 = false
end)
menu.Options.MainMenu.AreYouSure.No.MouseButton1Click:connect(function()
	if u60 then
		return
	end
	u60 = true
	if menu.Options.MainMenu.AreYouSure.Visible then
		menu.Options.MainMenu.AreYouSure.Visible = false
	end
	u60 = false
end)

runGettingTool()

camera.Changed:connect(function()
	updateAim()
end)
mouse.Idle:connect(function()
	updateAim()
end)

function refreshPlayer()
	print("setup")
	humanoid.WalkSpeed = statFolder.WalkSpeed.Value
	statFolder.Power.Value = statFolder.PowerMax.Value
	if not script.LocalTheIncident.Value then
		v26.Transparency = 0
		v26.BrickColor = BrickColor.new("Black")
		v29.Transparency = 0
		v29.BrickColor = BrickColor.new("Black")
	else
		v26.Transparency = 0.4
		v26.BrickColor = BrickColor.new("Bright red")
		v29.Transparency = 0.4
		v29.BrickColor = BrickColor.new("Bright red")
	end
	waitTime(1)
	torso.CFrame = statFolder.Location.Value
	waitTime(3)
	humanoid.Jump = true
	u5 = true
	player.CameraMode = 1
	local background = gameGui.Interface.Background
	local loadingLabel = gameGui.Interface.LoadingText
	loadingLabel.Visible = false
	waitTime(3)
	loadingLabel.Visible = true
	waitTime(4)
	loadingLabel.Visible = false
	waitTime(2)
	loadingLabel.Visible = true
	waitTime(2)
	loadingLabel.Visible = false
	waitTime(3)
	for i = 1, 20 do
		waitTime(1)
		background.BackgroundTransparency = i / 20
	end
	gameGui.CanPause.Value = true
	print("setup complete")
end

script.LocalRestart.Changed:connect(function()
	if script.LocalRestart.Value then
		refreshPlayer()
		script.LocalRestart.Value = false
	end
end)

refreshPlayer()

local animationRate = 1 / 60
local elapsed = 0

-- Stupid problems require stupid solutions
-- arm animations will be too fast at 60+ fps.
RunService.RenderStepped:Connect(function(dt)
	if player.Character.Parent == nil then
		return
	end
	if script.LocalPause.Value then
		return
	end

	elapsed += dt

	if elapsed >= animationRate then
		updateAnimationSpeed()
		elapsed -= animationRate
	end
end)

RunService.RenderStepped:Connect(function()
	if player.Character.Parent == nil then
		return
	end
	if script.LocalPause.Value then
		return
	end

	mouseTarget()
end)

while player.Character.Parent ~= nil do
	local _, time = wait(0.1)

	if not script.LocalPause.Value then
		humanoidHealth(time)
		move(time)
	else
		u26 = false
		u23 = false
	end
end
