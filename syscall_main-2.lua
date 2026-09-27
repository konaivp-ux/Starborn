local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local COLORS = {
    Background = Color3.fromRGB(12, 8, 8),
    Row = Color3.fromRGB(30, 20, 20),
    RowDark = Color3.fromRGB(22, 14, 14),
    Badge = Color3.fromRGB(45, 30, 30),
    TabBar = Color3.fromRGB(18, 12, 12),
    TabActive = Color3.fromRGB(40, 25, 25),
    White = Color3.fromRGB(255, 255, 255),
    RoseGold = Color3.fromRGB(183, 110, 121),
    RoseGoldBright = Color3.fromRGB(218, 145, 155),
    TextDim = Color3.fromRGB(200, 180, 180),
    Stroke = Color3.fromRGB(218, 165, 170),
}

local function corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = parent
    return c
end

local function stroke(parent, thickness, color, transparency)
    local s = Instance.new("UIStroke")
    s.Thickness = thickness or 1
    s.Color = color or COLORS.Stroke
    s.Transparency = transparency or 0
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

local function padding(parent, l, r, t, b)
    local p = Instance.new("UIPadding")
    p.PaddingLeft = UDim.new(0, l)
    p.PaddingRight = UDim.new(0, r)
    p.PaddingTop = UDim.new(0, t)
    p.PaddingBottom = UDim.new(0, b)
    p.Parent = parent
    return p
end

-- ═══════════════════════════════════════════════════════════
-- INTRO SCREEN (FULLSCREEN)
-- ═══════════════════════════════════════════════════════════
local introGui = Instance.new("ScreenGui")
introGui.Name = "BumbledIntro"
introGui.ResetOnSpawn = false
introGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
introGui.DisplayOrder = 100
introGui.IgnoreGuiInset = true
introGui.Parent = playerGui

local introFrame = Instance.new("Frame")
introFrame.Size = UDim2.new(1, 0, 1, 0)
introFrame.BackgroundColor3 = Color3.fromRGB(255, 240, 245)
introFrame.BorderSizePixel = 0
introFrame.ZIndex = 100
introFrame.Parent = introGui

local introGrad = Instance.new("UIGradient")
introGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 240, 245)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 220, 230)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 215)),
})
introGrad.Rotation = 45
introGrad.Parent = introFrame

local introText = Instance.new("TextLabel")
introText.Text = "humbled duels"
introText.Font = Enum.Font.GothamBlack
introText.TextSize = 42
introText.TextColor3 = COLORS.RoseGold
introText.BackgroundTransparency = 1
introText.Size = UDim2.new(1, 0, 0, 60)
introText.Position = UDim2.new(0, 0, 0.5, -30)
introText.TextXAlignment = Enum.TextXAlignment.Center
introText.ZIndex = 101
introText.Parent = introFrame

local subText = Instance.new("TextLabel")
subText.Text = "loading..."
subText.Font = Enum.Font.GothamMedium
subText.TextSize = 14
subText.TextColor3 = Color3.fromRGB(200, 140, 150)
subText.BackgroundTransparency = 1
subText.Size = UDim2.new(1, 0, 0, 24)
subText.Position = UDim2.new(0, 0, 0.5, 32)
subText.TextXAlignment = Enum.TextXAlignment.Center
subText.ZIndex = 101
subText.Parent = introFrame

-- Animate text in
introText.TextTransparency = 1
subText.TextTransparency = 1
TweenService:Create(introText, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    TextTransparency = 0
}):Play()
task.wait(0.3)
TweenService:Create(subText, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    TextTransparency = 0
}):Play()

-- Fade out after delay
task.spawn(function()
    task.wait(3.5)
    
    TweenService:Create(subText, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    TweenService:Create(introText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(introFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        BackgroundTransparency = 1
    }):Play()
    
    task.wait(1)
    introGui:Destroy()
end)

-- ═══════════════════════════════════════════════════════════
-- MAIN UI
-- ═══════════════════════════════════════════════════════════
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BumbledUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 220, 0, 300)
main.Position = UDim2.new(0.5, -110, 0.5, -150)
main.BackgroundColor3 = COLORS.Background
main.BackgroundTransparency = 0.2
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Visible = false
main.Parent = screenGui
corner(main, 12)

-- Reveal main UI after intro starts fading
task.spawn(function()
    task.wait(3.2)
    main.Visible = true
    main.BackgroundTransparency = 1
    TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.2
    }):Play()
