local function checkPlayerLoaded(player)
	local character = player.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid:FindFirstChild("Loaded") then
			if humanoid.Loaded.Value == true then
				humanoid.RootPart.Anchored = false
			else
				humanoid.RootPart.Anchored = true
			end
		end
	end
end

local function checkAllPlayers()
	for _, player in ipairs(game.Players:GetPlayers()) do
		checkPlayerLoaded(player)
	end
end

checkAllPlayers()

while wait(1) do
	checkAllPlayers()
end
