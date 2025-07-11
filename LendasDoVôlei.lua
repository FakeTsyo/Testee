--[[
Script Local Lua para Roblox Mobile: Lendas do Vôlei
Recurso: GUI básica, ícone de bola de futebol, 20 funções flutuantes
Observações:
- As funções são exemplos e podem ser adaptadas conforme o jogo permitir.
- Coloque este script em StarterGui > StarterPlayerScripts para rodar localmente no Roblox Mobile.
- GUI flutuante arrastável.
]]

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LendasDoVoleiGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Criar ícone de bola de futebol (substitua por imagem personalizada, se desejar)
local soccerIcon = Instance.new("ImageButton")
soccerIcon.Name = "SoccerIcon"
soccerIcon.Size = UDim2.new(0, 70, 0, 70)
soccerIcon.Position = UDim2.new(0, 20, 0, 120)
soccerIcon.BackgroundTransparency = 0.5
soccerIcon.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
soccerIcon.Image = "rbxassetid://12625430157" -- Ícone genérico de bola de futebol
soccerIcon.Parent = screenGui
soccerIcon.Draggable = true

-- Container das funções
local functionsFrame = Instance.new("Frame")
functionsFrame.Name = "FunctionsFrame"
functionsFrame.Size = UDim2.new(0, 250, 0, 420)
functionsFrame.Position = UDim2.new(0, 100, 0, 120)
functionsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
functionsFrame.BackgroundTransparency = 0.25
functionsFrame.BorderSizePixel = 0
functionsFrame.Visible = false
functionsFrame.Parent = screenGui

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "Lendas do Vôlei - Menu"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(220, 220, 255)
title.Parent = functionsFrame

-- Botão de fechar
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -34, 0, 1)
closeBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.TextSize = 18
closeBtn.Parent = functionsFrame

-- Funções (exemplo)
local functionNames = {
    "Velocidade+", "Velocidade-", "Pulo+", "Pulo-", "Força+", "Força-",
    "Teleporte Base", "Teleporte Bola", "Câmera Fixa", "Câmera Livre",
    "Visão Noturna", "Visão Normal", "Colisão Off", "Colisão On", "Invisible",
    "Visible", "Auto-Receber", "Auto-Atacar", "Reset", "Recarregar GUI"
}

local functionCallbacks = {}

-- Exemplo de funções (adicione suas funções reais aqui)
functionCallbacks["Velocidade+"] = function()
    local char = player.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.WalkSpeed = char.Humanoid.WalkSpeed + 5
    end
end

functionCallbacks["Velocidade-"] = function()
    local char = player.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.WalkSpeed = char.Humanoid.WalkSpeed - 5
    end
end

functionCallbacks["Pulo+"] = function()
    local char = player.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.JumpPower = char.Humanoid.JumpPower + 10
    end
end

functionCallbacks["Pulo-"] = function()
    local char = player.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.JumpPower = char.Humanoid.JumpPower - 10
    end
end

functionCallbacks["Força+"] = function()
    -- Exemplo: aumentar força (se o jogo tiver atributo)
end

functionCallbacks["Força-"] = function()
    -- Exemplo: diminuir força
end

functionCallbacks["Teleporte Base"] = function()
    -- Exemplo: teleporte para base
    local char = player.Character
    if char then
        char:MoveTo(Vector3.new(0, 10, 0))
    end
end

functionCallbacks["Teleporte Bola"] = function()
    -- Exemplo: teleporte para a bola (ajustar conforme necessidade)
    local ball = workspace:FindFirstChild("Ball")
    local char = player.Character
    if ball and char then
        char:MoveTo(ball.Position + Vector3.new(2, 2, 2))
    end
end

functionCallbacks["Câmera Fixa"] = function()
    workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
end

functionCallbacks["Câmera Livre"] = function()
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end

functionCallbacks["Visão Noturna"] = function()
    game.Lighting.Brightness = 3
    game.Lighting.Ambient = Color3.new(1,1,1)
end

functionCallbacks["Visão Normal"] = function()
    game.Lighting.Brightness = 1
    game.Lighting.Ambient = Color3.fromRGB(128,128,128)
end

functionCallbacks["Colisão Off"] = function()
    local char = player.Character
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end

functionCallbacks["Colisão On"] = function()
    local char = player.Character
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

functionCallbacks["Invisible"] = function()
    local char = player.Character
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end
end

functionCallbacks["Visible"] = function()
    local char = player.Character
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 0
            end
        end
    end
end

functionCallbacks["Auto-Receber"] = function()
    -- Exemplo: automatizar recepção (depende do jogo)
end

functionCallbacks["Auto-Atacar"] = function()
    -- Exemplo: automatizar ataque (depende do jogo)
end

functionCallbacks["Reset"] = function()
    player:LoadCharacter()
end

functionCallbacks["Recarregar GUI"] = function()
    screenGui:Destroy()
    -- Recomenda-se recarregar o script manualmente ou com outro método
end

-- Gerar botões das funções (flutuantes)
for i, funcName in ipairs(functionNames) do
    local btn = Instance.new("TextButton")
    btn.Name = funcName
    btn.Text = funcName
    btn.Size = UDim2.new(0, 115, 0, 28)
    btn.Position = UDim2.new(0, 10 + ((i - 1) % 2) * 120, 0, 40 + math.floor((i - 1) / 2) * 32)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextSize = 15
    btn.BorderSizePixel = 0
    btn.Parent = functionsFrame
    btn.AutoButtonColor = true
    btn.Draggable = true -- Botão flutuante

    btn.MouseButton1Click:Connect(function()
        local callback = functionCallbacks[funcName]
        if callback then
            pcall(callback)
        end
    end)
end

-- Mostrar/ocultar menu ao clicar no ícone
soccerIcon.MouseButton1Click:Connect(function()
    functionsFrame.Visible = not functionsFrame.Visible
end)

closeBtn.MouseButton1Click:Connect(function()
    functionsFrame.Visible = false
end)
