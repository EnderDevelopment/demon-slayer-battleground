-- DemonManager.server.lua

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local demonModels = {}

local function spawnDemon()
    -- Spawn logic for demons
    local spawnLocation = workspace:FindFirstChild("DemonSpawn")
    if spawnLocation then
        local demon = Instance.new("Model")
        demon.Name = "Demon"
        demon.Parent = workspace
        demon:PivotTo(spawnLocation.CFrame)
        
        -- Add demon behavior logic here
        table.insert(demonModels, demon)
    end
end

local function spawnDemons()
    -- Spawn multiple demons
    for i = 1, 5 do
        spawnDemon()
    end
end

return {
    spawnDemon = spawnDemon,
    spawnDemons = spawnDemons
}