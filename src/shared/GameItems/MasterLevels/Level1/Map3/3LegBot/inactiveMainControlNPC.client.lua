-- Decompiled with the Synapse X Luau decompiler.

print("Running Bot Script");
wait();
local l__Value__1 = script.LinkedModel.Value;
local l__Humanoid__2 = l__Value__1.Humanoid;
l__Humanoid__2.Health = l__Humanoid__2.MaxHealth;
local l__Torso__3 = l__Value__1.Torso;
local l__Stats__4 = l__Value__1.Stats;
local l__RightHip__5 = l__Torso__3.RightHip;
local l__LeftHip__6 = l__Torso__3.LeftHip;
local l__RightShoulder__7 = l__Torso__3.RightShoulder;
local l__LeftShoulder__8 = l__Torso__3.LeftShoulder;
local v9 = 0;
local v10 = nil;
local v11 = nil;
local v12 = Instance.new("Part");
v12.Transparency = 1;
v12.CanCollide = false;
v12.Anchored = true;
v12.CFrame = CFrame.new(l__Torso__3.Position);
v12.Parent = l__Value__1;
local l__Debris__13 = game:GetService("Debris");
local v14 = Instance.new("BodyGyro");
v14.P = 180000;
v14.D = 80;
v14.maxTorque = Vector3.new(8, 8, 8) * 1000;
v14.cframe = l__Torso__3.CFrame;
v14.Parent = l__Torso__3;
function unanchor(p1)
	local v15 = p1:GetChildren();
	local v16 = #v15;
	local v17 = 1 - 1;
	while true do
		if v15[v17] then
			if v15[v17]:IsA("Part") then
				v15[v17].Anchored = false;
			elseif v15[v17] then
				if v15[v17]:IsA("Model") then
					unanchor(v15[v17]);
				end;
			end;
		elseif v15[v17] then
			if v15[v17]:IsA("Model") then
				unanchor(v15[v17]);
			end;
		end;
		if 0 <= 1 then
			if v17 < v16 then

			else
				break;
			end;
		elseif v16 < v17 then

		else
			break;
		end;
		v17 = v17 + 1;	
	end;
end;
unanchor(l__Value__1);
local l__CurrentCamera__1 = game.Workspace.CurrentCamera;
l__Humanoid__2.Died:connect(function()
	l__Debris__13:AddItem(l__Value__1, 10);
	wait();
	if l__Value__1:findFirstChild("Torso") and l__Torso__3.Position.Y > 0 then
		local v18 = Instance.new("Explosion");
		v18.Position = l__Torso__3.Position;
		v18.BlastPressure = 0;
		v18.BlastRadius = 10;
		v18.Parent = l__CurrentCamera__1;
		l__Debris__13:AddItem(v18, 1);
		l__Value__1:BreakJoints();
		if l__Value__1:findFirstChild("LeftArm") and l__Value__1:findFirstChild("RightArm") then
			l__Value__1.LeftArm.Name = "Tool";
			l__Value__1.RightArm.Name = "Tool";
		end;
	end;
end);
function breakGlass(p2)
	local l__X__19 = p2.Position.X;
	local l__Y__20 = p2.Position.Y;
	local l__Z__21 = p2.Position.Z;
	local l__X__22 = p2.Size.X;
	local l__Y__23 = p2.Size.Y;
	local l__Z__24 = p2.Size.Z;
	local v25, v26, v27 = p2.CFrame:toEulerAnglesXYZ();
	local v28 = Vector3.new(math.deg(v25), math.deg(v26), (math.deg(v27)));
	p2:Destroy();
	local v29 = Instance.new("Part");
	v29.Name = "Averter";
	v29.FormFactor = 0;
	v29.Size = Vector3.new(1, 1, 1);
	v29.BrickColor = p2.BrickColor;
	v29.Shape = 1;
	v29.BottomSurface = 0;
	v29.TopSurface = 0;
	v29.Reflectance = p2.Reflectance;
	v29.Transparency = p2.Transparency;
	v29.CanCollide = false;
	local v30 = l__X__22 - 1;
	local v31 = 0 - 1;
	while true do
		local v32 = l__Y__23 - 1;
		local v33 = 0 - 1;
		while true do
			local v34 = l__Z__24 - 1;
			local v35 = 0 - 1;
			while true do
				local v36 = v29:clone();
				v36.Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
				v36.CFrame = CFrame.new(l__X__19 - (l__X__22 - 1) / 2 + v31, l__Y__20 - (l__Y__23 - 1) / 2 + v33, l__Z__21 - (l__Z__24 - 1) / 2 + v35) * CFrame.Angles(math.rad(v28.x), math.rad(v28.y), (math.rad(v28.z)));
				l__Debris__13:AddItem(v36, 0.5);
				v36.Parent = l__CurrentCamera__1;
				if 0 <= 1 then
					if v35 < v34 then

					else
						break;
					end;
				elseif v34 < v35 then

				else
					break;
				end;
				v35 = v35 + 1;			
			end;
			if 0 <= 1 then
				if v33 < v32 then

				else
					break;
				end;
			elseif v32 < v33 then

			else
				break;
			end;
			v33 = v33 + 1;		
		end;
		if 0 <= 1 then
			if v31 < v30 then

			else
				break;
			end;
		elseif v30 < v31 then

		else
			break;
		end;
		v31 = v31 + 1;	
	end;
