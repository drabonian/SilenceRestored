-- Decompiled with the Synapse X Luau decompiler.

print("Running Tile Turret Script");

local l__Value__1 = script.LinkedModel.Value;
local l__Humanoid__2 = l__Value__1.Humanoid;

game:GetService("ScriptContext").Error:Connect(function(Error, trace, erroredScript)
	if erroredScript == script then
		warn("Error generated by: " .. l__Humanoid__2.Parent.Name)
		warn(Error)
	end
end)

local l__Torso__3 = l__Value__1.Torso;
local l__Head__4 = l__Value__1.Head;
local l__Stats__5 = l__Value__1.Stats;
local l__Value__6 = l__Stats__5.Range.Value;
playerStats = game.Players.LocalPlayer.Stats
l__Humanoid__2.MaxHealth = l__Stats__5.Health.Value * (playerStats.Difficulty.Value / 3);
l__Humanoid__2.Health = l__Humanoid__2.MaxHealth;
local l__Debris__7 = game:GetService("Debris");
function unanchor(p1)
	local v8 = p1:GetChildren();
	local v9 = #v8;
	local v10 = 1 - 1;
	while true do
		if v8[v10] then
			if v8[v10]:IsA("Part") then
				v8[v10].Anchored = false;
			elseif v8[v10] then
				if v8[v10]:IsA("Model") then
					unanchor(v8[v10]);
				end;
			end;
		elseif v8[v10] then
			if v8[v10]:IsA("Model") then
				unanchor(v8[v10]);
			end;
		end;
		if 0 <= 1 then
			if v10 < v9 then

			else
				break;
			end;
		elseif v9 < v10 then

		else
			break;
		end;
		v10 = v10 + 1;	
	end;
end;
unanchor(l__Value__1);
local v11 = Instance.new("BodyPosition");
v11.position = script.Home.Value;
v11.maxForce = Vector3.new(4, 4, 4) * 100000000;
v11.Parent = l__Torso__3;
local v12 = Instance.new("BodyGyro");
v12.P = 1600000;
v12.D = 120;
v12.maxTorque = Vector3.new(6, 6, 6) * 1000;
v12.cframe = CFrame.new(script.Home.Value);
v12.Parent = l__Torso__3;

function waitTime(p5)
	for i = 0, p5 do
		task.wait(0.03)
		if script.Parent.GamePause.Value then
			script.Parent.GamePause.Changed:Wait()
		end
	end
end;

