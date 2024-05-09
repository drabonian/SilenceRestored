local module = {}

function module.StartLevel(level: number)
	require(script:FindFirstChild("Level" .. tostring(level)))
end

return module