end;
local l__GameItems__2 = game.Lighting.GameItems;
function visualDamage(p3, p4, p5)
	local v37 = Instance.new("BillboardGui");
	v37.Size = UDim2.new(1, 0, 1, 0);
	v37.StudsOffset = Vector3.new(math.random(-1, 1), 1.65, math.random(-1, 1));
	local v38 = l__GameItems__2.MasterGuis.DamageFrame:clone();
	v38.Parent = v37;
	if p4 == 0 then
		v38.TextLabel.Text = "-" .. p4;
		v38.TextLabel.TextStrokeColor3 = Color3.new(0, 0, 1);
	elseif p4 < 0 then
		v38.TextLabel.Text = "+" .. p4;
		v38.TextLabel.TextStrokeColor3 = Color3.new(0, 1, 0);
	else
		v38.TextLabel.Text = "-" .. p4;
		v38.TextLabel.TextStrokeColor3 = Color3.new(1, 0, 0);
	end;
	v38.RemoveGui.Disabled = false;
	v37.Parent = p5;
	v37.Adornee = p5;
	l__Debris__13:AddItem(v37, 5);
end;
function normalDamage(p6, p7)
	local v39 = p6.Parent:findFirstChild("Humanoid") or p6.Parent.Parent:findFirstChild("Humanoid");
	if v39 then
		if game.Players:findFirstChild(v39.Parent.Name) then
			if 0 < v39.Health then
				if not v39.Parent:findFirstChild("ForceField") then
					if v39.Parent:findFirstChild("Head") then
						local v40 = p7;
						if p6.Name == "Head" then
							v40 = math.ceil(v40 * 2);
						elseif p6.Name == "Torso" then
							v40 = math.ceil(v40 * 1.5);
						end;
						v39:TakeDamage(v40);
						visualDamage(v39, v40, v39.Parent.Head);
						return;
					end;
				end;
			end;
		else
			if p6.Name == "Glass" then
				breakGlass(p6);
				return;
			end;
			if p6.Name == "Explosive" then
				if p6:findFirstChild("Explode") then
					p6.Explode.Value = true;
				end;
			end;
		end;
	else
		if p6.Name == "Glass" then
			breakGlass(p6);
			return;
		end;
		if p6.Name == "Explosive" then
			if p6:findFirstChild("Explode") then
				p6.Explode.Value = true;
			end;
		end;
	end;
end;
local v41 = Instance.new("Part");
v41.FormFactor = Enum.FormFactor.Custom;
v41.Size = Vector3.new(0.2, 0.2, 1);
v41.BrickColor = BrickColor.new("Bright red");
v41.CanCollide = false;
v41.Anchored = true;
v41.Transparency = 0.3;
v41.TopSurface = Enum.SurfaceType.Smooth;
v41.BottomSurface = Enum.SurfaceType.Smooth;
v41.Name = "Averter";
function RayIgnoreCheck(p8, p9)
	if p8 then
		if not (1 <= p8.Transparency) then
			if string.lower(p8.Name) ~= "water" then
				if p8.Name ~= "Effect" then
					if p8.Name ~= "Rocket" then
						if p8.Name ~= "Averter" then
							if p8.Parent.ClassName ~= "Hat" then
								if p8.Parent.ClassName ~= "Tool" then
									if p8:IsDescendantOf(l__Value__1) then

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
function RayCast(p10, p11, p12)
	local v42, v43 = game.Workspace:FindPartOnRay(Ray.new(p10 + p11 * 0.01, p11 * p12), l__Value__1);
	if v42 then
		if v43 then
			local v44 = p12 - (v43 - p10).magnitude;
			if RayIgnoreCheck(v42, v43) then
				if 0 < v44 then
					return RayCast(v43, p11, v44);
				end;
			end;
		end;
	end;
	return v42, v43;