local l__CurrentCamera__1 = workspace.CurrentCamera;
local l__Main__2 = l__Value__1.Main;
l__Humanoid__2.Died:connect(function()
	coroutine.resume(coroutine.create(function()
		waitTime(4000);
		l__Value__1:Destroy();
		script:Destroy()
	end));
	waitTime(1);
	if l__Value__1:findFirstChild("Torso") and l__Torso__3.Position.Y > 0 then
		local v14 = Instance.new("Explosion");
		v14.Position = l__Torso__3.Position;
		v14.BlastPressure = 0;
		v14.BlastRadius = 10;
		v14.Parent = l__CurrentCamera__1;
		l__Debris__7:AddItem(v14, 3);
		v11.maxForce = Vector3.new(0, 0, 0);
		v12.maxTorque = Vector3.new(0, 0, 0);
		l__Value__1:BreakJoints();
		if script.Parent:FindFirstChild("SoundScript") then
			local v15 = Instance.new("StringValue");
			v15.Name = "Sound";
			v15.Value = "RoboticExplosion";
			local v16 = Instance.new("ObjectValue");
			v16.Name = "Location";
			v16.Value = l__Torso__3;
			v16.Parent = v15;
			v15.Parent = script.Parent.SoundScript.Effects;
		end;
		if l__CurrentCamera__1:findFirstChild("Level") and l__CurrentCamera__1.Level:findFirstChild("Tool") then
			l__Main__2.Name = "Turret";
			coroutine.resume(coroutine.create(function()
				while true do
					wait(0.09);
					if l__Main__2.Velocity.magnitude < 0.1 then
						break;
					end;				
				end;
				l__Main__2.Anchored = true;
			end));
			l__Main__2.Parent = l__CurrentCamera__1.Level.Tool;
			l__Main__2.Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
		end;
	end;
end);
function breakGlass(p3)
	local l__X__17 = p3.Position.X;
	local l__Y__18 = p3.Position.Y;
	local l__Z__19 = p3.Position.Z;
	local l__X__20 = p3.Size.X;
	local l__Y__21 = p3.Size.Y;
	local l__Z__22 = p3.Size.Z;
	local v23 = p3.CFrame - p3.CFrame.p;
	p3:Destroy();
	local v24 = Instance.new("Part");
	v24.Name = "Averter";
	v24.FormFactor = 0;
	v24.Size = Vector3.new(1, 1, 1);
	v24.BrickColor = p3.BrickColor;
	v24.Shape = 1;
	v24.BottomSurface = 0;
	v24.TopSurface = 0;
	v24.Reflectance = p3.Reflectance;
	v24.Transparency = p3.Transparency;
	v24.CanCollide = false;
	local v25 = l__X__20 - 1;
	local v26 = 0 - 1;
	while true do
		local v27 = l__Y__21 - 1;
		local v28 = 0 - 1;
		while true do
			local v29 = l__Z__22 - 1;
			local v30 = 0 - 1;
			while true do
				local v31 = v24:clone();
				v31.Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
				v31.CFrame = CFrame.new(l__X__17 - (l__X__20 - 1) / 2 + v26, l__Y__18 - (l__Y__21 - 1) / 2 + v28, l__Z__19 - (l__Z__22 - 1) / 2 + v30) * v23;
				l__Debris__7:AddItem(v31, 0.5);
				v31.Parent = l__CurrentCamera__1;
				if 0 <= 1 then
					if v30 < v29 then

					else
						break;
					end;
				elseif v29 < v30 then

				else
					break;
				end;
				v30 = v30 + 1;			
			end;
			if 0 <= 1 then
				if v28 < v27 then

				else
					break;
				end;
			elseif v27 < v28 then

			else
				break;
			end;
			v28 = v28 + 1;		
		end;
		if 0 <= 1 then
			if v26 < v25 then

			else
				break;
			end;
		elseif v25 < v26 then

		else
			break;
		end;
		v26 = v26 + 1;	
	end;
end;
local l__GameItems__3 = game.ReplicatedStorage.GameItems;
function visualDamage(p4, p5, p6)
	local v32 = Instance.new("BillboardGui");
	v32.Size = UDim2.new(1, 0, 1, 0);
	v32.StudsOffset = Vector3.new(math.random(-1, 1), 1.65, math.random(-1, 1));
	local v33 = l__GameItems__3.MasterGuis.DamageFrame:clone();
	v33.Parent = v32;
	if p5 == 0 then
		v33.TextLabel.Text = "-" .. p5;
		v33.TextLabel.TextStrokeColor3 = Color3.new(0, 0, 1);
	elseif p5 < 0 then
		v33.TextLabel.Text = "+" .. p5;
		v33.TextLabel.TextStrokeColor3 = Color3.new(0, 1, 0);
	else
		v33.TextLabel.Text = "-" .. p5;
		v33.TextLabel.TextStrokeColor3 = Color3.new(1, 0, 0);
	end;
	v32.Parent = p6;
	v32.Adornee = p6;
	local l__BillboardControl__34 = v33.BillboardControl;
	l__BillboardControl__34.Billboard.Value = v32;
	l__BillboardControl__34.Parent = script.Parent;
	l__BillboardControl__34.Disabled = false;
	l__Debris__7:AddItem(v32, 5);
end;
function normalDamage(p7, p8)
	local v35 = p7.Parent:findFirstChild("Humanoid") or p7.Parent.Parent:findFirstChild("Humanoid");
	if v35 then
		if game.Players:findFirstChild(v35.Parent.Name) then
			if 0 < v35.Health then
				if not v35.Parent:findFirstChild("ForceField") then
					if v35.Parent:findFirstChild("Head") then
						local v36 = math.ceil(p8 * playerStats.Difficulty.Value / 3);
						if p7.Name == "Head" then
							v36 = math.ceil(v36 * 2);
						elseif p7.Name == "Torso" then
							v36 = math.ceil(v36 * 1.5);
						end;
						v35:TakeDamage(v36);
						visualDamage(v35, v36, v35.Parent.Head);
						return;
					end;
				end;
			end;
		else
			if p7.Name == "Glass" then
				breakGlass(p7);
				return;
			end;
			if p7.Name == "Explosive" then
				if p7:findFirstChild("Explode") then
					p7.Explode.Value = true;
				end;
			end;
		end;
	else
		if p7.Name == "Glass" then
			breakGlass(p7);
			return;
		end;
		if p7.Name == "Explosive" then
			if p7:findFirstChild("Explode") then
				p7.Explode.Value = true;
			end;
		end;
	end;
