local gui = script.Parent
local Main = gui.Frame
local image = Main.ImageLabel

local rotationSpeed = 1

local function rotateImage()
	while true do
		image.Rotation = (image.Rotation + rotationSpeed) % 360
		wait(0.01)
	end
end

rotateImage()
