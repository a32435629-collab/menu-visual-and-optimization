-- main.lua
print("[Launcher] Запуск Menu Visual & Optimization...")

-- Запускаем меню
if _G.CreateMenu then
    _G.CreateMenu()
else
    warn("[Launcher] Ошибка: функция CreateMenu не найдена (menu.lua не загружен)")
end