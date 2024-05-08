-- Decompiled with the Synapse X Luau decompiler.

function waitForChild(p1, p2)
	local v1 = nil;
	local v2 = p1:findFirstChild(p2);
	if v2 then
		return v2;
	end;
	while true do
		v1 = p1.ChildAdded:wait();
		if v1.Name == p2 then
			break;
		end;	
	end;
	return v1;
end;
local l__Value__3 = script.LinkedModel.Value;
local v4 = waitForChild(l__Value__3, "Torso");
local v5 = waitForChild(v4, "Right Shoulder");
local v6 = waitForChild(v4, "Left Shoulder");
local v7 = waitForChild(v4, "Right Hip");
local v8 = waitForChild(v4, "Left Hip");
local v9 = waitForChild(v4, "Neck");
local v10 = waitForChild(l__Value__3, "Humanoid");
math.randomseed(tick());
local u1 = {};
function configureAnimationSet(p3, p4)
	if u1[p3] ~= nil then
		local v11, v12, v13 = pairs(u1[p3].connections);
		while true do
			local v14, v15 = v11(v12, v13);
			if v14 then

			else
				break;
			end;
			v13 = v14;
			v15:disconnect();		
		end;
	end;
	u1[p3] = {};
	u1[p3].count = 0;
	u1[p3].totalWeight = 0;
	u1[p3].connections = {};
	local v16 = script:FindFirstChild(p3);
	if v16 ~= nil then
		table.insert(u1[p3].connections, v16.ChildAdded:connect(function(p5)
			configureAnimationSet(p3, p4);
		end));
		table.insert(u1[p3].connections, v16.ChildRemoved:connect(function(p6)
			configureAnimationSet(p3, p4);
		end));
		local v17 = 1;
		local v18, v19, v20 = pairs(v16:GetChildren());
		while true do
			local v21, v22 = v18(v19, v20);
			if v21 then

			else
				break;
			end;
			v20 = v21;
			if v22:IsA("Animation") then
				table.insert(u1[p3].connections, v22.Changed:connect(function(p7)
					configureAnimationSet(p3, p4);
				end));
				u1[p3][v17] = {};
				u1[p3][v17].anim = v22;
				local l__Weight__23 = v22:FindFirstChild("Weight");
				if l__Weight__23 == nil then
					u1[p3][v17].weight = 1;
				else
					u1[p3][v17].weight = l__Weight__23.Value;
				end;
				u1[p3].count = u1[p3].count + 1;
				u1[p3].totalWeight = u1[p3].totalWeight + u1[p3][v17].weight;
				v17 = v17 + 1;
			end;		
		end;
	end;
	if u1[p3].count <= 0 then
		local v24, v25, v26 = pairs(p4);
		while true do
			local v27, v28 = v24(v25, v26);
			if v27 then

			else
				break;
			end;
			v26 = v27;
			u1[p3][v27] = {};
			u1[p3][v27].anim = Instance.new("Animation");
			u1[p3][v27].anim.Name = p3;
			u1[p3][v27].anim.AnimationId = v28.id;
			u1[p3][v27].weight = v28.weight;
			u1[p3].count = u1[p3].count + 1;
			u1[p3].totalWeight = u1[p3].totalWeight + v28.weight;		
		end;
	end;