end;
local u3 = nil;
function onFireNormal(p13)
	local v45, v46 = RayCast(p13.Position, (CFrame.new(Vector3.new(0, 0, 0), (u3.Position - p13.Position).unit) * CFrame.Angles(0, 0, math.random() * 2 * math.pi) * CFrame.Angles(math.random() * 0.16, 0, 0)).lookVector, 50);
	if v46 then
		local v47 = v41:clone();
		local l__magnitude__48 = (v46 - p13.Position).magnitude;
		v47.CFrame = CFrame.new(v46, p13.Position) * CFrame.new(0, 0, -l__magnitude__48 / 2);
		local v49 = Instance.new("BlockMesh");
		v49.Scale = Vector3.new(1, 1, l__magnitude__48 - 2);
		v49.Offset = Vector3.new(0, 0, 2);
		v49.Parent = v47;
		v47.Parent = l__CurrentCamera__1;
		l__Debris__13:AddItem(v47, 0.06);
	end;
	if v45 then
		if v45.Parent then
			if v46 then
				normalDamage(v45, 4);
			end;
		end;
	end;
end;
local u4 = false;
local l__C1__5 = l__RightShoulder__7.C1;
local l__C1__6 = l__LeftShoulder__8.C1;
local l__WalkSpeed__7 = l__Humanoid__2.WalkSpeed;
l__Stats__4.Ammo.Changed:connect(function()
	if l__Stats__4.Ammo.Value < 1 then
		u4 = true;
		l__Humanoid__2.WalkSpeed = 0;
		for v50 = 1, 30 do
			l__RightShoulder__7.C1 = l__C1__5 * CFrame.Angles(v50 / 20, 0, 0);
			l__LeftShoulder__8.C1 = l__C1__6 * CFrame.Angles(v50 / 20, 0, 0);
			wait();
		end;
		for v51 = 1, 5 do
			l__RightShoulder__7.C1 = l__RightShoulder__7.C1 - Vector3.new(0, 0.2, 0);
			l__LeftShoulder__8.C1 = l__LeftShoulder__8.C1 - Vector3.new(0, 0.2, 0);
			wait();
		end;
		for v52 = 1, 5 do
			l__RightShoulder__7.C1 = l__RightShoulder__7.C1 + Vector3.new(0, 0.2, 0);
			l__LeftShoulder__8.C1 = l__LeftShoulder__8.C1 + Vector3.new(0, 0.2, 0);
			wait();
		end;
		for v53 = 30, 1, -1 do
			l__RightShoulder__7.C1 = l__C1__5 * CFrame.Angles(v53 / 20, 0, 0);
			l__LeftShoulder__8.C1 = l__C1__6 * CFrame.Angles(v53 / 20, 0, 0);
			wait();
		end;
		l__Stats__4.Ammo.Value = 60;
		l__Humanoid__2.WalkSpeed = l__WalkSpeed__7;
		u4 = false;
	end;
end);
local u8 = "Walking";
local l__C1__9 = l__RightHip__5.C1;
local l__C1__10 = l__LeftHip__6.C1;
function move(p14)
	if u8 == "Walking" then
		if not u4 then
			local v54 = 0.5;
			local v55 = 4;
		else
			v54 = 0;
			v55 = 0;
		end;
	else
		v54 = 0;
		v55 = 0;
	end;
	local v56 = v54 * math.sin(p14 * v55);
	l__RightHip__5.C1 = l__C1__9 * CFrame.Angles(-v56 / 2 - 0.1, 0, 0);
	l__LeftHip__6.C1 = l__C1__10 * CFrame.Angles(v56 / 2 - 0.1, 0, 0);
