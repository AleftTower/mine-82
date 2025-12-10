local v0 = game:GetService("Players")
local v1 = game:GetService("RunService")
local v2 = v0.LocalPlayer
local v3 = game:GetService("TweenService")
local v4 = Instance.new("ScreenGui")
local v5 = Instance.new("Frame")
local v6 = Instance.new("UICorner")
local v7 = Instance.new("TextBox")
local v8 = Instance.new("UICorner")
local v9 = Instance.new("TextButton")
local v10 = Instance.new("UICorner")
local v11 = Instance.new("TextButton")
local v12 = Instance.new("UICorner")
local v13 = false

v4.Parent = game.CoreGui
v5.Parent = v4
v7.Parent = v5
v9.Parent = v5
v11.Parent = v5
v6.Parent = v5
v8.Parent = v7
v10.Parent = v9
v12.Parent = v11

v5.Size = UDim2.new(0, 160, 0, 110)
v5.Position = UDim2.new(0.5, -80, 0.5, -55)
v5.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
v5.BorderSizePixel = 0
v5.Active = true
v5.Draggable = true
v5.ClipsDescendants = true
v5.BackgroundTransparency = 0.2
v5.Visible = true
v6.CornerRadius = UDim.new(0, 10)

v11.Size = UDim2.new(0, 160, 0, 20)
v11.Position = UDim2.new(0, 0, 0, 0)
v11.Text = "▼"
v11.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
v11.TextColor3 = Color3.fromRGB(255, 255, 255)
v12.CornerRadius = UDim.new(0, 10)

v7.Size = UDim2.new(0, 140, 0, 25)
v7.Position = UDim2.new(0, 10, 0, 35)
v7.Text = "10"
v7.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
v7.TextColor3 = Color3.fromRGB(255, 255, 255)
v8.CornerRadius = UDim.new(0, 10)

v9.Size = UDim2.new(0, 140, 0, 35)
v9.Position = UDim2.new(0, 10, 0, 65)
v9.Text = "Enable Hitbox"
v9.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
v9.TextColor3 = Color3.fromRGB(255, 255, 255)
v10.CornerRadius = UDim.new(0, 10)

_G.HeadSize = tonumber(v7.Text) or 10
_G.Disabled = true
local v52 = {}

local function v53()
	v52 = {}
	for _, v67 in ipairs(v0:GetPlayers()) do
		if (v67 ~= v2 and v67.Character and v67.Character:FindFirstChild("HumanoidRootPart")) then
			table.insert(v52, v67)
		end
	end
end

v7.FocusLost:Connect(function()
	local v56 = tonumber(v7.Text)
	if v56 then
		_G.HeadSize = v56
	else
		v7.Text = tostring(_G.HeadSize)
	end
end)

v9.MouseButton1Click:Connect(function()
	if not _G.Disabled then
		_G.Disabled = true
		v9.Text = "Enable Hitbox"
		for _, v72 in ipairs(v52) do
			if (v72.Character and v72.Character:FindFirstChild("HumanoidRootPart")) then
				local v73 = v72.Character.HumanoidRootPart
				v73.Size = Vector3.new(2, 2, 1)
				v73.Transparency = 1
				v73.BrickColor = BrickColor.new("Medium stone grey")
				v73.Material = Enum.Material.Plastic
				v73.CanCollide = true
			end
		end
	else
		_G.Disabled = false
		v9.Text = "Disable Hitbox"
	end
end)

v11.MouseButton1Click:Connect(function()
	if v13 then
		v13 = false
		v11.Text = "▼"
		v3:Create(v5, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 160, 0, 110)}):Play()
	else
		v13 = true
		v11.Text = "▲"
		v3:Create(v5, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 160, 0, 20)}):Play()
	end
end)

v1.RenderStepped:Connect(function()
	if not _G.Disabled then
		for _, v65 in ipairs(v52) do
			if (v65.Character and v65.Character:FindFirstChild("HumanoidRootPart")) then
				local v70 = v65.Character.HumanoidRootPart
				v70.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
				v70.Transparency = 0.7
				v70.BrickColor = BrickColor.new("Medium stone grey")
				v70.Material = Enum.Material.Neon
				v70.CanCollide = false
			end
		end
	end
end)

while true do
	v53()
	wait(1)
end