end)

local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 1.2
mainStroke.Color = COLORS.RoseGold
mainStroke.Transparency = 0.6
mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
mainStroke.Parent = main

local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 38)
header.BackgroundTransparency = 1
header.Parent = main

local logoHolder = Instance.new("Frame")
logoHolder.Size = UDim2.new(0, 26, 0, 22)
logoHolder.Position = UDim2.new(0, 10, 0, 8)
logoHolder.BackgroundColor3 = COLORS.Badge
logoHolder.BackgroundTransparency = 0.3
logoHolder.BorderSizePixel = 0
logoHolder.Parent = header
corner(logoHolder, 8)

local logoImage = Instance.new("ImageLabel")
logoImage.Name = "Logo"
logoImage.AnchorPoint = Vector2.new(0.5, 0.5)
logoImage.Size = UDim2.new(0, 20, 0, 20)
logoImage.Position = UDim2.new(0.5, 0, 0.5, 0)
logoImage.BackgroundTransparency = 1
logoImage.Image = "rbxassetid://91760609863446"
logoImage.Parent = logoHolder

local title = Instance.new("TextLabel")
title.Text = "BUMBLED"
title.Font = Enum.Font.GothamBlack
title.TextSize = 12
title.TextColor3 = COLORS.RoseGoldBright
title.BackgroundTransparency = 1
title.Size = UDim2.new(0, 100, 0, 16)
title.Position = UDim2.new(0, 42, 0, 11)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local lineTrack = Instance.new("Frame")
lineTrack.Name = "LineTrack"
lineTrack.Size = UDim2.new(1, -20, 0, 2)
lineTrack.Position = UDim2.new(0, 10, 0, 34)
lineTrack.BackgroundColor3 = COLORS.RoseGold
lineTrack.BackgroundTransparency = 0.85
lineTrack.BorderSizePixel = 0
lineTrack.ClipsDescendants = true
lineTrack.Parent = header
corner(lineTrack, 1)

local movingLine = Instance.new("Frame")
movingLine.Name = "MovingLine"
movingLine.Size = UDim2.new(0, 60, 1, 0)
movingLine.Position = UDim2.new(0, -60, 0, 0)
movingLine.BackgroundColor3 = COLORS.RoseGoldBright
movingLine.BorderSizePixel = 0
movingLine.Parent = lineTrack
corner(movingLine, 1)

local lineGrad = Instance.new("UIGradient")
lineGrad.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 0.3),
    NumberSequenceKeypoint.new(1, 0),
})
lineGrad.Parent = movingLine

task.spawn(function()
    local speed = 100
    local x = -60
    RunService.RenderStepped:Connect(function(dt)
        x += speed * dt
        local trackWidth = lineTrack.AbsoluteSize.X
        if x > trackWidth then
            x = -60
        end
        movingLine.Position = UDim2.new(0, x, 0, 0)
    end)
end)

local content = Instance.new("ScrollingFrame")
content.Name = "Content"
content.Size = UDim2.new(1, -20, 1, -42 - 36)
content.Position = UDim2.new(0, 10, 0, 42)
content.BackgroundTransparency = 1
content.BorderSizePixel = 0
content.ScrollBarThickness = 2
content.ScrollBarImageColor3 = COLORS.Badge
content.CanvasSize = UDim2.new(0, 0, 0, 0)
content.AutomaticCanvasSize = Enum.AutomaticSize.Y
content.Parent = main

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 6)
listLayout.Parent = content

local order = 0
local function nextOrder()
    order += 1
    return order
end

local pages = {}

local function makePage(name)
    local page = Instance.new("Frame")
    page.Name = name
    page.Size = UDim2.new(1, 0, 0, 0)
    page.AutomaticSize = Enum.AutomaticSize.Y
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = content

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)
    layout.Parent = page

    pages[name] = page
    return page
end

local tabNames = {"duel", "settings", "keybinds", "ui changer"}
local tabButtons = {}
local currentTab = "duel"

