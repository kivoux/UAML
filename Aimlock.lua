-- Univerasl Aimlock made by Kivoux <3
-- Features:
-- Locks using BOTTOM of mouse cursor (+20px) this is for offset reasonings
-- Toggle on/off with GUI button
-- Stays locked until RMB released
-- Preserves original mouse position
-- Clean GUI with status info

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Local player
local localPlayer = Players.LocalPlayer
local mouse = localPlayer:GetMouse()

-- GUI Creation
local AimlockGUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local TargetSelection = Instance.new("Frame")
local HeadButton = Instance.new("TextButton")
local BodyButton = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton")
local StatusFrame = Instance.new("Frame")
local StatusLabel = Instance.new("TextLabel")
local TargetLabel = Instance.new("TextLabel")

-- GUI Setup
AimlockGUI.Name = "AimlockGUI"
AimlockGUI.Parent = game.CoreGui
AimlockGUI.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = AimlockGUI
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -90)
MainFrame.Size = UDim2.new(0, 200, 0, 180)
MainFrame.Active = true
MainFrame.Draggable = true

TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 25)

Title.Name = "Title"
Title.Parent = TitleBar
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.BackgroundTransparency = 1
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, -25, 1, 0)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Aimlock 🎯"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14

CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -25, 0, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14

TargetSelection.Name = "TargetSelection"
TargetSelection.Parent = MainFrame
TargetSelection.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TargetSelection.BorderSizePixel = 0
TargetSelection.Position = UDim2.new(0, 0, 0, 25)
TargetSelection.Size = UDim2.new(1, 0, 0, 75)

HeadButton.Name = "HeadButton"
HeadButton.Parent = TargetSelection
HeadButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
HeadButton.BorderSizePixel = 0
HeadButton.Position = UDim2.new(0.5, -80, 0, 10)
HeadButton.Size = UDim2.new(0, 75, 0, 25)
HeadButton.Font = Enum.Font.SourceSansBold
HeadButton.Text = "HEAD"
HeadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HeadButton.TextSize = 14

BodyButton.Name = "BodyButton"
BodyButton.Parent = TargetSelection
BodyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
BodyButton.BorderSizePixel = 0
BodyButton.Position = UDim2.new(0.5, 5, 0, 10)
BodyButton.Size = UDim2.new(0, 75, 0, 25)
BodyButton.Font = Enum.Font.SourceSansBold
BodyButton.Text = "BODY"
BodyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BodyButton.TextSize = 14

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = MainFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.5, -75, 0, 110)
ToggleButton.Size = UDim2.new(0, 150, 0, 25)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Text = "AIMLOCK: OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14

StatusFrame.Name = "StatusFrame"
StatusFrame.Parent = MainFrame
StatusFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
StatusFrame.BorderSizePixel = 0
StatusFrame.Position = UDim2.new(0, 0, 0, 140)
StatusFrame.Size = UDim2.new(1, 0, 0, 40)

StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = StatusFrame
StatusLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
StatusLabel.BackgroundTransparency = 1
StatusLabel.BorderSizePixel = 0
StatusLabel.Position = UDim2.new(0, 5, 0, 5)
StatusLabel.Size = UDim2.new(1, -10, 0, 15)
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.Text = "Status: Disabled"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 14
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

TargetLabel.Name = "TargetLabel"
TargetLabel.Parent = StatusFrame
TargetLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TargetLabel.BackgroundTransparency = 1
TargetLabel.BorderSizePixel = 0
TargetLabel.Position = UDim2.new(0, 5, 0, 25)
TargetLabel.Size = UDim2.new(1, -10, 0, 15)
TargetLabel.Font = Enum.Font.SourceSans
TargetLabel.Text = "Target: None"
TargetLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetLabel.TextSize = 14
TargetLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Variables
local targetPart = "Head"
local rightMouseDown = false
local currentTarget = nil
local connection = nil
local alive = true
local aimlockEnabled = false
local originalMousePos = Vector2.new(0, 0)
local lastAimPosition = nil

