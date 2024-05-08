-- Decompiled with the Synapse X Luau decompiler.

print("Running Drone Script");
wait();
local l__Value__1 = script.LinkedModel.Value;
local l__Debris__2 = game:GetService("Debris");
local l__Humanoid__3 = l__Value__1.Humanoid;
local l__Torso__4 = l__Value__1.Torso;
local l__Stats__5 = l__Value__1.Stats;
local v6 = { l__Value__1:findFirstChild("Left Leg"), l__Value__1:findFirstChild("Right Leg") };
local v7 = { l__Value__1:findFirstChild("Left Arm"), l__Value__1:findFirstChild("Right Arm") };
local v8 = CFrame.new(1.2, 0.3, 0.55) * CFrame.Angles(-1.9198621771937625, 0.4363323129985824, 0);
local v9 = CFrame.new(-1.2, 0.3, 0.56) * CFrame.Angles(-1.9198621771937625, -0.4363323129985824, 0);
playerStats = script.Parent.Parent.Stats;
l__Humanoid__3.MaxHealth = l__Stats__5.Health.Value * (playerStats.Difficulty.Value / 3);
l__Humanoid__3.Health = l__Humanoid__3.MaxHealth;
l__Humanoid__3.WalkSpeed = l__Stats__5.Speed.Value;
local l__Value__10 = l__Stats__5.Authority.Value;
local l__Value__11 = l__Stats__5.Range.Value;
local v12 = math.random(0, 1);
local l__Path__13 = l__Stats__5.Path;
local v14 = false;
local v15 = l__Path__13:GetChildren();
if #v15 > 0 then
	v14 = true;
end;
local v16 = {
	None = {
		damage = 0, 
		range = 0, 
		type = "Normal", 
		weldLA = CFrame.new(1.5, 0, 0) * CFrame.Angles(0, 0, 0), 
		weldRA = CFrame.new(-1.5, 0, 0) * CFrame.Angles(0, 0, 0)
	}, 
	Pistol = {
		reticle = "NormalGun", 
		spread = 0.075, 
		ammo = 16, 
		damage = 10, 
		range = 60, 
		recoil = 0.02, 
		type = "Ranged", 
		waitTime = 10, 
		weldLA = CFrame.new(1, 0.4, 0.45) * CFrame.Angles(-1.5707963267948966, 1.0471975511965976, 0), 
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0), 
		weldTool = CFrame.new(0.3, -0.2, 1.3) * CFrame.Angles(1.5707963267948966, 0, -0.2617993877991494)
	}, 
	["Machine Pistol"] = {
		reticle = "NormalGun", 
		spread = 0.15, 
		ammo = 30, 
		damage = 6, 
		range = 50, 
		recoil = 0.02, 
		type = "Ranged", 
		waitTime = 4, 
		weldLA = CFrame.new(1, 0.4, 0.45) * CFrame.Angles(-1.5707963267948966, 1.0471975511965976, 0), 
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0), 
		weldTool = CFrame.new(0.3, -1.2, 0) * CFrame.Angles(3.141592653589793, 0, -0.2617993877991494)
	}, 
	["Assault Rifle 1"] = {
		reticle = "NormalGun", 
		spread = 0.1, 
		ammo = 40, 
		damage = 6, 
		range = 70, 
		recoil = 0.02, 
		type = "Ranged", 
		waitTime = 6, 
		weldLA = CFrame.new(-0.39, 1.02, 0.8) * CFrame.Angles(-0.93, 0.13, -1.71), 
		weldRA = CFrame.new(-1.06, -0.38, 0.53) * CFrame.Angles(-1.33, -0.46, 0.14), 
		weldTool = CFrame.new(-0.15, 1.64, 0.39) * CFrame.Angles(-1.83, -1.36, -2.22)
	}, 
	Revolver = {
		reticle = "NormalGun", 
		spread = 0.05, 
		ammo = 8, 
		damage = 20, 
		range = 80, 
		recoil = 0.04, 
		type = "Ranged", 
		waitTime = 10, 
		weldLA = CFrame.new(0.63, 0.4, -0.54) * CFrame.Angles(-2.57, -0.07, 1.42), 
		weldRA = CFrame.new(-1.2, 0.2, 0.46) * CFrame.Angles(-1.5707963267948966, -0.2617993877991494, 0), 
		weldTool = CFrame.new(0.3, -1.5, -0.2) * CFrame.Angles(3.141592653589793, 0, -0.2617993877991494)
	}
};
function unanchor(p1)
	local v17 = p1:GetChildren();
	local v18 = #v17;
	local v19 = 1 - 1;
	while true do
		if v17[v19] then
			if v17[v19]:IsA("Part") then
				v17[v19].Anchored = false;
			elseif v17[v19] then
				if v17[v19]:IsA("Model") then
					unanchor(v17[v19]);
				end;
			end;
		elseif v17[v19] then
			if v17[v19]:IsA("Model") then
				unanchor(v17[v19]);
			end;
		end;
		if 0 <= 1 then
			if v19 < v18 then

			else
				break;
			end;
		elseif v18 < v19 then

		else
			break;
		end;
		v19 = v19 + 1;	
	end;
end;
unanchor(l__Value__1);
local v20 = Instance.new("BodyGyro");
v20.maxTorque = Vector3.new(4000000000000, 0, 4000000000000);
v20.P = 10000;
v20.D = 400;
v20.Parent = l__Torso__4;

function waitTime(p5)
	for i = 0, p5 do
		task.wait(0.03)
		if script.Parent.GamePause.Value then
			script.Parent.GamePause.Changed:Wait()
		end
	end
end;

local v22 = Instance.new("Weld");
v22.Part0 = l__Torso__4;
v22.Parent = l__Torso__4;
v22.Part1 = v7[1];
v22.C1 = v8;
local v23 = Instance.new("Weld");
v23.Part0 = l__Torso__4;
v23.Parent = l__Torso__4;
v23.Part1 = v7[2];
v23.C1 = v9;
l__Torso__4["Left Shoulder"].Part1 = nil;
l__Torso__4["Right Shoulder"].Part1 = nil;
local l__CurrentCamera__1 = workspace.CurrentCamera;
local l__GameItems__2 = game.ReplicatedStorage.GameItems;
function visualDamage(p3, p4, p5)
	local v24 = Instance.new("BillboardGui");
	v24.Size = UDim2.new(1, 0, 1, 0);
	v24.StudsOffset = Vector3.new(math.random(-1, 1), 1.65, math.random(-1, 1));
	local v25 = l__GameItems__2.MasterGuis.DamageFrame:clone();
	v25.Parent = v24;
	if p4 == 0 then
		v25.TextLabel.Text = "-" .. p4;
		v25.TextLabel.TextStrokeColor3 = Color3.new(0, 0, 1);
	elseif p4 < 0 then
		v25.TextLabel.Text = "+" .. p4;
		v25.TextLabel.TextStrokeColor3 = Color3.new(0, 1, 0);
	else
		v25.TextLabel.Text = "-" .. p4;
		v25.TextLabel.TextStrokeColor3 = Color3.new(1, 0, 0);
	end;
	v24.Parent = p5;
	v24.Adornee = p5;
	local l__BillboardControl__26 = v25.BillboardControl;
	l__BillboardControl__26.Billboard.Value = v24;
	l__BillboardControl__26.Parent = script.Parent;
	l__BillboardControl__26.Disabled = false;
	l__Debris__2:AddItem(v24, 5);