end;
local u2 = {
	idle = { {
			id = "http://www.roblox.com/asset/?id=180435571", 
			weight = 9
		}, {
			id = "http://www.roblox.com/asset/?id=180435792", 
			weight = 1
		} }, 
	walk = { {
			id = "http://www.roblox.com/asset/?id=180426354", 
			weight = 10
		} }, 
	run = { {
			id = "run.xml", 
			weight = 10
		} }, 
	jump = { {
			id = "http://www.roblox.com/asset/?id=125750702", 
			weight = 10
		} }, 
	fall = { {
			id = "http://www.roblox.com/asset/?id=180436148", 
			weight = 10
		} }, 
	climb = { {
			id = "http://www.roblox.com/asset/?id=180436334", 
			weight = 10
		} }, 
	sit = { {
			id = "http://www.roblox.com/asset/?id=178130996", 
			weight = 10
		} }, 
	toolnone = { {
			id = "http://www.roblox.com/asset/?id=182393478", 
			weight = 10
		} }, 
	toolslash = { {
			id = "http://www.roblox.com/asset/?id=129967390", 
			weight = 10
		} }, 
	toollunge = { {
			id = "http://www.roblox.com/asset/?id=129967478", 
			weight = 10
		} }, 
	wave = { {
			id = "http://www.roblox.com/asset/?id=128777973", 
			weight = 10
		} }, 
	point = { {
			id = "http://www.roblox.com/asset/?id=128853357", 
			weight = 10
		} }, 
	dance = { {
			id = "http://www.roblox.com/asset/?id=182435998", 
			weight = 10
		}, {
			id = "http://www.roblox.com/asset/?id=182491037", 
			weight = 10
		}, {
			id = "http://www.roblox.com/asset/?id=182491065", 
			weight = 10
		} }, 
	dance2 = { {
			id = "http://www.roblox.com/asset/?id=182436842", 
			weight = 10
		}, {
			id = "http://www.roblox.com/asset/?id=182491248", 
			weight = 10
		}, {
			id = "http://www.roblox.com/asset/?id=182491277", 
			weight = 10
		} }, 
	dance3 = { {
			id = "http://www.roblox.com/asset/?id=182436935", 
			weight = 10
		}, {
			id = "http://www.roblox.com/asset/?id=182491368", 
			weight = 10
		}, {
			id = "http://www.roblox.com/asset/?id=182491423", 
			weight = 10
		} }, 
	laugh = { {
			id = "http://www.roblox.com/asset/?id=129423131", 
			weight = 10
		} }, 
	cheer = { {
			id = "http://www.roblox.com/asset/?id=129423030", 
			weight = 10
		} }
};
function scriptChildModified(p8)
	local v29 = u2[p8.Name];
	if v29 ~= nil then
		configureAnimationSet(p8.Name, v29);
	end;
end;
script.ChildAdded:connect(scriptChildModified);
script.ChildRemoved:connect(scriptChildModified);
for v30, v31 in pairs(u2) do
	configureAnimationSet(v30, v31);
end;
local u3 = "";
local u4 = {
	wave = false, 
	point = false, 
	dance = true, 
	dance2 = true, 
	dance3 = true, 
	laugh = false, 
	cheer = false
};
local u5 = nil;
local u6 = nil;
local u7 = nil;
function stopAllAnimations()
	local v32 = u3;
	if u4[v32] ~= nil then
		if u4[v32] == false then
			v32 = "idle";
		end;
	end;
	u3 = "";
	u5 = nil;
	if u6 ~= nil then
		u6:disconnect();
	end;
	if u7 ~= nil then
		u7:Stop();
		u7:Destroy();
		u7 = nil;
	end;
	return v32;
end;
local u8 = 1;
function setAnimationSpeed(p9)
	if p9 ~= u8 then
		u8 = p9;
		u7:AdjustSpeed(u8);
	end;
end;
function keyFrameReachedFunc(p10)
	if p10 == "End" then
		local v33 = u3;
		if u4[v33] ~= nil then
			if u4[v33] == false then
				v33 = "idle";
			end;
		end;
		playAnimation(v33, 0, v10);
		setAnimationSpeed(u8);
	end;
end;
function playAnimation(p11, p12, p13)
	local v34 = math.random(1, u1[p11].totalWeight);
	local v35 = 1;
	while true do
		if u1[p11][v35].weight < v34 then

		else
			break;
		end;
		v34 = v34 - u1[p11][v35].weight;
		v35 = v35 + 1;	
	end;
	local l__anim__36 = u1[p11][v35].anim;
	if l__anim__36 ~= u5 then
		if u7 ~= nil then
			u7:Stop(p12);
			u7:Destroy();
		end;
		u8 = 1;
		u7 = p13:LoadAnimation(l__anim__36);
		u7:Play(p12);
		u3 = p11;
		u5 = l__anim__36;
		if u6 ~= nil then
			u6:disconnect();
		end;
		u6 = u7.KeyframeReached:connect(keyFrameReachedFunc);
	end;