for _, name in ipairs(tabNames) do
    local page = makePage(name)
    
    local emptyLabel = Instance.new("TextLabel")
    emptyLabel.Text = "Empty"
    emptyLabel.Font = Enum.Font.GothamMedium
    emptyLabel.TextSize = 11
    emptyLabel.TextColor3 = COLORS.TextDim
    emptyLabel.BackgroundTransparency = 1
    emptyLabel.Size = UDim2.new(1, 0, 0, 100)
    emptyLabel.TextXAlignment = Enum.TextXAlignment.Center
    emptyLabel.LayoutOrder = 1
    emptyLabel.Parent = page
end

pages[currentTab].Visible = true

local tabBar = Instance.new("Frame")
tabBar.Name = "TabBar"
tabBar.Size = UDim2.new(1, -12, 0, 30)
tabBar.Position = UDim2.new(0, 6, 1, -34)
tabBar.BackgroundColor3 = COLORS.TabBar
tabBar.BackgroundTransparency = 0.2
tabBar.BorderSizePixel = 0
tabBar.Parent = main
corner(tabBar, 10)
padding(tabBar, 3, 3, 3, 3)

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding = UDim.new(0, 3)
tabLayout.Parent = tabBar

local function selectTab(name)
    if currentTab == name then return end
    currentTab = name

    for tabName, data in pairs(tabButtons) do
        local active = tabName == name
        local info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(data.button, info, {
            BackgroundColor3 = active and COLORS.TabActive or COLORS.RowDark,
            BackgroundTransparency = active and 0.1 or 0.4,
        }):Play()
        TweenService:Create(data.stroke, info, {
            Transparency = active and 0.15 or 0.55,
        }):Play()
        TweenService:Create(data.underline, info, {
            BackgroundTransparency = active and 0 or 1,
            Size = active and UDim2.new(0, 12, 0, 2) or UDim2.new(0, 0, 0, 2),
        }):Play()
        pages[tabName].Visible = active
    end
    content.CanvasPosition = Vector2.new(0, 0)
end