end;
local function u3(p6)
	local l__X__27 = p6.Position.X;
	local l__Y__28 = p6.Position.Y;
	local l__Z__29 = p6.Position.Z;
	local l__X__30 = p6.Size.X;
	local l__Y__31 = p6.Size.Y;
	local l__Z__32 = p6.Size.Z;
	local v33 = p6.CFrame - p6.CFrame.p;
	p6:Destroy();
	local v34 = Instance.new("Part");
	v34.Name = "Averter";
	v34.FormFactor = 0;
	v34.Size = Vector3.new(1, 1, 1);
	v34.BrickColor = p6.BrickColor;
	v34.Shape = 1;
	v34.BottomSurface = 0;
	v34.TopSurface = 0;
	v34.Reflectance = p6.Reflectance;
	v34.Transparency = p6.Transparency;
	v34.CanCollide = false;
	for v35 = 0, l__X__30 - 1 do
		for v36 = 0, l__Y__31 - 1 do
			for v37 = 0, l__Z__32 - 1 do
				local v38 = v34:clone();
				v38.Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
				v38.CFrame = CFrame.new(l__X__27 - (l__X__30 - 1) / 2 + v35, l__Y__28 - (l__Y__31 - 1) / 2 + v36, l__Z__29 - (l__Z__32 - 1) / 2 + v37) * v33;
				l__Debris__2:AddItem(v38, 0.5);
				v38.Parent = l__CurrentCamera__1;
			end;
		end;
	end;
end;
function normalDamage(p7, p8)
	local v39 = p7.Parent:findFirstChild("Humanoid") or p7.Parent.Parent:findFirstChild("Humanoid");
	if v39 then
		if not game.Players:findFirstChild(v39.Parent.Name) then
			if v39.Parent:findFirstChild("MainControlVRT") then
				if 0 < v39.Health then
					if not v39.Parent:findFirstChild("ForceField") then
						if v39.Parent:findFirstChild("Head") then
							local v40 = math.ceil(p8 * playerStats.Difficulty.Value / 3);
							if p7.Name == "Head" then
								v40 = math.ceil(v40 * 2);
							elseif p7.Name == "Torso" then
								v40 = math.ceil(v40 * 1.5);
							end;
							v39:TakeDamage(v40);
							visualDamage(v39, v40, v39.Parent.Head);
							return;
						end;
					end;
				end;
			else
				if p7.Name == "Glass" then
					u3(p7);
					return;
				end;
				if p7.Name == "Explosive" then
					if p7:findFirstChild("Explode") then
						p7.Explode.Value = true;
					end;
				end;
			end;
		elseif 0 < v39.Health then
			if not v39.Parent:findFirstChild("ForceField") then
				if v39.Parent:findFirstChild("Head") then
					v40 = math.ceil(p8 * playerStats.Difficulty.Value / 3);
					if p7.Name == "Head" then
						v40 = math.ceil(v40 * 2);
					elseif p7.Name == "Torso" then
						v40 = math.ceil(v40 * 1.5);
					end;
					v39:TakeDamage(v40);
					visualDamage(v39, v40, v39.Parent.Head);
					return;
				end;
			end;
		end;
	else
		if p7.Name == "Glass" then
			u3(p7);
			return;
		end;
		if p7.Name == "Explosive" then
			if p7:findFirstChild("Explode") then
				p7.Explode.Value = true;
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
local u4 = false;
local u5 = 0.1;
local u6 = l__Value__11 / 2;
function onFireNormal(p9, p10)
	u4 = true;
	local function u7(p11, p12)
		if p11 then
			if not (1 <= p11.Transparency) then
				if string.lower(p11.Name) ~= "water" then
					if p11.Name ~= "Effect" then
						if p11.Name ~= "Rocket" then
							if p11.Name ~= "Averter" then
								if p11.Parent.ClassName ~= "Hat" then
									if p11.Parent.ClassName == "Tool" then

									else
										return false;
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
	local function u8(p13, p14, p15)
		local v42, v43 = workspace:FindPartOnRay(Ray.new(p13 + p14 * 0.01, p14 * p15), l__Value__1);
		if v42 then
			if v43 then
				local v44 = p15 - (v43 - p13).magnitude;
				if u7(v42, v43) then
					if 0 < v44 then
						return u8(v43, p14, v44);
					end;
				end;
			end;
		end;
		return v42, v43;
	end;
	local v45 = (p10.Position - p9.Position).unit;
	if p10.Name ~= "Glass" then
		v45 = (CFrame.new(Vector3.new(0, 0, 0), v45) * CFrame.Angles(0, 0, math.random() * 2 * math.pi) * CFrame.Angles(math.random() * u5, 0, 0)).lookVector;
	end;
	local v46, v47 = u8(p9.Position, v45, u6);
	if script.Parent:FindFirstChild("SoundScript") then
		local v48 = Instance.new("StringValue");
		v48.Name = "Sound";
		v48.Value = "LaserShot";
		local v49 = Instance.new("ObjectValue");
		v49.Name = "Location";
		v49.Value = l__Torso__4;
		v49.Parent = v48;
		v48.Parent = script.Parent.SoundScript.Effects;
	end;
	if v47 then
		local v50 = v41:clone();
		local l__magnitude__51 = (v47 - p9.Position).magnitude;
		v50.CFrame = CFrame.new(v47, p9.Position) * CFrame.new(0, 0, -l__magnitude__51 / 2);
		local v52 = Instance.new("BlockMesh");
		v52.Scale = Vector3.new(1, 1, l__magnitude__51 - 2);
		v52.Offset = Vector3.new(0, 0, 2);
		v52.Parent = v50;
		v50.Parent = l__CurrentCamera__1;
		l__Debris__2:AddItem(v50, 0.06);
	end;
	if v46 then
		if v46.Parent then
			if v47 then
				normalDamage(v46, v16[l__Stats__5.Tool.Value].damage / 2);
			end;
		end;
	end;
	waitTime(v16[l__Stats__5.Tool.Value].waitTime);
	u4 = false;
