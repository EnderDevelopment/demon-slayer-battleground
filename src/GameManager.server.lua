-- GameManager.server.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameState = {
    Lobby = "Lobby",
    InProgress = "InProgress",
    Ended = "Ended"
}

local gameState = GameState.Lobby
local gameTimer = 0
local maxGameTime = 300 -- 5 minutes in seconds

local function spawnPlayer(player)
    -- Spawn logic for players
    local spawnLocation = workspace:FindFirstChild("PlayerSpawn")
    if spawnLocation then
        local character = Instance.new("Model")
        character.Name = player.Name
        character.Parent = workspace
        player.Character = character
        character:PivotTo(spawnLocation.CFrame)
    end
end

local function startGame()
    gameState = GameState.InProgress
    gameTimer = 0
    
    -- Spawn players
    for _, player in ipairs(Players:GetPlayers()) do
        spawnPlayer(player)
    end

    -- Spawn demons
    spawnDemons()
end

local function endGame()
    gameState = GameState.Ended
    -- Game end logic
end

local function updateGame(deltaTime)
    if gameState == GameState.InProgress then
        gameTimer += deltaTime
        if gameTimer >= maxGameTime then
            endGame()
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    if gameState == GameState.Lobby then
        spawnPlayer(player)
    end
end)

game:GetService("RunService").Heartbeat:Connect(updateGame)

return {
    GameState = GameState,
    startGame = startGame,
    endGame = endGame
}