for i, name in ipairs(tabNames) do
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.Size = UDim2.new(1 / #tabNames, -3, 1, 0)
    btn.BackgroundColor3 = (name == currentTab) and COLORS.TabActive or COLORS.RowDark
    btn.BackgroundTransparency = (name == currentTab) and 0.1 or 0.4
    btn.BorderSizePixel = 0
    btn.LayoutOrder = i
    btn.Parent = tabBar
    corner(btn, 6)

    local tabStroke = stroke(btn, 1, COLORS.Stroke, (name == currentTab) and 0.15 or 0.55)

    local lbl = Instance.new("TextLabel")
    lbl.Text = name
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 8
    lbl.TextColor3 = COLORS.White
    lbl.TextScaled = false
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(1, 0, 0, 12)
    lbl.Position = UDim2.new(0, 0, 0, 5)
    lbl.Parent = btn

    local underline = Instance.new("Frame")
    underline.AnchorPoint = Vector2.new(0.5, 0)
    underline.Position = UDim2.new(0.5, 0, 0, 20)
    underline.Size = (name == currentTab) and UDim2.new(0, 12, 0, 2) or UDim2.new(0, 0, 0, 2)
    underline.BackgroundColor3 = COLORS.RoseGold
    underline.BackgroundTransparency = (name == currentTab) and 0 or 1
    underline.BorderSizePixel = 0
    underline.Parent = btn
    corner(underline, 1)

    tabButtons[name] = { button = btn, underline = underline, stroke = tabStroke }

    btn.MouseButton1Click:Connect(function()
        selectTab(name)
    end)
end


-- ═══════════════════════════════════════════════════════════
-- SYSCALL FEATURES / CUSTOM UI COMPATIBILITY
-- ═══════════════════════════════════════════════════════════
local UserInputService = game:GetService("UserInputService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = player
local Camera = Workspace.CurrentCamera
local PlayerGui = playerGui

local Options = {}
local Toggles = {}

local function makeRow(parent, height)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -6, 0, height or 30)
    row.BackgroundColor3 = COLORS.Row
    row.BackgroundTransparency = 0.12
    row.BorderSizePixel = 0
    row.Parent = parent
    corner(row, 8)
    stroke(row, 1, COLORS.Stroke, 0.75)
    return row
end

local function makeLabel(parent, text, size)
    local lbl = Instance.new("TextLabel")
    lbl.Text = text
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextSize = size or 10
    lbl.TextColor3 = COLORS.White
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(1, -12, 1, 0)
    lbl.Position = UDim2.new(0, 6, 0, 0)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = parent
    return lbl
end

local function addGroup(page, title)
    local group = Instance.new("Frame")
    group.Name = title:gsub("%s", "")
    group.Size = UDim2.new(1, 0, 0, 0)
    group.AutomaticSize = Enum.AutomaticSize.Y
    group.BackgroundColor3 = COLORS.RowDark
    group.BackgroundTransparency = 0.12
    group.BorderSizePixel = 0
    group.Parent = page
    corner(group, 9)
    stroke(group, 1, COLORS.Stroke, 0.65)
    padding(group, 6, 6, 6, 6)

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.Parent = group

    local header = makeLabel(group, title, 10)
    header.Size = UDim2.new(1, -12, 0, 20)
    header.Font = Enum.Font.GothamBold
    header.TextColor3 = COLORS.RoseGoldBright
    header.LayoutOrder = 0

    local api = {}

    function api:AddButton(cfg)
        local row = makeRow(group, 30)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text = cfg.Text or "Button"
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 10
        btn.TextColor3 = COLORS.White
        btn.AutoButtonColor = false
        btn.Parent = row
        btn.MouseButton1Click:Connect(function()
            if cfg.Func then cfg.Func() end
        end)
        return btn
    end

    function api:AddToggle(key, cfg)
        local row = makeRow(group, 30)
        local state = cfg.Default == true
        local label = makeLabel(row, cfg.Text or key, 10)
        label.Size = UDim2.new(1, -45, 1, 0)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 34, 0, 20)
        btn.Position = UDim2.new(1, -40, 0.5, -10)
        btn.BackgroundColor3 = state and COLORS.RoseGold or COLORS.Badge
        btn.Text = state and "ON" or "OFF"
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 8
        btn.TextColor3 = COLORS.White
        btn.AutoButtonColor = false
        btn.Parent = row
        corner(btn, 6)
        local function set(v)
            state = v and true or false
            Toggles[key].Value = state
            btn.Text = state and "ON" or "OFF"
            btn.BackgroundColor3 = state and COLORS.RoseGold or COLORS.Badge
            if cfg.Callback then cfg.Callback(state) end
        end
        Toggles[key] = {Value = state, SetValue = set}
        btn.MouseButton1Click:Connect(function() set(not state) end)
        return Toggles[key]
    end

    function api:AddSlider(key, cfg)
        local row = makeRow(group, 42)
        local label = makeLabel(row, (cfg.Text or key) .. ": " .. tostring(cfg.Default or cfg.Min or 0), 9)
        label.Size = UDim2.new(1, -12, 0, 16)
        label.Position = UDim2.new(0, 6, 0, 2)
        local min = cfg.Min or 0
        local max = cfg.Max or 100
        local value = cfg.Default or min
        local bar = Instance.new("Frame")
        bar.Size = UDim2.new(1, -12, 0, 6)
        bar.Position = UDim2.new(0, 6, 1, -11)
        bar.BackgroundColor3 = COLORS.Badge
        bar.BorderSizePixel = 0
        bar.Parent = row
        corner(bar, 3)
        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((value-min)/math.max(max-min,1), 0, 1, 0)
        fill.BackgroundColor3 = COLORS.RoseGold
        fill.BorderSizePixel = 0
        fill.Parent = bar
        corner(fill, 3)
        local function set(v)
            value = math.clamp(v, min, max)
            Options[key].Value = value
            label.Text = (cfg.Text or key) .. ": " .. tostring(math.floor(value + 0.5))
            fill.Size = UDim2.new((value-min)/math.max(max-min,1), 0, 1, 0)
            if cfg.Callback then cfg.Callback(value) end
        end
        Options[key] = {Value=value, SetValue=set}
        local dragging = false
        local function update(x)
            local pct = math.clamp((x - bar.AbsolutePosition.X) / math.max(bar.AbsoluteSize.X,1), 0, 1)
            set(min + (max-min)*pct)
        end
        bar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true; update(input.Position.X)
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then update(input.Position.X) end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
        end)
        return Options[key]
    end

    function api:AddDropdown(key, cfg)
        local row = makeRow(group, 30)
        local current = cfg.Values[cfg.Default or 1]
        local label = makeLabel(row, (cfg.Text or key) .. ": " .. tostring(current), 9)
        local index = cfg.Default or 1
        row.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                index = index % #cfg.Values + 1
                current = cfg.Values[index]
                label.Text = (cfg.Text or key) .. ": " .. tostring(current)
                Options[key].Value = current
            end
        end)
        Options[key] = {Value=current}
        return Options[key]
    end

    function api:AddLabel(text)
        local row = makeRow(group, 26)
        makeLabel(row, text, 9)
        local labelApi = {}
        function labelApi:AddKeyPicker(key, cfg)
            local value = cfg.Default or "E"
            Options[key] = {Value=value, GetState=function()
                local ok, result = pcall(function() return UserInputService:IsKeyDown(Enum.KeyCode[value]) end)
                return ok and result or false
            end}
            return labelApi
        end
        return labelApi
    end

    return api
