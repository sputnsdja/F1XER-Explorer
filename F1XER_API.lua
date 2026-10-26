-- language: Luau, file: F1XER_API.lua
-- Настройки и цвета для F1XER Explorer

getgenv().F1XER_CONFIG = {
    ESP = {
        EnemyColor = Color3.fromRGB(255, 60, 60),
        TeamColor = Color3.fromRGB(60, 255, 60),
        UseTeamCheck = true
    },
    Modes = {
        ["Workspace"] = {workspace},
        ["ReplicatedStorage"] = {game:GetService("ReplicatedStorage")},
        ["All"] = {workspace, game:GetService("ReplicatedStorage"), game:GetService("ServerScriptService"), game:GetService("Players")}
    }
}

print("[API] Конфигурация F1XER загружена.")
