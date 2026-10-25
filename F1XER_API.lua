-- language: Luau, file: F1XER_API.lua
-- API для Эксплорера (только для чтения и анализа)

getgenv().F1XER_EXPLORER_API = {}

-- 1. Скопировать код скрипта в буфер обмена
function getgenv().F1XER_EXPLORER_API.CopyScript(script)
    if script and (script:IsA("Script") or script:IsA("LocalScript") or script:IsA("ModuleScript")) then
        local code = ""
        if decompile then
            code = decompile(script)
        else
            code = "-- Decompile недоступен в этом экзекуторе"
        end
        if setclipboard then
            setclipboard(code)
            print("[Explorer API] Код скопирован: " .. script:GetFullName())
        end
    end
end

-- 2. Поиск по всем скриптам (возвращает таблицу путей)
function getgenv().F1XER_EXPLORER_API.SearchScripts(query)
    local results = {}
    local roots = {workspace, game:GetService("ReplicatedStorage"), game:GetService("ServerScriptService")}
    for _, root in pairs(roots) do
        for _, obj in pairs(root:GetDescendants()) do
            if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
                local code = decompile and decompile(obj) or ""
                if string.find(code, query) then
                    table.insert(results, obj:GetFullName())
                end
            end
        end
    end
    return results
end

-- 3. Получить список всех скриптов
function getgenv().F1XER_EXPLORER_API.GetAllScripts()
    local list = {}
    for _, root in pairs({workspace, game:GetService("ReplicatedStorage")}) do
        for _, obj in pairs(root:GetDescendants()) do
            if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
                table.insert(list, obj:GetFullName())
            end
        end
    end
    return list
end

print("[F1XER Explorer API] Загружен. Инструменты исследования готовы.")
