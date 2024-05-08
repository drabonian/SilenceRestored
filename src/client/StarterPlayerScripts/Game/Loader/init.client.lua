for _,module in script:GetChildren() do
	require(module).Init()
end