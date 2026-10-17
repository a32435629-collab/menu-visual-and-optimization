-- src/start_render.lua
_G.StartRender = function()
    local url = "https://raw.githubusercontent.com/a32435629-collab/render/main/dist/render.lua"
    local success, err = pcall(function()
        local code = game:HttpGet(url)
        loadstring(code)()
    end)
    if not success then warn("[Render] Ошибка загрузки: " .. tostring(err)) end
end