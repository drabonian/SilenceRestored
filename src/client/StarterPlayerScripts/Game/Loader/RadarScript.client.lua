-- Decompiled with the Synapse X Luau decompiler.

print("Radar Script Running")

local l__Parent__1 = script.Parent
local l__Character__2 = game.Players.LocalPlayer.Character

function waitTime(p5)
	for i = 0, p5 do
		task.wait(0.03)
	end
end

function D(p2, p3)
	return p2 - p3
end

local l__Torso__1 = l__Character__2.Torso
local u2 = l__Parent__1.Radar.Full.Bot:Clone()
local u3 = UDim2.new(0.5, 0, 0.5, 0)
local u4 = l__Parent__1.Radar.Full.Obj:Clone()
function PositionOnRadar(p4)
	local v4 = Vector3.new(p4.Position.x, 0, p4.Position.z)
	local v5 = Vector3.new(l__Torso__1.Position.x, 0, l__Torso__1.Position.z)
	if p4.Parent:findFirstChild("Humanoid") then
		if p4 ~= l__Torso__1 then
			if (v4 - v5).magnitude < 80 then
				local v6 = u2:Clone()
				v6.Parent = l__Parent__1.Radar.Frame
				if p4.Parent then
					if p4.Parent:findFirstChild("Stats") then
						if p4.Parent:findFirstChild("Humanoid") then
							if p4.Parent.Stats:findFirstChild("Invisible") then
								if 0 < p4.Parent.Humanoid.Health then
									if p4.Parent.Stats:findFirstChild("State") then
										if p4.Parent.Stats.State.Value == 0 then
											v6.Direction.Image = "http://www.roblox.com/asset/?id=136070023"
											v6.BackgroundColor3 = Color3.new(0.6, 0.6, 0.6)
										elseif p4.Parent.Stats:findFirstChild("State") then
											if p4.Parent.Stats.State.Value == 1 then
												v6.Direction.Image = "http://www.roblox.com/asset/?id=136070010"
												v6.BackgroundColor3 = Color3.new(1, 1, 0)
											elseif p4.Parent.Stats:findFirstChild("State") then
												if p4.Parent.Stats.State.Value == 2 then
													v6.Direction.Image = "http://www.roblox.com/asset/?id=136070002"
													v6.BackgroundColor3 = Color3.new(0.8, 0, 0)
												end
											end
										elseif p4.Parent.Stats:findFirstChild("State") then
											if p4.Parent.Stats.State.Value == 2 then
												v6.Direction.Image = "http://www.roblox.com/asset/?id=136070002"
												v6.BackgroundColor3 = Color3.new(0.8, 0, 0)
											end
										end
									elseif p4.Parent.Stats:findFirstChild("State") then
										if p4.Parent.Stats.State.Value == 1 then
											v6.Direction.Image = "http://www.roblox.com/asset/?id=136070010"
											v6.BackgroundColor3 = Color3.new(1, 1, 0)
										elseif p4.Parent.Stats:findFirstChild("State") then
											if p4.Parent.Stats.State.Value == 2 then
												v6.Direction.Image = "http://www.roblox.com/asset/?id=136070002"
												v6.BackgroundColor3 = Color3.new(0.8, 0, 0)
											end
										end
									elseif p4.Parent.Stats:findFirstChild("State") then
										if p4.Parent.Stats.State.Value == 2 then
											v6.Direction.Image = "http://www.roblox.com/asset/?id=136070002"
											v6.BackgroundColor3 = Color3.new(0.8, 0, 0)
										end
									end
									if p4.Parent.Stats:findFirstChild("RadarRotation") then
										v6.Direction.Visible = true
										v6.Rotation = p4.Parent.Stats.RadarRotation.Value
									end
								else
									v6.BackgroundColor3 = Color3.new(0, 0, 0)
								end
								if not p4.Parent.Stats.Invisible.Value then
									v6.Visible = true
								end
							end
						end
					end
				end
				if 16 < math.abs(l__Torso__1.Position.y - p4.Position.y) then
					v6.BackgroundColor3 = Color3.new(
						v6.BackgroundColor3.r * 0.5,
						v6.BackgroundColor3.g * 0.5,
						v6.BackgroundColor3.b * 0.5
					)
				elseif 32 < math.abs(l__Torso__1.Position.y - p4.Position.y) then
					v6.BackgroundColor3 = Color3.new(
						v6.BackgroundColor3.r * 0.2,
						v6.BackgroundColor3.g * 0.2,
						v6.BackgroundColor3.b * 0.2
					)
				else
					v6.ZIndex = 3
					v6.Direction.ZIndex = 3
				end
				v6.Position =
					UDim2.new(u3.X.Scale + D(v4.x, v5.x) / 80 / 2, -5, u3.Y.Scale + D(v4.z, v5.z) / 80 / 2, -5)
				coroutine.resume(coroutine.create(function()
					waitTime(2)
					v6:Destroy()
				end))
				return
			end
		end
	end
	if not p4.Parent:findFirstChild("Humanoid") then
		if p4 ~= l__Torso__1 then
			local v7 = u4:Clone()
			v7.Parent = l__Parent__1.Radar.Frame
			v7.Title.Text = string.sub(p4.Parent.Name, 1, 16)
			v7.Visible = true
			v7.Rotation = -l__Parent__1.Radar.Frame.Rotation
			if 14 < l__Torso__1.Position.y - p4.Position.y then
				v7.Title.Text = "(BELOW)"
				v7.BackgroundColor3 =
					Color3.new(v7.BackgroundColor3.r * 0.5, v7.BackgroundColor3.g * 0.5, v7.BackgroundColor3.b * 0.5)
			elseif 28 < l__Torso__1.Position.y - p4.Position.y then
				v7.Title.Text = "(FAR BELOW)"
				v7.BackgroundColor3 =
					Color3.new(v7.BackgroundColor3.r * 0.2, v7.BackgroundColor3.g * 0.2, v7.BackgroundColor3.b * 0.2)
			elseif l__Torso__1.Position.y - p4.Position.y < -14 then
				v7.Title.Text = "(ABOVE)"
				v7.BackgroundColor3 =
					Color3.new(v7.BackgroundColor3.r * 0.5, v7.BackgroundColor3.g * 0.5, v7.BackgroundColor3.b * 0.5)
			else
				v7.ZIndex = 3
				v7.Title.ZIndex = 3
			end
			if 8 < (p4.Position - l__Torso__1.Position).magnitude then
				if not l__Parent__1.LocalScript.LocalPause.Value then
					if not p4:FindFirstChild("TrackingGui") then
						local v8 = Instance.new("BillboardGui")
						local v9 = Instance.new("Frame")
						v9.Size = UDim2.new(0, 50, 0, 50)
						v9.BackgroundTransparency = 1
						v9.Parent = v8
						local v10 = Instance.new("ImageLabel")
						v10.Size = UDim2.new(0, 50, 0, 50)
						v10.BackgroundTransparency = 1
						v10.ImageTransparency = 0.9
						v10.Image = "http://www.roblox.com/asset/?id=97435923"
						v10.Parent = v9
						v8.Name = "TrackingGui"
						v8.Adornee = p4
						v8.AlwaysOnTop = true
						v8.Size = UDim2.new(0, 50, 0, 50)
						v8.Parent = p4
					end
				elseif p4:FindFirstChild("TrackingGui") then
					p4.TrackingGui:Destroy()
				end
			elseif p4:FindFirstChild("TrackingGui") then
				p4.TrackingGui:Destroy()
			end
			if (v4 - v5).magnitude < 80 then
				v7.Position =
					UDim2.new(u3.X.Scale + D(v4.x, v5.x) / 80 / 2, -5, u3.Y.Scale + D(v4.z, v5.z) / 80 / 2, -5)
			else
				local v11 = v5 - (v5 - v4).unit * 80
				v7.Position =
					UDim2.new(u3.X.Scale + D(v11.x, v5.x) / 80 / 2, -5, u3.Y.Scale + D(v11.z, v5.z) / 80 / 2, -5)
			end
			coroutine.resume(coroutine.create(function()
				waitTime(2)
				v7:Destroy()
			end))
		end
	end