end

-- Put feature controls into the custom textfile tabs.

-- ═══════════════════════════════════════════════════════════
-- KO.LUA (BLYXO 4.1.0) AUTO STEAL ENGINE
-- ═══════════════════════════════════════════════════════════



-- ── Wire BX modules ───────────────────────────────────────

local OreoAuto      = BX.require("features.autosteal")
local OreoEggs      = BX.require("features.eggs")
local OreoTreadmill = BX.require("features.treadmill")
local OreoEggESP    = BX.require("features.esp.eggs")
local OreoLog       = BX.require("boot.log").for_module("syscall.integration")

-- Anti Treadmill on by default (matches ko.lua behaviour)
BX.try("syscall.treadmill.default", function()
    OreoTreadmill.setEnabled(true)
end)

-- Profile + boot modules
BX.require("boot.log")
BX.require("boot.scope")
BX.require("core.services")
BX.require("core.exec")
BX.require("core.device")
BX.require("core.character")
BX.require("core.restore")
BX.require("core.state")
BX.require("core.util")
BX.require("core.config")
BX.require("core.data")
BX.require("core.net")
BX.require("features.treadmill")
BX.require("features.eggs")
BX.require("features.grab")
BX.require("features.movement")
BX.require("features.humanoid")
BX.require("features.antideath")
BX.require("features.guard")
BX.require("features.plot")
BX.require("features.regrab")
BX.require("features.autosteal")
BX.require("features.esp.cards")
BX.require("features.esp.eggs")

BX.profile.start()

-- ── Groups ────────────────────────────────────────────────

local GameGroup   = addGroup(pages["duel"],     "Game")
local PlayerGroup = addGroup(pages["duel"],     "Player")
local ESPGroup    = addGroup(pages["settings"], "ESP")

-- ── Target Egg helpers ────────────────────────────────────

local MAX_EGGS   = 40
local labelToUid = {}
local eggRows    = {}
local selectedUid = nil

local function labelFor(egg)
    local suffix = ""
    if egg.guardHeld then suffix = "  (guard)"
    elseif egg.dropped then suffix = "  (floor)" end
    return ("%s  |  %s/s%s"):format(egg.name, OreoEggs.formatRate(egg.value), suffix)
end

