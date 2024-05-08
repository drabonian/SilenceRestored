-- Decompiled with the Synapse X Luau decompiler.

wait(0.09);
local l__Map__1 = game.Workspace.CurrentCamera.Map;
local v2 = l__Map__1.ConversationLoops:getChildren();

function waitTime(p5)
	for i = 0, p5 do
		task.wait(0.03)
	end
end;

function typeText(p2, p3)
	local v4 = nil;
	v4 = 0;
	local v5 = string.len(p2);
	local v6 = 1 - 1;
	local v8 = 5
	while true do
		p3.Text = string.sub(p2, 1, v6);
		waitTime(1);
		v4 = v4 + 1;
		if 0 <= 1 then
			if v6 < v5 then

			else
				break;
			end;
		elseif v5 < v6 then

		else
			break;
		end;
		v6 = v6 + 1;	
	end;
	return math.ceil(v8);
end;
for v8 = 1, #v2 do
	local v9 = v2[v8].Dialogue.Main:getChildren();
	local v10 = 1;
	while l__Map__1 do
		speakers = v2[v8].Speakers:getChildren();
		v2[v8].Speakers[v9[v10].Change.Value].BillboardGui.Enabled = true;
		local l__Dialogue__11 = v2[v8].Speakers[v9[v10].Change.Value].BillboardGui.Dialogue;
		local v12 = typeText(v9[v10].Value, l__Dialogue__11.Text1);
		if v9[v10]:findFirstChild("Cont") then
			v12 = v12 + typeText(v9[v10].Cont.Value, l__Dialogue__11.Text2);
		else
			l__Dialogue__11.Text2.Text = "";
		end;
		waitTime(v12 * 2.5);
		l__Dialogue__11.Text1.Text = "";
		l__Dialogue__11.Text2.Text = "";
		for v13 = 1, #speakers do
			speakers[v13].BillboardGui.Enabled = false;
		end;
		if v9[v10]:findFirstChild("Wait") then
			wait(v9[v10].Wait.Value);
		end;
		v10 = v10 + 1;
		if #v9 < v10 then
			v10 = 1;
		end;	
	end;
end;
