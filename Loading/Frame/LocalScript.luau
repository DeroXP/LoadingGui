local TweenService = game:GetService("TweenService")
local Main = script.Parent
local LoadingText = Main.TextLabel

local fadeSpeed = 1 -- Adjust the speed of fades here

local function FadeOutObject(obj)
	if obj:IsA("TextLabel") then
		local textTweenInfo = TweenInfo.new(fadeSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		local textTween = TweenService:Create(obj, textTweenInfo, { TextTransparency = 1 })
		textTween:Play()
	elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
		local imageTweenInfo = TweenInfo.new(fadeSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		local imageTween = TweenService:Create(obj, imageTweenInfo, { ImageTransparency = 1 })
		imageTween:Play()
	elseif obj:IsA("Frame") then
		local frameTweenInfo = TweenInfo.new(fadeSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		local frameTween = TweenService:Create(obj, frameTweenInfo, { BackgroundTransparency = 1 })
		frameTween:Play()
	end
end

local function FadeOutChildren(obj)
	FadeOutObject(obj)
	for _, child in ipairs(obj:GetChildren()) do
		if child:IsA("GuiObject") then
			FadeOutObject(child)
		end
		FadeOutChildren(child)
	end
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerLoadedEvent = ReplicatedStorage:FindFirstChild("PlayerLoaded")

local function UpdateLoadingText()
	local queueSize = game:GetService('ContentProvider').RequestQueueSize
	LoadingText.Text = "Loading Assets: " .. queueSize .. " requests in queue"
	if queueSize == 0 then
		FadeOutChildren(Main)

		wait(0.5)

		PlayerLoadedEvent:FireServer() -- Fire the event to the server
	end
end

UpdateLoadingText()

game:GetService('RunService').RenderStepped:Connect(function()
	UpdateLoadingText()
end)