end;
local u9 = "";
function toolKeyFrameReachedFunc(p14)
	if p14 == "End" then
		playToolAnimation(u9, 0, v10);
	end;
end;
local u10 = nil;
local u11 = nil;
local u12 = nil;
function playToolAnimation(p15, p16, p17)
	local v37 = math.random(1, u1[p15].totalWeight);
	local v38 = 1;
	while true do
		if u1[p15][v38].weight < v37 then

		else
			break;
		end;
		v37 = v37 - u1[p15][v38].weight;
		v38 = v38 + 1;	
	end;
	local l__anim__39 = u1[p15][v38].anim;
	if u10 ~= l__anim__39 then
		if u11 ~= nil then
			u11:Stop();
			u11:Destroy();
			p16 = 0;
		end;
		u11 = p17:LoadAnimation(l__anim__39);
		u11:Play(p16);
		u9 = p15;
		u10 = l__anim__39;
		u12 = u11.KeyframeReached:connect(toolKeyFrameReachedFunc);
	end;
end;
function stopToolAnimations()
	if u12 ~= nil then
		u12:disconnect();
	end;
	u9 = "";
	u10 = nil;
	if u11 ~= nil then
		u11:Stop();
		u11:Destroy();
		u11 = nil;
	end;
	return u9;
end;
local u13 = "Standing";
function onRunning(p18)
	if 0.01 < p18 then
		playAnimation("walk", 0.1, v10);
		u13 = "Running";
		return;
	end;
	playAnimation("idle", 0.1, v10);
	u13 = "Standing";
end;
function onDied()
	u13 = "Dead";
end;
local u14 = 0;
function onJumping()
	playAnimation("jump", 0.1, v10);
	u14 = 0.3;
	u13 = "Jumping";
end;
function onClimbing(p19)
	playAnimation("climb", 0.1, v10);
	setAnimationSpeed(p19 / 12);
	u13 = "Climbing";
end;
function onGettingUp()
	u13 = "GettingUp";
end;
function onFreeFall()
	if u14 <= 0 then
		playAnimation("fall", 0.3, v10);
	end;
	u13 = "FreeFall";
end;
function onFallingDown()
	u13 = "FallingDown";
end;
function onSeated()
	u13 = "Seated";
end;
function onPlatformStanding()
	u13 = "PlatformStanding";
end;
function onSwimming(p20)
	if 0 < p20 then
		u13 = "Running";
		return;
	end;
	u13 = "Standing";
end;
function getTool()
	for _, tool in l__Value__3:GetChildren() do
		if tool:IsA("Tool") then
			return tool
		end
	end
	return nil
end;
function getToolAnim(p21)
	local v43, v44, v45 = ipairs(p21:GetChildren());
	while true do
		v43(v44, v45);
		if v43 then

		else
			break;
		end;
		v45 = v43;
		if v44.Name == "toolanim" then
			if v44.className == "StringValue" then
				return v44;
			end;
		end;	
	end;
	return nil;
end;
local u15 = "None";
function animateTool()
	if u15 == "None" then
		playToolAnimation("toolnone", 0.1, v10);
		return;
	end;
	if u15 == "Slash" then
		playToolAnimation("toolslash", 0, v10);
		return;
	end;
	if u15 == "Lunge" then

	else
		return;
	end;
	playToolAnimation("toollunge", 0, v10);
end;
function moveSit()
	v5.MaxVelocity = 0.15;
	v6.MaxVelocity = 0.15;
	v5:SetDesiredAngle(1.57);
	v6:SetDesiredAngle(-1.57);
	v7:SetDesiredAngle(1.57);
	v8:SetDesiredAngle(-1.57);