end;
local v53 = Instance.new("Part");
v53.FormFactor = "Symmetric";
v53.Size = Vector3.new(1, 1, 1);
v53.Transparency = 1;
v53.Name = "Sensor";
v53.CanCollide = false;
local v54 = Instance.new("Weld");
v54.Name = "SensorWeld";
v54.Parent = l__Torso__4;
v54.Part0 = l__Torso__4;
v54.Part1 = v53;
v53.Parent = l__Value__1;
local u9 = false;
v53.Touched:connect(function(p16)
	if u9 and p16 and p16.Parent then
		if not l__Stats__5.Mode.Value then
			normalDamage(p16, 10, l__Stats__5.Tool.Value);
		else
			normalDamage(p16, v16[l__Stats__5.Tool.Value].damage, l__Stats__5.Tool.Value);
		end;
		u9 = false;
	end;
end);
local u10 = nil;
local u11 = v8;
local u12 = nil;
local u13 = nil;
local u14 = v9;
local u15 = nil;
local u16 = v8;
local function u17(p17, p18, p19, p20)
	local v55, v56, v57 = p17:toEulerAnglesXYZ();
	local v58, v59, v60 = p18:toEulerAnglesXYZ();
	return CFrame.new(p17.X + (p18.X - p17.X) / p20 * p19, p17.Y + (p18.Y - p17.Y) / p20 * p19, p17.Z + (p18.Z - p17.Z) / p20 * p19) * CFrame.Angles(v55 + (v58 - v55) / p20 * p19, v56 + (v59 - v56) / p20 * p19, v57 + (v60 - v57) / p20 * p19);
end;
local u18 = v9;
function fists(p21)
	u4 = true;
	if p21 == 1 then
		u10 = u11;
		u12 = CFrame.new(1.6, 1.2, 0.55) * CFrame.Angles(-1.9198621771937625, 0.6981317007977318, 0.2617993877991494);
		u13 = u14;
		u15 = CFrame.new(-1.2, -0.6, -1.56) * CFrame.Angles(-2.792526803190927, 0.2617993877991494, -1.6580627893946132);
		u9 = true;
		v54.Part0 = v7[1];
		v54.C1 = v54.C1 + Vector3.new(0, 1, 0);
		step = 6;
		local v61 = 1 - 1;
		while true do
			u16 = u17(u10, u12, v61, step);
			u18 = u17(u13, u15, v61, step);
			waitTime(1);
			if 0 <= 1 then
				if v61 < step then

				else
					break;
				end;
			elseif step < v61 then

			else
				break;
			end;
			v61 = v61 + 1;		
		end;
		waitTime(1);
		step = 8;
		local v62 = 1 - 1;
		while true do
			u16 = u17(u12, u10, v62, step);
			u18 = u17(u15, u13, v62, step);
			waitTime(1);
			if 0 <= 1 then
				if v62 < step then

				else
					break;
				end;
			elseif step < v62 then

			else
				break;
			end;
			v62 = v62 + 1;		
		end;
		v54.Part0 = l__Torso__4;
		v54.C1 = v54.C1 - Vector3.new(0, 1, 0);
		u9 = false;
	else
		u10 = u11;
		u12 = CFrame.new(1.2, -0.6, -1.56) * CFrame.Angles(-2.792526803190927, -0.2617993877991494, 1.6580627893946132);
		u13 = u14;
		u15 = CFrame.new(-1.6, 1.2, 0.55) * CFrame.Angles(-1.9198621771937625, -0.6981317007977318, -0.2617993877991494);
		u9 = true;
		v54.Part0 = v7[2];
		v54.C1 = v54.C1 + Vector3.new(0, 1, 0);
		step = 6;
		local v63 = 1 - 1;
		while true do
			u16 = u17(u10, u12, v63, step);
			u18 = u17(u13, u15, v63, step);
			waitTime(1);
			if 0 <= 1 then
				if v63 < step then

				else
					break;
				end;
			elseif step < v63 then

			else
				break;
			end;
			v63 = v63 + 1;		
		end;
		waitTime(1);
		step = 8;
		local v64 = 1 - 1;
		while true do
			u16 = u17(u12, u10, v64, step);
			u18 = u17(u15, u13, v64, step);
			waitTime(1);
			if 0 <= 1 then
				if v64 < step then

				else
					break;
				end;
			elseif step < v64 then

			else
				break;
			end;
			v64 = v64 + 1;		
		end;
		v54.Part0 = l__Torso__4;
		v54.C1 = v54.C1 - Vector3.new(0, 1, 0);
		u9 = false;
	end;
	waitTime(2);
	u4 = false;
end;
local u19 = true;
local u20 = 0;
local u21 = 0.005;
local u22 = 0.07;
function getTransition()
	if u19 then
		u20 = u20 + u21;
		if u22 < u20 then

		else
			return;
		end;
	else
		u20 = u20 - u21;
		if u20 < -u22 then
			u19 = not u19;
		end;
		return;
	end;
	u19 = not u19;
end;
local l__Head__23 = l__Value__1.Head;
local u24 = 0;
local l__Neck__25 = l__Torso__4.Neck;
local u26 = "Standing";
function updateAim()
	local v65 = l__Head__23.CFrame.lookVector + l__Head__23.Position;
	local l__Position__66 = l__Head__23.Position;
	local v67 = (l__Position__66.y - v65.y) / (l__Position__66 - v65).magnitude;
	if 0.16 < u24 - v67 then
		v67 = u24 - 0.16;
	elseif u24 - v67 < -0.16 then
		v67 = u24 + 0.16;
	end;
	u24 = v67;
	l__Neck__25.C0 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0) * CFrame.Angles(v67, 0, 0);
	if v7 then
		if u26 ~= "Standing" then
			u22 = 0.03;
			u21 = 0.005;
			if u26 == "Running" then
				u22 = u22 * 5;
				u21 = u21 * 4;
			elseif u26 ~= "Pacing" then
				if u26 == "Following" then
					u22 = u22 * 2;
					u21 = u21 * 2;
				end;
			else
				u22 = u22 * 2;
				u21 = u21 * 2;
			end;
			getTransition();
		else
			u22 = 0;
			u21 = 0;
			getTransition();
		end;
		v22.C1 = u16 * CFrame.new(u20, math.abs(v67 * 0.4), -1.4 * v67 - 0.2) * CFrame.Angles(v67 * 1.2, u20 / 5, u20 / 5);
		v23.C1 = u18 * CFrame.new(u20, math.abs(v67 * 0.4), -1.4 * v67 - 0.2) * CFrame.Angles(v67 * 1.2, u20 / 5, u20 / 5);
	end;
