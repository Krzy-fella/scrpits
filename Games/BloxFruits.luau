local Debris = game:GetService("Debris")
local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

-- prevent duplicates
if CoreGui:FindFirstChild("rz-warning") then
	CoreGui["rz-warning"]:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "rz-warning"
ScreenGui.IgnoreGuiInset = true
Debris:AddItem(ScreenGui, 25)

-- background
local Background = Instance.new("Frame", ScreenGui)
Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background.Size = UDim2.fromScale(1, 1)

local Gradient = Instance.new("UIGradient", Background)
Gradient.Rotation = 90
Gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0));
	ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25));
})

-- center panel
local Center = Instance.new("Frame", Background)
Center.Size = UDim2.fromScale(0.25, 0.09)
Center.AnchorPoint = Vector2.new(0.5, 1)
Center.Position = UDim2.new(0.5, 0, 0.95, 0)
Center.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

local CenterCorner = Instance.new("UICorner", Center)
CenterCorner.CornerRadius = UDim.new(0, 8)

-- settings
local ServerLink = "discord.gg/redz-hub"
local WarnMessage = "Join our Discord for updates!"

-- warning text
local Warn = Instance.new("TextLabel", Background)
Warn.Text = WarnMessage
Warn.Size = UDim2.new(0.6, 0, 0.2, 0)
Warn.AnchorPoint = Vector2.new(0.5, 0.5)
Warn.Position = UDim2.fromScale(0.5, 0.5)
Warn.Font = Enum.Font.FredokaOne
Warn.TextColor3 = Color3.fromRGB(230, 230, 230)
Warn.TextScaled = true
Warn.BackgroundTransparency = 1

-- copy link button
local CopyLink = Instance.new("TextButton", Center)
CopyLink.Text = ServerLink
CopyLink.Size = UDim2.new(0.8, 0, 0.6, 0)
CopyLink.AnchorPoint = Vector2.new(0.5, 0.5)
CopyLink.Position = UDim2.fromScale(0.5, 0.5)
CopyLink.Font = Enum.Font.FredokaOne
CopyLink.TextColor3 = Color3.fromRGB(180, 180, 180)
CopyLink.TextScaled = true
CopyLink.TextTransparency = 0.2
CopyLink.BackgroundTransparency = 1

CopyLink.Activated:Connect(function()
	if CopyLink.Text ~= "Copied!" then
		if setclipboard then
			setclipboard(ServerLink)
		end
		CopyLink.Text = "Copied!"
		task.wait(2)
		CopyLink.Text = ServerLink
	end
end)

-- close button (top-right)
local CloseButton = Instance.new("TextButton", Background)
CloseButton.Size = UDim2.fromScale(0.1, 0.055)
CloseButton.Position = UDim2.fromScale(0.98, 0.02)
CloseButton.AnchorPoint = Vector2.new(1, 0)
CloseButton.Text = "Close"
CloseButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
CloseButton.TextColor3 = Color3.fromRGB(235, 20, 20)
CloseButton.Font = Enum.Font.FredokaOne
CloseButton.TextScaled = true
CloseButton.TextTransparency = 0.6

local CloseCorner = Instance.new("UICorner", CloseButton)
CloseCorner.CornerRadius = UDim.new(0, 8)

CloseButton.Activated:Connect(function()
	ScreenGui:Destroy()
end)
