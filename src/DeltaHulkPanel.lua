-- Delta Hulk Panel Script

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Create the main panel
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeltaHulkPanel"\nScreenGui.Parent = Player:WaitForChild("PlayerGui")

local Panel = Instance.new("Frame")
Panel.Name = "Panel"
Panel.Size = UDim2.new(0, 100, 0, 100)
Panel.Position = UDim2.new(0.5, -50, 0.5, -50)
Panel.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Panel.BackgroundTransparency = 0.5
Panel.Parent = ScreenGui

-- Create the Hulk face button
local HulkFaceButton = Instance.new("TextButton")
HulkFaceButton.Name = "HulkFaceButton"
HulkFaceButton.Size = UDim2.new(1, 0, 1, 0)
HulkFaceButton.Position = UDim2.new(0, 0, 0, 0)
HulkFaceButton.Text = "💥"
HulkFaceButton.TextSize = 50
HulkFaceButton.BackgroundTransparency = 1
HulkFaceButton.Parent = Panel

-- Create the action buttons
local ThunderClapButton = Instance.new("TextButton")
ThunderClapButton.Name = "ThunderClapButton"
ThunderClapButton.Size = UDim2.new(0.5, 0, 0.5, 0)
ThunderClapButton.Position = UDim2.new(0, 0, 0.5, 0)
ThunderClapButton.Text = "Thunder Clap"
ThunderClapButton.TextSize = 14
ThunderClapButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
ThunderClapButton.BackgroundTransparency = 0.5
ThunderClapButton.Visible = false
ThunderClapButton.Parent = Panel

local GroundSmashButton = Instance.new("TextButton")
GroundSmashButton.Name = "GroundSmashButton"
GroundSmashButton.Size = UDim2.new(0.5, 0, 0.5, 0)
GroundSmashButton.Position = UDim2.new(0.5, 0, 0.5, 0)
GroundSmashButton.Text = "Ground Smash"
GroundSmashButton.TextSize = 14
GroundSmashButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
GroundSmashButton.BackgroundTransparency = 0.5
GroundSmashButton.Visible = false
GroundSmashButton.Parent = Panel

-- Toggle panel visibility
local function togglePanel()
    ThunderClapButton.Visible = not ThunderClapButton.Visible
    GroundSmashButton.Visible = not GroundSmashButton.Visible
end

HulkFaceButton.MouseButton1Click:Connect(togglePanel)

-- Thunder Clap function
local function thunderClap()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local character = player.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if humanoid then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            local range = 20
            local power = 1000
            
            for _, otherPlayer in ipairs(Players:GetPlayers()) do
                if otherPlayer ~= player then
                    local otherCharacter = otherPlayer.Character
                    if otherCharacter then
                        local otherHumanoid = otherCharacter:FindFirstChildOfClass("Humanoid")
                        local otherRootPart = otherCharacter:FindFirstChild("HumanoidRootPart")
                        
                        if otherHumanoid and otherRootPart then
                            local distance = (rootPart.Position - otherRootPart.Position).Magnitude
                            if distance <= range then
                                local direction = (otherRootPart.Position - rootPart.Position).Unit
                                otherRootPart.Velocity = direction * power
                            end
                        end
                    end
                end
            end
        end
    end
end

-- Ground Smash function
local function groundSmash()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local character = player.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if humanoid then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            local range = 20
            local power = 1000
            
            for _, otherPlayer in ipairs(Players:GetPlayers()) do
                if otherPlayer ~= player then
                    local otherCharacter = otherPlayer.Character
                    if otherCharacter then
                        local otherHumanoid = otherCharacter:FindFirstChildOfClass("Humanoid")
                        local otherRootPart = otherCharacter:FindFirstChild("HumanoidRootPart")
                        
                        if otherHumanoid and otherRootPart then
                            local distance = (rootPart.Position - otherRootPart.Position).Magnitude
                            if distance <= range then
                                local direction = (otherRootPart.Position - rootPart.Position).Unit
                                otherRootPart.Velocity = direction * power
                            end
                        end
                    end
                end
            end
        end
    end
end

ThunderClapButton.MouseButton1Click:Connect(thunderClap)
GroundSmashButton.MouseButton1Click:Connect(groundSmash)

-- Animation for Thunder Clap
local function playThunderClapAnimation()
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://YOUR_THUNDER_CLAP_ANIMATION_ID"
    
    local humanoid = Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local animationTrack = humanoid:LoadAnimation(animation)
        animationTrack:Play()
    end
end

-- Animation for Ground Smash
local function playGroundSmashAnimation()
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://YOUR_GROUND_SMASH_ANIMATION_ID"
    
    local humanoid = Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local animationTrack = humanoid:LoadAnimation(animation)
        animationTrack:Play()
    end
end

ThunderClapButton.MouseButton1Click:Connect(playThunderClapAnimation)
GroundSmashButton.MouseButton1Click:Connect(playGroundSmashAnimation)