end;
local u27 = false;
local u28 = nil;
local u29 = nil;
local u30 = 0.3;
function getCurrentTool()
	u27 = false;
	u10 = u16;
	u12 = CFrame.new(1.29, 0, 0.34) * CFrame.Angles(-0.52, 0, -0.17);
	u13 = u18;
	u15 = CFrame.new(-1.29, 0, 0.34) * CFrame.Angles(-0.52, 0, 0.17);
	step = 6;
	local v68 = 1 - 1;
	while true do
		u16 = u17(u10, u12, v68, step);
		u18 = u17(u13, u15, v68, step);
		waitTime(1);
		if 0 <= 1 then
			if v68 < step then

			else
				break;
			end;
		elseif step < v68 then

		else
			break;
		end;
		v68 = v68 + 1;	
	end;
	if u28 then
		u28:Destroy();
	end;
	if u29 then
		u29:Destroy();
	end;
	if l__Stats__5.Mode.Value then
		if l__Stats__5.Tool.Value ~= "None" then
			l__Stats__5.Spread.Value = v16[l__Stats__5.Tool.Value].spread;
			u5 = l__Stats__5.Spread.Value;
			u30 = l__Stats__5.Spread.Value * (4 - l__Stats__5.Spread.Value * 10);
			l__Stats__5.Ammo.Value = v16[l__Stats__5.Tool.Value].ammo;
			u11 = v16[l__Stats__5.Tool.Value].weldLA;
			u14 = v16[l__Stats__5.Tool.Value].weldRA;
			u16 = u11;
			u18 = u14;
			u28 = l__GameItems__2.MasterTools[l__Stats__5.Tool.Value]:clone();
			u29 = Instance.new("Weld");
			u29.Part0 = v7[2];
			u29.Parent = v7[2];
			u29.Part1 = u28;
			u29.C1 = v16[l__Stats__5.Tool.Value].weldTool;
			u28.Parent = l__Value__1;
			u10 = u16;
			u13 = u18;
			local v69 = 1 - 1;
			while true do
				u16 = u17(u12, u10, v69, step);
				u18 = u17(u15, u13, v69, step);
				waitTime(1);
				if 0 <= 1 then
					if v69 < step then

					else
						break;
					end;
				elseif step < v69 then

				else
					break;
				end;
				v69 = v69 + 1;			
			end;
		else
			l__Stats__5.Spread.Value = 0;
			u5 = l__Stats__5.Spread.Value;
			u30 = l__Stats__5.Spread.Value * 4;
			u11 = v16[l__Stats__5.Tool.Value].weldLA;
			u14 = v16[l__Stats__5.Tool.Value].weldRA;
			u16 = u11;
			u18 = u14;
			u10 = u16;
			u13 = u18;
			local v70 = 1 - 1;
			while true do
				u16 = u17(u12, u10, v70, step);
				u18 = u17(u15, u13, v70, step);
				waitTime(1);
				if 0 <= 1 then
					if v70 < step then

					else
						break;
					end;
				elseif step < v70 then

				else
					break;
				end;
				v70 = v70 + 1;			
			end;
		end;
	else
		l__Stats__5.Spread.Value = 0;
		u5 = l__Stats__5.Spread.Value;
		u30 = l__Stats__5.Spread.Value * 4;
		u11 = v8;
		u14 = v9;
		u16 = u11;
		u18 = u14;
		u10 = u16;
		u13 = u18;
		local v71 = 1 - 1;
		while true do
			u16 = u17(u12, u10, v71, step);
			u18 = u17(u15, u13, v71, step);
			waitTime(1);
			if 0 <= 1 then
				if v71 < step then

				else
					break;
				end;
			elseif step < v71 then

			else
				break;
			end;
			v71 = v71 + 1;		
		end;
	end;
	u27 = true;
end;
local u31 = false;
function runGettingTool()
	if u31 then
		return;
	end;
	print("Get tool");
	u31 = true;
	getCurrentTool();
	waitTime(1);
	u31 = false;
