local StarterGui = game:GetService("StarterGui")

return function(parameterName, value, quitAfterSeconds)
	local completed = false
	local active = true
	local attempts = 0
	
	quitAfterSeconds = quitAfterSeconds or 15
	
	while active do
		if attempts > quitAfterSeconds then
			break
		end
		
		local ranFine = pcall(function()
			StarterGui:SetCore(parameterName, value)
		end)
		
		if ranFine then
			completed = true
			break
		else
			task.wait(1)
			attempts += 1
		end
	end
	
	return completed
end