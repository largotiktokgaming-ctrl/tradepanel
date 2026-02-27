local Player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Frame principale
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 260)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)

local Stroke = Instance.new("UIStroke", MainFrame)
Stroke.Color = Color3.fromRGB(0,170,255)
Stroke.Thickness = 1.5

-- Barre du haut (drag)
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1,0,0,45)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 30, 50)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,14)

-- Titre
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,1,0)
Title.BackgroundTransparency = 1
Title.Text = "Trade Panel"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = TopBar

-------------------------------------------------
-- FONCTION TOGGLE (avec texte agrandi)
-------------------------------------------------

local function CreateToggle(text, posY)

	local Label = Instance.new("TextLabel")
	Label.Position = UDim2.new(0,30,0,posY)
	Label.Size = UDim2.new(0.6,0,0,40)
	Label.BackgroundTransparency = 1
	Label.Text = text
	Label.TextColor3 = Color3.fromRGB(255,255,255)
	Label.Font = Enum.Font.GothamBold
	Label.TextSize = 26 -- 🔥 Texte agrandi
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = MainFrame

	local Button = Instance.new("TextButton")
	Button.Position = UDim2.new(0.68,0,0,posY-5)
	Button.Size = UDim2.new(0,120,0,45)
	Button.Text = "DESACTIVE"
	Button.BackgroundColor3 = Color3.fromRGB(40,40,40)
	Button.TextColor3 = Color3.fromRGB(255,255,255)
	Button.Font = Enum.Font.GothamBold
	Button.TextSize = 18
	Button.Parent = MainFrame
	Instance.new("UICorner", Button).CornerRadius = UDim.new(0,10)

	local state = false

	Button.MouseButton1Click:Connect(function()
		state = not state
		
		if state then
			Button.Text = "ACTIVE"
			Button.BackgroundColor3 = Color3.fromRGB(0,170,255) -- 🔵 Bleu
		else
			Button.Text = "DESACTIVE"
			Button.BackgroundColor3 = Color3.fromRGB(40,40,40) -- ⚫ Noir
		end
	end)
end

-- Création des options
CreateToggle("Freeze Trade :", 90)
CreateToggle("Auto Accept :", 160)

-------------------------------------------------
-- SYSTEME DRAG
-------------------------------------------------

local dragging = false
local dragInput
local dragStart
local startPos

TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

TopBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		MainFrame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)