end;
l__Stats__5.Tool.Changed:connect(function()
	if l__Stats__5.Mode.Value then
		runGettingTool();
		return;
	end;
	l__Stats__5.Mode.Value = true;
end);
l__Stats__5.Mode.Changed:connect(function()
	runGettingTool();
end);
runGettingTool();
l__Humanoid__3.Died:connect(function()
	coroutine.resume(coroutine.create(function()
		waitTime(400);
		l__Value__1:Destroy();
	end));
	waitTime(1);
	if l__Value__1:findFirstChild("Torso") and l__Torso__4.Position.y > -20 then
		local v72 = Instance.new("Explosion");
		v72.Position = l__Torso__4.Position;
		v72.BlastPressure = 0;
		v72.BlastRadius = 5;
		v72.Parent = l__CurrentCamera__1;
		l__Debris__2:AddItem(v72, 3);
		l__Value__1:BreakJoints();
		local v73 = script.Parent:FindFirstChild("SoundScript");
		if v73 then
			v73 = Instance.new("StringValue");
			v73.Name = "Sound";
			v73.Value = "RoboticExplosion";
			local v74 = Instance.new("ObjectValue");
			v74.Name = "Location";
			v74.Value = l__Torso__4;
			v74.Parent = v73;
			v73.Parent = script.Parent.SoundScript.Effects;
		end;
		local function u32(p22)
			local v75 = p22:GetChildren();
			for v76 = 1, #v75 do
				if v75[v76] and v75[v76]:IsA("Part") then
					v75[v76].Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
				elseif v75[v76] and v75[v76]:IsA("Model") then
					u32(v75[v76]);
				end;
			end;
		end;
		u32(l__Value__1);
		if l__CurrentCamera__1:findFirstChild("Level") and l__CurrentCamera__1.Level:findFirstChild("Tool") and l__GameItems__2.MasterTools:findFirstChild(l__Stats__5.Tool.Value) then
			local v77 = l__GameItems__2.MasterTools[l__Stats__5.Tool.Value]:clone();
			v77.CanCollide = true;
			v77.CFrame = l__Torso__4.CFrame;
			coroutine.resume(coroutine.create(function()
				while true do
					wait(0.09);
					if v77.Velocity.magnitude < 0.1 then
						break;
					end;				
				end;
				v77.Anchored = true;
			end));
			v77.Parent = l__CurrentCamera__1.Level.Tool;
			v77.Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
		end;
		if l__Stats__5.Counter.Value then
			l__Stats__5.Counter.Value.Value = l__Stats__5.Counter.Value.Value - 1;
		end;
		script.LinkedModel.Value = nil;
		waitTime(500);
		script:Destroy();
	end;
end);
local u33 = false;
l__Torso__4.Touched:connect(function(p23)
	if p23 and p23.Parent and p23.Transparency < 1 and p23.CanCollide then
		local v78 = p23.Parent:findFirstChild("Humanoid") or p23.Parent.Parent:findFirstChild("Humanoid");
		if v78 then
			if v78.Health > 0 and not v78.Parent:findFirstChild("MainControlNPC") then
				u33 = true;
				return;
			end;
		else
			l__Humanoid__3.Jump = true;
			if math.random(1, 2) % 2 then
				l__Torso__4.Velocity = l__Torso__4.Velocity + Vector3.new(0, 0, 10 * (math.random(0, 1) * 2 - 1));
				return;
			end;
			l__Torso__4.Velocity = l__Torso__4.Velocity + Vector3.new(10 * (math.random(0, 1) * 2 - 1), 0, 0);
		end;
	end;
end);
local u34 = false;
l__Head__23.Touched:connect(function(p24)
	if p24 and p24.Parent and p24.Transparency < 1 and p24.CanCollide then
		local v79 = p24.Parent:findFirstChild("Humanoid") or p24.Parent.Parent:findFirstChild("Humanoid");
		if v79 then
			if v79.Health > 0 and not v79.Parent:findFirstChild("MainControlNPC") then
				u34 = true;
				return;
			end;
		elseif not u33 then

		end;
	end;
end);
local u35 = 0;
l__Torso__4.TouchEnded:connect(function(p25)
	if p25 and p25.Parent and p25.Transparency < 1 and p25.CanCollide then
		local v80 = p25.Parent:findFirstChild("Humanoid") or p25.Parent.Parent:findFirstChild("Humanoid");
		if v80 and (game.Players:findFirstChild(v80.Parent.Name) and v80.Health > 0) and not v80.Parent:findFirstChild("MainControlNPC") then
			u33 = false;
			if not u34 then
				u35 = 0;
			end;
		end;
	end;
end);
l__Head__23.TouchEnded:connect(function(p26)
	if p26 and p26.Parent and p26.Transparency < 1 and p26.CanCollide then
		local v81 = p26.Parent:findFirstChild("Humanoid") or p26.Parent.Parent:findFirstChild("Humanoid");
		if v81 and (game.Players:findFirstChild(v81.Parent.Name) and v81.Health > 0) and not v81.Parent:findFirstChild("MainControlNPC") then
			u34 = false;
			if not u33 then
				u35 = 0;
			end;
		end;
	end;
end);
local l__UnderAttack__36 = l__Stats__5.UnderAttack;
local u37 = 0;
l__Humanoid__3.ChildAdded:connect(function()
	if l__Humanoid__3:findFirstChild("creator") and not l__UnderAttack__36.Value then
		l__UnderAttack__36.Value = true;
		u37 = 10;
	end;
end);
l__Humanoid__3.ChildRemoved:connect(function()
	if not l__Humanoid__3:findFirstChild("creator") and l__UnderAttack__36.Value then
		l__UnderAttack__36.Value = false;
	end;
end);
local v82 = Instance.new("Part");
v82.Name = "Home";
v82.Transparency = 1;
v82.CanCollide = false;
v82.Anchored = true;
v82.CFrame = CFrame.new(l__Torso__4.Position);
v82.Parent = l__Value__1;
local u38 = 0;
function followEnemy(p27)
	local l__magnitude__83 = (p27.Position - l__Torso__4.Position).magnitude;
	if l__magnitude__83 < 10 then
		l__Humanoid__3.WalkSpeed = l__Stats__5.Speed.Value - (10 - l__magnitude__83) * (10 - l__magnitude__83) / (l__magnitude__83 * 100) * l__Stats__5.Speed.Value;
		if l__magnitude__83 < 5 then
			if u26 == "Pacing" then

			else
				return;
			end;
		else
			return;
		end;
	else
		l__Humanoid__3.WalkSpeed = l__Stats__5.Speed.Value;
		return;
	end;
	u38 = 0;
end;
function DirectionRayIgnoreCheck(p28, p29)
	if p28 then
		if p28.Name == "Glass" then

		elseif p28.Name == "Averter" then
			return true;
		else
			return false;
		end;
	else
		return false;
	end;
	if (p28.Position - l__Torso__4.Position).magnitude < u6 * 1.5 then
		if checkSight(p29) then
			onFireNormal(l__Head__23, p28);
		end;
	end;
	return true;
end;
function DirectionRayCast(p30, p31, p32)
	local v84, v85 = workspace:FindPartOnRay(Ray.new(p30, p31 * p32), l__Value__1);
	if v84 then
		if v85 then
			local v86 = p32 - (v85 - p30).magnitude;
			if DirectionRayIgnoreCheck(v84, v85) then
				if 0 < v86 then
					--return DirectionRayCast(v85, p31, v86);
				end;
			end;
		end;
	end;
	return v84, v85;
end;
function checkSight(p33)
	local v87 = Instance.new("Part");
	v87.Name = "Sight1";
	v87.Size = Vector3.new(1, 1, 1);
	v87.CanCollide = false;
	v87.Transparency = 1;
	local v88 = Instance.new("Weld");
	v88.Parent = l__Torso__4;
	v88.Part0 = l__Torso__4;
	v88.Part1 = v87;
	v88.C1 = v88.C1 + Vector3.new(16, 0, 12);
	v87.Parent = l__Value__1;
	local v89 = Instance.new("Part");
	v89.Name = "Sight2";
	v89.Size = Vector3.new(1, 1, 1);
	v89.CanCollide = false;
	v89.Transparency = 1;
	local v90 = Instance.new("Weld");
	v90.Parent = l__Torso__4;
	v90.Part0 = l__Torso__4;
	v90.Part1 = v89;
	v90.C1 = v90.C1 + Vector3.new(-16, 0, 12);
	v89.Parent = l__Value__1;
	local v91 = v87.Position - l__Torso__4.Position;
	local v92 = v89.Position - l__Torso__4.Position;
	local v93 = math.acos((v91.X * v92.X + v91.Y * v92.Y + v91.Z * v92.Z) / (v91.magnitude * v92.magnitude + 0.001));
	local v94 = Vector3.new(p33.X, 0, p33.Z) - l__Torso__4.Position;
	local v95 = v87.Position - l__Torso__4.Position;
	local v96 = math.acos((v94.X * v95.X + v94.Y * v95.Y + v94.Z * v95.Z) / (v94.magnitude * v95.magnitude + 0.001));
	local v97 = Vector3.new(p33.X, 0, p33.Z) - l__Torso__4.Position;
	local v98 = v89.Position - l__Torso__4.Position;
	local v99 = math.acos((v97.X * v98.X + v97.Y * v98.Y + v97.Z * v98.Z) / (v97.magnitude * v98.magnitude + 0.001));
	v87:Destroy();
	v88:Destroy();
	v89:Destroy();
	v90:Destroy();
	if v96 < v93 then
		if v99 < v93 then
			return true;
		end;
	end;
	return false;
