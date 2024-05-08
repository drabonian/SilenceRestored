-- Decompiled with the Synapse X Luau decompiler.

print("Story Script Running");

local player = game.Players.LocalPlayer
local l__Parent__1 = script.Parent;
local l__Torso__2 = game.Players.LocalPlayer.Character.Torso;
local l__Dialogue__3 = l__Parent__1.Cutscene.Dialogue;

function waitTime(p5)
	for i = 0, p5 do
		task.wait(0.03)
	end
end;

local l__Continue__1 = l__Dialogue__3.Parent.Continue;
function typeText(p2, p3)
	local v5 = nil;
	v5 = 0;
	local v6 = string.len(p2);
	local v7 = 1 - 1;
	local v8 = 5 -- guessing for now
	while true do
		if not l__Continue__1.Visible then
			p3.Text = p2;
			return 1;
		end;
		p3.Text = string.sub(p2, 1, v7);
		waitTime(1);
		v5 = v5 + 1;
		if 0 <= 1 then
			if v7 < v6 then

			else
				break;
			end;
		elseif v6 < v7 then

		else
			break;
		end;
		v7 = v7 + 1;	
	end;
	return math.ceil(v8 / 2);
end;
local l__CurrentCamera__2 = workspace.CurrentCamera;
local u3 = require(workspace.CFrameInterpolator);
function focusOnLocation(p4)
	local v9, v10 = u3(l__CurrentCamera__2.Focus, p4);
	coroutine.resume(coroutine.create(function()
		local v11 = 1 - 1;
		while true do
			l__CurrentCamera__2.Focus = v10(v11 / 16);
			wait(0.03);
			if 0 <= 1 then
				if v11 < 16 then

				else
					break;
				end;
			elseif 16 < v11 then

			else
				break;
			end;
			v11 = v11 + 1;		
		end;
	end));
	wait(0.24);
