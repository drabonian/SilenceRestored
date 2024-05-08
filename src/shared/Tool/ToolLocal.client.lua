-- Decompiled with the Synapse X Luau decompiler.

local l__LocalPlayer__1 = game.Players.LocalPlayer;
function onEquipped(p1)
	wait();
	p1.Icon = "http://www.roblox.com/asset/?id=12675845";
	local l__Icon__2 = p1.Icon;
	l__LocalPlayer__1.PlayerGui.GameGui.GamePause.Changed:connect(function()
		if l__LocalPlayer__1.PlayerGui.GameGui.GamePause.Value then
			p1.Icon = l__Icon__2;
			return;
		end;
		p1.Icon = "http://www.roblox.com/asset/?id=12675845";
	end);
end;
script.Parent.Equipped:connect(onEquipped);