-- Get player closest to BOTTOM of mouse cursor (+20px Y offset)
local function getClosestPlayerToMouse()
    local closestPlayer = nil
    local closestDistance = math.huge
    local camera = workspace.CurrentCamera
    
    -- Use bottom of cursor (20px below actual cursor)
    local cursorBottomPos = Vector2.new(mouse.X, mouse.Y + 50) -- + will lower / - will raise
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local target = player.Character:FindFirstChild(targetPart)
            
            if humanoid and humanoid.Health > 0 and target then
                local screenPos, onScreen = camera:WorldToViewportPoint(target.Position)
                
                if onScreen then
                    local targetPos = Vector2.new(screenPos.X, screenPos.Y)
                    local distance = (cursorBottomPos - targetPos).Magnitude
                    
                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end
    
    return closestPlayer
end

-- Get exact aim position
local function getExactAimPosition(target)
    if not target or not target.Character then return nil end
    local part = target.Character:FindFirstChild(targetPart)
    return part and part.Position
end

-- Smooth aiming
local function smoothAim(newPosition)
    if not lastAimPosition then
        lastAimPosition = newPosition
        return newPosition
    end
    return lastAimPosition:Lerp(newPosition, 0.2)
end

-- Main aimlock function
local function aimlock()
    if not alive or not aimlockEnabled then return end
    
    if rightMouseDown then
        -- Store original mouse position when first pressing RMB
        if originalMousePos == Vector2.new(0, 0) then
            originalMousePos = Vector2.new(mouse.X, mouse.Y)
        end
        
        -- Get closest player to mouse (only if we don't have a target)
        if not currentTarget then
            currentTarget = getClosestPlayerToMouse()
            if currentTarget then
                TargetLabel.Text = "Target: " .. currentTarget.Name
                StatusLabel.Text = "Status: Locked ("..targetPart..")"
            end
        end
        
        -- Lock onto target
        if currentTarget then
            local aimPosition = getExactAimPosition(currentTarget)
            if aimPosition then
                -- Smooth aiming
                lastAimPosition = smoothAim(aimPosition)
                
                -- Update camera
                local camera = workspace.CurrentCamera
                camera.CFrame = CFrame.new(camera.CFrame.Position, lastAimPosition)
            else
                -- Target lost their body part
                currentTarget = nil
                StatusLabel.Text = "Status: Target lost"
                TargetLabel.Text = "Target: None"
            end
        else
            StatusLabel.Text = "Status: No target found"
        end
    else
        -- Restore original mouse position when releasing RMB
        if originalMousePos ~= Vector2.new(0, 0) then
            mousemoverel(originalMousePos.X - mouse.X, originalMousePos.Y - mouse.Y)
            originalMousePos = Vector2.new(0, 0)
        end
        
        -- Reset target
        if currentTarget then
            currentTarget = nil
            lastAimPosition = nil
            StatusLabel.Text = "Status: Ready ("..targetPart..")"
            TargetLabel.Text = "Target: None"
        end
    end
end

-- Toggle aimlock
local function toggleAimlock()
    aimlockEnabled = not aimlockEnabled
    if aimlockEnabled then
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
        ToggleButton.Text = "AIMLOCK: ON"
        StatusLabel.Text = "Status: Ready ("..targetPart..")"
    else
        ToggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        ToggleButton.Text = "AIMLOCK: OFF"
        StatusLabel.Text = "Status: Disabled"
        -- Reset everything when disabling
        if currentTarget then
            currentTarget = nil
            lastAimPosition = nil
            if originalMousePos ~= Vector2.new(0, 0) then
                mousemoverel(originalMousePos.X - mouse.X, originalMousePos.Y - mouse.Y)
                originalMousePos = Vector2.new(0, 0)
            end
            TargetLabel.Text = "Target: None"
        end
    end
end

-- GUI Events
CloseButton.MouseButton1Click:Connect(function()
    alive = false
    if connection then connection:Disconnect() end
    AimlockGUI:Destroy()
end)

HeadButton.MouseButton1Click:Connect(function()
    targetPart = "Head"
    HeadButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
    BodyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    if aimlockEnabled then
        StatusLabel.Text = "Status: Ready (HEAD)"
    end
end)

BodyButton.MouseButton1Click:Connect(function()
    targetPart = "HumanoidRootPart"
    BodyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
    HeadButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    if aimlockEnabled then
        StatusLabel.Text = "Status: Ready (BODY)"
    end
end)

ToggleButton.MouseButton1Click:Connect(toggleAimlock)

-- Input handling
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 and aimlockEnabled then
        rightMouseDown = true
        StatusLabel.Text = "Status: Acquiring target..."
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        rightMouseDown = false
    end
end)

-- Start the aimlock
connection = RunService.RenderStepped:Connect(aimlock)