end
local u5 = {}
local l__CurrentCamera__6 = workspace.CurrentCamera
function GetTorsos()
	local function v12(p5)
		local v13 = p5:GetChildren()

		for _, item in v13 do
			if item:IsA("Model") then
				if item:findFirstChild("Torso") then
					local v16 = item:GetChildren()

					for _, item2 in v16 do
						if item2.Name == "Torso" then
							table.insert(u5, item2)
						end
					end
				end
			end
		end
	end

	u5 = {}
	if l__CurrentCamera__6:findFirstChild("Map") then
		v12(l__CurrentCamera__6.Map)
	end
	if l__CurrentCamera__6:findFirstChild("Level") then
		v12(l__CurrentCamera__6.Level.Objectives)
	end
	return u5
end
l__Parent__1.Radar.Visible = true
while true do
	local v19 = nil
	if not l__Character__2 then
		break
	end
	waitTime(2)
	local _, v21 = l__Torso__1.CFrame:toEulerAnglesXYZ()
	v19 = math.deg(v21 + math.pi / 2)

	local v23
	if l__Torso__1.CFrame.lookVector.Z > 0 then
		v23 = v19 + 180
	else
		v23 = 180 - v19
	end
	l__Parent__1.Radar.Frame.Rotation = math.ceil(90 - v23)
	local v24 = GetTorsos()
	for v25 = 1, #v24 do
		PositionOnRadar(v24[v25])
	end
end
