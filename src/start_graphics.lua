-- src/start_graphics.lua
_G.StartGraphics = function()
    local url = "https://raw.githubusercontent.com/a32435629-collab/graphics/main/dist/graphics.lua"
    local success, err = pcall(function()
        local code = game:HttpGet(url)
        loadstring(code)()
    end)
    if not success then warn("[Graphics] Ошибка загрузки: " .. tostring(err)) end
end