local function buildEggOptions()
    local list = OreoEggs.list({}, true)
    labelToUid = {}; eggRows = {}
    local out, used = {}, {}
    for i, egg in ipairs(list) do
        if i > MAX_EGGS then break end
        local lbl = labelFor(egg)
        if used[lbl] then
            used[lbl] = used[lbl] + 1
            lbl = lbl .. ("  #%d"):format(used[lbl])
        else used[lbl] = 1 end
        labelToUid[lbl] = egg.uid
        eggRows[#eggRows + 1] = egg
        out[#out + 1] = lbl
    end
    if #out == 0 then out[1] = "No eggs found" end
    return out
end

local function eggForLabel(value)
    if type(value) ~= "string" or value == "" or value == "No eggs found" then return nil end
    local uid = labelToUid[value]
    if uid then
        for _, e in ipairs(eggRows) do if e.uid == uid then return e end end
        return {uid = uid}
    end
end

-- ── Steal Group ───────────────────────────────────────────

local StealGroup = addGroup(pages["duel"], "Auto Steal")

-- Info label
do
    local row = makeRow(pages["duel"], 46)
    local lbl = makeLabel(row,
        "Pick an egg below then toggle Auto Steal. Baits the Forest guard, steals the egg, carries it home.", 9)
    lbl.TextWrapped = true
end

-- Target egg dropdown (custom inline selector)
local eggOptions     = buildEggOptions()
local eggBtnFrame    = makeRow(pages["duel"], 30)
makeLabel(eggBtnFrame, "Target Egg", 10)

local eggValLbl = Instance.new("TextLabel")
eggValLbl.Size = UDim2.new(0, 110, 0, 20)
eggValLbl.AnchorPoint = Vector2.new(1, 0.5)
eggValLbl.Position = UDim2.new(1, -32, 0.5, 0)
eggValLbl.BackgroundColor3 = COLORS.Badge
eggValLbl.Text = eggOptions[1] or "No eggs"
eggValLbl.TextColor3 = COLORS.RoseGold
eggValLbl.TextSize = 8
eggValLbl.Font = Enum.Font.GothamBold
eggValLbl.TextTruncate = Enum.TextTruncate.AtEnd
eggValLbl.TextXAlignment = Enum.TextXAlignment.Center
eggValLbl.Parent = eggBtnFrame
corner(eggValLbl, 5)

local eggIdx = 1
local function cycleEgg(dir)
    eggIdx = ((eggIdx - 1 + dir) % math.max(#eggOptions, 1)) + 1
    local lbl = eggOptions[eggIdx]
    eggValLbl.Text = lbl or "No eggs"
    local egg = eggForLabel(lbl)
    selectedUid = egg and egg.uid or nil
    OreoAuto.setOptions("main", {uid = selectedUid})
end

local prevBtn = Instance.new("TextButton")
prevBtn.Size = UDim2.fromOffset(22, 22)
prevBtn.AnchorPoint = Vector2.new(1, 0.5)
prevBtn.Position = UDim2.new(1, -4, 0.5, 0)
prevBtn.BackgroundColor3 = COLORS.Badge
prevBtn.Text = "▶"
prevBtn.TextColor3 = COLORS.RoseGold
prevBtn.TextSize = 10
prevBtn.Font = Enum.Font.GothamBold
prevBtn.AutoButtonColor = false
prevBtn.BorderSizePixel = 0
prevBtn.Parent = eggBtnFrame
corner(prevBtn, 5)
prevBtn.MouseButton1Click:Connect(function() cycleEgg(1) end)

-- Refresh egg list button
StealGroup:AddButton({Text = "Refresh Egg List", Func = function()
    eggOptions = buildEggOptions()
    eggIdx = 1
    eggValLbl.Text = eggOptions[1] or "No eggs"
    local egg = eggForLabel(eggOptions[1])
    selectedUid = egg and egg.uid or nil
    OreoAuto.setOptions("main", {uid = selectedUid})
end})

-- Auto Steal toggle
local _persist = false
StealGroup:AddToggle("AutoSteal", {Text = "Auto Steal", Default = false, Callback = function(on)
    if on then
        _persist = true
        OreoAuto.setEnabled(true, "main")
    else
        _persist = false
        OreoAuto.setEnabled(false, "main")
    end
end})

-- Sync toggle off when run stops
OreoAuto.onStop(function(why, whose)
    if whose and whose ~= "main" then return end
    if not _persist then return end
    -- persistent mode: restart automatically
    task.spawn(function()
        OreoAuto.setEnabled(false, "main")
        task.wait(0.5)
        OreoAuto.setEnabled(true, "main")
    end)
end)

-- ── Game Group ────────────────────────────────────────────

GameGroup:AddButton({Text = "Remove Traps",     Func = removeTraps})
GameGroup:AddButton({Text = "Remove Guards",    Func = removeGuards})
GameGroup:AddButton({Text = "Bypass Anti Cheat",Func = bypassAntiCheat})
GameGroup:AddToggle("InstantPickup", {Text = "Instant Pickup", Default = false})
ProximityPromptService.PromptShown:Connect(function(prompt)
    if Toggles.InstantPickup.Value then prompt.HoldDuration = 0 end
end)
GameGroup:AddToggle("AutoPickup", {Text = "Auto Pickup", Default = false})
GameGroup:AddToggle("ExpandHitbox", {Text = "Expand Hitboxes", Default = false, Callback = function(enabled)
    if not enabled then return end
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant.Name == "Hitbox" and descendant:IsA("BasePart") then
            descendant.Size = Vector3.new(20, 20, 20)
        end
    end
end})
workspace.DescendantAdded:Connect(function(descendant)
    if not Toggles.ExpandHitbox.Value or descendant.Name ~= "Hitbox" or not descendant:IsA("BasePart") then return end
    descendant.Size = Vector3.new(20, 20, 20)
end)

-- ── Player Group ──────────────────────────────────────────

PlayerGroup:AddToggle("TpWalk", {Text = "TP Walk", Default = false})
PlayerGroup:AddSlider("TpWalkSpeed", {Text = "TP Walk Speed", Default = 120, Min = 1, Max = 1000, Rounding = 0,
    Callback = function(v) Options.TpWalkSpeed.Value = v end})
PlayerGroup:AddToggle("AntiRagdoll", {Text = "Anti Ragdoll", Default = false})
PlayerGroup:AddToggle("Fly", {Text = "Fly (WASD)", Default = false})
PlayerGroup:AddSlider("FlySpeed", {Text = "Fly Speed", Default = 500, Min = 1, Max = 1000, Rounding = 0,
    Callback = function(v) Options.FlySpeed.Value = v end})

-- ── ESP Group ─────────────────────────────────────────────

ESPGroup:AddToggle("EggESP", {Text = "Egg ESP", Default = false, Callback = function(on)
    BX.try("syscall.eggEsp", function() OreoEggESP.setEnabled(on) end)
end})
ESPGroup:AddToggle("AntiTreadmill", {Text = "Anti Treadmill", Default = true, Callback = function(on)
    BX.try("syscall.treadmill", function() OreoTreadmill.setEnabled(on) end)
end})

-- ── Fly + TPWalk runtime ──────────────────────────────────

local normalFlyGyro, normalFlyVel = nil, nil
local UserInputService = game:GetService("UserInputService")

RunService.RenderStepped:Connect(function(dt)
    local char = LocalPlayer.Character
    if not char then return end
    local hum  = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return end

    if Toggles.TpWalk and Toggles.TpWalk.Value then
        if hum.MoveDirection.Magnitude > 0 then
            local spd = Options.TpWalkSpeed and Options.TpWalkSpeed.Value or 120
            root.AssemblyLinearVelocity = Vector3.new(
                hum.MoveDirection.X * spd, root.AssemblyLinearVelocity.Y, hum.MoveDirection.Z * spd)
        end
    end

    if Toggles.Fly and Toggles.Fly.Value then
        if not normalFlyGyro or not normalFlyGyro.Parent then
            normalFlyGyro = Instance.new("BodyGyro"); normalFlyGyro.Name = "CustomFlyGyro"
            normalFlyGyro.P = 9e4; normalFlyGyro.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
            normalFlyGyro.Parent = root
        end
        if not normalFlyVel or not normalFlyVel.Parent then
            normalFlyVel = Instance.new("BodyVelocity"); normalFlyVel.Name = "CustomFlyVel"
            normalFlyVel.Velocity = Vector3.zero; normalFlyVel.MaxForce = Vector3.new(9e4, 9e4, 9e4)
            normalFlyVel.Parent = root
        end
        local cam = workspace.CurrentCamera
        local dir = Vector3.zero
        if not UserInputService:GetFocusedTextBox() then
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
        end
        local spd = Options.FlySpeed and Options.FlySpeed.Value or 500
        normalFlyGyro.CFrame = cam.CFrame
        normalFlyVel.Velocity = dir * math.clamp(spd, 1, 1000)
        hum.PlatformStand = true
    else
        if normalFlyGyro then normalFlyGyro:Destroy(); normalFlyGyro = nil end
        if normalFlyVel  then normalFlyVel:Destroy();  normalFlyVel  = nil end
        if hum and hum.PlatformStand then
            hum.PlatformStand = false
            pcall(function() hum:ChangeState(Enum.HumanoidStateType.Landed) end)
        end
    end
end)

-- Auto Pickup runtime
local function fireNearestPrompt()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local best, bestD = nil, 15
    for _, d in ipairs(workspace:GetDescendants()) do
        if d:IsA("ProximityPrompt") and d.Enabled then
            local p = d.Parent
            local part = (p and p:IsA("BasePart")) and p or (p and p:FindFirstChildWhichIsA("BasePart"))
            if part then
                local dist = (root.Position - part.Position).Magnitude
                if dist < bestD then bestD = dist; best = d end
            end
        end
    end
    if best then pcall(fireproximityprompt, best) end
end

RunService.Heartbeat:Connect(function()
    if Toggles.AutoPickup and Toggles.AutoPickup.Value then fireNearestPrompt() end
end)