end;
local l__Stats__4 = player.Stats;
local l__Choice1__5 = l__Dialogue__3.Choice1;
local l__Choice2__6 = l__Dialogue__3.Choice2;
function runDialogue()
	local l__Value__12 = script.Current.Value;
	local l__Main__13 = l__Value__12.Main;
	local v14 = l__Main__13:getChildren();
	l__Dialogue__3.Text1.Text = "";
	l__Dialogue__3.Text2.Text = "";
	l__Dialogue__3.Background.Visible = true;
	l__Dialogue__3.Parent.ForceMouseUnlock.Visible = true;
	if l__Value__12.Parent:IsA("Part") then
		if l__Value__12.Value ~= "Secret Conversation" then
			focusOnLocation(l__Value__12.Parent.CFrame);
		end;
	end;
	if string.sub(l__Value__12.Value, 1, 18) == "Overseer's Journal" then
		if not l__Stats__4["OverseerBook" .. string.sub(l__Value__12.Value, 21, 21)].Value then
			l__Stats__4["OverseerBook" .. string.sub(l__Value__12.Value, 21, 21)].Value = true;
		end;
		local v15 = l__Stats__4:GetChildren();
		local v16 = 0;
		local v17 = #v15;
		local v18 = 1
		while true do
			if string.sub(v15[v18].Name, 1, 12) == "OverseerBook" then
				if v15[v18].Value then
					v16 = v16 + 1;
				end;
			end;
			if 0 <= 1 then
				if v18 < v17 then

				else
					break;
				end;
			elseif v17 < v18 then

			else
				break;
			end;
			v18 = v18 + 1;		
		end;
		if 6 < v16 then
			if not l__Stats__4.BadgeOverbooked.Value then
				l__Stats__4.BadgeOverbooked.Value = true;
			end;
		end;
	elseif l__Value__12.Value == "Civilian" then
		if l__Main__13.Value == "Silence Green" then
			if not l__Stats__4.BadgeSilenceGreen.Value then
				l__Stats__4.BadgeSilenceGreen.Value = true;
			end;
		elseif l__Value__12.Value == "VRT - Serial 01337B" then
			if not l__Stats__4.Badge1337Sneaks.Value then
				l__Stats__4.Badge1337Sneaks.Value = true;
			end;
		end;
	elseif l__Value__12.Value == "VRT - Serial 01337B" then
		if not l__Stats__4.Badge1337Sneaks.Value then
			l__Stats__4.Badge1337Sneaks.Value = true;
		end;
	end;
	local v19 = 1;
	while true do
		if v19 <= #v14 then

		else
			break;
		end;
		script.Number.Value = v19;
		if l__Main__13[tostring(v19)]:findFirstChild("Change") then
			l__Dialogue__3.Title.Text = l__Main__13[tostring(v19)].Change.Value .. ":";
		else
			l__Dialogue__3.Title.Text = l__Value__12.Value .. ":";
		end;
		l__Dialogue__3.Title.Visible = true;
		l__Dialogue__3.Text1.Visible = true;
		l__Dialogue__3.Text2.Visible = true;
		l__Continue__1.Visible = true;
		local v20 = typeText(l__Main__13[tostring(v19)].Value, l__Dialogue__3.Text1);
		if l__Main__13[tostring(v19)]:findFirstChild("Cont") then
			v20 = v20 + typeText(l__Main__13[tostring(v19)].Cont.Value, l__Dialogue__3.Text2);
		else
			l__Dialogue__3.Text2.Text = "";
		end;
		if l__Continue__1.Visible then
			l__Continue__1.Visible = false;
			waitTime(v20);
		else
			waitTime(1);
		end;
		l__Continue__1.Visible = true;
		l__Dialogue__3.Click.Visible = true;
		while true do
			wait();
			if l__Continue__1.Visible then

			else
				break;
			end;		
		end;
		l__Dialogue__3.Text1.Text = "";
		l__Dialogue__3.Text2.Text = "";
		l__Dialogue__3.Text1.Visible = false;
		l__Dialogue__3.Text2.Visible = false;
		l__Dialogue__3.Click.Visible = false;
		if l__Main__13[tostring(v19)]:findFirstChild("1") then
			if l__Main__13[tostring(v19)]:findFirstChild("2") then
				l__Dialogue__3.Title.Text = "Select Response:";
				l__Choice1__5.Text = l__Main__13[tostring(v19)]["1"].Value;
				l__Choice2__6.Text = l__Main__13[tostring(v19)]["2"].Value;
				l__Choice1__5.Visible = true;
				l__Choice2__6.Visible = true;
				script.Choice.Value = 0;
				while true do
					wait();
					if script.Choice.Value == 0 then

					else
						break;
					end;				
				end;
				v19 = l__Main__13[tostring(v19)]["" .. script.Choice.Value].Next.Value;
				l__Choice1__5.Visible = false;
				l__Choice2__6.Visible = false;
			elseif l__Main__13[tostring(v19)]:findFirstChild("End") then
				v19 = #v14 + 1;
			else
				v19 = v19 + 1;
			end;
		elseif l__Main__13[tostring(v19)]:findFirstChild("End") then
			v19 = #v14 + 1;
		else
			v19 = v19 + 1;
		end;	
	end;
	l__Dialogue__3.Title.Text = "";
	l__Dialogue__3.Title.Visible = false;
	l__Dialogue__3.Background.Visible = false;
	l__Dialogue__3.Parent.ForceMouseUnlock.Visible = false;
	if l__Value__12.Main.Value ~= "Indestructible" then
		l__Value__12:Destroy();
	end;
	script.Current.Value = nil;
	script.Number.Value = 0;
end;
l__Choice1__5.MouseButton1Click:connect(function()
	if script.Choice.Value == 0 then
		script.Choice.Value = 1;
	end;
end);
l__Choice2__6.MouseButton1Click:connect(function()
	if script.Choice.Value == 0 then
		script.Choice.Value = 2;
	end;
end);
l__Continue__1.MouseButton1Click:connect(function()
	l__Continue__1.Visible = false;
end);
script.Current.Changed:connect(function()
	if script.Current.Value and not script.Busy.Value then
		script.Busy.Value = true;
		runDialogue();
		script.Busy.Value = false;
	end;
end);