end;
local v37 = Instance.new("Part");
v37.FormFactor = Enum.FormFactor.Custom;
v37.Size = Vector3.new(0.2, 0.2, 1);
v37.BrickColor = BrickColor.new("Bright red");
v37.CanCollide = false;
v37.Anchored = true;
v37.Transparency = 0.3;
v37.TopSurface = Enum.SurfaceType.Smooth;
v37.BottomSurface = Enum.SurfaceType.Smooth;
v37.Name = "Averter";
function RayIgnoreCheck(p9, p10)
	if p9 then
		if not (1 <= p9.Transparency) then
			if string.lower(p9.Name) ~= "water" then
				if p9.Name ~= "Effect" then
					if p9.Name ~= "Rocket" then
						if p9.Name ~= "Averter" then
							if p9.Parent.ClassName ~= "Hat" then
								if p9.Parent.ClassName ~= "Tool" then
									if p9:IsDescendantOf(l__Value__1) then

									else
										return false;
									end;
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	else
		return false;
	end;
	return true;
end;
function RayCast(p11, p12, p13)
	local v38, v39 = game.Workspace:FindPartOnRay(Ray.new(p11 + p12 * 0.01, p12 * p13), l__Value__1);
	if v38 then
		if v39 then
			local v40 = p13 - (v39 - p11).magnitude;
			--if RayIgnoreCheck(v38, v39) then
			--	if 0 < v40 then
			--		return RayCast(v39, p12, v40);
			--	end;
			--end;
		end;
	end;
	return v38, v39;
end;
local u4 = nil;
local u5 = l__Value__6 - 4;
function onFireNormal(p14)
	local v41, v42 = RayCast(p14.Position, (CFrame.new(Vector3.new(0, 0, 0), (u4.Position - p14.Position).unit) * CFrame.Angles(0, 0, math.random() * 2 * math.pi) * CFrame.Angles(math.random() * 0.16, 0, 0)).lookVector, u5);
	if script.Parent:FindFirstChild("SoundScript") then
		local v43 = Instance.new("StringValue");
		v43.Name = "Sound";
		v43.Value = "LaserShot";
		local v44 = Instance.new("ObjectValue");
		v44.Name = "Location";
		v44.Value = l__Torso__3;
		v44.Parent = v43;
		v43.Parent = script.Parent.SoundScript.Effects;
	end;
	if v42 then
		local v45 = v37:clone();
		local l__magnitude__46 = (v42 - p14.Position).magnitude;
		v45.CFrame = CFrame.new(v42, p14.Position) * CFrame.new(0, 0, -l__magnitude__46 / 2);
		local v47 = Instance.new("BlockMesh");
		v47.Scale = Vector3.new(1, 1, l__magnitude__46 - 2);
		v47.Offset = Vector3.new(0, 0, 2);
		v47.Parent = v45;
		v45.Parent = l__CurrentCamera__1;
		l__Debris__7:AddItem(v45, 0.06);
	end;
	if v41 then
		if v41.Parent then
			if v42 then
				normalDamage(v41, 4);
			end;
		end;
	end;
end;
local u6 = false;
l__Stats__5.Ammo.Changed:connect(function()
	if l__Stats__5.Ammo.Value < 1 then
		u6 = true;
		waitTime(130);
		l__Stats__5.Ammo.Value = 60;
		u6 = false;
	end;
end);
function followEnemy(p15)
	local l__unit__48 = (l__Main__2.Position - p15).unit;
	if l__Torso__3 then
		if not l__Torso__3:findFirstChild("MainWeld") then
			return;
		end;
	else
		return;
	end;
	l__Torso__3.MainWeld.C1 = CFrame.new(l__Torso__3.MainWeld.C1.p) * CFrame.new(Vector3.new(0, 0, 0), (Vector3.new(l__unit__48.Z, 0, l__unit__48.X))) * CFrame.Angles(math.pi, -math.pi / 2, 0);
