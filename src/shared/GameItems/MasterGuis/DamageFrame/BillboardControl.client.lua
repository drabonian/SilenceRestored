-- Decompiled with the Synapse X Luau decompiler.

local l__Value__1 = script.Billboard.Value;
math.randomseed(tick());
for v2 = 0, 5 do
	local v3 = math.random(-1, 1);
	if not l__Value__1 then
		break;
	end;
	if not l__Value__1.Parent then
		break;
	end;
	l__Value__1.DamageFrame.TextLabel.TextTransparency = l__Value__1.DamageFrame.TextLabel.TextTransparency + 0.0625;
	l__Value__1.DamageFrame.TextLabel.TextStrokeTransparency = l__Value__1.DamageFrame.TextLabel.TextStrokeTransparency + 0.0625;
	l__Value__1.DamageFrame:TweenPosition(UDim2.new(-4 * v3, 0, 0, 0), "Out", "Linear", 2, true);
	l__Value__1.StudsOffset = l__Value__1.StudsOffset + Vector3.new(0, 0.15 * v2, 0);
	wait(0.09);
	if not l__Value__1 then
		break;
	end;
	if not l__Value__1.Parent then
		break;
	end;
	l__Value__1.StudsOffset = l__Value__1.StudsOffset + Vector3.new(0, 0.15 * v2, 0);
	wait(0.09);
	if not l__Value__1 then
		break;
	end;
	if not l__Value__1.Parent then
		break;
	end;
	l__Value__1.DamageFrame.TextLabel.TextTransparency = l__Value__1.DamageFrame.TextLabel.TextTransparency + 0.0625;
	l__Value__1.DamageFrame.TextLabel.TextStrokeTransparency = l__Value__1.DamageFrame.TextLabel.TextStrokeTransparency + 0.0625;
	l__Value__1.DamageFrame:TweenPosition(UDim2.new(4 * v3, 0, 0, 0), "Out", "Linear", 2, true);
	l__Value__1.StudsOffset = l__Value__1.StudsOffset + Vector3.new(0, 0.15 * v2, 0);
	wait(0.09);
	if not l__Value__1 then
		break;
	end;
	if not l__Value__1.Parent then
		break;
	end;
	l__Value__1.StudsOffset = l__Value__1.StudsOffset + Vector3.new(0, 0.15 * v2, 0);
	wait(0.09);
	if not l__Value__1 then
		break;
	end;
	if not l__Value__1.Parent then
		break;
	end;
	l__Value__1.DamageFrame.TextLabel.TextTransparency = l__Value__1.DamageFrame.TextLabel.TextTransparency + 0.0625;
	l__Value__1.DamageFrame.TextLabel.TextStrokeTransparency = l__Value__1.DamageFrame.TextLabel.TextStrokeTransparency + 0.0625;
end;
script:Destroy();
