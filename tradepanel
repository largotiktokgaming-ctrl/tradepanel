-- Début du script à héberger
local p=game.Players.LocalPlayer
local u=game:GetService("UserInputService")
local g=Instance.new("ScreenGui",p.PlayerGui)
g.ResetOnSpawn=false
local f=Instance.new("Frame",g)
f.Size=UDim2.new(0,450,0,260)
f.Position=UDim2.new(0.5,-225,0.5,-130)
f.BackgroundColor3=Color3.fromRGB(15,20,35)
Instance.new("UICorner",f).CornerRadius=UDim.new(0,14)
Instance.new("UIStroke",f).Color=Color3.fromRGB(0,170,255)
Instance.new("UIStroke",f).Thickness=1.5
local t=Instance.new("Frame",f)
t.Size=UDim2.new(1,0,0,45)
t.BackgroundColor3=Color3.fromRGB(25,30,50)
Instance.new("UICorner",t).CornerRadius=UDim.new(0,14)
local l=Instance.new("TextLabel",t)
l.Size=UDim2.new(1,0,1,0)
l.BackgroundTransparency=1
l.Text="Trade Panel"
l.TextColor3=Color3.fromRGB(255,255,255)
l.TextScaled=true
l.Font=Enum.Font.GothamBold
function c(n,y)
  local a=Instance.new("TextLabel",f)
  a.Position=UDim2.new(0,30,0,y)
  a.Size=UDim2.new(0.6,0,0,40)
  a.BackgroundTransparency=1
  a.Text=n
  a.TextColor3=Color3.fromRGB(255,255,255)
  a.Font=Enum.Font.GothamBold
  a.TextSize=26
  a.TextXAlignment=Enum.TextXAlignment.Left
  local b=Instance.new("TextButton",f)
  b.Position=UDim2.new(0.68,0,0,y-5)
  b.Size=UDim2.new(0,120,0,45)
  b.Text="DESACTIVE"
  b.BackgroundColor3=Color3.fromRGB(40,40,40)
  b.TextColor3=Color3.fromRGB(255,255,255)
  b.Font=Enum.Font.GothamBold
  b.TextSize=18
  Instance.new("UICorner",b).CornerRadius=UDim.new(0,10)
  local s=false
  b.MouseButton1Click:Connect(function()
    s=not s
    if s then b.Text="ACTIVE" b.BackgroundColor3=Color3.fromRGB(0,170,255)
    else b.Text="DESACTIVE" b.BackgroundColor3=Color3.fromRGB(40,40,40) end
  end)
end
c("Freeze Trade :",90)
c("Auto Accept :",160)
local d=false
local m,i,o
t.InputBegan:Connect(function(x)
  if x.UserInputType==Enum.UserInputType.MouseButton1 then
    d=true
    m=x.Position
    i=f.Position
    x.Changed:Connect(function() if x.UserInputState==Enum.UserInputState.End then d=false end end)
  end
end)
t.InputChanged:Connect(function(x) if x.UserInputType==Enum.UserInputType.MouseMovement then o=x end end)
u.InputChanged:Connect(function(x) if x==o and d then local y=x.Position-m f.Position=UDim2.new(i.X.Scale,i.X.Offset+y.X,i.Y.Scale,i.Y.Offset+y.Y) end end)
-- Fin du script
