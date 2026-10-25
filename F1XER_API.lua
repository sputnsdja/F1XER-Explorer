-- language: Luau, file: F1XER_API.lua
-- Настройки Эксплорера

getgenv().F1XER_EXPLORER_CONFIG = {
    Modes = {
        ["Workspace"] = {workspace},
        ["ReplicatedStorage"] = {game:GetService("ReplicatedStorage")},
        ["ServerScriptService"] = {game:GetService("ServerScriptService")},
        ["All"] = {workspace, game:GetService("ReplicatedStorage"), game:GetService("ServerScriptService"), game:GetService("Players")}
    }
}

print("[API] Конфигурация режимов загружена.")