end;
local u39 = nil;
local u40 = 0;
local l__Value__41 = l__Stats__5.Agressive.Value;
function findNearestTorso(p34)
	local v100 = l__CurrentCamera__1:getChildren();
	if l__CurrentCamera__1:findFirstChild("Level") then
		if l__CurrentCamera__1.Level:findFirstChild("NPC") then
			local v101 = l__CurrentCamera__1.Level.NPC:getChildren();
			local v102 = #v101;
			local v103 = 1 - 1;
			while true do
				if v101[v103]:IsA("Model") then
					if v101[v103]:findFirstChild("Humanoid") then
						if v101[v103]:findFirstChild("MainControlVRT") then
							table.insert(v100, v101[v103]);
						end;
					end;
				end;
				if 0 <= 1 then
					if v103 < v102 then

					else
						break;
					end;
				elseif v102 < v103 then

				else
					break;
				end;
				v103 = v103 + 1;			
			end;
		end;
	end;
	local v104 = #v100;
	local v105 = 1 - 1;
	while true do
		if v100[v105] then
			if v100[v105]:IsA("Model") then
				if v100[v105] ~= l__Value__1 then
					if not l__Value__41 then
						if l__UnderAttack__36.Value then
							local v106 = v100[v105]:findFirstChild("Torso");
							local v107 = v100[v105]:findFirstChild("Humanoid");
							if v106 then
								if v107 then
									if not v100[v105]:findFirstChild("MainControlNPC") then
										if (v106.Position - p34).magnitude <= l__Value__11 then
											if 0 < v107.Health then
												if math.abs(v106.Position.Y - p34.Y) < 16 then
													local v108, v109 = DirectionRayCast(p34, (v106.Position - p34).unit, l__Value__11);
													local v110 = false;
													if v108 then
														if v108:IsDescendantOf(v100[v105]) then
															v110 = true;
														end;
													end;
													if not v110 then
														if l__UnderAttack__36.Value then
															if u39 then
																if v110 then
																	if (v106.Position - p34).magnitude < (u39.Position - p34).magnitude then
																		u40 = 10;
																		u39 = v106;
																	elseif v106 == u39 then
																		u40 = 10;
																	end;
																elseif not l__UnderAttack__36.Value then
																	if (v106.Position - p34).magnitude < 4 then
																		u40 = 10;
																		u39 = v106;
																	elseif checkSight(v109) then
																		u40 = 10;
																		u39 = v106;
																	end;
																else
																	u40 = 10;
																	u39 = v106;
																end;
															elseif not l__UnderAttack__36.Value then
																if (v106.Position - p34).magnitude < 4 then
																	u40 = 10;
																	u39 = v106;
																elseif checkSight(v109) then
																	u40 = 10;
																	u39 = v106;
																end;
															else
																u40 = 10;
																u39 = v106;
															end;
														elseif v106 == u39 then
															if u39 then
																u40 = u40 - 1;
																if u40 < -40 then
																	u39 = nil;
																	l__UnderAttack__36.Value = false;
																elseif u40 ~= 0 then
																	if u40 ~= -10 then
																		if u40 ~= -20 then
																			if u40 == -30 then
																				calculatePacing();
																			end;
																		else
																			calculatePacing();
																		end;
																	else
																		calculatePacing();
																	end;
																else
																	calculatePacing();
																end;
															end;
														end;
													elseif u39 then
														if v110 then
															if (v106.Position - p34).magnitude < (u39.Position - p34).magnitude then
																u40 = 10;
																u39 = v106;
															elseif v106 == u39 then
																u40 = 10;
															end;
														elseif not l__UnderAttack__36.Value then
															if (v106.Position - p34).magnitude < 4 then
																u40 = 10;
																u39 = v106;
															elseif checkSight(v109) then
																u40 = 10;
																u39 = v106;
															end;
														else
															u40 = 10;
															u39 = v106;
														end;
													elseif not l__UnderAttack__36.Value then
														if (v106.Position - p34).magnitude < 4 then
															u40 = 10;
															u39 = v106;
														elseif checkSight(v109) then
															u40 = 10;
															u39 = v106;
														end;
													else
														u40 = 10;
														u39 = v106;
													end;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
					else
						v106 = v100[v105]:findFirstChild("Torso");
						v107 = v100[v105]:findFirstChild("Humanoid");
						if v106 then
							if v107 then
								if not v100[v105]:findFirstChild("MainControlNPC") then
									if (v106.Position - p34).magnitude <= l__Value__11 then
										if 0 < v107.Health then
											if math.abs(v106.Position.Y - p34.Y) < 16 then
												v108, v109 = DirectionRayCast(p34, (v106.Position - p34).unit, l__Value__11);
												v110 = false;
												if v108 then
													if v108:IsDescendantOf(v100[v105]) then
														v110 = true;
													end;
												end;
												if not v110 then
													if l__UnderAttack__36.Value then
														if u39 then
															if v110 then
																if (v106.Position - p34).magnitude < (u39.Position - p34).magnitude then
																	u40 = 10;
																	u39 = v106;
																elseif v106 == u39 then
																	u40 = 10;
																end;
															elseif not l__UnderAttack__36.Value then
																if (v106.Position - p34).magnitude < 4 then
																	u40 = 10;
																	u39 = v106;
																elseif checkSight(v109) then
																	u40 = 10;
																	u39 = v106;
																end;
															else
																u40 = 10;
																u39 = v106;
															end;
														elseif not l__UnderAttack__36.Value then
															if (v106.Position - p34).magnitude < 4 then
																u40 = 10;
																u39 = v106;
															elseif checkSight(v109) then
																u40 = 10;
																u39 = v106;
															end;
														else
															u40 = 10;
															u39 = v106;
														end;
													elseif v106 == u39 then
														if u39 then
															u40 = u40 - 1;
															if u40 < -40 then
																u39 = nil;
																l__UnderAttack__36.Value = false;
															elseif u40 ~= 0 then
																if u40 ~= -10 then
																	if u40 ~= -20 then
																		if u40 == -30 then
																			calculatePacing();
																		end;
																	else
																		calculatePacing();
																	end;
																else
																	calculatePacing();
																end;
															else
																calculatePacing();
															end;
														end;
													end;
												elseif u39 then
													if v110 then
														if (v106.Position - p34).magnitude < (u39.Position - p34).magnitude then
															u40 = 10;
															u39 = v106;
														elseif v106 == u39 then
															u40 = 10;
														end;
													elseif not l__UnderAttack__36.Value then
														if (v106.Position - p34).magnitude < 4 then
															u40 = 10;
															u39 = v106;
														elseif checkSight(v109) then
															u40 = 10;
															u39 = v106;
														end;
													else
														u40 = 10;
														u39 = v106;
													end;
												elseif not l__UnderAttack__36.Value then
													if (v106.Position - p34).magnitude < 4 then
														u40 = 10;
														u39 = v106;
													elseif checkSight(v109) then
														u40 = 10;
														u39 = v106;
													end;
												else
													u40 = 10;
													u39 = v106;
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
			if v105 < v104 then

			else
				break;
			end;
		elseif v104 < v105 then

		else
			break;
		end;
		v105 = v105 + 1;	
	end;
