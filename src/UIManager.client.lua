-- UIManager.client.lua

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function createHealthBar()
    -- Create health bar UI
    local healthBar = Instance.new("Frame")
    healthBar.Name = "HealthBar"
    healthBar.Size = UDim2.new(0.2, 0, 0.05, 0)
    healthBar.Position = UDim2.new(0.4, 0, 0.1, 0)
    healthBar.BackgroundColor3 = Color3.new(1, 0, 0)
    healthBar.Parent = playerGui
    
    local health = Instance.new("Frame")
    health.Name = "Health"
    health.Size = UDim2.new(1, 0, 1, 0)
    health.BackgroundColor3 = Color3.new(0, 1, 0)
    health.Parent = healthBar
    
    return healthBar
end

local function createScoreDisplay()
    -- Create score display UI
    local scoreDisplay = Instance.new("TextLabel")
    scoreDisplay.Name = "ScoreDisplay"
    scoreDisplay.Size = UDim2.new(0.1, 0, 0.05, 0)
    scoreDisplay.Position = UDim2.new(0.45, 0, 0.2, 0)
    scoreDisplay.Text = "Score: 0"
    scoreDisplay.TextColor3 = Color3.new(1, 1, 1)
    scoreDisplay.BackgroundTransparency = 1
    scoreDisplay.Parent = playerGui
    
    return scoreDisplay
end

local function createGameTimer()
    -- Create game timer UI
    local gameTimer = Instance.new("TextLabel")
    gameTimer.Name = "GameTimer"
    gameTimer.Size = UDim2.new(0.1, 0, 0.05, 0)
    gameTimer.Position = UDim2.new(0.45, 0, 0.3, 0)
    gameTimer.Text = "Time: 0"
    gameTimer.TextColor3 = Color3.new(1, 1, 1)
    gameTimer.BackgroundTransparency = 1
    gameTimer.Parent = playerGui
    
    return gameTimer
end

local healthBar = createHealthBar()
local scoreDisplay = createScoreDisplay()
local gameTimer = createGameTimer()

return {
    healthBar = healthBar,
    scoreDisplay = scoreDisplay,
    gameTimer = gameTimer
}