end;
local u16 = 0;
local u17 = 0;
function move(p22)
	local v46 = 1;
	local v47 = 1;
	u16 = p22;
	local v48 = false;
	if 0 < u14 then
		u14 = u14 - (p22 - u16);
	end;
	if u13 == "FreeFall" then
		if u14 <= 0 then
			playAnimation("fall", 0.3, v10);
		else
			if u13 == "Seated" then
				playAnimation("sit", 0.5, v10);
				return;
			end;
			if u13 == "Running" then
				playAnimation("walk", 0.1, v10);
			elseif u13 ~= "Dead" then
				if u13 ~= "GettingUp" then
					if u13 ~= "FallingDown" then
						if u13 ~= "Seated" then
							if u13 == "PlatformStanding" then
								stopAllAnimations();
								v46 = 0.1;
								v47 = 1;
								v48 = true;
							end;
						else
							stopAllAnimations();
							v46 = 0.1;
							v47 = 1;
							v48 = true;
						end;
					else
						stopAllAnimations();
						v46 = 0.1;
						v47 = 1;
						v48 = true;
					end;
				else
					stopAllAnimations();
					v46 = 0.1;
					v47 = 1;
					v48 = true;
				end;
			else
				stopAllAnimations();
				v46 = 0.1;
				v47 = 1;
				v48 = true;
			end;
		end;
	else
		if u13 == "Seated" then
			playAnimation("sit", 0.5, v10);
			return;
		end;
		if u13 == "Running" then
			playAnimation("walk", 0.1, v10);
		elseif u13 ~= "Dead" then
			if u13 ~= "GettingUp" then
				if u13 ~= "FallingDown" then
					if u13 ~= "Seated" then
						if u13 == "PlatformStanding" then
							stopAllAnimations();
							v46 = 0.1;
							v47 = 1;
							v48 = true;
						end;
					else
						stopAllAnimations();
						v46 = 0.1;
						v47 = 1;
						v48 = true;
					end;
				else
					stopAllAnimations();
					v46 = 0.1;
					v47 = 1;
					v48 = true;
				end;
			else
				stopAllAnimations();
				v46 = 0.1;
				v47 = 1;
				v48 = true;
			end;
		else
			stopAllAnimations();
			v46 = 0.1;
			v47 = 1;
			v48 = true;
		end;
	end;
	if v48 then
		desiredAngle = v46 * math.sin(p22 * v47);
		v5:SetDesiredAngle(desiredAngle + 0);
		v6:SetDesiredAngle(desiredAngle - 0);
		v7:SetDesiredAngle(-desiredAngle);
		v8:SetDesiredAngle(-desiredAngle);
	end;
	local v49 = getTool();
	if v49 then

	else
		stopToolAnimations();
		u15 = "None";
		u10 = nil;
		u17 = 0;
		return;
	end;
	animStringValueObject = getToolAnim(v49);
	if animStringValueObject then
		u15 = animStringValueObject.Value;
		animStringValueObject.Parent = nil;
		u17 = p22 + 0.3;
	end;
	if u17 < p22 then
		u17 = 0;
		u15 = "None";
	end;
	animateTool();
end;
v10.Died:connect(onDied);
v10.Running:connect(onRunning);
v10.Jumping:connect(onJumping);
v10.Climbing:connect(onClimbing);
v10.GettingUp:connect(onGettingUp);
v10.FreeFalling:connect(onFreeFall);
v10.FallingDown:connect(onFallingDown);
v10.Seated:connect(onSeated);
v10.PlatformStanding:connect(onPlatformStanding);
v10.Swimming:connect(onSwimming);
game.Players.LocalPlayer.Chatted:connect(function(p23)
	local v50 = "";
	if string.sub(p23, 1, 3) == "/e " then
		v50 = string.sub(p23, 4);
	elseif string.sub(p23, 1, 7) == "/emote " then
		v50 = string.sub(p23, 8);
	end;
	if u13 == "Standing" and u4[v50] ~= nil then
		playAnimation(v50, 0.1, v10);
	end;
end);
local v51 = game:service("RunService");
playAnimation("idle", 0.1, v10);
u13 = "Standing";
while l__Value__3.Parent ~= nil do
	local v52, v53 = wait(0.1);
	move(v53);
end;
