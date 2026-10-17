-- menu.lua
_G.CreateMenu = function()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MenuOptimization"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game.CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 300, 0, 240)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -120)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    Title.Text = "Menu Visual & Optimization"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 18
    Title.Parent = MainFrame

    local function createButton(name, funcName, yPos)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.9, 0, 0, 40)
        btn.Position = UDim2.new(0.05, 0, 0, yPos)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
        btn.Text = name
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.SourceSans
        btn.TextSize = 16
        btn.Parent = MainFrame
        
        btn.MouseButton1Click:Connect(function()
            btn.Text = "Загрузка..."
            if _G[funcName] then
                _G[funcName]()
                btn.Text = "Запущено!"
            else
                btn.Text = "Ошибка"
            end
            task.wait(2)
            btn.Text = name
        end)
    end

    -- Вызываем функции из src-загрузчиков
    createButton("1. Restart Render", "StartRender", 50)
    createButton("2. Restart Graphics", "StartGraphics", 100)
    createButton("3. Start Visual", "StartVisual", 150)

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0.9, 0, 0, 30)
    CloseBtn.Position = UDim2.new(0.05, 0, 1, -35)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
    CloseBtn.Text = "Закрыть"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.Parent = MainFrame

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end 
-- src/start_render.lua
_G.StartRender = function()
    local url = "https://raw.githubusercontent.com/a32435629-collab/render/main/dist/render.lua"
    local success, err = pcall(function()
        local code = game:HttpGet(url)
        loadstring(code)()
    end)
    if not success then warn("[Render] Ошибка загрузки: " .. tostring(err)) end
end 
-- src/start_graphics.lua
_G.StartGraphics = function()
    local url = "https://raw.githubusercontent.com/a32435629-collab/graphics/main/dist/graphics.lua"
    local success, err = pcall(function()
        local code = game:HttpGet(url)
        loadstring(code)()
    end)
    if not success then warn("[Graphics] Ошибка загрузки: " .. tostring(err)) end
end 
-- src/start_visual.lua
_G.StartVisual = function()
    local url = "https://raw.githubusercontent.com/a32435629-collab/visual/main/dist/visual.lua"
    local success, err = pcall(function()
        local code = game:HttpGet(url)
        loadstring(code)()
    end)
    if not success then warn("[Visual] Ошибка загрузки: " .. tostring(err)) end
end 
-- main.lua
print("[Launcher] Запуск Menu Visual & Optimization...")

-- Запускаем меню
if _G.CreateMenu then
    _G.CreateMenu()
else
    warn("[Launcher] Ошибка: функция CreateMenu не найдена (menu.lua не загружен)")
end