end;
local u42 = false;
function checkAmmo()
	if l__Stats__5.Ammo.Value < 1 then
		u42 = true;
		l__Humanoid__3.WalkSpeed = 0;
		l__Stats__5.Tool.Value = "None";
		waitTime(1);
		l__Stats__5.Tool.Value = l__Stats__5.Tool.Value;
		l__Humanoid__3.WalkSpeed = l__Stats__5.Speed.Value;
		u42 = false;
	end;
end;
l__Stats__5.Ammo.Changed:connect(function()
	checkAmmo();
end);
local u43 = nil;
function calculatePacing()
	if not u39 then
		if v14 then
			v82.CFrame = CFrame.new(l__Path__13[tostring(l__Path__13.Value)].Value);
			l__Path__13.Value = l__Path__13.Value + 1;
			if #v15 < l__Path__13.Value then
				l__Path__13.Value = 1;
			end;
		else
			v82.CFrame = CFrame.new(l__Torso__4.Position) + Vector3.new(math.random(-30, 30), 0, math.random(-30, 30));
		end;
	else
		v82.CFrame = CFrame.new(u39.Position) + Vector3.new(12 * (math.random(0, 1) * 2 - 1), 0, 12 * (math.random(0, 1) * 2 - 1));
	end;
	u43 = v82;
	local v111, v112 = DirectionRayCast(l__Torso__4.Position, (v82.Position - l__Torso__4.Position).unit, l__Value__11);
	if (v112 - l__Torso__4.Position).magnitude < (v82.CFrame.p - l__Torso__4.Position).magnitude then
		v82.CFrame = CFrame.new(v112);
	end;
end;
function enemyLost()
	if not l__Stats__5.Mode.Value then
		l__Stats__5.Mode.Value = true;
	end;
	if u38 <= 0 then
		if v14 then
			if #v15 <= 1 then
				if u43 then
					if (u43.Position - l__Torso__4.Position).magnitude < 3 then
						u26 = "Standing";
					else
						u26 = "Pacing";
					end;
				else
					u26 = "Pacing";
				end;
			else
				u26 = "Pacing";
			end;
		else
			u26 = "Pacing";
		end;
		u38 = 60;
		calculatePacing();
		return;
	end;
	if v14 then
		if #v15 <= 1 then
			if u43 then
				if (u43.Position - l__Torso__4.Position).magnitude < 3 then
					u26 = "Standing";
				else
					u26 = "Pacing";
				end;
			else
				u26 = "Pacing";
			end;
		else
			u26 = "Pacing";
		end;
	else
		u26 = "Pacing";
	end;
	u38 = u38 - 1;
end;
l__Stats__5.EnemyFound.Changed:connect(function()
	if not l__Stats__5.EnemyFound.Value then
		u38 = 12;
		u26 = "Standing";
		u43 = nil;
		enemyLost();
	end;
end);
local u44 = l__Stats__5.OffsetMaxX.Value + l__Torso__4.Position.X;
local u45 = l__Stats__5.OffsetMaxZ.Value + l__Torso__4.Position.Z;
local u46 = l__Stats__5.OffsetMinX.Value + l__Torso__4.Position.X;
local u47 = l__Stats__5.OffsetMinZ.Value + l__Torso__4.Position.Z;
local u48 = l__Torso__4["Right Hip"];
local u49 = l__Torso__4["Left Hip"];
function move(p35)
	if u26 ~= "Following" then
		if u26 == "Pacing" then
			if 0 < l__Humanoid__3.WalkSpeed then
				if not (1.5 < u48.CurrentAngle) then
					if u48.CurrentAngle < -1.5 then
						u48.MaxVelocity = 0.75;
					else
						u48.MaxVelocity = 0.15;
					end;
				else
					u48.MaxVelocity = 0.75;
				end;
				if not (1.5 < u49.CurrentAngle) then
					if u49.CurrentAngle < -1.5 then
						u49.MaxVelocity = 0.75;
					else
						u49.MaxVelocity = 0.15;
					end;
				else
					u49.MaxVelocity = 0.75;
				end;
				local v113 = 1;
				local v114 = 9;
			else
				v113 = 0.1;
				v114 = 1;
			end;
		else
			v113 = 0.1;
			v114 = 1;
		end;
	elseif 0 < l__Humanoid__3.WalkSpeed then
		if not (1.5 < u48.CurrentAngle) then
			if u48.CurrentAngle < -1.5 then
				u48.MaxVelocity = 0.75;
			else
				u48.MaxVelocity = 0.15;
			end;
		else
			u48.MaxVelocity = 0.75;
		end;
		if not (1.5 < u49.CurrentAngle) then
			if u49.CurrentAngle < -1.5 then
				u49.MaxVelocity = 0.75;
			else
				u49.MaxVelocity = 0.15;
			end;
		else
			u49.MaxVelocity = 0.75;
		end;
		v113 = 1;
		v114 = 9;
	else
		v113 = 0.1;
		v114 = 1;
	end;
	local v115 = v113 * math.sin(p35 * v114);
	u48:SetDesiredAngle(-v115);
	u49:SetDesiredAngle(-v115);