end;
local l__Head__11 = l__Value__1.Head;
function followEnemy(p15)
	v14.cframe = CFrame.new(l__Torso__3.Position, (Vector3.new(p15.x, l__Torso__3.Position.y, p15.z)));
	if u4 then
		return;
	end;
	local v57 = (l__Head__11.Position.y - p15.y) / (l__Head__11.Position - p15).magnitude;
	l__RightShoulder__7.C1 = l__C1__5 * CFrame.Angles(-v57, 0, 0);
	l__LeftShoulder__8.C1 = l__C1__6 * CFrame.Angles(-v57, 0, 0);
end;
function findNearestTorso(p16)
	local v58 = l__CurrentCamera__1:getChildren();
	u3 = nil;
	local v59 = #v58;
	local v60 = 1 - 1;
	while true do
		if v58[v60] then
			if v58[v60].className == "Model" then
				if v58[v60] ~= l__Value__1 then
					local v61 = v58[v60]:findFirstChild("Torso");
					local v62 = v58[v60]:findFirstChild("Humanoid");
					if v61 then
						if v61.Transparency < 1 then
							if v62 then
								if not v58[v60]:findFirstChild("MainControlNPC") then
									if (v61.Position - p16).magnitude <= 600 then
										if p16.Y - 48 < v61.Position.Y then
											if 0 < v62.Health then
												if u3 then
													if (v61.Position - p16).magnitude < (u3.Position - p16).magnitude then
														u3 = v61;
													end;
												else
													u3 = v61;
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
			if v60 < v59 then

			else
				break;
			end;
		elseif v59 < v60 then

		else
			break;
		end;
		v60 = v60 + 1;	
	end;
end;
function lineOfSight()
	local l__Position__63 = l__Torso__3.Position;
	local v64 = {};
	local v65 = {};
	local v66 = {};
	local v67 = false;
	local v68 = 4;
	while true do
		if 0 < v68 then

		else
			break;
		end;
		if not v67 then

		else
			break;
		end;
		local v69 = RayCast(l__Torso__3.Position, (u3.Position - l__Torso__3.Position).unit, 50);
		if v69 then
			if v69.Parent then
				print(v69);
				if v69.Parent:findFirstChild("Humanoid") or v69.Parent.Parent:findFirstChild("Humanoid") then
					v67 = true;
				end;
			end;
		end;
		v68 = v68 - 1;
		print(v68);
		wait();	
	end;
	return u3.Position;
end;
while l__Value__1 do
	local v70, v71 = wait();
	move(v71);
	findNearestTorso(l__Torso__3.Position);
	if l__Humanoid__2.Health > 0 then
		if u3 then
			u8 = "Walking";
			l__Humanoid__2:MoveTo(lineOfSight(), u3);
			followEnemy(u3.Position);
			if v9 > 3 and (u3.Position - l__Torso__3.Position).magnitude < 50 and l__Stats__4.Ammo.Value > 0 then
				onFireNormal(l__Value__1.LeftArm.Chaingun);
				onFireNormal(l__Value__1.RightArm.Chaingun);
				l__Stats__4.Ammo.Value = l__Stats__4.Ammo.Value - 1;
				v9 = 0;
			elseif (u3.Position - l__Torso__3.Position).magnitude > 100 then
				u3 = nil;
			end;
		else
			u8 = "Standing";
			l__Humanoid__2:MoveTo(v12.Position, v12);
		end;
		if l__Humanoid__2.Health < 50 and not v10 then
			v10 = Instance.new("Smoke");
			v10.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
			v10.Opacity = 0.2;
			v10.Size = 0.1;
			v10.Parent = l__Value__1.Main.Exhaust1;
		elseif l__Humanoid__2.Health < 30 and not v11 then
			v11 = Instance.new("Smoke");
			v11.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
			v11.Opacity = 0.2;
			v11.Size = 0.1;
			v11.Parent = l__Value__1.Main.Exhaust2;
		end;
	else
		if v10 then
			v10:Destroy();
		end;
		if v11 then
			v11:Destroy();
		end;
		u8 = "Standing";
		l__Humanoid__2:MoveTo(l__Torso__3.Position, l__Torso__3);
	end;
	v9 = v9 + 1;
end;
