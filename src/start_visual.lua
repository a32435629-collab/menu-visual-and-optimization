-- src/start_visual.lua
_G.StartVisual = function()
    local url = "https://raw.githubusercontent.com/a32435629-collab/visual/main/dist/visual.lua"
    local success, err = pcall(function()
        local code = game:HttpGet(url)
        loadstring(code)()
    end)
    if not success then warn("[Visual] Ошибка загрузки: " .. tostring(err)) end
end