end;
local function u50()
	u26 = "Following";
	if u40 >= 0 then
		u43 = u39;
	end;
	local l__magnitude__116 = (u39.Position - l__Torso__4.Position).magnitude;
	if u27 and not u42 and l__magnitude__116 < u6 and not u4 and checkSight(u39.Position) and u39.Parent:findFirstChild("Humanoid") and (u39.Parent.Humanoid.Health > 0 or u39.Parent.Humanoid.MaxHealth == 0) then
		if l__Stats__5.Mode.Value and u28 and l__Stats__5.Ammo.Value > 0 then
			coroutine.resume(coroutine.create(function()
				onFireNormal(u28, u39);
			end));
			l__Stats__5.Ammo.Value = l__Stats__5.Ammo.Value - 1;
		elseif not l__Stats__5.Mode.Value then
			local l__unit__117 = l__Head__23.CFrame.lookVector.unit;
			l__Torso__4.Velocity = Vector3.new(l__magnitude__116 * 7 * l__unit__117.x, l__Torso__4.Velocity.y, l__magnitude__116 * 7 * l__unit__117.z);
			coroutine.resume(coroutine.create(function()
				fists(math.random(1, 2));
			end));
		end;
		if l__magnitude__116 < 10 then
			l__Stats__5.Mode.Value = false;
			return;
		else
			l__Stats__5.Mode.Value = true;
			return;
		end;
	end;
	if l__Value__11 < l__magnitude__116 and u37 == 0 then
		if u39 then
			u40 = u40 - 1;
			if u40 < -40 then
				u39 = nil;
				l__UnderAttack__36.Value = false;
				return;
			end;
			if u40 == 0 or u40 == -10 or u40 == -20 or u40 == -30 then
				calculatePacing();
				return;
			end;
		end;
	elseif u39.Parent.Humanoid.Health < 1 and u39.Parent.Humanoid.MaxHealth ~= 0 then
		u39 = nil;
	end;
end;
local function u51(p36)
	if u44 < l__Torso__4.Position.X or u45 < l__Torso__4.Position.Z or l__Torso__4.Position.X < u46 or l__Torso__4.Position.Z < u47 then
		if v14 then
			v82.CFrame = CFrame.new(l__Path__13[tostring(l__Path__13.Value)].Value);
			p36 = v82;
			u38 = 60;
			local v118, v119 = DirectionRayCast(l__Torso__4.Position, (v82.Position - l__Torso__4.Position).unit, l__Value__11);
		else
			v82.CFrame = CFrame.new((u44 + u46) / 2, l__Torso__4.Position.Y, (u45 + u47) / 2);
			p36 = v82;
			u38 = 80;
			local v120, v121 = DirectionRayCast(l__Torso__4.Position, (v82.Position - l__Torso__4.Position).unit, l__Value__11);
		end;
		if nil then
			wait();
			if math.random(1, 2) % 2 then
				local v122 = (u45 + u47) / 2;
				v82.CFrame = CFrame.new(l__Torso__4.Position.X, l__Torso__4.Position.Y, math.random(v122 - 4, v122 + 4));
				p36 = v82;
				local v123, v124 = DirectionRayCast(l__Torso__4.Position, (v82.Position - l__Torso__4.Position).unit, l__Value__11);
				local v125 = v123;
			else
				local v126 = (u44 + u46) / 2;
				v82.CFrame = CFrame.new(math.random(v126 - 4, v126 + 4), l__Torso__4.Position.Y, l__Torso__4.Position.Z);
				p36 = v82;
				local v127, v128 = DirectionRayCast(l__Torso__4.Position, (v82.Position - l__Torso__4.Position).unit, l__Value__11);
				v125 = v127;
			end;
			if v125 then
				v82.CFrame = CFrame.new((u44 + u46) / 2, l__Torso__4.Position.Y, (u45 + u47) / 2);
				p36 = v82;
			end;
		end;
	end;
	l__Humanoid__3:MoveTo(p36.Position, p36);
end;
function runBot(p37)
	local v129 = nil;
	move(p37);
	if 0 < l__Humanoid__3.Health then

	else
		u26 = "Standing";
		u43 = nil;
		return;
	end;
	u37 = u37 + 1;
	if 9 < u37 then
		u37 = 0;
		findNearestTorso(l__Torso__4.Position);
	end;
	if u39 then
		l__Stats__5.State.Value = 2;
		l__Stats__5.EnemyFound.Value = true;
		u50();
	else
		if l__Value__41 then
			l__Stats__5.State.Value = 1;
		else
			l__Stats__5.State.Value = 0;
		end;
		if l__Stats__5.EnemyFound.Value then
			l__Stats__5.EnemyFound.Value = false;
		else
			enemyLost();
		end;
	end;
	if u43 then
		u51(u43);
		followEnemy(u43);
	else
		u51(l__Torso__4);
	end;
	updateAim();
	if not u33 then
		if u34 then
			print(u35);
			u35 = u35 + 1;
		end;
	else
		print(u35);
		u35 = u35 + 1;
	end;
	if 10 < u35 then
		l__UnderAttack__36.Value = true;
	end;
	local v130, v131, v132 = l__Torso__4.CFrame:toEulerAnglesXYZ();
	v129 = math.deg(v131 + math.pi / 2);
	if 0 < l__Torso__4.CFrame.lookVector.Z then
		local v133 = v129 + 180;
	else
		v133 = 180 - v129;
	end;
	l__Stats__5.RadarRotation.Value = math.ceil(v133 + 180);
end;
if l__Stats__5.WaitTime.Value > 0 then
	wait(l__Stats__5.WaitTime.Value);
end;
while l__Value__1 and l__Value__1.Parent do
	local v134, v135 = wait();
	if not l__Value__1 then
		break;
	end;
	if not l__Value__1.Parent then
		break;
	end;
	if script.Parent:findFirstChild("LocalScript") and script.Parent.LocalScript:findFirstChild("LocalPause") then
		if not script.Parent.LocalScript.LocalPause.Value or l__CurrentCamera__1.CameraType == "Scriptable" then
			if l__Humanoid__3.WalkSpeed == 0 then
				l__Humanoid__3.WalkSpeed = l__Stats__5.Speed.Value;
			end;
			runBot(v135);
			for v136 = 1, 3 do
				wait();
				if not l__Value__1 then
					break;
				end;
				if not l__Value__1.Parent then
					break;
				end;
				updateAim();
			end;
		elseif l__Humanoid__3.WalkSpeed ~= 0 then
			l__Humanoid__3.WalkSpeed = 0;
		end;
	else
		runBot(v135);
	end;
end;
script:Destroy();