end;
function findNearestTorso(p16)
	local v49 = l__CurrentCamera__1:getChildren();
	u4 = nil;
	local v50 = #v49;
	local v51 = 1;
	while true do
		if v49[v51] then
			if v49[v51].className == "Model" then
				if v49[v51] ~= l__Value__1 then
					local v52 = v49[v51]:findFirstChild("Torso");
					local v53 = v49[v51]:findFirstChild("Humanoid");
					if v52 then
						if v52.Transparency < 1 then
							if v53 then
								if not v49[v51]:findFirstChild("MainControlNPC") then
									if (v52.Position - (p16 - Vector3.new(0, 8, 0))).magnitude <= l__Value__6 then
										if p16.Y - 48 < v52.Position.Y then
											if 0 < v53.Health then
												if u4 then
													if (v52.Position - p16).magnitude < (u4.Position - p16).magnitude then
														u4 = v52;
													end;
												else
													u4 = v52;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
				end;
			end;
		end;
		if 0 <= 1 then
			if v51 < v50 then

			else
				break;
			end;
		elseif v50 < v51 then

		else
			break;
		end;
		v51 = v51 + 1;	
	end;
	return u4;
end;
local u7 = false;
local u8 = false;
function rotate()
	u7 = true;
	local v54 = 1 - 1;
	while true do
		v12.cframe = v12.cframe * CFrame.Angles(math.pi / 20, 0, 0);
		waitTime(1);
		if 0 <= 1 then
			if v54 < 20 then

			else
				break;
			end;
		elseif 20 < v54 then

		else
			break;
		end;
		v54 = v54 + 1;	
	end;
	u7 = false;
	u8 = not u8;
end;
local u9 = 0;
local u10 = false;
local u11 = nil;
function runBot()
	u4 = findNearestTorso(l__Torso__3.Position);
	if 0 < l__Humanoid__2.Health then
		local v55 = nil;
		if u4 then
			l__Stats__5.State.Value = 2;
			if not u8 then
				if u7 then
					while true do
						waitTime(1);
						if u7 then

						else
							break;
						end;					
					end;
				end;
				rotate();
				l__Stats__5.Invisible.Value = false;
			end;
			followEnemy(u4.Position);
			if 3 < u9 then
				if (u4.Position - (l__Torso__3.Position - Vector3.new(0, 4, 0))).magnitude < u5 then
					if 0 < l__Stats__5.Ammo.Value then
						if u10 then
							onFireNormal(l__Value__1.Barrel1);
						else
							onFireNormal(l__Value__1.Barrel2);
						end;
						u10 = not u10;
						l__Stats__5.Ammo.Value = l__Stats__5.Ammo.Value - 1;
						u9 = 0;
					elseif u5 * 2 < (u4.Position - l__Torso__3.Position).magnitude then
						u4 = nil;
					end;
				elseif u5 * 2 < (u4.Position - l__Torso__3.Position).magnitude then
					u4 = nil;
				end;
			elseif u5 * 2 < (u4.Position - l__Torso__3.Position).magnitude then
				u4 = nil;
			end;
		else
			l__Stats__5.State.Value = 1;
			if u7 then
				while true do
					waitTime(1);
					if u7 then

					else
						break;
					end;				
				end;
			end;
			if u8 then
				rotate();
				l__Stats__5.Invisible.Value = true;
			end;
		end;
		local v56, v57, v58 = l__Main__2.CFrame:toEulerAnglesXYZ();
		v55 = math.deg(v57 + math.pi / 2);
		if 0 < l__Main__2.CFrame.lookVector.Z then
			local v59 = v55 + 180;
		else
			v59 = 180 - v55;
		end;
		l__Stats__5.RadarRotation.Value = math.ceil(v59 - 90);
		if l__Humanoid__2.Health < 20 then
			if not u11 then
				u11 = Instance.new("Smoke");
				u11.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
				u11.Opacity = 0.2;
				u11.Size = 0.1;
				u11.Parent = l__Main__2;
			end;
		end;
	elseif u11 then
		u11:remove();
	end;
	u9 = u9 + 1;
end;
while l__Value__1 do
	wait();
	if script.Parent:findFirstChild("GamePause") then
		if not script.Parent.GamePause.Value then
			runBot();
		end;
	else
		runBot();
	end;
end;
