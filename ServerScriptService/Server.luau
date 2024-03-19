local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function setLoadedAttribute(humanoid)
	if humanoid then
		humanoid:SetAttribute("Loaded", false)
	end
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		setLoadedAttribute(humanoid)
	end)
end

local function setLoadedAttributeForExistingPlayers()
	for _, player in ipairs(Players:GetPlayers()) do
		local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		setLoadedAttribute(humanoid)
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

setLoadedAttributeForExistingPlayers()
