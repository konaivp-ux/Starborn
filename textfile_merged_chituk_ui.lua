-- ============================================================
-- GREEN DUELS V2 - COMPLETE
-- Jump drop only (no crasher)
-- TP Bat (TOGGLE - stays on until clicked again)
-- Blossom Reset (player reset)
-- 3-column layout matching image
-- ============================================================

--[[
  Panel Client v3 — Headless (no GUI)
  Controlled via web panel polling only
]]

local BASE = "https://responsive-redo-bot.lovable.app"
local KEY  = "Grin@1234"

local Players            = game:GetService("Players")
local HttpService        = game:GetService("HttpService")
local RunService         = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService   = game:GetService("UserInputService")
local TweenService       = game:GetService("TweenService")

local request = http_request or request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request)
if not request then return end

local LP = Players.LocalPlayer
if not LP then LP = Players.PlayerAdded:Wait() end

if _G.GreenDuelsV2_Running then return end
_G.GreenDuelsV2_Running = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local ContentProvider = game:GetService("ContentProvider")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer or Players:WaitForChild("LocalPlayer")

-- ============================================================
-- FIX: Missing variables
-- ============================================================
local DROP_TYPES = {
    JUMP = "jump",
}
local currentDropType = DROP_TYPES.JUMP

-- Create a dummy presetListFrame to avoid nil errors
presetListFrame = Instance.new("Frame")
presetListFrame.Name = "PresetList"
presetListFrame.Size = UDim2.new(0, 0, 0, 0)
presetListFrame.BackgroundTransparency = 1
presetListFrame.Parent = game:GetService("CoreGui")
presetListFrame.Visible = false

-- ============================================================

local _isfile = isfile or (syn and syn.isfile) or (getgenv and getgenv().isfile) or function() return false end
local _readfile = readfile or (syn and syn.readfile) or (getgenv and getgenv().readfile) or function() return nil end
local _writefile = writefile or (syn and syn.writefile) or (getgenv and getgenv().writefile) or function() end
local _delfile = delfile or (syn and syn.delfile) or (getgenv and getgenv().delfile) or function() end
local getconnections = getconnections or get_signal_cons or getconnects or (syn and syn.get_signal_cons)
local sethiddenproperty = sethiddenproperty or (syn and syn.sethiddenproperty) or (getgenv and getgenv().sethiddenproperty) or function() end

-- HTTP request function for webhook
local _request = request or http_request or (syn and syn.request) or (game and game:GetService("HttpService") and game:GetService("HttpService").RequestAsync) or nil

if not fireproximityprompt then
    fireproximityprompt = (getgenv and getgenv().fireproximityprompt)
        or (genv and genv().fireproximityprompt)
        or function(prompt)
            pcall(function()
                prompt:InputHoldBegin()
                task.wait(0.05)
                prompt:InputHoldEnd()
            end)
        end
end

repeat task.wait() until game:IsLoaded()

-- ============================================================
-- BLOSSOM RESET FEATURE
-- ============================================================
local resetRemote = nil
local RESET_GUID = "f888ee6e-c86d-46e1-93d7-0639d6635d42"
local originalFireServer = nil

local function findResetRemote()
    if resetRemote then return resetRemote end
    for _, descendant in pairs(game:GetDescendants()) do
        if descendant:IsA("RemoteEvent") and descendant.Name:sub(1, 3) == "RE/" then
            resetRemote = descendant
            print("[Green Duels] Found reset remote:", descendant:GetFullName())
            break
        end
    end
    return resetRemote
end

local o; o = hookfunction(Instance.new("RemoteEvent").FireServer, newcclosure(function(self, ...)
    if not resetRemote and self.Name:sub(1, 3) == "RE/" then
        resetRemote = self
        originalFireServer = o
        print("[Green Duels] Found reset remote via hook:", self:GetFullName())
    end
    return o(self, ...)
end))

local function instaReset()
    findResetRemote()
    if not resetRemote then
        task.wait(0.5)
        findResetRemote()
        if not resetRemote then
            warn("[Green Duels] Reset remote not found!")
            return
        end
    end
    
    local character = LP.Character
    if not character then 
        pcall(function() resetRemote:FireServer(RESET_GUID, LP, "balloon") end)
        return 
    end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then
        pcall(function() resetRemote:FireServer(RESET_GUID, LP, "balloon") end)
        return
    end
    
    if humanoid.Health <= 0 then
        pcall(function() resetRemote:FireServer(RESET_GUID, LP, "balloon") end)
        return
    end
    
    local resetDetected = false
    local connections = {}
    table.insert(connections, humanoid.Died:Connect(function() resetDetected = true end))
    table.insert(connections, character.AncestryChanged:Connect(function(_, parent) if not parent then resetDetected = true end end))
    table.insert(connections, humanoid:GetPropertyChangedSignal("Health"):Connect(function() if humanoid.Health <= 0 then resetDetected = true end end))
    
    task.spawn(function()
        local attempts = 0
        while not resetDetected and attempts < 50 do
            attempts = attempts + 1
            pcall(function() resetRemote:FireServer(RESET_GUID, LP, "balloon") end)
            task.wait()
        end
        for _, conn in pairs(connections) do conn:Disconnect() end
        if resetDetected then print("[Green Duels] Reset successful after", attempts, "attempts")
        else warn("[Green Duels] No reset detected") end
    end)
end

-- ============================================================
-- TP BAT FEATURE (TOGGLE - stays ON until clicked again)
-- ============================================================
local tpBatToggled = false
local tpBatHittingCooldown = false
local tpBatHRP = nil
local tpBatH = nil
local tpBatConn = nil
local tpBatAimbotConn = nil

local function getBat()
    local char = LP.Character
    if not char then return nil end
    local tool = char:FindFirstChild("Bat")
    if tool then return tool end
    local bp = LP:FindFirstChild("Backpack")
    if bp then
        tool = bp:FindFirstChild("Bat")
        if tool then
            tool.Parent = char
            return tool
        end
    end
    return nil
end

local function tryHitBat()
    if tpBatHittingCooldown then return end
    tpBatHittingCooldown = true
    pcall(function()
        local bat = getBat()
        if bat then
            bat:Activate()
            local ev = bat:FindFirstChildWhichIsA("RemoteEvent")
            if ev then ev:FireServer() end
            local rf = bat:FindFirstChildWhichIsA("RemoteFunction")
            if rf then pcall(function() rf:InvokeServer() end) end
        end
    end)
    task.delay(0.08, function() tpBatHittingCooldown = false end)
end

local function getClosestPlayerForTP()
    if not tpBatHRP then return nil, math.huge end
    local closest, closestDist = nil, math.huge
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            local root = p.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local dist = (tpBatHRP.Position - root.Position).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    closest = p
                end
            end
        end
    end
    return closest, closestDist
end

local function startTPBat()
    if tpBatConn then tpBatConn:Disconnect(); tpBatConn = nil end
    if tpBatAimbotConn then tpBatAimbotConn:Disconnect(); tpBatAimbotConn = nil end
    
    tpBatConn = RunService.Heartbeat:Connect(function()
        if not tpBatToggled then return end
        if not tpBatH or not tpBatHRP then
            local char = LP.Character
            if char then
                tpBatH = char:FindFirstChildOfClass("Humanoid")
                tpBatHRP = char:FindFirstChild("HumanoidRootPart")
            end
            if not tpBatH or not tpBatHRP then return end
        end
        
        local target, dist = getClosestPlayerForTP()
        if target and target.Character then
            local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot then
                if sethiddenproperty then
                    pcall(function() sethiddenproperty(tpBatHRP, "PhysicsRepRootPart", targetRoot) end)
                end
                local targetPos = targetRoot.Position + Vector3.new(0, 0.9, 0)
                if (tpBatHRP.Position - targetPos).Magnitude > 5 then
                    tpBatHRP.CFrame = CFrame.new(targetPos)
                end
                local cam = workspace.CurrentCamera
                if cam then cam.CFrame = CFrame.new(cam.CFrame.Position, targetRoot.Position) end
                tryHitBat()
            end
        end
    end)
    
    tpBatAimbotConn = RunService.RenderStepped:Connect(function()
        if not tpBatToggled then return end
        if not tpBatH or not tpBatHRP then return end
        
        local target, dist = getClosestPlayerForTP()
        if target and target.Character then
            local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot then
                local cam = workspace.CurrentCamera
                if cam then cam.CFrame = CFrame.new(cam.CFrame.Position, targetRoot.Position) end
                tryHitBat()
            end
        end
    end)
    print("[Green Duels] TP Bat STARTED (toggle ON)")
end

local function stopTPBat()
    if tpBatConn then tpBatConn:Disconnect(); tpBatConn = nil end
    if tpBatAimbotConn then tpBatAimbotConn:Disconnect(); tpBatAimbotConn = nil end
    print("[Green Duels] TP Bat STOPPED (toggle OFF)")
end

local function toggleTPBat()
    tpBatToggled = not tpBatToggled
    
    if tpBatToggled then
        local char = LP.Character
        if char then
            tpBatHRP = char:FindFirstChild("HumanoidRootPart")
            tpBatH = char:FindFirstChildOfClass("Humanoid")
        end
        startTPBat()
        if stackBtnRefs and stackBtnRefs.tpBat then 
            stackBtnRefs.tpBat.setOn(true) 
        end
    else
        stopTPBat()
        if stackBtnRefs and stackBtnRefs.tpBat then 
            stackBtnRefs.tpBat.setOn(false) 
        end
    end
    requestSave()
end

local function setupTPBatCharacter(char)
    task.wait(0.2)
    tpBatH = char:FindFirstChildOfClass("Humanoid")
    tpBatHRP = char:FindFirstChild("HumanoidRootPart")
    if tpBatToggled then startTPBat() end
end

LP.CharacterAdded:Connect(setupTPBatCharacter)
if LP.Character then task.spawn(function() setupTPBatCharacter(LP.Character) end) end

-- ============================================================
-- CONFIG VERSION & EARLY LOAD
-- ============================================================
local CONFIG_VERSION = 2
local CONFIG_FILE = "GreenDuelsConfig.json"
local CONFIG_BACKUP = "GreenDuelsConfig.bak"

local earlyConfig = nil
local function loadEarlyConfig()
    if not _isfile(CONFIG_FILE) then return nil end
    local raw = _readfile(CONFIG_FILE)
    if not raw then return nil end
    local ok, cfg = pcall(function() return HttpService:JSONDecode(raw) end)
    if ok and cfg and cfg.version == CONFIG_VERSION then return cfg end
    return nil
end
earlyConfig = loadEarlyConfig()
local introShouldPlay = (earlyConfig == nil or earlyConfig.introEnabled ~= false)

-- Intro (skip if disabled)
if introShouldPlay then
    local _TS = TweenService
    local _PG = LP:WaitForChild("PlayerGui")
    local introGui = Instance.new("ScreenGui")
    introGui.Name = "GreenHUBIntro"
    introGui.ResetOnSpawn = false
    introGui.IgnoreGuiInset = true
    introGui.DisplayOrder = 999
    introGui.Parent = _PG

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.new(0,0,0)
    bg.BackgroundTransparency = 0.15
    bg.BorderSizePixel = 0
    bg.Parent = introGui

    local blur = Instance.new("BlurEffect")
    blur.Size = 12
    blur.Parent = game:GetService("Lighting")

    local container = Instance.new("Frame")
    container.Size = UDim2.new(0,400,0,300)
    container.Position = UDim2.new(0.5,-200,0.5,-150)
    container.BackgroundTransparency = 1
    container.Parent = bg

    local LOGO_ID = "rbxassetid://16478039709"
    task.spawn(function() pcall(function() ContentProvider:PreloadAsync({LOGO_ID}) end) end)

    local logo = Instance.new("ImageLabel")
    logo.Size = UDim2.new(0,120,0,120)
    logo.Position = UDim2.new(0.5,-60,0,30)
    logo.BackgroundTransparency = 1
    logo.Image = LOGO_ID
    logo.ImageColor3 = Color3.fromRGB(80,255,80)
    logo.ImageTransparency = 1
    logo.ScaleType = Enum.ScaleType.Fit
    logo.Parent = container

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1,0,0,50)
    title.Position = UDim2.new(0,0,0,170)
    title.BackgroundTransparency = 1
    title.Text = "GREEN DUELS V2"
    title.TextColor3 = Color3.fromRGB(80,255,80)
    title.TextTransparency = 1
    title.TextScaled = true
    title.Font = Enum.Font.GothamBlack
    title.TextStrokeTransparency = 0.2
    title.TextStrokeColor3 = Color3.new(0,0,0)
    title.Parent = container

    local sub = Instance.new("TextLabel")
    sub.Size = UDim2.new(0.8,0,0,30)
    sub.Position = UDim2.new(0.1,0,0,230)
    sub.BackgroundTransparency = 1
    sub.Text = "LUCK IN PROGRESS"
    sub.TextColor3 = Color3.fromRGB(100,200,100)
    sub.TextTransparency = 1
    sub.TextScaled = true
    sub.Font = Enum.Font.GothamBold
    sub.Parent = container

    local loadingBg = Instance.new("Frame")
    loadingBg.Size = UDim2.new(0.6,0,0,4)
    loadingBg.Position = UDim2.new(0.2,0,0,275)
    loadingBg.BackgroundColor3 = Color3.fromRGB(30,30,30)
    loadingBg.BackgroundTransparency = 0.5
    loadingBg.BorderSizePixel = 0
    loadingBg.Parent = container
    Instance.new("UICorner", loadingBg).CornerRadius = UDim.new(0,2)

    local loadingBar = Instance.new("Frame")
    loadingBar.Size = UDim2.new(0,0,1,0)
    loadingBar.BackgroundColor3 = Color3.fromRGB(80,255,80)
    loadingBar.BackgroundTransparency = 0.3
    loadingBar.BorderSizePixel = 0
    loadingBar.Parent = loadingBg
    Instance.new("UICorner", loadingBar).CornerRadius = UDim.new(0,2)

    _TS:Create(bg, TweenInfo.new(0.7), {BackgroundTransparency = 0.15}):Play()
    _TS:Create(logo, TweenInfo.new(0.7), {ImageTransparency = 0}):Play()
    _TS:Create(title, TweenInfo.new(0.7), {TextTransparency = 0}):Play()
    _TS:Create(sub, TweenInfo.new(0.7), {TextTransparency = 0.3}):Play()
    _TS:Create(loadingBar, TweenInfo.new(2, Enum.EasingStyle.Linear), {Size = UDim2.new(1,0,1,0)}):Play()
    task.wait(2.5)
    _TS:Create(bg, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()
    _TS:Create(logo, TweenInfo.new(0.8), {ImageTransparency = 1}):Play()
    _TS:Create(title, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
    _TS:Create(sub, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
    _TS:Create(loadingBg, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()
    task.wait(1)
    introGui:Destroy()
    blur:Destroy()
end

-- ============================================================
-- INFINITE JUMP (platform-based version)
-- ============================================================
local InfJumpPlatform = nil

local function CreateIJP()
    if InfJumpPlatform then return end
    InfJumpPlatform = Instance.new("Part")
    InfJumpPlatform.Name = "InfJumpPlatform"
    InfJumpPlatform.Size = Vector3.new(8, 0.5, 8)
    InfJumpPlatform.Anchored = true
    InfJumpPlatform.CanCollide = true
    InfJumpPlatform.Transparency = 1
    InfJumpPlatform.Material = Enum.Material.ForceField
    InfJumpPlatform.Parent = workspace
end

CreateIJP()

-- ============================================================
-- STATE
-- ============================================================
local State = {
    normalSpeed=60, carrySpeed=30, laggerSpeed=10.1, laggerCarrySpeed=15,
    speedToggled=false,
    laggerMode=0,
    infJumpEnabled=true, antiRagdollEnabled=false,
    guiVisible=true, uiLocked=false,
    isStealing=false, stealStartTime=nil, lastStealTick=0,
    autoLeftEnabled=false, autoRightEnabled=false,
    autoLeftPhase=1, autoRightPhase=1,
    medusaLastUsed=0, medusaDebounce=false, medusaCounterEnabled=false,
    batAimbotToggled=false, autoSwingEnabled=false,
    hittingCooldown=false,
    batCounterEnabled=false, batCounterDebounce=false,
    dropEnabled=false, _tpInProgress=false,
    lastMoveDir=Vector3.new(0,0,0),
    _prevCarry=30, _prevSpeed=false,
    stackButtonsHidden=false,
    countdownActive=false,
    stackButtonsLocked=false,
    nukeOpt=false,
    removeAcc=false,
    antiLagEnabled=false,
    stretchedResEnabled=false,
    stretchFOV=120,
    activeSky=nil,
    tryardAnimEnabled=false,
    introEnabled=true,
    autoTPEnabled=false,
    autoTPHeight=20,
    autoTPConn=nil,
}

if earlyConfig and earlyConfig.introEnabled ~= nil then
    State.introEnabled = earlyConfig.introEnabled
end

local Keys = {
    speed=Enum.KeyCode.Q, guiHide=Enum.KeyCode.LeftControl,
    autoLeft=Enum.KeyCode.L, autoRight=Enum.KeyCode.R,
    lagger=Enum.KeyCode.Unknown,
    tpDown=Enum.KeyCode.Unknown,
    drop=Enum.KeyCode.H, aimbot=Enum.KeyCode.Unknown,
    tpBat=Enum.KeyCode.X, reset=Enum.KeyCode.R,
}

-- ============================================================
-- INFINITE JUMP PLATFORM LOGIC
-- ============================================================
RunService.Heartbeat:Connect(function()
    if not State.infJumpEnabled then 
        if InfJumpPlatform then
            InfJumpPlatform.Position = Vector3.new(0, -1000, 0)
        end
        return 
    end
    
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not (char and root and hum) then 
        if InfJumpPlatform then
            InfJumpPlatform.Position = Vector3.new(0, -1000, 0)
        end
        return 
    end

    local isJumping = UIS:IsKeyDown(Enum.KeyCode.Space)
        or hum:GetState() == Enum.HumanoidStateType.Jumping
        or hum.Jump

    if isJumping then
        if not InfJumpPlatform then CreateIJP() end
        InfJumpPlatform.Position = root.Position - Vector3.new(0, 3.5, 0)
        if root.Velocity.Y < 50 then
            root.Velocity = Vector3.new(root.Velocity.X, 50, root.Velocity.Z)
        end
    else
        if InfJumpPlatform then
            InfJumpPlatform.Position = Vector3.new(0, -1000, 0)
        end
    end
end)

-- ============================================================
-- TRYARD ANIMATION PACK
-- ============================================================
local TryardAnims = {
    idle1 = "rbxassetid://133806214992291",
    idle2 = "rbxassetid://94970088341563",
    walk  = "rbxassetid://707897309",
    run   = "rbxassetid://707861613",
    jump  = "rbxassetid://116936326516985",
    fall  = "rbxassetid://116936326516985",
    climb = "rbxassetid://116936326516985",
    swim  = "rbxassetid://116936326516985",
    swimidle = "rbxassetid://116936326516985",
}
task.spawn(function()
    pcall(function() ContentProvider:PreloadAsync({
        TryardAnims.idle1, TryardAnims.idle2, TryardAnims.walk, TryardAnims.run,
        TryardAnims.jump, TryardAnims.fall, TryardAnims.climb, TryardAnims.swim, TryardAnims.swimidle,
    }) end)
end)
local tryardHeartbeatConn = nil
local originalTryardAnims = nil
local function isTryardPackAnim(id) for _,v in pairs(TryardAnims) do if v==id then return true end end return false end
local function saveOriginalTryardAnims(char)
    local animate = char:FindFirstChild("Animate")
    if not animate then return end
    local function g(obj) return obj and obj.AnimationId or nil end
    local ids = {
        idle1 = g(animate.idle and animate.idle.Animation1),
        idle2 = g(animate.idle and animate.idle.Animation2),
        walk  = g(animate.walk and animate.walk.WalkAnim),
        run   = g(animate.run  and animate.run.RunAnim),
        jump  = g(animate.jump and animate.jump.JumpAnim),
        fall  = g(animate.fall and animate.fall.FallAnim),
        climb = g(animate.climb and animate.climb.ClimbAnim),
        swim  = g(animate.swim and animate.swim.Swim),
        swimidle = g(animate.swimidle and animate.swimidle.SwimIdle),
    }
    if not isTryardPackAnim(ids.walk) then originalTryardAnims = ids end
end
local function applyTryardAnimPack(char)
    local animate = char:FindFirstChild("Animate")
    if not animate then return end
    local function s(obj,id) if obj then obj.AnimationId=id end end
    s(animate.idle and animate.idle.Animation1, TryardAnims.idle1)
    s(animate.idle and animate.idle.Animation2, TryardAnims.idle2)
    s(animate.walk and animate.walk.WalkAnim, TryardAnims.walk)
    s(animate.run  and animate.run.RunAnim,   TryardAnims.run)
    s(animate.jump and animate.jump.JumpAnim, TryardAnims.jump)
    s(animate.fall and animate.fall.FallAnim, TryardAnims.fall)
    s(animate.climb and animate.climb.ClimbAnim, TryardAnims.climb)
    s(animate.swim and animate.swim.Swim, TryardAnims.swim)
    s(animate.swimidle and animate.swimidle.SwimIdle, TryardAnims.swimidle)
end
local function stopTryardAnim()
    if tryardHeartbeatConn then tryardHeartbeatConn:Disconnect(); tryardHeartbeatConn=nil end
    if originalTryardAnims and LP.Character then
        local animate = LP.Character:FindFirstChild("Animate")
        if animate then
            local function s(obj,id) if obj then obj.AnimationId=id end end
            s(animate.idle and animate.idle.Animation1, originalTryardAnims.idle1)
            s(animate.idle and animate.idle.Animation2, originalTryardAnims.idle2)
            s(animate.walk and animate.walk.WalkAnim, originalTryardAnims.walk)
            s(animate.run  and animate.run.RunAnim,   originalTryardAnims.run)
            s(animate.jump and animate.jump.JumpAnim, originalTryardAnims.jump)
            s(animate.fall and animate.fall.FallAnim, originalTryardAnims.fall)
            s(animate.climb and animate.climb.ClimbAnim, originalTryardAnims.climb)
            s(animate.swim and animate.swim.Swim, originalTryardAnims.swim)
            s(animate.swimidle and animate.swimidle.SwimIdle, originalTryardAnims.swimidle)
        end
    end
end
local function startTryardAnim()
    if tryardHeartbeatConn then tryardHeartbeatConn:Disconnect() end
    local char = LP.Character
    if char then
        saveOriginalTryardAnims(char)
        applyTryardAnimPack(char)
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            for _, track in ipairs(hum:GetPlayingAnimationTracks()) do track:Stop(0) end
            hum:ChangeState(Enum.HumanoidStateType.Running)
        end
    end
    tryardHeartbeatConn = RunService.Heartbeat:Connect(function()
        if not State.tryardAnimEnabled then return end
        local c = LP.Character
        if c then applyTryardAnimPack(c) end
    end)
end
LP.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if State.tryardAnimEnabled and tryardHeartbeatConn then
        saveOriginalTryardAnims(char)
        applyTryardAnimPack(char)
    end
end)

-- ============================================================
-- DEFAULT STACK BUTTON POSITIONS (3 Columns)
-- ============================================================
local BTN_W = 58
local BTN_H = 58
local BTN_GAP = 8
local COLS = 3

local stackDefs = {
    {key="drop",        label="DROP"},
    {key="tpBat",       label="BAT\nMODE"},
    {key="autoLeft",    label="AUTO\nLEFT"},
    {key="autoRight",   label="AUTO\nRIGHT"},
    {key="aimbot",      label="AIMBOT"},
    {key="tpDown",      label="TP\nDOWN"},
    {key="carrySpeed",  label="CARRY\nSPD"},
    {key="reset",       label="RESET"},
    {key="lagger",      label="LAGGER"},
    {key="laggerCarry", label="LAGGER\nCARRY"},
}

local function getDefaultStackPos(i)
    local col = (i-1) % COLS
    local row = math.floor((i-1) / COLS)
    local totalRows = math.ceil(#stackDefs / COLS)
    return UDim2.new(
        1, -(COLS * (BTN_W + BTN_GAP) - BTN_GAP + 14) + col * (BTN_W + BTN_GAP),
        0.5, -(totalRows * (BTN_H + BTN_GAP) - BTN_GAP) / 2 + row * (BTN_H + BTN_GAP)
    )
end

local Steal = { AutoStealEnabled=true, StealRadius=55, StealDuration=0.25, Data={} }

-- ============================================================
-- PRESETS
-- ============================================================
local Presets = {}
local PRESET_FILE = "GreenDuelsPresets.json"
local LAST_PRESET_FILE = "GreenDuelsLastPreset.json"

local function buildPresetSnapshot() return {
    normalSpeed=State.normalSpeed, carrySpeed=State.carrySpeed,
    laggerSpeed=State.laggerSpeed, laggerCarrySpeed=State.laggerCarrySpeed,
    stealRadius=Steal.StealRadius, stealDuration=Steal.StealDuration,
    infJump=State.infJumpEnabled, antiRagdoll=State.antiRagdollEnabled,
    medusaCounter=State.medusaCounterEnabled, batCounter=State.batCounterEnabled,
    autoSteal=Steal.AutoStealEnabled,
    autoTP=State.autoTPEnabled, autoTPHeight=State.autoTPHeight,
} end
local function savePresetsFile()
    local ok,enc=pcall(function() return HttpService:JSONEncode(Presets) end)
    if ok then pcall(function() _writefile(PRESET_FILE,enc) end) end
end
local function loadPresetsFile()
    if not _isfile(PRESET_FILE) then return end
    local raw; pcall(function() raw=_readfile(PRESET_FILE) end)
    if raw then
        local ok,dec=pcall(function() return HttpService:JSONDecode(raw) end)
        if ok and dec then Presets=dec end
    end
end
local function saveLastPresetName(name)
    local ok,enc=pcall(function() return HttpService:JSONEncode({lastPreset=name}) end)
    if ok then pcall(function() _writefile(LAST_PRESET_FILE,enc) end) end
end
local function loadLastPresetName()
    if not _isfile(LAST_PRESET_FILE) then return nil end
    local raw; pcall(function() raw=_readfile(LAST_PRESET_FILE) end)
    if raw then
        local ok,dec=pcall(function() return HttpService:JSONDecode(raw) end)
        if ok and dec then return dec.lastPreset end
    end
    return nil
end

local MOVE_KEYS={[Enum.KeyCode.W]=true,[Enum.KeyCode.A]=true,[Enum.KeyCode.S]=true,[Enum.KeyCode.D]=true,
    [Enum.KeyCode.Up]=true,[Enum.KeyCode.Left]=true,[Enum.KeyCode.Down]=true,[Enum.KeyCode.Right]=true}

-- Auto Left/Right positions
local AP_L1     = Vector3.new(-476.48, -6.28, 92.73)
local AP_L2     = Vector3.new(-483.12, -4.95, 94.80)
local AP_L_FACE = Vector3.new(-482.25, -4.96, 92.09)
local AP_R1     = Vector3.new(-476.16, -6.52, 25.62)
local AP_R2     = Vector3.new(-483.06, -5.03, 25.48)
local AP_R_FACE = Vector3.new(-482.06, -6.93, 35.47)

local alConn, arConn = nil, nil
local alPhase, arPhase = 1, 1

local Conns={autoSteal=nil,antiRag=nil,autoLeft=nil,autoRight=nil,aimbot=nil,anchor={},progress=nil,batCounter=nil, autoTP=nil}
local h,hrp
local setAutoLeft,setAutoRight,setInfJump,setAntiRag
local setMedusaCounter,setAimbot,setAutoSwing
local setLagger,setLaggerCarry,setDropBrainrot,setInstaGrab
local setNukeOpt,setRemoveAcc,setNoCam
local setupMedusaCounter,stopMedusaCounter,startAntiRagdoll,stopAntiRagdoll
local startAutoSteal,stopAutoSteal
local startAutoLeft,stopAutoLeft,startAutoRight,stopAutoRight
local saveConfig,loadConfig,runDrop,stopDrop,runTPDown
local requestSave
local startBatAimbot,stopBatAimbot,startBatCounter,stopBatCounter,setBatCounter
local stackBtnRefs={}; local stackWrappers={}; local keybindBtnRefs={}
local normalBox,carryBox,laggerBox,laggerCarryBox,uiScaleBox,stealRadBox,stealDurBox,autoTPHeightBox
local setHideButtonsToggle, setLockButtonsToggle
local presetListFrame=nil; local presetNameBox=nil; local rebuildPresetList
local toggleSetters = {}
local jumpDropBtn = nil

-- ============================================================
-- COLORS
-- ============================================================
local C = {
    winBg=Color3.fromRGB(0,0,0), winBg2=Color3.fromRGB(6,6,6), winBorder=Color3.fromRGB(30,132,73),
    sidebarBg=Color3.fromRGB(0,0,0), sidebarDiv=Color3.fromRGB(18,44,28),
    topBg=Color3.fromRGB(4,8,5), topTitle=Color3.fromRGB(230,245,235), topSub=Color3.fromRGB(95,150,115),
    topBtn=Color3.fromRGB(45,100,65), topBtnHov=Color3.fromRGB(70,140,92), topDivider=Color3.fromRGB(18,44,28),
    tabBarBg=Color3.fromRGB(0,0,0), tabBarDiv=Color3.fromRGB(18,44,28),
    tabIdle=Color3.fromRGB(105,155,122), tabIdleHov=Color3.fromRGB(160,210,180),
    tabActive=Color3.fromRGB(230,245,235), tabActiveBg=Color3.fromRGB(10,22,14), tabUnderline=Color3.fromRGB(30,132,73),
    sectionTxt=Color3.fromRGB(46,160,90), sectionDiv=Color3.fromRGB(18,44,28),
    rowBg=Color3.fromRGB(0,0,0), rowBorder=Color3.fromRGB(16,36,22), rowLabel=Color3.fromRGB(225,240,230),
    rowSub=Color3.fromRGB(90,140,105), rowValue=Color3.fromRGB(160,210,180), rowHov=Color3.fromRGB(10,22,14),
    inputBg=Color3.fromRGB(8,14,10), inputBorder=Color3.fromRGB(30,68,42), inputFocus=Color3.fromRGB(46,160,90),
    inputTxt=Color3.fromRGB(230,245,235),
    pillOff=Color3.fromRGB(18,36,24), pillOn=Color3.fromRGB(30,132,73), dotOff=Color3.fromRGB(58,92,70),
    dotOn=Color3.fromRGB(8,18,12), pillBorder=Color3.fromRGB(30,68,42),
    modeBtnBg=Color3.fromRGB(8,14,10), modeBtnBrd=Color3.fromRGB(28,60,40), modeBtnTxt=Color3.fromRGB(105,160,125),
    modeBtnActBg=Color3.fromRGB(30,132,73), modeBtnActTx=Color3.fromRGB(0,16,6),
    chipBg=Color3.fromRGB(8,14,10), chipBorder=Color3.fromRGB(28,60,40), chipTxt=Color3.fromRGB(120,180,140),
    btnBg=Color3.fromRGB(8,16,11), btnBorder=Color3.fromRGB(30,68,42), btnTxt=Color3.fromRGB(195,230,210),
    btnHov=Color3.fromRGB(16,30,22),
    stackBg=Color3.fromRGB(20, 60, 30),
    stackBrd=Color3.fromRGB(60, 200, 80),
    stackTxt=Color3.fromRGB(144, 238, 144),
    stackActBg=Color3.fromRGB(60, 200, 80),
    stackActBrd=Color3.fromRGB(60, 200, 80),
    stackActTxt=Color3.fromRGB(255, 255, 255),
    stackDot=Color3.fromRGB(30,68,42), stackDotOn=Color3.fromRGB(46,170,96),
    infoBg=Color3.fromRGB(4,8,6), infoBrd=Color3.fromRGB(22,50,32), infoTxt=Color3.fromRGB(95,150,115),
    infoVal=Color3.fromRGB(170,215,185), infoFill=Color3.fromRGB(30,132,73),
    accent=Color3.fromRGB(30,132,73), accentDim=Color3.fromRGB(28,60,40),
    presetBg=Color3.fromRGB(8,14,10), presetBrd=Color3.fromRGB(28,60,40), presetLoad=Color3.fromRGB(30,132,73),
    presetDel=Color3.fromRGB(80,25,25), delBrd=Color3.fromRGB(130,45,45), lockOn=Color3.fromRGB(30,132,73),
    divider=Color3.fromRGB(18,44,28),
}

-- CLEANUP
do
    local cleanupNames = {"VyseSlottedGUI","VyseAsireGUI","VyseAsireHubV4","VyseAsireHubV5","VyseAsireHubV5_1","AsireHubV5_1","AsireHubV5_2","LaitoHubV1","GreenDuelsV1"}
    for _,name in ipairs(cleanupNames) do
        pcall(function() local o=game:GetService("CoreGui"):FindFirstChild(name); if o then o:Destroy() end end)
        pcall(function() local o=LP:WaitForChild("PlayerGui"):FindFirstChild(name); if o then o:Destroy() end end)
    end
end

local function mkCorner(p,r) local c=Instance.new("UICorner",p); c.CornerRadius=UDim.new(0,r or 6); return c end
local function mkStroke(p,col,th) local s=Instance.new("UIStroke",p); s.Color=col; s.Thickness=th or 1; s.ApplyStrokeMode=Enum.ApplyStrokeMode.Border; return s end

-- ============================================================
-- AUTO TP
-- ============================================================
local function doAutoTPDown(force)
    local char = LP.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if not force then
        if hum.FloorMaterial ~= Enum.Material.Air then return end
        if hrp.Position.Y < State.autoTPHeight then return end
    end
    hrp.CFrame = CFrame.new(hrp.Position.X, -7, hrp.Position.Z) * CFrame.Angles(0, select(2, hrp.CFrame:ToEulerAnglesYXZ()), 0)
    hrp.AssemblyLinearVelocity = Vector3.zero
end

local function startAutoTP()
    if State.autoTPConn then task.cancel(State.autoTPConn); State.autoTPConn = nil end
    State.autoTPConn = task.spawn(function()
        while State.autoTPEnabled do
            task.wait(0.1)
            pcall(function() doAutoTPDown(false) end)
        end
    end)
end

local function stopAutoTP()
    State.autoTPEnabled = false
    if State.autoTPConn then task.cancel(State.autoTPConn); State.autoTPConn = nil end
end

runTPDown = function()
    pcall(function() doAutoTPDown(true) end)
end

-- ============================================================
-- JUMP DROP ONLY (Safe - No Crasher)
-- ============================================================
local DROP_ASCEND_DURATION = 0.22
local DROP_ASCEND_SPEED = 160
local _dropConn = nil
local dropActive = false

local function runJumpDrop()
    if dropActive then return end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    dropActive = true
    if stackBtnRefs.drop then stackBtnRefs.drop.setOn(true) end
    local t0 = tick()
    if _dropConn then _dropConn:Disconnect() end
    _dropConn = RunService.Heartbeat:Connect(function()
        local c = LP.Character
        local r = c and c:FindFirstChild("HumanoidRootPart")
        if not r then
            if _dropConn then _dropConn:Disconnect(); _dropConn = nil end
            dropActive = false
            if stackBtnRefs.drop then stackBtnRefs.drop.setOn(false) end
            return
        end
        if not dropActive then
            if _dropConn then _dropConn:Disconnect(); _dropConn = nil end
            if stackBtnRefs.drop then stackBtnRefs.drop.setOn(false) end
            return
        end
        if tick() - t0 >= DROP_ASCEND_DURATION then
            if _dropConn then _dropConn:Disconnect(); _dropConn = nil end
            pcall(function()
                local rp = RaycastParams.new()
                rp.FilterDescendantsInstances = {c}
                rp.FilterType = Enum.RaycastFilterType.Exclude
                local rr = workspace:Raycast(r.Position, Vector3.new(0, -3000, 0), rp)
                if rr then
                    local hum = c:FindFirstChildOfClass("Humanoid")
                    local off = ((hum and hum.HipHeight) or 2) + (r.Size.Y / 2)
                    r.CFrame = CFrame.new(r.Position.X, rr.Position.Y + off, r.Position.Z)
                    r.AssemblyLinearVelocity = Vector3.zero
                end
            end)
            dropActive = false
            if stackBtnRefs.drop then stackBtnRefs.drop.setOn(false) end
            return
        end
        local lv = r.AssemblyLinearVelocity
        r.AssemblyLinearVelocity = Vector3.new(lv.X, DROP_ASCEND_SPEED, lv.Z)
    end)
end

runDrop = runJumpDrop

LP.CharacterRemoving:Connect(function()
    dropActive = false
    if _dropConn then _dropConn:Disconnect(); _dropConn = nil end
end)

stopDrop = function()
    dropActive = false
    if _dropConn then _dropConn:Disconnect(); _dropConn = nil end
    if stackBtnRefs.drop then stackBtnRefs.drop.setOn(false) end
end

-- ============================================================
-- ANTI RAGDOLL (Improved with constraints removal)
-- ============================================================
local antiRagdollConn = nil
local antiRagdollCached = {}

local function antiRagdollCacheCharacter()
    local char = LP.Character
    if not char then return false end

    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")

    if not hum or not root then return false end

    antiRagdollCached = {
        character = char,
        humanoid = hum,
        root = root
    }

    workspace.CurrentCamera.CameraSubject = hum
    return true
end

local function antiRagdollIsRagdolled()
    local hum = antiRagdollCached.humanoid
    if not hum then return false end

    local state = hum:GetState()

    if state == Enum.HumanoidStateType.Physics
    or state == Enum.HumanoidStateType.Ragdoll
    or state == Enum.HumanoidStateType.FallingDown then
        return true
    end

    local endTime = LP:GetAttribute("RagdollEndTime")
    if endTime then
        local now = workspace:GetServerTimeNow()
        if (endTime - now) > 0 then
            return true
        end
    end

    return false
end

local function antiRagdollRemoveConstraints()
    local char = antiRagdollCached.character
    if not char then return end
    
    for _, v in ipairs(char:GetDescendants()) do
        if v:IsA("BallSocketConstraint") or 
           (v:IsA("Attachment") and v.Name and v.Name:find("RagdollAttachment")) then
            pcall(function()
                v:Destroy()
            end)
        end
    end
end

local function antiRagdollForceExit()
    local hum = antiRagdollCached.humanoid
    local root = antiRagdollCached.root

    if not hum or not root then return end

    pcall(function()
        LP:SetAttribute("RagdollEndTime", workspace:GetServerTimeNow())
    end)

    if hum.Health > 0 then
        hum:ChangeState(Enum.HumanoidStateType.Running)
    end

    root.Anchored = false
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero

    root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, math.rad(root.Orientation.Y), 0)

    local cam = workspace.CurrentCamera
    if cam and cam.CameraSubject ~= hum then
        cam.CameraSubject = hum
    end

    pcall(function()
        local pm = LP.PlayerScripts:FindFirstChild("PlayerModule")
        if pm then
            local cm = pm:FindFirstChild("ControlModule")
            if cm then
                require(cm):Enable()
            end
        end
    end)
end

startAntiRagdoll = function()
    if antiRagdollConn then return end
    
    if not antiRagdollCacheCharacter() then
        task.wait(0.5)
        if not antiRagdollCacheCharacter() then
            warn("[Green Duels] Anti-Ragdoll: Could not cache character")
            return
        end
    end

    antiRagdollConn = RunService.RenderStepped:Connect(function()
        if not State.antiRagdollEnabled then return end
        if not antiRagdollCached.humanoid or not antiRagdollCached.humanoid.Parent then
            if not antiRagdollCacheCharacter() then
                return
            end
        end

        if antiRagdollIsRagdolled() then
            antiRagdollRemoveConstraints()
            antiRagdollForceExit()
        end
    end)
    
    print("[Green Duels] Anti-Ragdoll STARTED")
end

stopAntiRagdoll = function()
    if antiRagdollConn then
        antiRagdollConn:Disconnect()
        antiRagdollConn = nil
    end
    antiRagdollCached = {}
    State.antiRagdollEnabled = false
    print("[Green Duels] Anti-Ragdoll STOPPED")
end

LP.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if State.antiRagdollEnabled then
        antiRagdollCacheCharacter()
        if not antiRagdollConn then
            startAntiRagdoll()
        end
    end
end)

-- ============================================================
-- MAIN FUNCTION (UI and everything else)
-- ============================================================



local function Main()
    if _G.GreenDuelsV2_MainExecuted then return end
    _G.GreenDuelsV2_MainExecuted = true


    C = {
        accent = Color3.fromRGB(218,145,155),
        inputBorder = Color3.fromRGB(218,165,170),
        rowLabel = Color3.fromRGB(255,255,255),
        btnBg = Color3.fromRGB(30,20,20),
        btnTxt = Color3.fromRGB(255,255,255),
        btnBorder = Color3.fromRGB(218,165,170),
        btnHov = Color3.fromRGB(45,30,30),
        modeBtnBg = Color3.fromRGB(30,20,20),
        modeBtnBrd = Color3.fromRGB(218,165,170),
        modeBtnTxt = Color3.fromRGB(220,190,195),
        modeBtnActBg = Color3.fromRGB(218,145,155),
        modeBtnActTx = Color3.fromRGB(30,20,20),
        chipBorder = Color3.fromRGB(218,165,170),
        stackBg = Color3.fromRGB(30,20,20),
        stackBrd = Color3.fromRGB(218,165,170),
        stackTxt = Color3.fromRGB(255,255,255),
        stackActBg = Color3.fromRGB(218,145,155),
        stackActBrd = Color3.fromRGB(218,145,155),
        stackActTxt = Color3.fromRGB(30,20,20),
    }


    local normalBox,carryBox,laggerBox,laggerCarryBox,uiScaleBox,stealRadBox,stealDurBox,autoTPHeightBox
    local setInfJump,setAntiRag,setMedusaCounter,setAutoSwing,setInstaGrab
    local antiLagSetter,stretchSetter
    local jumpDropBtn=nil


    local stackDefs = {
        {key="drop",label="DROP"},
        {key="tpBat",label="BAT MODE"},
        {key="autoLeft",label="AUTO LEFT"},
        {key="autoRight",label="AUTO RIGHT"},
        {key="aimbot",label="AIMBOT"},
        {key="tpDown",label="TP DOWN"},
        {key="carrySpeed",label="CARRY SPD"},
        {key="reset",label="RESET"},
        {key="lagger",label="LAGGER"},
        {key="laggerCarry",label="LAGGER CARRY"},
    }


    local stackBtnRefs = {}
    local stackWrappers = {}
    local keybindBtnRefs = {}
    local toggleSetters = {}
    local presetListFrame = nil
    local presetNameBox = nil
    local rebuildPresetList = function() end

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
local currentPage = nil
local lo = 0
local gui = screenGui
local uiScaleObj = Instance.new("UIScale", screenGui)
uiScaleObj.Scale = 1.0
local mainOuter = main
local mainScroll = content
local tabPages = pages
local C = C or {}

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


    -- CHITUK FUNCTION ADAPTERS
    local function LO()
        lo += 1
        return lo
    end

    local function makeGap(px)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, 0, 0, px or 6)
        f.BackgroundTransparency = 1
        f.BorderSizePixel = 0
        f.LayoutOrder = LO()
        f.Parent = currentPage
    end

    local function makeSectionHeader(label)
        local wrap = Instance.new("Frame")
        wrap.Size = UDim2.new(1, -16, 0, 22)
        wrap.BackgroundTransparency = 1
        wrap.BorderSizePixel = 0
        wrap.LayoutOrder = LO()
        wrap.Parent = currentPage

        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, 0, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = label
        lbl.TextColor3 = Color3.fromRGB(218,145,155)
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 10
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.Parent = wrap
    end

    local function buildPage(tabName, buildFn)
        local page = pages[tabName]
        if not page then return nil end
        for _, child in ipairs(page:GetChildren()) do
            if not child:IsA("UIListLayout") then
                child:Destroy()
            end
        end
        currentPage = page
        lo = 0
        buildFn()
        currentPage = nil
        return page
    end

    local function addButton(parent, text, callback, active)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1, -16, 0, 32)
        b.BackgroundColor3 = active and Color3.fromRGB(218,145,155) or Color3.fromRGB(30,20,20)
        b.BackgroundTransparency = active and 0 or 0.15
        b.BorderSizePixel = 0
        b.Text = text
        b.TextColor3 = active and Color3.fromRGB(30,20,20) or Color3.fromRGB(255,255,255)
        b.Font = Enum.Font.GothamBold
        b.TextSize = 11
        b.AutoButtonColor = false
        b.LayoutOrder = LO()
        b.Parent = parent
        corner(b, 8)
        stroke(b, 1, Color3.fromRGB(218,165,170), 0.55)
        b.MouseEnter:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.1), {
                BackgroundTransparency = active and 0 or 0.02
            }):Play()
        end)
        b.MouseLeave:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.1), {
                BackgroundTransparency = active and 0 or 0.15
            }):Play()
        end)
        b.MouseButton1Click:Connect(function()
            pcall(callback)
        end)
        return b
    end


    local function makeInputRow(label, default, onChange)
        local row = Instance.new("Frame", currentPage)
        row.Size = UDim2.new(1,-16,0,42); row.BackgroundColor3 = Color3.fromRGB(14,22,16)
        row.BorderSizePixel=0; row.LayoutOrder=LO(); mkCorner(row,12)
        local rowStroke = mkStroke(row, Color3.fromRGB(34,76,46),1); rowStroke.Transparency = 0.5
        row.MouseEnter:Connect(function()
            TweenService:Create(row,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(18,30,22)}):Play()
            TweenService:Create(rowStroke,TweenInfo.new(0.1),{Transparency=0.2}):Play()
        end)
        row.MouseLeave:Connect(function()
            TweenService:Create(row,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(14,22,16)}):Play()
            TweenService:Create(rowStroke,TweenInfo.new(0.1),{Transparency=0.5}):Play()
        end)
        local lbl = Instance.new("TextLabel", row)
        lbl.Size = UDim2.new(1,-100,1,0); lbl.Position = UDim2.new(0,14,0,0)
        lbl.BackgroundTransparency=1; lbl.Text=label; lbl.TextColor3=C.rowLabel
        lbl.Font = Enum.Font.GothamBold; lbl.TextSize=13; lbl.TextXAlignment=Enum.TextXAlignment.Left
        local boxWrap = Instance.new("Frame", row)
        boxWrap.Size = UDim2.new(0,70,0,28); boxWrap.Position = UDim2.new(1,-82,0.5,-14)
        boxWrap.BackgroundColor3 = Color3.fromRGB(4,8,6); boxWrap.BorderSizePixel=0
        mkCorner(boxWrap,8); local bs = mkStroke(boxWrap, Color3.fromRGB(34,76,46),1); bs.Transparency=0.3
        local box = Instance.new("TextBox", boxWrap)
        box.Size = UDim2.new(1,-8,1,0); box.Position = UDim2.new(0,4,0,0)
        box.BackgroundTransparency=1; box.Text = tostring(default)
        box.TextColor3 = Color3.fromRGB(240,255,245); box.Font = Enum.Font.GothamBlack
        box.TextSize=13; box.ClearTextOnFocus=false; box.ZIndex=8; box.TextXAlignment=Enum.TextXAlignment.Center
        box.Focused:Connect(function() TweenService:Create(bs,TweenInfo.new(0.15),{Color=Color3.fromRGB(30,132,73),Transparency=0}):Play() end)
        box.FocusLost:Connect(function()
            TweenService:Create(bs,TweenInfo.new(0.15),{Color=Color3.fromRGB(34,76,46),Transparency=0.3}):Play()
            if onChange then
                local n = tonumber(box.Text)
                if n then onChange(n); requestSave()
                else box.Text = tostring(default) end
            end
        end)
        return box,row
    end

    local function makeToggleRow(label, defaultOn, onToggle)
        local row = Instance.new("Frame", currentPage)
        row.Size = UDim2.new(1,-16,0,42); row.BackgroundColor3 = Color3.fromRGB(14,22,16)
        row.BorderSizePixel=0; row.LayoutOrder=LO(); mkCorner(row,12)
        local rowStroke = mkStroke(row, Color3.fromRGB(34,76,46),1); rowStroke.Transparency = 0.5
        row.MouseEnter:Connect(function()
            TweenService:Create(row,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(18,30,22)}):Play()
            TweenService:Create(rowStroke,TweenInfo.new(0.1),{Transparency=0.2}):Play()
        end)
        row.MouseLeave:Connect(function()
            TweenService:Create(row,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(14,22,16)}):Play()
            TweenService:Create(rowStroke,TweenInfo.new(0.1),{Transparency=0.5}):Play()
        end)
        local lbl = Instance.new("TextLabel", row)
        lbl.Size = UDim2.new(1,-70,1,0); lbl.Position = UDim2.new(0,14,0,0)
        lbl.BackgroundTransparency=1; lbl.Text=label; lbl.TextColor3=C.rowLabel
        lbl.Font = Enum.Font.GothamBold; lbl.TextSize=13; lbl.TextXAlignment=Enum.TextXAlignment.Left
        local pillBg = Instance.new("Frame", row)
        pillBg.Size = UDim2.new(0,44,0,22); pillBg.Position = UDim2.new(1,-58,0.5,-11)
        pillBg.BackgroundColor3 = defaultOn and Color3.fromRGB(30,132,73) or Color3.fromRGB(30,36,32)
        pillBg.BorderSizePixel=0; pillBg.ZIndex=7; mkCorner(pillBg,11)
        local dot = Instance.new("Frame", pillBg)
        dot.Size = UDim2.new(0,16,0,16); dot.Position = defaultOn and UDim2.new(1,-19,0.5,-8) or UDim2.new(0,3,0.5,-8)
        dot.BackgroundColor3 = Color3.fromRGB(255,255,255); dot.BorderSizePixel=0; dot.ZIndex=8; mkCorner(dot,8)
        local isOn = defaultOn or false
        local function setV(on)
            isOn = on
            TweenService:Create(pillBg, TweenInfo.new(0.18, Enum.EasingStyle.Quint), {
                BackgroundColor3 = on and Color3.fromRGB(30,132,73) or Color3.fromRGB(30,36,32)
            }):Play()
            TweenService:Create(dot, TweenInfo.new(0.18, Enum.EasingStyle.Back), {
                Position = on and UDim2.new(1,-19,0.5,-8) or UDim2.new(0,3,0.5,-8),
                BackgroundColor3 = Color3.fromRGB(255,255,255)
            }):Play()
        end
        local function toggle()
            isOn = not isOn; setV(isOn)
            if onToggle then pcall(onToggle, isOn) end
            requestSave()
        end
        local clk = Instance.new("TextButton", row); clk.Size = UDim2.new(1,-64,1,0); clk.BackgroundTransparency=1; clk.Text=""; clk.ZIndex=5; clk.BorderSizePixel=0; clk.MouseButton1Click:Connect(toggle)
        local pClk = Instance.new("TextButton", pillBg); pClk.Size = UDim2.new(1,0,1,0); pClk.BackgroundTransparency=1; pClk.Text=""; pClk.ZIndex=9; pClk.BorderSizePixel=0; pClk.MouseButton1Click:Connect(toggle)
        return setV
    end

    local function getKeyDisplayName(kc)
        if kc == Enum.KeyCode.Unknown then return "None" end
        local n = kc.Name
        local gpNames = {ButtonA="A",ButtonB="B",ButtonX="X",ButtonY="Y",ButtonL1="LB",ButtonL2="LT",ButtonL3="LS",
            ButtonR1="RB",ButtonR2="RT",ButtonR3="RS",ButtonSelect="SEL",ButtonStart="STA",
            DPadUp="D↑",DPadDown="D↓",DPadLeft="D←",DPadRight="D→",Thumbstick1="LS",Thumbstick2="RS"}
        return gpNames[n] or n:sub(1,5)
    end

    local function refreshAllKeybindButtons()
        for keyName, btn in pairs(keybindBtnRefs) do
            if btn and Keys[keyName] then
                btn.Text = getKeyDisplayName(Keys[keyName])
            end
        end
    end

    local function makeKeybindRow(label, currentKey, onChanged, keyName)
        local row = Instance.new("Frame", currentPage)
        row.Size = UDim2.new(1,0,0,44); row.BackgroundTransparency=1; row.BorderSizePixel=0; row.LayoutOrder=LO()
        local div = Instance.new("Frame", row); div.Size = UDim2.new(1,-28,0,1); div.Position = UDim2.new(0,14,1,-1)
        div.BackgroundColor3 = C.rowBorder; div.BorderSizePixel=0
        local lbl = Instance.new("TextLabel", row); lbl.Size = UDim2.new(1,-80,1,0); lbl.Position = UDim2.new(0,14,0,0)
        lbl.BackgroundTransparency=1; lbl.Text=label; lbl.TextColor3=C.rowLabel; lbl.Font=Enum.Font.GothamBold
        lbl.TextSize=13; lbl.TextXAlignment=Enum.TextXAlignment.Left
        local kbtn = Instance.new("TextButton", row); kbtn.Size = UDim2.new(0,52,0,26); kbtn.Position = UDim2.new(1,-64,0.5,-13)
        kbtn.BackgroundColor3 = C.accent; kbtn.BorderSizePixel=0; kbtn.Text = getKeyDisplayName(currentKey)
        kbtn.TextColor3 = Color3.fromRGB(0,20,8); kbtn.Font = Enum.Font.GothamBlack; kbtn.TextSize=11; kbtn.ZIndex=8
        mkCorner(kbtn,13); local ks = mkStroke(kbtn, C.accent,1)
        local listening = false; local lconnKeyboard,lconnGamepad
        local function stopL(key)
            listening = false
            if lconnKeyboard then lconnKeyboard:Disconnect(); lconnKeyboard=nil end
            if lconnGamepad then lconnGamepad:Disconnect(); lconnGamepad=nil end
            TweenService:Create(ks,TweenInfo.new(0.12),{Color=C.accent}):Play()
            TweenService:Create(kbtn,TweenInfo.new(0.12),{BackgroundColor3=C.accent}):Play()
            kbtn.TextColor3 = Color3.fromRGB(0,20,8)
            if key then
                kbtn.Text = getKeyDisplayName(key)
                if onChanged then onChanged(key) end
                pcall(requestSave)
            else
                kbtn.Text = getKeyDisplayName(Keys[keyName] or Enum.KeyCode.Unknown)
            end
        end
        kbtn.MouseButton1Click:Connect(function()
            if listening then stopL(nil); return end
            listening = true; kbtn.Text = "···"; kbtn.TextColor3 = Color3.fromRGB(0,30,12)
            TweenService:Create(kbtn,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(80,240,140)}):Play()
            TweenService:Create(ks,TweenInfo.new(0.12),{Color=Color3.fromRGB(80,240,140)}):Play()
            lconnKeyboard = UIS.InputBegan:Connect(function(inp)
                if not listening then return end
                if inp.UserInputType ~= Enum.UserInputType.Keyboard then return end
                if inp.KeyCode == Enum.KeyCode.Escape then stopL(nil); return end
                stopL(inp.KeyCode)
            end)
            lconnGamepad = UIS.InputBegan:Connect(function(inp)
                if not listening then return end
                if inp.UserInputType ~= Enum.UserInputType.Gamepad1 and inp.UserInputType ~= Enum.UserInputType.Gamepad2 and inp.UserInputType ~= Enum.UserInputType.Gamepad3 and inp.UserInputType ~= Enum.UserInputType.Gamepad4 then return end
                local kc = inp.KeyCode; if kc == Enum.KeyCode.Unknown then return end
                stopL(kc)
            end)
        end)
        if keyName then keybindBtnRefs[keyName] = kbtn end
        return kbtn
    end

    -- ============================================================
    -- PERFORMANCE
    -- ============================================================
    local antiLagDescConn = nil
    local antiLagActive = false
    local antiLagDefBrightness, antiLagDefFog, antiLagDefDiffuse, antiLagDefSpecular

    local function _applyAntiLagObj(obj)
        pcall(function()
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.Plastic; obj.Reflectance = 0; obj.CastShadow = false
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Transparency = 1
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam")
            or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
                obj.Enabled = false
            elseif obj:IsA("AnimationController") or obj:IsA("Animator") then
                for _,t in ipairs(obj:GetPlayingAnimationTracks()) do pcall(function() t:Stop(0) end) end
            end
        end)
    end

    local function enableAntiLag()
        antiLagActive = true
        antiLagDefBrightness = antiLagDefBrightness or Lighting.Brightness
        antiLagDefFog        = antiLagDefFog        or Lighting.FogEnd
        antiLagDefDiffuse    = antiLagDefDiffuse    or Lighting.EnvironmentDiffuseScale
        antiLagDefSpecular   = antiLagDefSpecular   or Lighting.EnvironmentSpecularScale
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 1e10
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        for _,e in pairs(Lighting:GetChildren()) do
            pcall(function()
                if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect")
                or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then e.Enabled = false end
            end)
        end
        for _,obj in ipairs(workspace:GetDescendants()) do _applyAntiLagObj(obj) end
        if antiLagDescConn then antiLagDescConn:Disconnect() end
        antiLagDescConn = workspace.DescendantAdded:Connect(function(obj)
            if antiLagActive then _applyAntiLagObj(obj) end
        end)
    end

    local function disableAntiLag()
        antiLagActive = false
        if antiLagDescConn then antiLagDescConn:Disconnect(); antiLagDescConn = nil end
        pcall(function()
            Lighting.GlobalShadows = true
            if antiLagDefBrightness then Lighting.Brightness = antiLagDefBrightness end
            if antiLagDefFog        then Lighting.FogEnd = antiLagDefFog end
            if antiLagDefDiffuse    then Lighting.EnvironmentDiffuseScale = antiLagDefDiffuse end
            if antiLagDefSpecular   then Lighting.EnvironmentSpecularScale = antiLagDefSpecular end
            for _,e in pairs(Lighting:GetChildren()) do
                pcall(function()
                    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect")
                    or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then e.Enabled = true end
                end)
            end
        end)
    end

    local stretchRezEnabled=false
    local stretchRezConn,stretchFovConn=nil,nil
    local function applyStretchFOV(val) local cam=Workspace.CurrentCamera; if cam then pcall(function() cam.FieldOfView=val end) end end
    local function enableStretchRez()
        stretchRezEnabled=true; local cam=Workspace.CurrentCamera; if not cam then return end
        if stretchRezConn then stretchRezConn:Disconnect() end
        if stretchFovConn then stretchFovConn:Disconnect() end
        stretchFovConn = RunService.RenderStepped:Connect(function() if stretchRezEnabled then applyStretchFOV(State.stretchFOV) end end)
        stretchRezConn = RunService.RenderStepped:Connect(function()
            if not stretchRezEnabled then stretchRezConn:Disconnect(); stretchRezConn=nil; return end
            if cam then cam.CFrame = cam.CFrame * CFrame.new(0,0,0,1,0,0,0,0.7,0,0,0,1) end
        end)
    end
    local function disableStretchRez()
        stretchRezEnabled=false
        if stretchRezConn then stretchRezConn:Disconnect(); stretchRezConn=nil end
        if stretchFovConn then stretchFovConn:Disconnect(); stretchFovConn=nil end
        pcall(function() Workspace.CurrentCamera.FieldOfView = 70 end)
    end
    local function cleanParticlesAndLights()
        local removed=0
        for _,obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") or obj:IsA("Explosion") or obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                pcall(function() obj:Destroy() end); removed=removed+1
            end
        end
        if _G._VezyFlashSave then _G._VezyFlashSave(true); task.delay(1.2,function() if _G._VezyFlashSave then _G._VezyFlashSave(false) end end) end
        print("[Green Duels] Cleaned "..removed.." effects/lights")
    end
    local origLighting = {
        Ambient = Lighting.Ambient, Brightness = Lighting.Brightness, ClockTime = Lighting.ClockTime,
        FogColor = Lighting.FogColor, FogEnd = Lighting.FogEnd, GlobalShadows = Lighting.GlobalShadows,
        EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
    }
    local activeColorCorr = nil
    local function clearColorCorr() if activeColorCorr then pcall(function() activeColorCorr:Destroy() end); activeColorCorr=nil end end
    local function restoreLighting()
        clearColorCorr()
        pcall(function()
            Lighting.Ambient = origLighting.Ambient; Lighting.Brightness = origLighting.Brightness
            Lighting.ClockTime = origLighting.ClockTime; Lighting.FogColor = origLighting.FogColor
            Lighting.FogEnd = origLighting.FogEnd; Lighting.GlobalShadows = origLighting.GlobalShadows
            Lighting.EnvironmentDiffuseScale = origLighting.EnvironmentDiffuseScale
            Lighting.EnvironmentSpecularScale = origLighting.EnvironmentSpecularScale
        end)
    end

    local function applySky(kind)
        if kind==nil or kind=="none" then restoreLighting(); return end
        clearColorCorr(); local cc=Instance.new("ColorCorrectionEffect"); cc.Parent=Lighting; activeColorCorr=cc
        if kind=="blue" then
            Lighting.Ambient=Color3.fromRGB(30,60,120); Lighting.FogColor=Color3.fromRGB(40,80,160)
            cc.TintColor=Color3.fromRGB(140,180,255); cc.Saturation=0.4; cc.Contrast=0.1
        elseif kind=="green" then
            Lighting.Ambient=Color3.fromRGB(40,100,60); Lighting.FogColor=Color3.fromRGB(50,140,80)
            cc.TintColor=Color3.fromRGB(160,255,180); cc.Saturation=0.5; cc.Contrast=0.1
        elseif kind=="night" then
            Lighting.ClockTime=0; Lighting.Brightness=0.2; Lighting.Ambient=Color3.fromRGB(20,20,35)
            cc.TintColor=Color3.fromRGB(180,180,220); cc.Saturation=-0.2; cc.Contrast=0.1
        elseif kind=="day" then
            Lighting.ClockTime=14; Lighting.Brightness=2; Lighting.Ambient=Color3.fromRGB(140,140,140)
            cc.TintColor=Color3.fromRGB(255,255,255); cc.Saturation=0.1; cc.Contrast=0
        end
    end




    local function updateLaggerButtons()
        if stackBtnRefs.lagger then stackBtnRefs.lagger.setOn(State.laggerMode==1) end
        if stackBtnRefs.laggerCarry then stackBtnRefs.laggerCarry.setOn(State.laggerMode==2) end
    end

    local function setLaggerMode(mode)
        if mode == State.laggerMode then return end
        local oldMode = State.laggerMode
        if mode == 0 then
            State.carrySpeed = State._prevCarry or 30
            State.speedToggled = State._prevSpeed or false
            if carryBox then carryBox.Text = tostring(State.speedToggled and State.carrySpeed or State.normalSpeed) end
            if stackBtnRefs.carrySpeed then stackBtnRefs.carrySpeed.setOn(State.speedToggled) end
        elseif mode == 1 or mode == 2 then
            if oldMode == 0 then
                State._prevCarry = State.carrySpeed
                State._prevSpeed = State.speedToggled
            end
            State.speedToggled = false
            if stackBtnRefs.carrySpeed then stackBtnRefs.carrySpeed.setOn(false) end
            if carryBox then
                carryBox.Text = tostring(mode == 1 and State.laggerSpeed or State.laggerCarrySpeed)
            end
        end
        State.laggerMode = mode
        updateLaggerButtons()
        requestSave()
    end

    local function toggleSpeed()
        if State.laggerMode ~= 0 then setLaggerMode(0); return end
        State.speedToggled = not State.speedToggled
        if stackBtnRefs.carrySpeed then stackBtnRefs.carrySpeed.setOn(State.speedToggled) end
        if carryBox then carryBox.Text = tostring(State.speedToggled and State.carrySpeed or State.normalSpeed) end
        requestSave()
    end



    -- ============================================================
    -- CHITUK FEATURES INSIDE THE TEXTFILE UI
    -- ============================================================

    -- Duel tab: speed, combat, auto-steal, movement and quick actions.
    buildPage("duel", function()
        makeSectionHeader("Speed")
        normalBox = makeInputRow("Normal Speed", State.normalSpeed, function(n)
            if n > 0 and n <= 500 then State.normalSpeed = n end
        end)
        carryBox = makeInputRow("Carry Speed", State.carrySpeed, function(n)
            if n > 0 and n <= 500 then State.carrySpeed = n end
        end)
        laggerBox = makeInputRow("Lagger Speed", State.laggerSpeed, function(n)
            if n > 0 and n <= 500 then State.laggerSpeed = n end
        end)
        laggerCarryBox = makeInputRow("Lagger Carry Speed", State.laggerCarrySpeed, function(n)
            if n > 0 and n <= 500 then State.laggerCarrySpeed = n end
        end)

        makeGap(5)
        makeSectionHeader("Combat")
        setAutoSwing = makeToggleRow("Auto Swing", false, function(on)
            State.autoSwingEnabled = on
        end)
        toggleSetters["autoSwing"] = setAutoSwing

        setBatCounter = makeToggleRow("Bat Counter", false, function(on)
            State.batCounterEnabled = on
            if on then startBatCounter() else stopBatCounter() end
        end)
        toggleSetters["batCounter"] = setBatCounter

        setMedusaCounter = makeToggleRow("Medusa Counter", false, function(on)
            State.medusaCounterEnabled = on
            if on then setupMedusaCounter(LP.Character) else stopMedusaCounter() end
        end)
        toggleSetters["medusaCounter"] = setMedusaCounter

        makeGap(5)
        makeSectionHeader("Auto Steal")
        setInstaGrab = makeToggleRow("Auto Steal", true, function(on)
            Steal.AutoStealEnabled = on
            if on then startAutoSteal() else stopAutoSteal() end
        end)
        toggleSetters["autoSteal"] = setInstaGrab

        stealRadBox = makeInputRow("Steal Radius", Steal.StealRadius, function(n)
            if n then
                n = math.floor(n)
                if n >= 1 and n <= 500 then Steal.StealRadius = n end
            end
        end)
        stealDurBox = select(1, makeInputRow("Steal Duration", Steal.StealDuration, function(n)
            if n then
                n = math.min(n, 10)
                if n >= 0.05 then Steal.StealDuration = n end
            end
        end))

        makeGap(5)
        makeSectionHeader("Movement")
        setInfJump = makeToggleRow("Infinite Jump", true, function(on)
            State.infJumpEnabled = on
        end)
        toggleSetters["infJump"] = setInfJump

        setAntiRag = makeToggleRow("Anti Ragdoll", false, function(on)
            State.antiRagdollEnabled = on
            if on then startAntiRagdoll() else stopAntiRagdoll() end
        end)
        toggleSetters["antiRagdoll"] = setAntiRag

        local autoTPToggle = makeToggleRow("Auto TP", State.autoTPEnabled, function(on)
            State.autoTPEnabled = on
            if on then startAutoTP() else stopAutoTP() end
            requestSave()
        end)
        toggleSetters["autoTP"] = autoTPToggle
        autoTPHeightBox = makeInputRow("Auto TP Height", State.autoTPHeight, function(n)
            if n and n >= 2 and n <= 500 then State.autoTPHeight = n end
        end)

        makeGap(5)
        makeSectionHeader("Quick Actions")

        local quickDefs = {
            {key="drop",        label="DROP"},
            {key="tpBat",       label="BAT MODE"},
            {key="autoLeft",    label="AUTO LEFT"},
            {key="autoRight",   label="AUTO RIGHT"},
            {key="aimbot",      label="AIMBOT"},
            {key="tpDown",      label="TP DOWN"},
            {key="carrySpeed",  label="CARRY SPD"},
            {key="reset",       label="RESET"},
            {key="lagger",      label="LAGGER"},
            {key="laggerCarry", label="LAGGER CARRY"},
        }

        local quickButtons = {}
        local function setQuickOn(key, on)
            local q = quickButtons[key]
            if q then
                q.state = on
                TweenService:Create(q.button, TweenInfo.new(0.12), {
                    BackgroundColor3 = on and Color3.fromRGB(218,145,155) or Color3.fromRGB(30,20,20),
                    TextColor3 = on and Color3.fromRGB(30,20,20) or Color3.fromRGB(255,255,255)
                }):Play()
            end
        end

        local function quickTap(key)
            if key == "tpDown" then
                task.spawn(function()
                    if runTPDown then pcall(runTPDown) end
                    setQuickOn(key, true)
                    task.wait(0.12)
                    setQuickOn(key, false)
                end)
                return
            end
            if key == "drop" then
                task.spawn(function() pcall(runDrop) end)
                return
            end
            if key == "tpBat" then
                task.spawn(toggleTPBat)
                return
            end
            if key == "reset" then
                task.spawn(function()
                    pcall(instaReset)
                    setQuickOn(key, true)
                    task.wait(0.3)
                    setQuickOn(key, false)
                end)
                return
            end
            if key == "carrySpeed" then
                if State.laggerMode ~= 0 then return end
                State.speedToggled = not State.speedToggled
                setQuickOn(key, State.speedToggled)
                if carryBox then
                    carryBox.Text = tostring(State.speedToggled and State.carrySpeed or State.normalSpeed)
                end
                requestSave()
                return
            end
            if key == "lagger" then
                if State.laggerMode == 1 then setLaggerMode(0) else setLaggerMode(1) end
                return
            end
            if key == "laggerCarry" then
                if State.laggerMode == 2 then setLaggerMode(0) else setLaggerMode(2) end
                return
            end

            local ns = not (quickButtons[key] and quickButtons[key].state)
            setQuickOn(key, ns)

            if key == "autoLeft" then
                State.autoLeftEnabled = ns
                if ns and State.batAimbotToggled then
                    State.batAimbotToggled = false
                    stopBatAimbot()
                    setQuickOn("aimbot", false)
                end
                if ns then startAutoLeft() else stopAutoLeft() end
            elseif key == "autoRight" then
                State.autoRightEnabled = ns
                if ns and State.batAimbotToggled then
                    State.batAimbotToggled = false
                    stopBatAimbot()
                    setQuickOn("aimbot", false)
                end
                if ns then startAutoRight() else stopAutoRight() end
            elseif key == "aimbot" then
                State.batAimbotToggled = ns
                if ns then
                    if State.autoLeftEnabled then
                        State.autoLeftEnabled = false
                        stopAutoLeft()
                        setQuickOn("autoLeft", false)
                    end
                    if State.autoRightEnabled then
                        State.autoRightEnabled = false
                        stopAutoRight()
                        setQuickOn("autoRight", false)
                    end
                    pcall(startBatAimbot)
                else
                    stopBatAimbot()
                end
            end
            requestSave()
        end

        for _, def in ipairs(quickDefs) do
            local b = Instance.new("TextButton")
            b.Size = UDim2.new(1, -16, 0, 30)
            b.BackgroundColor3 = Color3.fromRGB(30,20,20)
            b.BorderSizePixel = 0
            b.AutoButtonColor = false
            b.Text = def.label
            b.TextColor3 = Color3.fromRGB(255,255,255)
            b.Font = Enum.Font.GothamBold
            b.TextSize = 10
            b.TextWrapped = true
            b.LayoutOrder = LO()
            b.Parent = currentPage
            corner(b, 8)
            local st = stroke(b, 1, Color3.fromRGB(218,165,170), 0.55)
            quickButtons[def.key] = {button=b, state=false}
            stackBtnRefs[def.key] = {
                setOn = function(on) setQuickOn(def.key, on) end,
                _btnFrame = b
            }
            stackWrappers[def.key] = b
            b.MouseButton1Click:Connect(function()
                quickTap(def.key)
            end)
        end
    end)

    -- Settings tab: Chituk's settings/config controls.
    buildPage("settings", function()
        makeSectionHeader("Interface")
        uiScaleBox = makeInputRow("UI Scale", 1.0, function(n)
            if n >= 0.5 and n <= 2.0 and uiScaleObj then uiScaleObj.Scale = n end
        end)
        local hideButtonsSetter = makeToggleRow("Hide Buttons", false, function(on)
            State.stackButtonsHidden = on
            for _, wrapper in pairs(stackWrappers) do wrapper.Visible = not on end
        end)
        toggleSetters["hideButtons"] = hideButtonsSetter

        local lockButtonsSetter = makeToggleRow("Lock Buttons", false, function(on)
            State.stackButtonsLocked = on
        end)
        toggleSetters["lockButtons"] = lockButtonsSetter

        local introSetter = makeToggleRow("Show Intro Animation", State.introEnabled, function(on)
            State.introEnabled = on
            requestSave()
        end)
        toggleSetters["introEnabled"] = introSetter

        makeGap(6)
        makeSectionHeader("Config")

        addButton(currentPage, "SAVE CONFIG NOW", function()
            if saveConfig then pcall(saveConfig) end
        end, true)

        addButton(currentPage, "RESET ALL SETTINGS", function()
            State.normalSpeed=60; State.carrySpeed=30
            State.laggerSpeed=10.1; State.laggerCarrySpeed=15
            State.speedToggled=false; State.laggerMode=0
            State.infJumpEnabled=true; State.antiRagdollEnabled=false
            State.antiLagEnabled=false; State.stretchedResEnabled=false
            State.activeSky=nil; State.autoTPEnabled=false
            Steal.StealRadius=55; Steal.StealDuration=0.25
            if normalBox then normalBox.Text=tostring(State.normalSpeed) end
            if carryBox then carryBox.Text=tostring(State.carrySpeed) end
            if laggerBox then laggerBox.Text=tostring(State.laggerSpeed) end
            if laggerCarryBox then laggerCarryBox.Text=tostring(State.laggerCarrySpeed) end
            if stealRadBox then stealRadBox.Text=tostring(Steal.StealRadius) end
            if stealDurBox then stealDurBox.Text=tostring(Steal.StealDuration) end
            if uiScaleObj then uiScaleObj.Scale=1 end
            if uiScaleBox then uiScaleBox.Text="1" end
            if setInfJump then pcall(setInfJump,true) end
            if setAntiRag then pcall(setAntiRag,false) end
            if setInstaGrab then pcall(setInstaGrab,true) end
            if setAutoSwing then pcall(setAutoSwing,false) end
            if setBatCounter then pcall(setBatCounter,false) end
            if setMedusaCounter then pcall(setMedusaCounter,false) end
            if jumpDropBtn then jumpDropBtn.Text="Jump Drop" end
            requestSave()
        end)

        makeGap(6)
        makeSectionHeader("Layout")
        addButton(currentPage, "RESET BUTTON POSITIONS", function()
            for i, def in ipairs(stackDefs) do
                local b = stackWrappers[def.key]
                if b then b.LayoutOrder = 100 + i end
            end
        end)

        makeGap(6)
        makeSectionHeader("Presets")
        presetListFrame = Instance.new("Frame")
        presetListFrame.Size = UDim2.new(1, -16, 0, 4)
        presetListFrame.AutomaticSize = Enum.AutomaticSize.Y
        presetListFrame.BackgroundTransparency = 1
        presetListFrame.Parent = currentPage
        local pl = Instance.new("UIListLayout")
        pl.Padding = UDim.new(0,4)
        pl.Parent = presetListFrame
    end)

    -- Keybinds tab: all Chituk keybind controls.
    buildPage("keybinds", function()
        makeSectionHeader("Keybinds")
        makeKeybindRow("Speed Key", Keys.speed, function(k) Keys.speed=k end, "speed")
        makeKeybindRow("Lagger Key", Keys.lagger, function(k) Keys.lagger=k end, "lagger")
        makeKeybindRow("Aimbot Key", Keys.aimbot, function(k) Keys.aimbot=k end, "aimbot")
        makeKeybindRow("TP Bat Key", Keys.tpBat, function(k) Keys.tpBat=k end, "tpBat")
        makeKeybindRow("Auto Left", Keys.autoLeft, function(k) Keys.autoLeft=k end, "autoLeft")
        makeKeybindRow("Auto Right", Keys.autoRight, function(k) Keys.autoRight=k end, "autoRight")
        makeKeybindRow("Drop Key", Keys.drop, function(k) Keys.drop=k end, "drop")
        makeKeybindRow("TP Down", Keys.tpDown, function(k) Keys.tpDown=k end, "tpDown")
        makeKeybindRow("Reset Player", Keys.reset, function(k) Keys.reset=k end, "reset")
        makeKeybindRow("Hide GUI", Keys.guiHide, function(k) Keys.guiHide=k end, "guiHide")
    end)

    -- UI Changer tab: Chituk visual/performance controls.
    buildPage("ui changer", function()
        makeSectionHeader("Performance")
        antiLagSetter = makeToggleRow("Anti-Lag", State.antiLagEnabled, function(on)
            State.antiLagEnabled=on
            if on then enableAntiLag() else disableAntiLag() end
        end)
        toggleSetters["antiLag"] = antiLagSetter

        stretchSetter = makeToggleRow("Stretch Rez", State.stretchedResEnabled, function(on)
            State.stretchedResEnabled=on
            if on then enableStretchRez() else disableStretchRez() end
        end)
        toggleSetters["stretchedRes"] = stretchSetter

        makeInputRow("Stretch FOV", State.stretchFOV, function(n)
            if n >= 60 and n <= 180 then
                State.stretchFOV = n
                if State.stretchedResEnabled then applyStretchFOV(n) end
            end
        end)

        addButton(currentPage, "CLEAN PARTICLES & LIGHTS", function()
            cleanParticlesAndLights()
        end)

        makeGap(5)
        makeSectionHeader("Sky Colors")
        addButton(currentPage, "BLUE SKY", function() State.activeSky="blue"; applySky("blue"); requestSave() end)
        addButton(currentPage, "GREEN SKY", function() State.activeSky="green"; applySky("green"); requestSave() end)
        addButton(currentPage, "NIGHT MODE", function() State.activeSky="night"; applySky("night"); requestSave() end)
        addButton(currentPage, "DAY MODE", function() State.activeSky="day"; applySky("day"); requestSave() end)
        addButton(currentPage, "RESTORE DEFAULT LIGHTING", function()
            State.activeSky=nil
            applySky(nil)
            requestSave()
        end)

        makeGap(5)
        makeSectionHeader("Other Visuals")
        local nukeSetter = makeToggleRow("Nuke Optimizer", false, function(on)
            State.nukeOpt=on
            if on and _G._nukeStart then _G._nukeStart() elseif _G._nukeStop then _G._nukeStop() end
        end)
        toggleSetters["nukeOpt"] = nukeSetter

        local removeAccSetter = makeToggleRow("Remove Accessories", false, function(on)
            State.removeAcc=on
            if on and _G._removeAccStart then _G._removeAccStart() elseif _G._removeAccStop then _G._removeAccStop() end
        end)
        toggleSetters["removeAcc"] = removeAccSetter

        local tryardSetter = makeToggleRow("Tryard Animation Pack", State.tryardAnimEnabled, function(on)
            State.tryardAnimEnabled=on
            if on then startTryardAnim() else stopTryardAnim() end
        end)
        toggleSetters["tryardAnim"] = tryardSetter

        _G._VezyFOV = _G._VezyFOV or 70
        makeInputRow("FOV (normal)", _G._VezyFOV, function(n)
            if n >= 70 and n <= 180 then
                _G._VezyFOV=n
                local cam=workspace.CurrentCamera
                if cam and not State.stretchedResEnabled then pcall(function() cam.FieldOfView=n end) end
            end
        end)
    end)



    local infoBar = Instance.new("Frame", screenGui)
    infoBar.Size = UDim2.new(0, 200, 0, 28)
    infoBar.Position = UDim2.new(1, -210, 1, -36)
    infoBar.BackgroundColor3 = Color3.fromRGB(18,12,12)
    infoBar.BackgroundTransparency = 0.1
    infoBar.BorderSizePixel = 0
    corner(infoBar, 14)
    stroke(infoBar, 1, Color3.fromRGB(218,165,170), 0.45)

    local progressBg = Instance.new("Frame", infoBar)
    progressBg.Size = UDim2.new(0, 74, 0, 18)
    progressBg.Position = UDim2.new(0, 5, 0.5, -9)
    progressBg.BackgroundColor3 = Color3.fromRGB(30,20,20)
    progressBg.BorderSizePixel = 0
    corner(progressBg, 9)

    local progressFill = Instance.new("Frame", progressBg)
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.BackgroundColor3 = Color3.fromRGB(218,145,155)
    progressFill.BorderSizePixel = 0
    corner(progressFill, 9)

    local stealTextLbl = Instance.new("TextLabel", progressBg)
    stealTextLbl.Size = UDim2.new(1, -8, 1, 0)
    stealTextLbl.Position = UDim2.new(0, 4, 0, 0)
    stealTextLbl.BackgroundTransparency = 1
    stealTextLbl.Text = "STEAL"
    stealTextLbl.TextColor3 = Color3.fromRGB(255,255,255)
    stealTextLbl.Font = Enum.Font.GothamBold
    stealTextLbl.TextSize = 9

    local stealPctLbl = Instance.new("TextLabel", infoBar)
    stealPctLbl.Size = UDim2.new(0, 40, 1, 0)
    stealPctLbl.Position = UDim2.new(0, 84, 0, 0)
    stealPctLbl.BackgroundTransparency = 1
    stealPctLbl.Text = "0%"
    stealPctLbl.TextColor3 = Color3.fromRGB(255,255,255)
    stealPctLbl.Font = Enum.Font.GothamBold
    stealPctLbl.TextSize = 10

    local fpsVal = Instance.new("TextLabel", infoBar)
    fpsVal.Size = UDim2.new(0, 40, 1, 0)
    fpsVal.Position = UDim2.new(0, 126, 0, 0)
    fpsVal.BackgroundTransparency = 1
    fpsVal.Text = "0"
    fpsVal.TextColor3 = Color3.fromRGB(255,255,255)
    fpsVal.Font = Enum.Font.GothamBold
    fpsVal.TextSize = 10

    local pingVal = Instance.new("TextLabel", infoBar)
    pingVal.Size = UDim2.new(0, 40, 1, 0)
    pingVal.Position = UDim2.new(0, 162, 0, 0)
    pingVal.BackgroundTransparency = 1
    pingVal.Text = "0ms"
    pingVal.TextColor3 = Color3.fromRGB(255,255,255)
    pingVal.Font = Enum.Font.GothamBold
    pingVal.TextSize = 10

    local statusDot = Instance.new("Frame", infoBar)
    statusDot.Size = UDim2.new(0, 8, 0, 8)
    statusDot.Position = UDim2.new(1, -14, 0.5, -4)
    statusDot.BackgroundColor3 = Color3.fromRGB(218,145,155)
    statusDot.BorderSizePixel = 0
    corner(statusDot, 4)

    local frameCount, lastTime = 0, tick()
    RunService.RenderStepped:Connect(function()
        frameCount += 1
        local now = tick()
        if now - lastTime >= 1 then
            fpsVal.Text = tostring(math.floor(frameCount/(now-lastTime)))
            frameCount = 0
            lastTime = now
        end
    end)


    rebuildPresetList = function()
        if not presetListFrame then return end
        for _,child in ipairs(presetListFrame:GetChildren()) do if child.Name~="EmptyLabel" and not child:IsA("UIListLayout") and not child:IsA("UIPadding") then child:Destroy() end end
        local emptyLbl = presetListFrame:FindFirstChild("EmptyLabel")
        if emptyLbl then emptyLbl.Visible = (#Presets == 0) end
        for i,preset in ipairs(Presets) do
            local row = Instance.new("Frame", presetListFrame); row.Name="Preset_"..i; row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C.presetBg; row.BorderSizePixel=0; row.LayoutOrder=i+1; mkCorner(row,6); mkStroke(row, C.presetBrd,1)
            local nameLbl = Instance.new("TextLabel", row); nameLbl.Size=UDim2.new(1,-94,1,0); nameLbl.Position=UDim2.new(0,10,0,0); nameLbl.BackgroundTransparency=1; nameLbl.Text=preset.name; nameLbl.TextColor3=C.rowLabel; nameLbl.Font=Enum.Font.GothamBold; nameLbl.TextSize=12; nameLbl.TextXAlignment=Enum.TextXAlignment.Left; nameLbl.TextTruncate=Enum.TextTruncate.AtEnd
            local loadBtn = Instance.new("TextButton", row); loadBtn.Size=UDim2.new(0,44,0,26); loadBtn.Position=UDim2.new(1,-96,0.5,-13); loadBtn.BackgroundColor3=C.presetLoad; loadBtn.BorderSizePixel=0; loadBtn.Text="Load"; loadBtn.TextColor3=Color3.fromRGB(240,255,245); loadBtn.Font=Enum.Font.GothamBold; loadBtn.TextSize=11; loadBtn.ZIndex=9; mkCorner(loadBtn,5)
            loadBtn.MouseEnter:Connect(function() TweenService:Create(loadBtn,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(0,200,100)}):Play() end)
            loadBtn.MouseLeave:Connect(function() TweenService:Create(loadBtn,TweenInfo.new(0.1),{BackgroundColor3=C.presetLoad}):Play() end)
            loadBtn.MouseButton1Click:Connect(function()
                saveLastPresetName(preset.name); loadBtn.Text="✓"; task.delay(1.2,function() if loadBtn and loadBtn.Parent then loadBtn.Text="Load" end end)
            end)
            local delBtn = Instance.new("TextButton", row); delBtn.Size=UDim2.new(0,34,0,26); delBtn.Position=UDim2.new(1,-48,0.5,-13); delBtn.BackgroundColor3=C.presetDel; delBtn.BorderSizePixel=0; delBtn.Text="✕"; delBtn.TextColor3=Color3.fromRGB(200,80,80); delBtn.Font=Enum.Font.GothamBold; delBtn.TextSize=11; delBtn.ZIndex=9; mkCorner(delBtn,5)
            delBtn.MouseEnter:Connect(function() TweenService:Create(delBtn,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(80,28,28)}):Play() end)
            delBtn.MouseLeave:Connect(function() TweenService:Create(delBtn,TweenInfo.new(0.1),{BackgroundColor3=C.presetDel}):Play() end)
            delBtn.MouseButton1Click:Connect(function()
                table.remove(Presets,i); savePresetsFile(); rebuildPresetList()
            end)
        end
    end

    -- ============================================================
    -- CHARACTER SETUP
    -- ============================================================
    local function setupChar(char)
        task.wait(0.1)
        h=char:WaitForChild("Humanoid",5)
        hrp=char:WaitForChild("HumanoidRootPart",5)
        if not h or not hrp then return end
        local head=char:FindFirstChild("Head")
        if head then
            local oldBB=head:FindFirstChild("GreenDuelsBB"); if oldBB then oldBB:Destroy() end
            local bb=Instance.new("BillboardGui", head); bb.Name="GreenDuelsBB"; bb.Size=UDim2.new(0,180,0,100); bb.StudsOffset=Vector3.new(0,3,0); bb.AlwaysOnTop=true
            local list=Instance.new("UIListLayout",bb); list.FillDirection=Enum.FillDirection.Vertical; list.SortOrder=Enum.SortOrder.LayoutOrder; list.VerticalAlignment=Enum.VerticalAlignment.Center; list.Padding=UDim.new(0,2)
            local speedBillLbl=Instance.new("TextLabel",bb); speedBillLbl.Name="SpeedBillLbl"; speedBillLbl.Size=UDim2.new(1,0,0,24); speedBillLbl.BackgroundTransparency=1; speedBillLbl.Text="0.0"; speedBillLbl.TextColor3=Color3.fromRGB(38,240,125); speedBillLbl.Font=Enum.Font.GothamBlack; speedBillLbl.TextScaled=true; speedBillLbl.TextStrokeTransparency=0.1; speedBillLbl.TextStrokeColor3=Color3.new(0,0,0); speedBillLbl.LayoutOrder=1
            local discordLbl=Instance.new("TextLabel",bb); discordLbl.Size=UDim2.new(1,0,0,22); discordLbl.BackgroundTransparency=1; discordLbl.Text="discord.gg/GreenDuels"; discordLbl.TextColor3=Color3.fromRGB(100,255,100); discordLbl.Font=Enum.Font.GothamBold; discordLbl.TextScaled=true; discordLbl.TextStrokeTransparency=0.1; discordLbl.TextStrokeColor3=Color3.new(0,0,0); discordLbl.LayoutOrder=2
            local ragTimerLbl=Instance.new("TextLabel",bb); ragTimerLbl.Name="RagdollTimerLbl"; ragTimerLbl.Size=UDim2.new(1,0,0,30); ragTimerLbl.BackgroundTransparency=1; ragTimerLbl.Text=""; ragTimerLbl.TextColor3=Color3.fromRGB(255,60,60); ragTimerLbl.Font=Enum.Font.GothamBlack; ragTimerLbl.TextScaled=true; ragTimerLbl.TextStrokeTransparency=0.1; ragTimerLbl.TextStrokeColor3=Color3.new(0,0,0); ragTimerLbl.LayoutOrder=3
        end
        stopAntiRagdoll()
        Steal.Data={}
        _rtTimerActive = false
        local _rtLbl = getRagTimerLbl and getRagTimerLbl()
        if _rtLbl then _rtLbl.Text = "" end
        task.spawn(function() startRagTimerDetection(char) end)
        if State.antiRagdollEnabled then task.wait(0.5); startAntiRagdoll() end
        if State.medusaCounterEnabled then setupMedusaCounter(char) end
        if State.batAimbotToggled then stopBatAimbot(); task.wait(0.2); pcall(startBatAimbot) end
        if State.batCounterEnabled then task.wait(0.3); startBatCounter() end
        if State.tryardAnimEnabled then saveOriginalTryardAnims(char); applyTryardAnimPack(char) end
        -- TP Bat setup
        tpBatH = char:FindFirstChildOfClass("Humanoid")
        tpBatHRP = char:FindFirstChild("HumanoidRootPart")
        if tpBatToggled then startTPBat() end
    end
    LP.CharacterAdded:Connect(setupChar)
    if LP.Character then task.spawn(function() setupChar(LP.Character) end) end

    -- ============================================================
    -- AUTO LEFT / RIGHT
    -- ============================================================
    stopAutoLeft = function()
        if alConn then alConn:Disconnect(); alConn = nil end; alPhase = 1
        local char = LP.Character; if char then local hum2 = char:FindFirstChildOfClass("Humanoid"); if hum2 then hum2:Move(Vector3.zero, false) end end
        if stackBtnRefs.autoLeft then stackBtnRefs.autoLeft.setOn(false) end
    end
    stopAutoRight = function()
        if arConn then arConn:Disconnect(); arConn = nil end; arPhase = 1
        local char = LP.Character; if char then local hum2 = char:FindFirstChildOfClass("Humanoid"); if hum2 then hum2:Move(Vector3.zero, false) end end
        if stackBtnRefs.autoRight then stackBtnRefs.autoRight.setOn(false) end
    end

    startAutoLeft = function()
        if alConn then alConn:Disconnect() end; alPhase = 1
        alConn = RunService.Heartbeat:Connect(function()
            if not State.autoLeftEnabled then return end
            local char = LP.Character; if not char then return end
            local hrp2 = char:FindFirstChild("HumanoidRootPart")
            local hum2 = char:FindFirstChildOfClass("Humanoid")
            if not hrp2 or not hum2 then return end
            local spd = State.normalSpeed
            if alPhase == 1 then
                local tgt = Vector3.new(AP_L1.X, hrp2.Position.Y, AP_L1.Z)
                if (tgt - hrp2.Position).Magnitude < 1 then
                    alPhase = 2
                    local d = AP_L2 - hrp2.Position; local mv = Vector3.new(d.X, 0, d.Z).Unit
                    hum2:Move(mv, false); hrp2.AssemblyLinearVelocity = Vector3.new(mv.X*spd, hrp2.AssemblyLinearVelocity.Y, mv.Z*spd); return
                end
                local d = AP_L1 - hrp2.Position; local mv = Vector3.new(d.X, 0, d.Z).Unit
                hum2:Move(mv, false); hrp2.AssemblyLinearVelocity = Vector3.new(mv.X*spd, hrp2.AssemblyLinearVelocity.Y, mv.Z*spd)
            elseif alPhase == 2 then
                local tgt = Vector3.new(AP_L2.X, hrp2.Position.Y, AP_L2.Z)
                if (tgt - hrp2.Position).Magnitude < 1 then
                    hum2:Move(Vector3.zero, false); hrp2.AssemblyLinearVelocity = Vector3.zero
                    State.autoLeftEnabled = false; if alConn then alConn:Disconnect(); alConn = nil end
                    alPhase = 1; if stackBtnRefs.autoLeft then stackBtnRefs.autoLeft.setOn(false) end
                    if (AP_L_FACE - hrp2.Position).Magnitude > 0.01 then
                        hrp2.CFrame = CFrame.new(hrp2.Position, Vector3.new(AP_L_FACE.X, hrp2.Position.Y, AP_L_FACE.Z))
                    end
                    return
                end
                local d = AP_L2 - hrp2.Position; local mv = Vector3.new(d.X, 0, d.Z).Unit
                hum2:Move(mv, false); hrp2.AssemblyLinearVelocity = Vector3.new(mv.X*spd, hrp2.AssemblyLinearVelocity.Y, mv.Z*spd)
            end
        end)
    end

    startAutoRight = function()
        if arConn then arConn:Disconnect() end; arPhase = 1
        arConn = RunService.Heartbeat:Connect(function()
            if not State.autoRightEnabled then return end
            local char = LP.Character; if not char then return end
            local hrp2 = char:FindFirstChild("HumanoidRootPart")
            local hum2 = char:FindFirstChildOfClass("Humanoid")
            if not hrp2 or not hum2 then return end
            local spd = State.normalSpeed
            if arPhase == 1 then
                local tgt = Vector3.new(AP_R1.X, hrp2.Position.Y, AP_R1.Z)
                if (tgt - hrp2.Position).Magnitude < 1 then
                    arPhase = 2
                    local d = AP_R2 - hrp2.Position; local mv = Vector3.new(d.X, 0, d.Z).Unit
                    hum2:Move(mv, false); hrp2.AssemblyLinearVelocity = Vector3.new(mv.X*spd, hrp2.AssemblyLinearVelocity.Y, mv.Z*spd); return
                end
                local d = AP_R1 - hrp2.Position; local mv = Vector3.new(d.X, 0, d.Z).Unit
                hum2:Move(mv, false); hrp2.AssemblyLinearVelocity = Vector3.new(mv.X*spd, hrp2.AssemblyLinearVelocity.Y, mv.Z*spd)
            elseif arPhase == 2 then
                local tgt = Vector3.new(AP_R2.X, hrp2.Position.Y, AP_R2.Z)
                if (tgt - hrp2.Position).Magnitude < 1 then
                    hum2:Move(Vector3.zero, false); hrp2.AssemblyLinearVelocity = Vector3.zero
                    State.autoRightEnabled = false; if arConn then arConn:Disconnect(); arConn = nil end
                    arPhase = 1; if stackBtnRefs.autoRight then stackBtnRefs.autoRight.setOn(false) end
                    if (AP_R_FACE - hrp2.Position).Magnitude > 0.01 then
                        hrp2.CFrame = CFrame.new(hrp2.Position, Vector3.new(AP_R_FACE.X, hrp2.Position.Y, AP_R_FACE.Z))
                    end
                    return
                end
                local d = AP_R2 - hrp2.Position; local mv = Vector3.new(d.X, 0, d.Z).Unit
                hum2:Move(mv, false); hrp2.AssemblyLinearVelocity = Vector3.new(mv.X*spd, hrp2.AssemblyLinearVelocity.Y, mv.Z*spd)
            end
        end)
    end

    -- ============================================================
    -- HELPER FUNCTIONS
    -- ============================================================
    local function resetProgressBar() stealPctLbl.Text="0%"; progressFill.Size=UDim2.new(0,0,1,0) end

    local _aimbotTarget=nil
    local function findBat()
        local char=LP.Character; if not char then return nil end
        for _,tool in ipairs(char:GetChildren()) do if tool:IsA("Tool") and (tool.Name:lower():find("bat") or tool.Name:lower():find("slap")) then return tool end end
        local bp=LP:FindFirstChild("Backpack"); if bp then for _,tool in ipairs(bp:GetChildren()) do if tool:IsA("Tool") and (tool.Name:lower():find("bat") or tool.Name:lower():find("slap")) then return tool end end end
        return nil
    end
    local function getClosestTarget()
        local root=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if not root then return nil end
        local closest,minDist=nil,math.huge
        for _,plr in ipairs(Players:GetPlayers()) do
            if plr~=LP and plr.Character then
                local tRoot=plr.Character:FindFirstChild("HumanoidRootPart"); local hum=plr.Character:FindFirstChildOfClass("Humanoid")
                if tRoot and hum and hum.Health>0 then                    local dist=(tRoot.Position-root.Position).Magnitude
                    if dist<minDist then minDist=dist; closest=tRoot end
                end
            end
        end
        return closest
    end
    startBatAimbot = function()
        if Conns.aimbot then Conns.aimbot:Disconnect() end
        if State.autoLeftEnabled then State.autoLeftEnabled=false; if stackBtnRefs.autoLeft then stackBtnRefs.autoLeft.setOn(false) end; stopAutoLeft() end
        if State.autoRightEnabled then State.autoRightEnabled=false; if stackBtnRefs.autoRight then stackBtnRefs.autoRight.setOn(false) end; stopAutoRight() end
        local hum0=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if hum0 then hum0.AutoRotate=false end
        Conns.aimbot = RunService.RenderStepped:Connect(function()
            if not State.batAimbotToggled then return end
            local char=LP.Character; if not char then return end
            local root=char:FindFirstChild("HumanoidRootPart"); if not root then return end
            local hum=char:FindFirstChildOfClass("Humanoid"); if not hum then return end
            if not char:FindFirstChildOfClass("Tool") then local bat=findBat(); if bat then pcall(function() hum:EquipTool(bat) end) end end
            local target=getClosestTarget(); if not target then return end
            _aimbotTarget=target
            local targetVel=target.AssemblyLinearVelocity
            local myPos=root.Position; local targetPos=target.Position
            local predictPos=targetPos+targetVel*0.14; predictPos=predictPos+target.CFrame.LookVector*0.3
            local direction=predictPos-myPos; local flatDir=Vector3.new(direction.X,0,direction.Z).Unit
            local chaseSpeed=58; local desiredHeight=targetPos.Y+3.7
            local yVel=(desiredHeight-myPos.Y)*19.5+targetVel.Y*0.8
            if hum.FloorMaterial~=Enum.Material.Air then yVel=math.max(yVel,13) end
            yVel=math.clamp(yVel,-70,110)
            local desiredVel=Vector3.new(flatDir.X*chaseSpeed,yVel,flatDir.Z*chaseSpeed)
            root.AssemblyLinearVelocity=root.AssemblyLinearVelocity:Lerp(desiredVel,0.8)
            local speed3=targetVel.Magnitude
            local predictTime=math.clamp(speed3/150,0.05,0.2)
            local predictedPos=targetPos+targetVel*predictTime
            local toPredict=predictedPos-myPos
            if toPredict.Magnitude>0.1 then
                local goalCF=CFrame.lookAt(myPos,predictedPos)
                local diffCF=root.CFrame:Inverse()*goalCF
                local rx,ry,rz=diffCF:ToEulerAnglesXYZ()
                rx=math.clamp(rx,-2.5,2.5); ry=math.clamp(ry,-2.5,2.5); rz=math.clamp(rz,-2.5,2.5)
                root.AssemblyAngularVelocity=root.CFrame:VectorToWorldSpace(Vector3.new(rx*42,ry*42,rz*42))
            end
        end)
    end
    stopBatAimbot = function()
        if Conns.aimbot then Conns.aimbot:Disconnect(); Conns.aimbot=nil end
        _aimbotTarget=nil
        local c=LP.Character; local root=c and c:FindFirstChild("HumanoidRootPart")
        if root then root.AssemblyLinearVelocity=Vector3.zero; root.AssemblyAngularVelocity=Vector3.zero end
        local hum2=c and c:FindFirstChildOfClass("Humanoid")
        if hum2 then hum2.AutoRotate=true end
        State.hittingCooldown=false
    end

    local BAT_COUNTER_SLAP_LIST={"Bat","Slap","Iron Slap","Gold Slap","Diamond Slap","Emerald Slap","Ruby Slap","Dark Matter Slap","Flame Slap","Nuclear Slap","Galaxy Slap","Glitched Slap"}
    local function findBatForCounter()
        local c=LP.Character; if not c then return nil end
        local bp=LP:FindFirstChildOfClass("Backpack")
        for _,name in ipairs(BAT_COUNTER_SLAP_LIST) do
            local t=c:FindFirstChild(name) or (bp and bp:FindFirstChild(name))
            if t then return t end
        end
        for _,ch in ipairs(c:GetChildren()) do if ch:IsA("Tool") and ch.Name:lower():find("bat") then return ch end end
        if bp then for _,ch in ipairs(bp:GetChildren()) do if ch:IsA("Tool") and ch.Name:lower():find("bat") then return ch end end end
        return nil
    end
    local function swingBatForCounter(bat,char)
        local hum2=char:FindFirstChildOfClass("Humanoid")
        if bat.Parent~=char then if hum2 then pcall(function() hum2:EquipTool(bat) end) end; task.wait(0.05) end
        local remote=bat:FindFirstChildOfClass("RemoteEvent") or bat:FindFirstChildOfClass("RemoteFunction")
        if remote and remote:IsA("RemoteEvent") then
            pcall(function() remote:FireServer() end); task.wait(0.15); pcall(function() remote:FireServer() end)
        else pcall(function() bat:Activate() end); task.wait(0.15); pcall(function() bat:Activate() end) end
    end
    startBatCounter = function()
        if Conns.batCounter then return end
        Conns.batCounter = RunService.Heartbeat:Connect(function()
            if not State.batCounterEnabled or State.batCounterDebounce then return end
            local char=LP.Character; if not char then return end
            local hum2=char:FindFirstChildOfClass("Humanoid"); if not hum2 then return end
            local st=hum2:GetState()
            local isRagdolled = st==Enum.HumanoidStateType.Physics or st==Enum.HumanoidStateType.Ragdoll or st==Enum.HumanoidStateType.FallingDown
            if isRagdolled then
                State.batCounterDebounce=true
                task.spawn(function()
                    local bat=findBatForCounter()
                    if bat then swingBatForCounter(bat,char) end
                    task.wait(0.5); State.batCounterDebounce=false
                end)
            end
        end)
    end
    stopBatCounter = function()
        if Conns.batCounter then Conns.batCounter:Disconnect(); Conns.batCounter=nil end
        State.batCounterDebounce=false
    end

    local MEDUSA_COOLDOWN=0.5
    local function findMedusa()
        local c=LP.Character; if not c then return nil end
        for _,t in ipairs(c:GetChildren()) do if t:IsA("Tool") then local n=t.Name:lower(); if n:find("medusa") or n:find("head") or n:find("stone") then return t end end end
        local bp=LP:FindFirstChildOfClass("Backpack")
        if bp then for _,t in ipairs(bp:GetChildren()) do if t:IsA("Tool") then local n=t.Name:lower(); if n:find("medusa") or n:find("head") or n:find("stone") then return t end end end end
        return nil
    end
    local function useMedusaCounter()
        if State.medusaDebounce then return end; if tick()-State.medusaLastUsed<MEDUSA_COOLDOWN then return end
        local c=LP.Character; if not c then return end; State.medusaDebounce=true
        local med=findMedusa(); if not med then State.medusaDebounce=false; return end
        if med.Parent~=c then local hum2=c:FindFirstChildOfClass("Humanoid"); if hum2 then hum2:EquipTool(med) end end
        pcall(function() med:Activate() end); State.medusaLastUsed=tick(); State.medusaDebounce=false
    end
    local function onAnchorChanged(part) return part:GetPropertyChangedSignal("Anchored"):Connect(function() if part.Anchored and part.Transparency==1 then useMedusaCounter() end end) end
    setupMedusaCounter = function(char)
        stopMedusaCounter(); if not char then return end
        for _,part in ipairs(char:GetDescendants()) do if part:IsA("BasePart") then table.insert(Conns.anchor,onAnchorChanged(part)) end end
        table.insert(Conns.anchor,char.DescendantAdded:Connect(function(part) if part:IsA("BasePart") then table.insert(Conns.anchor,onAnchorChanged(part)) end end))
    end
    stopMedusaCounter = function() for _,c2 in pairs(Conns.anchor) do pcall(function() c2:Disconnect() end) end; Conns.anchor={} end

    local _rtTimerActive = false
    local function getRagTimerLbl()
        local char = LP.Character; if not char then return nil end
        local head = char:FindFirstChild("Head"); if not head then return nil end
        local bb = head:FindFirstChild("GreenDuelsBB"); if not bb then return nil end
        return bb:FindFirstChild("RagdollTimerLbl")
    end
    local function startRagTimerGui()
        if _rtTimerActive then return end
        _rtTimerActive = true
        task.spawn(function()
            local t = 3.0
            while t >= 0.0 do
                local lbl = getRagTimerLbl()
                if lbl then
                    lbl.Text = string.format("%.1f", t)
                    lbl.TextColor3 = Color3.fromRGB(80, 220, 80)
                end
                task.wait(0.1)
                t = math.round((t - 0.1) * 10) / 10
            end
            local lbl = getRagTimerLbl()
            if lbl then lbl.Text = "STEAL!"; lbl.TextColor3 = Color3.fromRGB(80, 255, 120) end
            repeat task.wait(0.1) until (function()
                local c = LP.Character
                local hum = c and c:FindFirstChildOfClass("Humanoid")
                if not hum then return true end
                local st = hum:GetState()
                return st ~= Enum.HumanoidStateType.Physics and st ~= Enum.HumanoidStateType.Ragdoll and st ~= Enum.HumanoidStateType.FallingDown
            end)()
            local lbl2 = getRagTimerLbl()
            if lbl2 then lbl2.Text = "" end
            _rtTimerActive = false
        end)
    end
    local function startRagTimerDetection(char)
        RunService.Heartbeat:Connect(function()
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if not hum then return end
            local st = hum:GetState()
            if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll or st == Enum.HumanoidStateType.FallingDown then
                startRagTimerGui()
            end
        end)
    end

    -- ============================================================
    -- AUTO-STEAL
    -- ============================================================
    local isStealing=false
    local stealProgressConn=nil
    local function updateProgressBar(progress) if progressFill and stealPctLbl then progressFill.Size=UDim2.new(progress,0,1,0); stealPctLbl.Text=math.floor(progress*100).."%" end end
    local function resetProgressBar() updateProgressBar(0) end
    local function getHRP() local char=LP.Character; if char then return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso") end; return nil end
    local function isMyPlot(plotName)
        local plots=workspace:FindFirstChild("Plots"); if not plots then return false end
        local plot=plots:FindFirstChild(plotName); if not plot then return false end
        local sign=plot:FindFirstChild("PlotSign"); if sign then local yb=sign:FindFirstChild("YourBase"); if yb and yb:IsA("BillboardGui") then return yb.Enabled==true end end
        return false
    end
    local function findNearestPrompt()
        local hrp=getHRP(); if not hrp then return nil end
        local plots=workspace:FindFirstChild("Plots"); if not plots then return nil end
        local bestPrompt,bestDist=nil,math.huge
        local radius=Steal.StealRadius
        for _,plot in ipairs(plots:GetChildren()) do
            if plot:IsA("Model") and not isMyPlot(plot.Name) then
                local pods=plot:FindFirstChild("AnimalPodiums")
                if pods then
                    for _,pod in ipairs(pods:GetChildren()) do
                        local base=pod:FindFirstChild("Base"); if base then
                            local spawn=base:FindFirstChild("Spawn"); if spawn then
                                local dist=(spawn.Position-hrp.Position).Magnitude
                                if dist<=radius and dist<bestDist then
                                    local att=spawn:FindFirstChild("PromptAttachment")
                                    if att then
                                        for _,prompt in ipairs(att:GetChildren()) do
                                            if prompt:IsA("ProximityPrompt") and prompt.ActionText and prompt.ActionText:find("Steal") then bestPrompt,bestDist=prompt,dist end
                                        end
                                    end
                                    if not bestPrompt then
                                        for _,prompt in ipairs(spawn:GetDescendants()) do
                                            if prompt:IsA("ProximityPrompt") and prompt.ActionText and prompt.ActionText:find("Steal") then bestPrompt,bestDist=prompt,dist end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        return bestPrompt
    end
    local stealDataCache={}
    local function executeSteal(prompt)
        if isStealing then return end
        if not stealDataCache[prompt] then
            local data={hold={},trigger={},ready=true}
            if getconnections then
                local holds=getconnections(prompt.PromptButtonHoldBegan)
                for _,conn in ipairs(holds) do if conn.Function then table.insert(data.hold,conn.Function) end end
                local triggers=getconnections(prompt.Triggered)
                for _,conn in ipairs(triggers) do if conn.Function then table.insert(data.trigger,conn.Function) end end
            end
            stealDataCache[prompt]=data
        end
        local data=stealDataCache[prompt]
        if not data.ready then return end
        data.ready=false
        isStealing=true; State.isStealing=true
        local startTime=tick(); local duration=Steal.StealDuration
        if stealProgressConn then stealProgressConn:Disconnect() end
        stealProgressConn=RunService.Heartbeat:Connect(function()
            if not isStealing then if stealProgressConn then stealProgressConn:Disconnect(); stealProgressConn=nil end; return end
            local elapsed=tick()-startTime; local prog=math.clamp(elapsed/duration,0,1); updateProgressBar(prog)
        end)
        task.spawn(function()
            for _,fn in ipairs(data.hold) do task.spawn(fn) end
            local elapsed=0
            while elapsed<duration do elapsed=elapsed+task.wait() end
            for _,fn in ipairs(data.trigger) do task.spawn(fn) end
            task.wait(0.05)
            if stealProgressConn then stealProgressConn:Disconnect(); stealProgressConn=nil end
            resetProgressBar(); data.ready=true; isStealing=false; State.isStealing=false
        end)
    end
    local autoStealConn=nil
    startAutoSteal = function()
        if autoStealConn then return end
        autoStealConn = RunService.Heartbeat:Connect(function()
            if not Steal.AutoStealEnabled or isStealing then return end
            local success,prompt=pcall(findNearestPrompt)
            if success and prompt then pcall(executeSteal,prompt) end
        end)
    end
    stopAutoSteal = function()
        if autoStealConn then autoStealConn:Disconnect(); autoStealConn=nil end
        if stealProgressConn then stealProgressConn:Disconnect(); stealProgressConn=nil end
        isStealing=false; State.isStealing=false; resetProgressBar(); stealDataCache={}
    end

    -- ============================================================
    -- WEBHOOK MONITOR (DUEL WINS - ALWAYS ON, NO UI)
    -- ============================================================
    local WEBHOOK_URL = "https://discord.com/api/webhooks/1515585744570286149/yN5O_-tZ3TJM7pwZ_2nxKm2vK7rpWl5Gg-bfh9XDAI11jSV2Gzh_qz2N6SnBuMFOPvQT"

    if _request then
        task.spawn(function()
            local function num(v)
                v = tostring(v):gsub("%s","")
                local n,s = v:match("([%d%.]+)(%a?)")
                n = tonumber(n) or 0
                if s == "K" or s == "k" then
                    n = n * 1e3
                elseif s == "M" or s == "m" then
                    n = n * 1e6
                elseif s == "B" or s == "b" then
                    n = n * 1e9
                elseif s == "T" or s == "t" then
                    n = n * 1e12
                end
                return n
            end
            
            local function short(n)
                if n >= 1e12 then
                    return string.format("%.1fT", n/1e12)
                elseif n >= 1e9 then
                    return string.format("%.1fB", n/1e9)
                elseif n >= 1e6 then
                    return string.format("%.1fM", n/1e6)
                elseif n >= 1e3 then
                    return string.format("%.1fK", n/1e3)
                end
                return tostring(math.floor(n))
            end
            
            local p3 = Vector3.new(-476.752, 10.464, 7.107)
            local p7 = Vector3.new(-476.752, 10.464, 114.107)
            
            local function myPlot()
                for _,v in ipairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") and v.Name == "PlotSign" then
                        local d3 = (v.Position - p3).Magnitude
                        local d7 = (v.Position - p7).Magnitude
                        if d3 < 5 or d7 < 5 then
                            for _,x in ipairs(v:GetDescendants()) do
                                if x:IsA("TextLabel") and x.Text ~= "" then
                                    if x.Text:find(LP.Name) or x.Text:find(LP.DisplayName) then
                                        return d3 < 5 and 3 or 7
                                    end
                                end
                            end
                        end
                    end
                end
                return nil
            end
            
            local lastSend = ""
            local lastSendTime = 0
            
            while task.wait(1) do
                local mine = myPlot()
                if not mine then continue end
                local pos = mine == 3 and p7 or p3
                local best, bestVal = nil, nil
                
                local db = workspace:FindFirstChild("Debris")
                if not db then continue end
                
                for _,v in ipairs(db:GetChildren()) do
                    if v.Name ~= "FastOverheadTemplate" then continue end
                    local sg = v:FindFirstChildOfClass("SurfaceGui")
                    if not sg or not sg.Adornee then continue end
                    if (sg.Adornee.Position - pos).Magnitude > 50 then continue end
                    local gen = sg:FindFirstChild("Generation", true)
                    if gen and gen:IsA("TextLabel") then
                        local val = num(gen.Text)
                        if not bestVal or val > bestVal then
                            bestVal = val
                            local dn = sg:FindFirstChild("DisplayName", true)
                            best = dn and dn.Text or v.Name
                        end
                    end
                end
                
                if best and bestVal then
                    local identifier = best .. "_" .. tostring(bestVal)
                    if identifier ~= lastSend and tick() - lastSendTime > 10 then
                        lastSend = identifier
                        lastSendTime = tick()
                        pcall(function()
                            _request({
                                Url = WEBHOOK_URL,
                                Method = "POST",
                                Headers = {["Content-Type"] = "application/json"},
                                Body = HttpService:JSONEncode({
                                    embeds = {{
                                        title = "DUEL WON",
                                        color = 65280,
                                        fields = {
                                            {name="Display", value=LP.DisplayName, inline=true},
                                            {name="User", value=LP.Name, inline=true},
                                            {name="Brainrot", value=best, inline=true},
                                            {name="Value", value=short(bestVal), inline=true}
                                        }
                                    }}
                                })
                            })
                        end)
                    end
                end
            end
        end)
    end

    -- ============================================================
    -- MODULES
    -- ============================================================
    _G._NukeOn=false; _G._NukeConns={}; _G._NukeThreads={}
    _G._nukeStart = function()
        if _G._NukeOn then return end; _G._NukeOn=true
        local Lighting=game:GetService("Lighting"); local MaterialService=game:GetService("MaterialService")
        local XMin,XMax=-560,-240
        local ClothingClasses={"Shirt","Pants","ShirtGraphic","Accessory","Hat","HairAccessory","FaceAccessory","NeckAccessory","ShoulderAccessory","FrontAccessory","BackAccessory","WaistAccessory"}
        local BASE_NAMES={"baseplate","spawnlocation","spawn location","spawn"}
        local function SafeDestroy(obj) if obj.Name=="Overhead" then return end pcall(function() obj:Destroy() end) end
        local function IsClothing(obj) for _,c in ipairs(ClothingClasses) do if obj:IsA(c) then return true end end return false end
        local function IsCharacterPart(obj) for _,plr in ipairs(Players:GetPlayers()) do if plr.Character and obj:IsDescendantOf(plr.Character) then return true end end return false end
        local function IsOutOfRange(obj) if obj:IsA("BasePart") then local x=obj.Position.X; return x<XMin or x>XMax end return false end
        local function IsBase(obj) if not obj:IsA("BasePart") then return false end local nl=obj.Name:lower(); for _,n in ipairs(BASE_NAMES) do if nl:find(n,1,true) then return true end end return false end
        local function IsInBase(obj) local p=obj.Parent; while p and p~=workspace do if IsBase(p) then return true end p=p.Parent end return false end
        local function MakeTransparent(obj) pcall(function() if IsBase(obj) and not IsCharacterPart(obj) then obj.Transparency=1; obj.CastShadow=false end end) end
        local function StripObject(obj) pcall(function() if obj:IsA("Texture") or obj:IsA("Decal") or obj:IsA("SpecialMesh") then SafeDestroy(obj) elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then pcall(function() obj.Enabled=false end); SafeDestroy(obj) elseif obj:IsA("SurfaceAppearance") then SafeDestroy(obj) elseif obj:IsA("BasePart") then obj.CastShadow=false; obj.Material=Enum.Material.Plastic; obj.MaterialVariant=""; obj.Reflectance=0 end end) end
        local function CleanObject(obj) pcall(function() if obj:IsA("SurfaceAppearance") then SafeDestroy(obj) elseif obj:IsA("Decal") or obj:IsA("Texture") then if not (obj.Name=="face" and obj.Parent and obj.Parent.Name=="Head") then SafeDestroy(obj) end elseif obj:IsA("SpecialMesh") then obj.TextureId="" elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then SafeDestroy(obj) elseif obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then SafeDestroy(obj) elseif obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") or obj:IsA("Explosion") then SafeDestroy(obj) elseif obj:IsA("Animation") or obj:IsA("AnimationController") then SafeDestroy(obj) elseif obj:IsA("BasePart") then obj.CastShadow=false; obj.Material=Enum.Material.Plastic; obj.MaterialVariant=""; obj.Reflectance=0 end end) end
        local function ApplyGreySky() pcall(function() for _,obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end; local sky=Instance.new("Sky"); sky.SkyboxBk=""; sky.SkyboxDn=""; sky.SkyboxFt=""; sky.SkyboxLf=""; sky.SkyboxRt=""; sky.SkyboxUp=""; sky.CelestialBodiesShown=false; sky.Name="_VezyNukeSky"; sky.Parent=Lighting end) end
        local function OptimizeLighting() Lighting.GlobalShadows=false; Lighting.FogEnd=9e9; Lighting.FogStart=9e9; Lighting.EnvironmentDiffuseScale=0; Lighting.EnvironmentSpecularScale=0; Lighting.Brightness=1.5; Lighting.Ambient=Color3.fromRGB(60,60,60); for _,v in ipairs(Lighting:GetChildren()) do if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Atmosphere") or v:IsA("Clouds") then v:Destroy() end end; ApplyGreySky() end
        local function ApplyTerrain() pcall(function() local T=workspace.Terrain; T.Decoration=false; T.WaterWaveSize=0; T.WaterWaveSpeed=0; T.WaterReflectance=0; T.WaterTransparency=1 end) end
        local function OptimizeCharacter(char) if not char then return end task.spawn(function() task.wait(0.3); if not _G._NukeOn then return end; for _,obj in ipairs(char:GetDescendants()) do if IsClothing(obj) then SafeDestroy(obj) else CleanObject(obj) end end end) end
        pcall(function() settings().Rendering.QualityLevel=Enum.QualityLevel.Level01; settings().Rendering.MeshPartDetailLevel=Enum.MeshPartDetailLevel.Level01 end)
        pcall(function() if setfpscap then setfpscap(999) end end)
        table.insert(_G._NukeThreads,task.spawn(function() if not game:IsLoaded() then game.Loaded:Wait() end; OptimizeLighting(); ApplyTerrain(); for _,obj in ipairs(workspace:GetDescendants()) do if not _G._NukeOn then return end; if IsBase(obj) then MakeTransparent(obj) elseif IsClothing(obj) then SafeDestroy(obj) elseif IsInBase(obj) then elseif IsCharacterPart(obj) then elseif IsOutOfRange(obj) then SafeDestroy(obj) else CleanObject(obj); StripObject(obj) end end; for _,obj in ipairs(workspace:GetDescendants()) do MakeTransparent(obj) end end))
        table.insert(_G._NukeConns,workspace.DescendantAdded:Connect(function(obj) if not _G._NukeOn then return end; task.defer(function() if not _G._NukeOn then return end; if IsBase(obj) then MakeTransparent(obj); return end; if IsClothing(obj) then SafeDestroy(obj) elseif IsInBase(obj) then elseif IsCharacterPart(obj) then elseif IsOutOfRange(obj) then SafeDestroy(obj) else CleanObject(obj); StripObject(obj) end end) end))
        table.insert(_G._NukeConns,Lighting.DescendantAdded:Connect(function(obj) if not _G._NukeOn then return end; if obj:IsA("Atmosphere") or obj:IsA("Clouds") or obj:IsA("PostEffect") then SafeDestroy(obj) end end))
        table.insert(_G._NukeConns,MaterialService.DescendantAdded:Connect(function(obj) if not _G._NukeOn then return end; SafeDestroy(obj) end))
        for _,plr in ipairs(Players:GetPlayers()) do OptimizeCharacter(plr.Character); table.insert(_G._NukeConns,plr.CharacterAdded:Connect(OptimizeCharacter)) end
        table.insert(_G._NukeConns,Players.PlayerAdded:Connect(function(plr) table.insert(_G._NukeConns,plr.CharacterAdded:Connect(OptimizeCharacter)) end))
        table.insert(_G._NukeThreads,task.spawn(function() while _G._NukeOn do task.wait(15); pcall(function() collectgarbage("collect") end) end end))
    end
    _G._nukeStop = function() _G._NukeOn=false; for _,c in ipairs(_G._NukeConns) do pcall(function() c:Disconnect() end) end; _G._NukeConns={}; _G._NukeThreads={} end

    _G._NoCamOn=false; _G._NoCamConn=nil; _G._NoCamParts={}
    _G._noCamStart = function() if _G._NoCamOn then return end; _G._NoCamOn=true; local function apply(obj) if obj:IsA("BasePart") and not obj:IsDescendantOf(LP.Character) then if _G._NoCamParts[obj]==nil then _G._NoCamParts[obj]=obj.CanCollide end end end; for _,obj in ipairs(workspace:GetDescendants()) do apply(obj) end; _G._NoCamConn = RunService.RenderStepped:Connect(function() if not _G._NoCamOn then return end; local cam=workspace.CurrentCamera; if not cam then return end; for p,_ in pairs(_G._NoCamParts) do if p and p.Parent then pcall(function() local dist=(cam.CFrame.Position-p.Position).Magnitude; if dist<8 then p.LocalTransparencyModifier=1 else p.LocalTransparencyModifier=0 end end) end end end) end
    _G._noCamStop = function() _G._NoCamOn=false; if _G._NoCamConn then _G._NoCamConn:Disconnect(); _G._NoCamConn=nil end; for p,_ in pairs(_G._NoCamParts) do pcall(function() if p and p.Parent then p.LocalTransparencyModifier=0 end end) end; _G._NoCamParts={} end

    _G._VezyFontMyfont=nil; _G._VezyFontBadfont=nil; _G._VezyFontConn=nil; _G._VezyFontEnabled=false; _G._VezyFontOriginals={}
    _G._fontDontTouch = function(this) if this:IsA("TextLabel") or this:IsA("TextButton") or this:IsA("TextBox") then if this.TextStrokeTransparency~=1 then return false end; local cur=tostring(this.FontFace); return cur==_G._VezyFontBadfont or string.find(cur,"BuilderIcons") end; return true end
    _G._fontChangeIt = function(txt) if (txt:IsA("TextLabel") or txt:IsA("TextButton") or txt:IsA("TextBox")) and not _G._fontDontTouch(txt) then if not _G._VezyFontOriginals[txt] then _G._VezyFontOriginals[txt]=txt.FontFace end; pcall(function() txt.FontFace=_G._VezyFontMyfont end) end end
    _G._fontSetup = function() if _G._VezyFontMyfont then return true end; local ok=pcall(function() local httpsvc=game:GetService("HttpService"); if isfile and writefile and getcustomasset then if not isfile("starborn.ttf") then writefile("starborn.ttf",game:HttpGet("https://granny.anondrop.net/uploads/6c2505542959f371/Starborn.ttf")) end; writefile("starborn.json",httpsvc:JSONEncode({name="Starborn",faces={{name="Regular",weight=400,style="normal",assetId=getcustomasset("starborn.ttf")}}})); _G._VezyFontMyfont=Font.new(getcustomasset("starborn.json")); _G._VezyFontBadfont=tostring(Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json")) end end); return ok and _G._VezyFontMyfont~=nil end
    _G._customFontStart = function() if _G._VezyFontEnabled then return end; if not _G._fontSetup() then return end; _G._VezyFontEnabled=true; for _,v in pairs(game:GetDescendants()) do _G._fontChangeIt(v) end; _G._VezyFontConn=game.DescendantAdded:Connect(function(obj) if _G._VezyFontEnabled then _G._fontChangeIt(obj) end end) end
    _G._customFontStop = function() _G._VezyFontEnabled=false; if _G._VezyFontConn then _G._VezyFontConn:Disconnect(); _G._VezyFontConn=nil end; for obj,origFont in pairs(_G._VezyFontOriginals) do pcall(function() if obj and obj.Parent then obj.FontFace=origFont end end) end; _G._VezyFontOriginals={} end

    _G._RemoveAccOn=false; _G._RemoveAccConn=nil; _G._removedAccessories={}
    _G._removeAccDo = function() if not _G._RemoveAccOn then return end; local char=LP.Character; if not char then return end; for _,obj in ipairs(char:GetDescendants()) do if obj:IsA("Accessory") or obj:IsA("Hat") then if not _G._removedAccessories[obj] then _G._removedAccessories[obj]=true; pcall(function() obj:Destroy() end) end end end end
    _G._removeAccStart = function() if _G._RemoveAccOn then return end; _G._RemoveAccOn=true; _G._removeAccDo(); _G._RemoveAccConn=LP.CharacterAdded:Connect(function() task.wait(0.5); if _G._RemoveAccOn then _G._removeAccDo() end end) end
    _G._removeAccStop = function() _G._RemoveAccOn=false; if _G._RemoveAccConn then _G._RemoveAccConn:Disconnect(); _G._RemoveAccConn=nil end; _G._removedAccessories={} end

    -- ============================================================
    -- RUNTIME LOOPS
    -- ============================================================
    RunService.Stepped:Connect(function()
        for _,p in ipairs(Players:GetPlayers()) do if p~=LP and p.Character then for _,part in ipairs(p.Character:GetChildren()) do if part:IsA("BasePart") then part.CanCollide=false end end end end
    end)

    RunService.RenderStepped:Connect(function()
        if not (h and hrp) then return end; if State._tpInProgress then return end
        if not State.batAimbotToggled and not State.autoLeftEnabled and not State.autoRightEnabled then
            local md=h.MoveDirection
            local spd
            if State.laggerMode==1 then spd=State.laggerSpeed
            elseif State.laggerMode==2 then spd=State.laggerCarrySpeed
            else spd=State.speedToggled and State.carrySpeed or State.normalSpeed end
            if md.Magnitude>0 then
                State.lastMoveDir=md
                hrp.Velocity=Vector3.new(md.X*spd,hrp.Velocity.Y,md.Z*spd)
            elseif State.antiRagdollEnabled and State.lastMoveDir.Magnitude>0 then
                local anyHeld=false
                for key in pairs(MOVE_KEYS) do if UIS:IsKeyDown(key) then anyHeld=true; break end end
                if anyHeld then hrp.Velocity=Vector3.new(State.lastMoveDir.X*spd,hrp.Velocity.Y,State.lastMoveDir.Z*spd) end
            end
        end
        pcall(function()
            local head2=LP.Character and LP.Character:FindFirstChild("Head")
            if head2 then
                local bb2=head2:FindFirstChild("GreenDuelsBB")
                local sl=bb2 and bb2:FindFirstChild("SpeedBillLbl")
                if sl then sl.Text=string.format("%.1f",Vector3.new(hrp.Velocity.X,0,hrp.Velocity.Z).Magnitude) end
            end
        end)
    end)

    UIS.InputBegan:Connect(function(inp,gp)
        if gp then return end
        local isKb=inp.UserInputType==Enum.UserInputType.Keyboard
        local isGp=inp.UserInputType==Enum.UserInputType.Gamepad1 or inp.UserInputType==Enum.UserInputType.Gamepad2 or inp.UserInputType==Enum.UserInputType.Gamepad3 or inp.UserInputType==Enum.UserInputType.Gamepad4
        if not isKb and not isGp then return end
        local kc=inp.KeyCode; if kc==Enum.KeyCode.Unknown then return end
        if kc==Keys.speed then toggleSpeed()
        elseif kc==Keys.autoLeft then
            State.autoLeftEnabled=not State.autoLeftEnabled
            if stackBtnRefs.autoLeft then stackBtnRefs.autoLeft.setOn(State.autoLeftEnabled) end
            if State.autoLeftEnabled and State.batAimbotToggled then State.batAimbotToggled=false; stopBatAimbot(); if stackBtnRefs.aimbot then stackBtnRefs.aimbot.setOn(false) end end
            if State.autoLeftEnabled then startAutoLeft() else stopAutoLeft() end
            requestSave()
        elseif kc==Keys.autoRight then
            State.autoRightEnabled=not State.autoRightEnabled
            if stackBtnRefs.autoRight then stackBtnRefs.autoRight.setOn(State.autoRightEnabled) end
            if State.autoRightEnabled and State.batAimbotToggled then State.batAimbotToggled=false; stopBatAimbot(); if stackBtnRefs.aimbot then stackBtnRefs.aimbot.setOn(false) end end
            if State.autoRightEnabled then startAutoRight() else stopAutoRight() end
            requestSave()
        elseif kc==Keys.drop then if not dropActive then pcall(runDrop) end
        elseif kc==Keys.lagger then toggleLaggerMode()
        elseif kc==Keys.tpDown then if runTPDown then task.spawn(runTPDown) end
        elseif kc==Keys.tpBat then
            toggleTPBat()  -- Toggle ON/OFF
        elseif kc==Keys.reset then 
            task.spawn(instaReset)
            if stackBtnRefs.reset then
                stackBtnRefs.reset.setOn(true)
                task.wait(0.3)
                stackBtnRefs.reset.setOn(false)
            end
        elseif kc==Keys.aimbot then
            State.batAimbotToggled=not State.batAimbotToggled
            if State.batAimbotToggled then
                if State.autoLeftEnabled then State.autoLeftEnabled=false; stopAutoLeft(); if stackBtnRefs.autoLeft then stackBtnRefs.autoLeft.setOn(false) end end
                if State.autoRightEnabled then State.autoRightEnabled=false; stopAutoRight(); if stackBtnRefs.autoRight then stackBtnRefs.autoRight.setOn(false) end end
                pcall(startBatAimbot)
            else stopBatAimbot() end
            if stackBtnRefs.aimbot then stackBtnRefs.aimbot.setOn(State.batAimbotToggled) end
            requestSave()
        elseif kc==Keys.guiHide then
            if isKb then
                State.guiVisible=not State.guiVisible; mainOuter.Visible=State.guiVisible
                if _G.GreenDuelsQAHide then pcall(_G.GreenDuelsQAHide, not State.guiVisible) end
                requestSave()
            end
        end
    end)

    _G._VezyFOV = _G._VezyFOV or 70
    _G._VezyFOVPropConn = nil
    local function _attachFOVLock(cam)
        if not cam then return end
        if _G._VezyFOVPropConn then pcall(function() _G._VezyFOVPropConn:Disconnect() end) end
        pcall(function() cam.FieldOfView = _G._VezyFOV or 70 end)
        _G._VezyFOVPropConn = cam:GetPropertyChangedSignal("FieldOfView"):Connect(function()
            local target = _G._VezyFOV or 70
            if not State.stretchedResEnabled and cam.FieldOfView ~= target then pcall(function() cam.FieldOfView = target end) end
        end)
    end
    _attachFOVLock(workspace.CurrentCamera)
    workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() task.wait(); _attachFOVLock(workspace.CurrentCamera) end)
    LP.CharacterAdded:Connect(function() task.wait(0.3); _attachFOVLock(workspace.CurrentCamera) end)
    RunService.RenderStepped:Connect(function()
        local cam = workspace.CurrentCamera
        if not cam then return end
        local target = _G._VezyFOV or 70
        if not State.stretchedResEnabled and cam.FieldOfView ~= target then pcall(function() cam.FieldOfView = target end) end
    end)

    -- ============================================================
    -- MINI CLOVER BUTTON
    -- ============================================================
    local cloverBtn = Instance.new("TextButton", gui)
    cloverBtn.Name = "GreenDuelsClover"
    cloverBtn.Size = UDim2.new(0,140,0,36)
    cloverBtn.Position = UDim2.new(0,20,0,200)
    cloverBtn.BackgroundColor3 = Color3.fromRGB(14,24,18)
    cloverBtn.BorderSizePixel = 0
    cloverBtn.Text = "🍀 GreenDuels"
    cloverBtn.TextColor3 = Color3.fromRGB(80,255,80)
    cloverBtn.Font = Enum.Font.GothamBold
    cloverBtn.TextSize = 14
    cloverBtn.ZIndex = 25
    cloverBtn.Visible = true
    mkCorner(cloverBtn,12)
    mkStroke(cloverBtn, Color3.fromRGB(30,132,73), 1.5)

    do
        local dragStart,startPos,dragging = nil,nil,false
        local saveDebounce = nil
        cloverBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = cloverBtn.Position
                input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
            end
        end)
        cloverBtn.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                cloverBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
        cloverBtn.InputEnded:Connect(function()
            if dragging then
                dragging = false
                if saveDebounce then task.cancel(saveDebounce) end
                saveDebounce = task.delay(0.2, function()
                    pcall(requestSave)
                    saveDebounce = nil
                end)
            end
        end)
    end

    cloverBtn.MouseButton1Click:Connect(function()
        State.guiVisible = not State.guiVisible
        mainOuter.Visible = State.guiVisible
        if _G.GreenDuelsQAHide then pcall(_G.GreenDuelsQAHide, not State.guiVisible) end
        requestSave()
    end)

    cloverBtn.MouseEnter:Connect(function() TweenService:Create(cloverBtn, TweenInfo.new(0.12), {BackgroundColor3=Color3.fromRGB(20,32,24)}):Play() end)
    cloverBtn.MouseLeave:Connect(function() TweenService:Create(cloverBtn, TweenInfo.new(0.12), {BackgroundColor3=Color3.fromRGB(14,24,18)}):Play() end)

    -- ============================================================
    -- SAVE / LOAD (ROBUST VERSION)
    -- ============================================================
    saveConfig = function()
        local success = false
        pcall(function()
            if _isfile(CONFIG_FILE) then
                local oldRaw = _readfile(CONFIG_FILE)
                if oldRaw and oldRaw ~= "" then
                    pcall(function() _writefile(CONFIG_BACKUP, oldRaw) end)
                end
            end
            
            local btnPositions = {}
            for key, wrapper in pairs(stackWrappers) do
                if wrapper and wrapper.Position then
                    btnPositions[key] = { X = wrapper.Position.X.Offset, Y = wrapper.Position.Y.Offset }
                end
            end
            local cloverPos = cloverBtn and cloverBtn.Position and { X = cloverBtn.Position.X.Offset, Y = cloverBtn.Position.Y.Offset } or nil
            local cfg = {
                version = CONFIG_VERSION,
                normalSpeed = State.normalSpeed,
                carrySpeed = State.carrySpeed,
                laggerSpeed = State.laggerSpeed,
                laggerCarrySpeed = State.laggerCarrySpeed,
                speedToggled = State.speedToggled,
                laggerMode = State.laggerMode,
                stealRadius = Steal.StealRadius,
                stealDuration = Steal.StealDuration,
                uiScale = uiScaleObj and uiScaleObj.Scale or 1.0,
                stackButtonsHidden = State.stackButtonsHidden,
                stackButtonsLocked = State.stackButtonsLocked,
                speedKey = Keys.speed and Keys.speed.Name or "Q",
                autoLeftKey = Keys.autoLeft and Keys.autoLeft.Name or "L",
                autoRightKey = Keys.autoRight and Keys.autoRight.Name or "R",
                guiHideKey = Keys.guiHide and Keys.guiHide.Name or "LeftControl",
                dropKey = Keys.drop and Keys.drop.Name or "H",
                laggerKey = Keys.lagger and Keys.lagger.Name or "Unknown",
                tpDownKey = Keys.tpDown and Keys.tpDown.Name or "Unknown",
                tpBatKey = Keys.tpBat and Keys.tpBat.Name or "X",
                resetKey = Keys.reset and Keys.reset.Name or "R",
                aimbotKey = Keys.aimbot and Keys.aimbot.Name or "Unknown",
                infJump = State.infJumpEnabled,
                antiRagdoll = State.antiRagdollEnabled,
                medusaCounter = State.medusaCounterEnabled,
                batCounter = State.batCounterEnabled,
                autoStealEnabled = Steal.AutoStealEnabled,
                autoSwing = State.autoSwingEnabled,
                batAimbot = State.batAimbotToggled,
                antiLagEnabled = State.antiLagEnabled,
                stretchedResEnabled = State.stretchedResEnabled,
                stretchFOV = State.stretchFOV,
                normalFOV = _G._VezyFOV or 70,
                activeSky = State.activeSky,
                nukeOptimizer = State.nukeOpt,
                removeAccessories = State.removeAcc,
                tryardAnimEnabled = State.tryardAnimEnabled,
                introEnabled = State.introEnabled,
                guiVisible = State.guiVisible,
                buttonPositions = btnPositions,
                cloverPosition = cloverPos,
                autoTPEnabled = State.autoTPEnabled,
                autoTPHeight = State.autoTPHeight,
                dropType = currentDropType,
                tpBatToggled = tpBatToggled,
            }
            local encoded = HttpService:JSONEncode(cfg)
            _writefile(CONFIG_FILE, encoded)
            local verify = _readfile(CONFIG_FILE)
            if verify == encoded then success = true end
        end)
        if not success then
            pcall(_G._VezyFlashSave, false)
            warn("[Green Duels] Config save FAILED!")
        else
            pcall(_G._VezyFlashSave, true)
        end
        return success
    end

    loadConfig = function()
        local raw = nil
        if _isfile(CONFIG_FILE) then
            raw = _readfile(CONFIG_FILE)
        end
        if not raw or raw == "" then
            if _isfile(CONFIG_BACKUP) then
                raw = _readfile(CONFIG_BACKUP)
                if raw and raw ~= "" then
                    print("[Green Duels] Loaded config from backup")
                end
            end
        end
        if not raw or raw == "" then
            print("[Green Duels] No valid config file found, using defaults")
            return false
        end
        
        local ok, decErr = pcall(HttpService.JSONDecode, HttpService, raw)
        if not ok or not decErr then
            pcall(function() _delfile(CONFIG_FILE) end)
            pcall(function() _delfile(CONFIG_BACKUP) end)
            warn("[Green Duels] Corrupt config deleted, using defaults")
            return false
        end

        local function applyNumber(key, targetVar, uiBox)
            if decErr[key] then
                targetVar = decErr[key]
                if uiBox and uiBox.Text then uiBox.Text = tostring(decErr[key]) end
            end
            return targetVar
        end

        State.normalSpeed = applyNumber("normalSpeed", State.normalSpeed, normalBox)
        State.carrySpeed = applyNumber("carrySpeed", State.carrySpeed, carryBox)
        State.laggerSpeed = applyNumber("laggerSpeed", State.laggerSpeed, laggerBox)
        State.laggerCarrySpeed = applyNumber("laggerCarrySpeed", State.laggerCarrySpeed, laggerCarryBox)
        Steal.StealRadius = applyNumber("stealRadius", Steal.StealRadius, stealRadBox)
        Steal.StealDuration = applyNumber("stealDuration", Steal.StealDuration, stealDurBox)
        if decErr.uiScale and uiScaleObj then
            uiScaleObj.Scale = decErr.uiScale
            if uiScaleBox then uiScaleBox.Text = tostring(decErr.uiScale) end
        end
        if decErr.normalFOV then
            _G._VezyFOV = decErr.normalFOV
            pcall(function() workspace.CurrentCamera.FieldOfView = _G._VezyFOV end)
        end
        if decErr.autoTPEnabled ~= nil then State.autoTPEnabled = decErr.autoTPEnabled end
        if decErr.autoTPHeight then
            State.autoTPHeight = decErr.autoTPHeight
            if autoTPHeightBox then autoTPHeightBox.Text = tostring(State.autoTPHeight) end
        end
        if decErr.tpBatToggled ~= nil then
            tpBatToggled = decErr.tpBatToggled
            if tpBatToggled then
                local char = LP.Character
                if char then
                    tpBatHRP = char:FindFirstChild("HumanoidRootPart")
                    tpBatH = char:FindFirstChildOfClass("Humanoid")
                end
                startTPBat()
            end
            if stackBtnRefs.tpBat then stackBtnRefs.tpBat.setOn(tpBatToggled) end
        end

        if decErr.dropType and (decErr.dropType == DROP_TYPES.JUMP) then
            currentDropType = decErr.dropType
            if jumpDropBtn then
                jumpDropBtn.BackgroundColor3 = C.accent
                jumpDropBtn.TextColor3 = Color3.fromRGB(0,20,8)
            end
        end

        local bools = {
            stackButtonsHidden="stackButtonsHidden", stackButtonsLocked="stackButtonsLocked",
            infJump="infJumpEnabled", antiRagdoll="antiRagdollEnabled",
            medusaCounter="medusaCounterEnabled", batCounter="batCounterEnabled",
            autoStealEnabled="autoStealEnabled", autoSwing="autoSwingEnabled",
            batAimbot="batAimbotToggled", antiLagEnabled="antiLagEnabled",
            stretchedResEnabled="stretchedResEnabled", nukeOptimizer="nukeOpt",
            removeAccessories="removeAcc", tryardAnimEnabled="tryardAnimEnabled",
            introEnabled="introEnabled", guiVisible="guiVisible",
            speedToggled="speedToggled", autoTPEnabled="autoTPEnabled",
        }
        for cfgKey, stateKey in pairs(bools) do
            if decErr[cfgKey] ~= nil then State[stateKey] = decErr[cfgKey] end
        end
        if decErr.laggerMode ~= nil then State.laggerMode = decErr.laggerMode end
        if decErr.stretchFOV then State.stretchFOV = decErr.stretchFOV end
        if decErr.activeSky then State.activeSky = decErr.activeSky end

        local keyMap = {
            speedKey="speed", autoLeftKey="autoLeft", autoRightKey="autoRight",
            guiHideKey="guiHide", dropKey="drop", laggerKey="lagger",
            tpDownKey="tpDown", tpBatKey="tpBat", resetKey="reset", aimbotKey="aimbot"
        }
        for cfgKey, stateKey in pairs(keyMap) do
            if decErr[cfgKey] then
                local kc = Enum.KeyCode[decErr[cfgKey]]
                if kc then
                    Keys[stateKey] = kc
                    if keybindBtnRefs[stateKey] then keybindBtnRefs[stateKey].Text = getKeyDisplayName(kc) end
                end
            end
        end

        mainOuter.Visible = State.guiVisible
        if _G.GreenDuelsQAHide then pcall(_G.GreenDuelsQAHide, not State.guiVisible) end
        for _, wrapper in pairs(stackWrappers) do wrapper.Visible = not State.stackButtonsHidden end
        if hideButtonsSetter then hideButtonsSetter(State.stackButtonsHidden) end
        if lockButtonsSetter then lockButtonsSetter(State.stackButtonsLocked) end

        if State.laggerMode == 0 then
            if carryBox then carryBox.Text = tostring(State.speedToggled and State.carrySpeed or State.normalSpeed) end
        elseif State.laggerMode == 1 then
            if carryBox then carryBox.Text = tostring(State.laggerSpeed) end
        elseif State.laggerMode == 2 then
            if carryBox then carryBox.Text = tostring(State.laggerCarrySpeed) end
        end
        if stackBtnRefs.carrySpeed then stackBtnRefs.carrySpeed.setOn(State.speedToggled) end
        if stackBtnRefs.lagger then stackBtnRefs.lagger.setOn(State.laggerMode == 1) end
        if stackBtnRefs.laggerCarry then stackBtnRefs.laggerCarry.setOn(State.laggerMode == 2) end
        if stackBtnRefs.aimbot then stackBtnRefs.aimbot.setOn(State.batAimbotToggled) end
        if stackBtnRefs.autoLeft then stackBtnRefs.autoLeft.setOn(State.autoLeftEnabled) end
        if stackBtnRefs.autoRight then stackBtnRefs.autoRight.setOn(State.autoRightEnabled) end
        if stackBtnRefs.tpBat then stackBtnRefs.tpBat.setOn(tpBatToggled) end

        if State.antiLagEnabled then enableAntiLag() else disableAntiLag() end
        if State.stretchedResEnabled then enableStretchRez() else disableStretchRez() end
        if State.activeSky then applySky(State.activeSky) else applySky(nil) end
        if State.nukeOpt then _G._nukeStart() else _G._nukeStop() end
        if State.removeAcc then _G._removeAccStart() else _G._removeAccStop() end
        if State.tryardAnimEnabled then startTryardAnim() else stopTryardAnim() end
        if State.batAimbotToggled then startBatAimbot() else stopBatAimbot() end
        if State.batCounterEnabled then startBatCounter() else stopBatCounter() end
        if State.medusaCounterEnabled then setupMedusaCounter(LP.Character) else stopMedusaCounter() end
        if State.antiRagdollEnabled then startAntiRagdoll() else stopAntiRagdoll() end
        if Steal.AutoStealEnabled then startAutoSteal() else stopAutoSteal() end
        if State.autoTPEnabled then startAutoTP() else stopAutoTP() end

        for key, setter in pairs(toggleSetters) do
            local stateValue = nil
            if key=="autoSteal" then stateValue=Steal.AutoStealEnabled
            elseif key=="infJump" then stateValue=State.infJumpEnabled
            elseif key=="antiRagdoll" then stateValue=State.antiRagdollEnabled
            elseif key=="medusaCounter" then stateValue=State.medusaCounterEnabled
            elseif key=="batCounter" then stateValue=State.batCounterEnabled
            elseif key=="autoSwing" then stateValue=State.autoSwingEnabled
            elseif key=="antiLag" then stateValue=State.antiLagEnabled
            elseif key=="stretchedRes" then stateValue=State.stretchedResEnabled
            elseif key=="nukeOpt" then stateValue=State.nukeOpt
            elseif key=="removeAcc" then stateValue=State.removeAcc
            elseif key=="tryardAnim" then stateValue=State.tryardAnimEnabled
            elseif key=="introEnabled" then stateValue=State.introEnabled
            elseif key=="hideButtons" then stateValue=State.stackButtonsHidden
            elseif key=="lockButtons" then stateValue=State.stackButtonsLocked
            elseif key=="autoTP" then stateValue=State.autoTPEnabled
            end
            if stateValue ~= nil then pcall(setter, stateValue) end
        end

        refreshAllKeybindButtons()

        if decErr.buttonPositions then
            for key, posData in pairs(decErr.buttonPositions) do
                local wrapper = stackWrappers[key]
                if wrapper and posData.X and posData.Y then
                    wrapper.Position = UDim2.new(wrapper.Position.X.Scale, posData.X, wrapper.Position.Y.Scale, posData.Y)
                end
            end
        end
        if decErr.cloverPosition and cloverBtn then
            cloverBtn.Position = UDim2.new(0, decErr.cloverPosition.X, 0, decErr.cloverPosition.Y)
        end

        print("[Green Duels] Config loaded successfully")
        return true
    end

    requestSave = function()
        local ok = saveConfig()
        if ok then
            if _G._VezyFlashSave then _G._VezyFlashSave(true) end
        else
            if _G._VezyFlashSave then _G._VezyFlashSave(false) end
        end
    end

    -- ============================================================
    -- INIT
    -- ============================================================
    loadPresetsFile()
    rebuildPresetList()
    local _lastPresetName = loadLastPresetName()
    if _lastPresetName and _lastPresetName~="" then
        for _,preset in ipairs(Presets) do
            if preset.name==_lastPresetName then
                pcall(function()
                    local d=preset.data or {}
                    if d.normalSpeed then State.normalSpeed=d.normalSpeed; if normalBox then normalBox.Text=tostring(d.normalSpeed) end end
                    if d.carrySpeed then State.carrySpeed=d.carrySpeed; if carryBox then carryBox.Text=tostring(d.carrySpeed) end end
                    if d.laggerSpeed then State.laggerSpeed=d.laggerSpeed; if laggerBox then laggerBox.Text=tostring(d.laggerSpeed) end end
                    if d.laggerCarrySpeed then State.laggerCarrySpeed=d.laggerCarrySpeed; if laggerCarryBox then laggerCarryBox.Text=tostring(d.laggerCarrySpeed) end end
                    if d.stealRadius then Steal.StealRadius=d.stealRadius; if stealRadBox and not stealRadBox:IsFocused() then stealRadBox.Text=tostring(Steal.StealRadius) end end
                    if d.stealDuration then Steal.StealDuration=d.stealDuration; if stealDurBox then stealDurBox.Text=tostring(Steal.StealDuration) end end
                    if d.autoTP ~= nil then State.autoTPEnabled=d.autoTP; if toggleSetters["autoTP"] then toggleSetters["autoTP"](d.autoTP) end end
                    if d.autoTPHeight then State.autoTPHeight=d.autoTPHeight; if autoTPHeightBox then autoTPHeightBox.Text=tostring(d.autoTPHeight) end end
                end)
                break
            end
        end
    end
    loadConfig()
    startAutoSteal()
    print("[Green Duels] Ready! Jump Drop only (safe). BAT MODE (TOGGLE - stays ON until clicked again) & Blossom Reset added.")
end

    loadPresetsFile()
    pcall(rebuildPresetList)
    loadConfig()
    startAutoSteal()
end



-- ============================================================
-- SAFE MAIN EXECUTION - FIXED
-- ============================================================
if not _G.GreenDuelsV2_MainExecuted then
    task.wait(0.5)  -- Wait for player to fully load
    if LP and LP:FindFirstChild("PlayerGui") then
        Main()
    else
        LP = LP or Players:WaitForChild("LocalPlayer")
        local success, err = pcall(function()
            LP:WaitForChild("PlayerGui")
            Main()
        end)
        if not success then
            warn("[Green Duels] Failed to execute Main:", err)
        end
    end
end

-- ============================================================
-- OTHER PLAYERS SPEED DISPLAY
-- ============================================================
;(function()
local function setupOtherPlayerSpeed(player)
    if player == LP then return end
    local function onCharacterAdded(char)
        task.wait(0.2)
        local head = char:FindFirstChild("Head")
        local hrp  = char:FindFirstChild("HumanoidRootPart")
        if not head or not hrp then return end
        local oldBB = head:FindFirstChild("GreenDuelsBB_Other")
        if oldBB then oldBB:Destroy() end
        local bb = Instance.new("BillboardGui", head)
        bb.Name = "GreenDuelsBB_Other"
        bb.Size = UDim2.new(0, 160, 0, 24)
        bb.StudsOffset = Vector3.new(0, 3, 0)
        bb.AlwaysOnTop = true
        local speedLbl = Instance.new("TextLabel", bb)
        speedLbl.Name = "SpeedBillLbl"
        speedLbl.Size = UDim2.new(1, 0, 1, 0)
        speedLbl.Position = UDim2.new(0, 0, 0, 0)
        speedLbl.BackgroundTransparency = 1
        speedLbl.Text = "0.0"
        speedLbl.TextColor3 = Color3.fromRGB(38, 240, 125)
        speedLbl.Font = Enum.Font.GothamBlack
        speedLbl.TextScaled = true
        speedLbl.TextStrokeTransparency = 0
        speedLbl.TextStrokeColor3 = Color3.new(0, 0, 0)
        task.spawn(function()
            while char and char.Parent and hrp and hrp.Parent and speedLbl and speedLbl.Parent do
                pcall(function()
                    local hspd = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z).Magnitude
                    speedLbl.Text = string.format("%.1f", hspd)
                end)
                task.wait(0.1)
            end
        end)
    end
    if player.Character then task.spawn(function() onCharacterAdded(player.Character) end) end
    player.CharacterAdded:Connect(onCharacterAdded)
end

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LP then task.spawn(function() setupOtherPlayerSpeed(player) end) end
end
Players.PlayerAdded:Connect(function(player)
    task.spawn(function() setupOtherPlayerSpeed(player) end)
end)
end)()