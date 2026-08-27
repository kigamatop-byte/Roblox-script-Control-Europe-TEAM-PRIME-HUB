```lua
--==============================================================
-- TEAM PRIME HUB
-- V26 FINAL FIX + MOBILE RESPONSIVE
-- ONE LOCAL SCRIPT
-- ROBLOX STUDIO TEST BUILD
--==============================================================

--==============================================================
-- SERVICES
--==============================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer

if not LocalPlayer then
	return
end

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera
local IsStudio = RunService:IsStudio()

--==============================================================
-- DEVICE DETECTION
--==============================================================

local function IsPhone()
	if not UserInputService.TouchEnabled then
		return false
	end

	if UserInputService.KeyboardEnabled then
		return false
	end

	local currentCamera = workspace.CurrentCamera

	if currentCamera then
		local viewport = currentCamera.ViewportSize

		-- Телефон / маленький мобильный экран
		if viewport.X <= 700 then
			return true
		end
	end

	return true
end

local MobileDevice = IsPhone()

--==============================================================
-- CONFIG
--==============================================================

local Config = {
	Language = nil,

	Theme = "Prime",

	Width = 900,
	Height = 560,

	MinWidth = 720,
	MaxWidth = 1250,

	MinHeight = 430,
	MaxHeight = 820,

	Scale = 1,
	Corner = 12,

	SidebarWidth = 195,

	AnimationSpeed = 0.18,
	Transparency = 0,

	Hover = true,
	Notifications = true,

	HubKey = Enum.KeyCode.RightShift,
	FlyKey = Enum.KeyCode.F,

	FlySpeed = 55,

	MusicVolume = 0.70,
	MusicLooped = true,

	CubesEnabled = false,
	CubesAmount = 25,
	CubesSize = 1.4,
	CubesSpeed = 2,
	CubesSpread = 70,
	CubesRotation = 1,
	CubesTransparency = 0.25,

	ColorSaturation = 0,
	ColorContrast = 0,
	ColorBrightness = 0,

	--==========================================================
	-- MOBILE DEFAULTS
	--==========================================================

	MobileWidth = 380,
	MobileHeight = 520,

	MobileMinWidth = 320,
	MobileMaxWidth = 520,

	MobileMinHeight = 430,
	MobileMaxHeight = 720,

	MobileSidebarWidth = 105,
	MobileScale = 0.88,
}

--==============================================================
-- THEMES
--==============================================================

local Themes = {
	Prime = {
		Background = Color3.fromRGB(7, 11, 18),
		Sidebar = Color3.fromRGB(10, 16, 25),
		Panel = Color3.fromRGB(13, 20, 32),
		Card = Color3.fromRGB(18, 28, 43),

		Accent = Color3.fromRGB(0, 170, 255),
		Accent2 = Color3.fromRGB(0, 225, 210),

		Text = Color3.fromRGB(240, 245, 255),
		Muted = Color3.fromRGB(135, 150, 175),

		Success = Color3.fromRGB(35, 225, 145),
		Danger = Color3.fromRGB(255, 75, 90),
	},

	Glass = {
		Background = Color3.fromRGB(8, 11, 17),
		Sidebar = Color3.fromRGB(13, 19, 29),
		Panel = Color3.fromRGB(18, 25, 38),
		Card = Color3.fromRGB(25, 35, 51),

		Accent = Color3.fromRGB(70, 180, 255),
		Accent2 = Color3.fromRGB(110, 240, 230),

		Text = Color3.fromRGB(245, 248, 255),
		Muted = Color3.fromRGB(150, 165, 185),

		Success = Color3.fromRGB(50, 230, 155),
		Danger = Color3.fromRGB(255, 85, 105),
	},

	Minimal = {
		Background = Color3.fromRGB(10, 10, 12),
		Sidebar = Color3.fromRGB(15, 15, 18),
		Panel = Color3.fromRGB(19, 19, 23),
		Card = Color3.fromRGB(25, 25, 29),

		Accent = Color3.fromRGB(210, 220, 235),
		Accent2 = Color3.fromRGB(235, 240, 250),

		Text = Color3.fromRGB(245, 245, 245),
		Muted = Color3.fromRGB(150, 150, 155),

		Success = Color3.fromRGB(80, 220, 150),
		Danger = Color3.fromRGB(240, 80, 90),
	},
}

local function GetTheme()
	return Themes[Config.Theme] or Themes.Prime
end

--==============================================================
-- LANGUAGE
--==============================================================

local Lang = {
	ru = {
		title = "TEAM PRIME HUB",
		subtitle = "CONTROL EUROPE",

		home = "ГЛАВНАЯ",
		regions = "РЕГИОНЫ",
		countries = "СТРАНЫ",
		players = "ИГРОКИ",

		visual = "VISUAL",
		esp = "ESP",
		world = "МИР",
		color = "ЦВЕТ",
		effects = "ЭФФЕКТЫ",
		cubes = "ЛЕТАЮЩИЕ КУБЫ",

		movement = "ДВИЖЕНИЕ",
		fly = "FLY",

		music = "МУЗЫКА",

		war = "ВОЕННЫЙ ЦЕНТР",
		targets = "ЦЕЛИ",
		battle = "СЦЕНАРИИ",
		development = "РАЗВИТИЕ",

		settings = "НАСТРОЙКИ",
		interface = "ИНТЕРФЕЙС",
		design = "ДИЗАЙН",
		language = "ЯЗЫК",
		theme = "ТЕМА",

		admin = "ADMIN / DEV",

		country = "Страна",
		capture = "Захват",
		defence = "Оборона",

		search = "Поиск...",
		monitor = "МОНИТОРИНГ",
		refresh = "ОБНОВИТЬ",
		back = "НАЗАД",

		time = "ВРЕМЯ",
		brightness = "ЯРКОСТЬ",
		exposure = "ЭКСПОЗИЦИЯ",
		fog = "ТУМАН",
		shadows = "ГЛОБАЛЬНЫЕ ТЕНИ",

		day = "ДЕНЬ",
		night = "НОЧЬ",
		sunset = "ЗАКАТ",
		storm = "ШТОРМ",
		cinematic = "CINEMATIC",
		original = "ОРИГИНАЛ",

		saturation = "НАСЫЩЕННОСТЬ",
		contrast = "КОНТРАСТ",
		colorBrightness = "ЯРКОСТЬ ЦВЕТА",

		amount = "КОЛИЧЕСТВО",
		size = "РАЗМЕР",
		speed = "СКОРОСТЬ",
		spread = "РАЗБРОС",
		rotation = "ВРАЩЕНИЕ",
		transparency = "ПРОЗРАЧНОСТЬ",

		volume = "ГРОМКОСТЬ",
		loop = "ЗАЦИКЛИТЬ",
		play = "ВОСПРОИЗВЕСТИ",
		pause = "ПАУЗА",
		stop = "СТОП",
		audioId = "ROBLOX AUDIO ID / URL",

		width = "ШИРИНА ОКНА",
		height = "ВЫСОТА ОКНА",
		scale = "МАСШТАБ UI",
		corner = "СКРУГЛЕНИЕ",
		animation = "СКОРОСТЬ АНИМАЦИИ",
		transparencyUI = "ПРОЗРАЧНОСТЬ UI",
		sidebar = "ШИРИНА SIDEBAR",

		hover = "ЭФФЕКТ НАВЕДЕНИЯ",
		notifications = "УВЕДОМЛЕНИЯ",

		on = "ВКЛ",
		off = "ВЫКЛ",

		reset = "СБРОСИТЬ",

		online = "КЛИЕНТ ONLINE",
		ready = "СИСТЕМА ГОТОВА",
		error = "ОШИБКА",
		done = "ГОТОВО",

		noPlayers = "НЕТ ИГРОКОВ",
		noTarget = "ЦЕЛЬ НЕ ВЫБРАНА",
		noTrack = "ТРЕК НЕ ВЫБРАН",

		localTest = "Локальное тестирование",
		studioOnly = "Только Roblox Studio",

		russian = "РУССКИЙ",
		english = "АНГЛИЙСКИЙ",
	},

	en = {
		title = "TEAM PRIME HUB",
		subtitle = "CONTROL EUROPE",

		home = "HOME",
		regions = "REGIONS",
		countries = "COUNTRIES",
		players = "PLAYERS",

		visual = "VISUAL",
		esp = "ESP",
		world = "WORLD",
		color = "COLOR",
		effects = "EFFECTS",
		cubes = "FLOATING CUBES",

		movement = "MOVEMENT",
		fly = "FLY",

		music = "MUSIC",

		war = "WAR ROOM",
		targets = "TARGETS",
		battle = "SCENARIOS",
		development = "DEVELOPMENT",

		settings = "SETTINGS",
		interface = "INTERFACE",
		design = "DESIGN",
		language = "LANGUAGE",
		theme = "THEME",

		admin = "ADMIN / DEV",

		country = "Country",
		capture = "Capture",
		defence = "Defence",

		search = "Search...",
		monitor = "MONITOR",
		refresh = "REFRESH",
		back = "BACK",

		time = "TIME",
		brightness = "BRIGHTNESS",
		exposure = "EXPOSURE",
		fog = "FOG",
		shadows = "GLOBAL SHADOWS",

		day = "DAY",
		night = "NIGHT",
		sunset = "SUNSET",
		storm = "STORM",
		cinematic = "CINEMATIC",
		original = "ORIGINAL",

		saturation = "SATURATION",
		contrast = "CONTRAST",
		colorBrightness = "COLOR BRIGHTNESS",

		amount = "AMOUNT",
		size = "SIZE",
		speed = "SPEED",
		spread = "SPREAD",
		rotation = "ROTATION",
		transparency = "TRANSPARENCY",

		volume = "VOLUME",
		loop = "LOOP",
		play = "PLAY",
		pause = "PAUSE",
		stop = "STOP",
		audioId = "ROBLOX AUDIO ID / URL",

		width = "WINDOW WIDTH",
		height = "WINDOW HEIGHT",
		scale = "UI SCALE",
		corner = "CORNER RADIUS",
		animation = "ANIMATION SPEED",
		transparencyUI = "UI TRANSPARENCY",
		sidebar = "SIDEBAR WIDTH",

		hover = "HOVER EFFECTS",
		notifications = "NOTIFICATIONS",

		on = "ON",
		off = "OFF",

		reset = "RESET",

		online = "CLIENT ONLINE",
		ready = "SYSTEM READY",
		error = "ERROR",
		done = "DONE",

		noPlayers = "NO PLAYERS",
		noTarget = "NO TARGET",
		noTrack = "NO TRACK",

		localTest = "Local testing",
		studioOnly = "Roblox Studio only",

		russian = "RUSSIAN",
		english = "ENGLISH",
	},
}

local function T(key)
	local dictionary = Lang[Config.Language]

	if not dictionary then
		dictionary = Lang.ru
	end

	return dictionary[key] or key
end

--==============================================================
-- DYNAMIC TABLES
--==============================================================

local UI: {[string]: any} = {}
local Pages: {[string]: any} = {}

local State: {[string]: any} = {
	Started = false,
	Destroyed = false,

	Page = "Home",

	SelectedRegion = nil,
	SelectedCountry = nil,
	SelectedPlayer = nil,

	Dragging = false,
	DragStart = nil,
	DragOrigin = nil,

	Minimized = false,

	Connections = {},
	PageConnections = {},
	SidebarConnections = {},

	WindowTweening = false,
}

local Router: {[string]: any} = {}

--==============================================================
-- RESPONSIVE SIZE
--==============================================================

local function GetDefaultWindowSize()
	if MobileDevice then
		return UDim2.fromOffset(
			Config.MobileWidth,
			Config.MobileHeight
		)
	end

	return UDim2.fromOffset(
		Config.Width,
		Config.Height
	)
end

local function GetDefaultSidebarWidth()
	if MobileDevice then
		return Config.MobileSidebarWidth
	end

	return Config.SidebarWidth
end

local function GetDefaultScale()
	if MobileDevice then
		return Config.MobileScale
	end

	return Config.Scale
end

State.NormalSize = GetDefaultWindowSize()

--==============================================================
-- RUNTIME
--==============================================================

local FlyState = {
	Enabled = false,

	Connection = nil,

	Humanoid = nil,
	Root = nil,
	Animate = nil,

	Attachment = nil,
	Velocity = nil,
	Orientation = nil,
}

local ESPEnabled = false
local ESPObjects = {}

local ColorEffect = nil

local CubeObjects = {}
local CubeConnection = nil

local MusicSound = nil

local RegionMonitorToken = 0

--==============================================================
-- CONNECTION HELPERS
--==============================================================

local function Track(connection)

	if connection then
		table.insert(
			State.Connections,
			connection
		)
	end

	return connection
end

local function TrackPage(connection)

	if connection then
		table.insert(
			State.PageConnections,
			connection
		)
	end

	return connection
end

local function TrackSidebar(connection)

	if connection then
		table.insert(
			State.SidebarConnections,
			connection
		)
	end

	return connection
end

local function DisconnectList(list)

	for index = #list, 1, -1 do

		local connection =
			list[index]

		if connection then

			pcall(
				function()
					connection:Disconnect()
				end
			)
		end

		list[index] = nil
	end
end

--==============================================================
-- FACTORY
--==============================================================

local function New(className, parent)

	local object =
		Instance.new(
			className
		)

	if parent then
		object.Parent =
			parent
	end

	return object
end

local function Apply(object, properties)

	for property, value in pairs(
		properties
	) do

		object[property] =
			value
	end

	return object
end

local function AddCorner(
	object,
	radius
)

	local corner =
		Instance.new(
			"UICorner"
		)

	corner.CornerRadius =
		UDim.new(
			0,
			radius
		)

	corner.Parent =
		object

	return corner
end

local function AddStroke(
	object,
	color,
	transparency,
	thickness
)

	local stroke =
		Instance.new(
			"UIStroke"
		)

	stroke.Color =
		color

	stroke.Transparency =
		transparency

	stroke.Thickness =
		thickness

	stroke.Parent =
		object

	return stroke
end

local function AddLabel(
	parent,
	text,
	position,
	size,
	textSize,
	font,
	color,
	align
)

	local label =
		Instance.new(
			"TextLabel"
		)

	label.Position =
		position

	label.Size =
		size

	label.BackgroundTransparency =
		1

	label.BorderSizePixel =
		0

	label.Text =
		tostring(
			text or ""
		)

	label.TextColor3 =
		color

	label.Font =
		font

	label.TextSize =
		textSize

	label.TextXAlignment =
		align

	label.TextYAlignment =
		Enum.TextYAlignment.Center

	label.TextWrapped =
		true

	label.Parent =
		parent

	return label
end

--==============================================================
-- ANIMATION
--==============================================================

local function Animate(
	object,
	properties,
	duration,
	style
)

	if State.Destroyed then
		return nil
	end

	if not object
		or not object.Parent
	then
		return nil
	end

	local tween =
		TweenService:Create(

			object,

			TweenInfo.new(
				duration
					or
					Config.AnimationSpeed,

				style
					or
					Enum.EasingStyle.Quint,

				Enum.EasingDirection.Out
			),

			properties
		)

	tween:Play()

	return tween
end

local function AddHover(
	button,
	normalColor,
	hoverColor
)

	-- На мобильном устройстве hover не нужен:
	-- там нет нормального MouseEnter/MouseLeave интерфейса.
	if MobileDevice then
		return
	end

	if not Config.Hover then
		return
	end

	TrackPage(
		button.MouseEnter:Connect(
			function()

				if State.Destroyed
					or
					not button.Parent
				then
					return
				end

				Animate(
					button,
					{
						BackgroundColor3 =
							hoverColor
					},
					0.08,
					Enum.EasingStyle.Quad
				)
			end
		)
	)

	TrackPage(
		button.MouseLeave:Connect(
			function()

				if State.Destroyed
					or
					not button.Parent
				then
					return
				end

				Animate(
					button,
					{
						BackgroundColor3 =
							normalColor
					},
					0.08,
					Enum.EasingStyle.Quad
				)
			end
		)
	)
end

--==============================================================
-- NOTIFICATIONS
--==============================================================

local function Notify(
	title,
	message
)

	if not Config.Notifications
		or State.Destroyed
	then
		return
	end

	if not UI.ScreenGui then
		return
	end

	local holder =
		UI.ScreenGui:FindFirstChild(
			"Notifications"
		)

	if not holder then

		holder =
			New(
				"Frame",
				UI.ScreenGui
			)

		Apply(
			holder,
			{
				Name =
					"Notifications",

				AnchorPoint =
					Vector2.new(
						1,
						0
					),

				Position =
					MobileDevice
					and
					UDim2.new(
						1,
						-8,
						0,
						8
					)
					or
					UDim2.new(
						1,
						-15,
						0,
						15
					),

				Size =
					MobileDevice
					and
					UDim2.fromOffset(
						240,
						260
					)
					or
					UDim2.fromOffset(
						330,
						300
					),

				BackgroundTransparency =
					1,

				ZIndex =
					900,
			}
		)

		local layout =
			Instance.new(
				"UIListLayout"
			)

		layout.Padding =
			UDim.new(
				0,
				7
			)

		layout.HorizontalAlignment =
			Enum.HorizontalAlignment.Right

		layout.Parent =
			holder
	end

	local box =
		New(
			"Frame",
			holder
		)

	local boxWidth =
		MobileDevice
		and
		225
		or
		310

	local boxHeight =
		MobileDevice
		and
		58
		or
		64

	Apply(
		box,
		{
			Size =
				UDim2.fromOffset(
					boxWidth,
					boxHeight
				),

			BackgroundColor3 =
				GetTheme().Panel,

			BorderSizePixel =
				0,

			ZIndex =
				901,
		}
	)

	AddCorner(
		box,
		9
	)

	AddStroke(
		box,
		GetTheme().Accent,
		0.7,
		1
	)

	local stripe =
		New(
			"Frame",
			box
		)

	Apply(
		stripe,
		{
			Size =
				UDim2.fromOffset(
					4,
					boxHeight
				),

			BackgroundColor3 =
				GetTheme().Accent,

			BorderSizePixel =
				0,
		}
	)

	local titleLabel =
		AddLabel(
			box,
			title,

			UDim2.fromOffset(
				15,
				6
			),

			UDim2.new(
				1,
				-25,
				0,
				20
			),

			MobileDevice and 9 or 10,

			Enum.Font.GothamBold,

			GetTheme().Text,

			Enum.TextXAlignment.Left
		)

	titleLabel.ZIndex = 903

	local messageLabel =
		AddLabel(
			box,
			message,

			UDim2.fromOffset(
				15,
				28
			),

			UDim2.new(
				1,
				-25,
				0,
				25
			),

			MobileDevice and 8 or 9,

			Enum.Font.Gotham,

			GetTheme().Muted,

			Enum.TextXAlignment.Left
		)

	messageLabel.ZIndex = 903

	task.delay(
		2.7,
		function()

			if not box
				or not box.Parent
			then
				return
			end

			local tween =
				Animate(
					box,
					{
						BackgroundTransparency =
							1,
						Size =
							UDim2.fromOffset(
								boxWidth - 20,
								boxHeight - 6
							),
					},
					0.18,
					Enum.EasingStyle.Quad
				)

			if tween then
				tween.Completed:Wait()
			end

			if box
				and box.Parent
			then
				box:Destroy()
			end
		end
	)
end

--==============================================================
-- REGION SCANNER
--==============================================================

local function GetRegions()

	local folder =
		workspace:FindFirstChild(
			"Regions"
		)

	if not folder then
		return {}
	end

	local result = {}

	for _, object in ipairs(
		folder:GetChildren()
	) do

		if object:IsA("Folder")
			or object:IsA("Model")
		then

			table.insert(
				result,
				object
			)
		end
	end

	table.sort(
		result,

		function(a, b)
			return a.Name:lower()
				<
				b.Name:lower()
		end
	)

	return result
end

local function GetRegionData(region)

	if not region
		or not region.Parent
	then
		return nil
	end

	local country =
		region:FindFirstChild(
			"Country",
			true
		)

	local capture =
		region:FindFirstChild(
			"CaptureValue",
			true
		)

	local defence =
		region:FindFirstChild(
			"DefenceHP",
			true
		)

	if country
		and not country:IsA(
			"StringValue"
		)
	then
		country = nil
	end

	if capture
		and not (
			capture:IsA(
				"NumberValue"
			)
			or
			capture:IsA(
				"IntValue"
			)
		)
	then
		capture = nil
	end

	if defence
		and not (
			defence:IsA(
				"NumberValue"
			)
			or
			defence:IsA(
				"IntValue"
			)
		)
	then
		defence = nil
	end

	local features = {
		Capital = false,
		Airport = false,
		Shipyard = false,
		AntiAircraft = false,
	}

	for _, object in ipairs(
		region:GetDescendants()
	) do

		local name =
			object.Name:lower()

		if name == "capital" then

			features.Capital =
				true

		elseif name == "airport" then

			features.Airport =
				true

		elseif name == "shipyard" then

			features.Shipyard =
				true

		elseif name == "antiaircraft" then

			features.AntiAircraft =
				true
		end
	end

	return {
		Instance = region,
		Name = region.Name,

		Country =
			country
			and country.Value
			or nil,

		Capture =
			capture
			and capture.Value
			or nil,

		Defence =
			defence
			and defence.Value
			or nil,

		CaptureObject =
			capture,

		DefenceObject =
			defence,

		Features =
			features,
	}
end

local function GetRegionScore(region)

	local data =
		GetRegionData(
			region
		)

	if not data then
		return 0
	end

	local score = 0

	if data.Capture ~= nil then
		score += data.Capture * 0.45
	end

	if data.Defence ~= nil then
		score +=
			(
				100
				-
				data.Defence
			)
			*
			0.35
	end

	if data.Features.Capital then
		score += 10
	end

	if data.Features.Airport then
		score += 5
	end

	if data.Features.Shipyard then
		score += 5
	end

	if data.Features.AntiAircraft then
		score += 2
	end

	return math.clamp(
		score,
		0,
		100
	)
end

local function GetCountries()

	local map = {}

	for _, region in ipairs(
		GetRegions()
	) do

		local data =
			GetRegionData(
				region
			)

		if data
			and data.Country
		then

			local name =
				tostring(
					data.Country
				)

			if not map[name] then

				map[name] = {
					Name = name,
					Regions = {},

					RegionCount = 0,

					CaptureTotal = 0,
					CaptureCount = 0,

					DefenceTotal = 0,
					DefenceCount = 0,

					CapitalCount = 0,
					AirportCount = 0,
					ShipyardCount = 0,
				}
			end

			local country =
				map[name]

			table.insert(
				country.Regions,
				region
			)

			country.RegionCount += 1

			if data.Capture ~= nil then
				country.CaptureTotal +=
					data.Capture

				country.CaptureCount += 1
			end

			if data.Defence ~= nil then
				country.DefenceTotal +=
					data.Defence

				country.DefenceCount += 1
			end

			if data.Features.Capital then
				country.CapitalCount += 1
			end

			if data.Features.Airport then
				country.AirportCount += 1
			end

			if data.Features.Shipyard then
				country.ShipyardCount += 1
			end
		end
	end

	local result = {}

	for _, country in pairs(
		map
	) do

		if country.CaptureCount > 0 then

			country.AverageCapture =
				country.CaptureTotal
				/
				country.CaptureCount
		end

		if country.DefenceCount > 0 then

			country.AverageDefence =
				country.DefenceTotal
				/
				country.DefenceCount
		end

		table.insert(
			result,
			country
		)
	end

	table.sort(
		result,

		function(a, b)
			return a.Name:lower()
				<
				b.Name:lower()
		end
	)

	return result
end

local function GetCountry(name)

	for _, country in ipairs(
		GetCountries()
	) do

		if country.Name ==
			name
		then
			return country
		end
	end

	return nil
end

--==============================================================
-- LIGHTING
--==============================================================

local OriginalLighting = {
	ClockTime =
		Lighting.ClockTime,

	Brightness =
		Lighting.Brightness,

	Exposure =
		Lighting.ExposureCompensation,

	FogStart =
		Lighting.FogStart,

	FogEnd =
		Lighting.FogEnd,

	GlobalShadows =
		Lighting.GlobalShadows,

	Ambient =
		Lighting.Ambient,

	OutdoorAmbient =
		Lighting.OutdoorAmbient,
}

local function RestoreLighting()

	Lighting.ClockTime =
		OriginalLighting.ClockTime

	Lighting.Brightness =
		OriginalLighting.Brightness

	Lighting.ExposureCompensation =
		OriginalLighting.Exposure

	Lighting.FogStart =
		OriginalLighting.FogStart

	Lighting.FogEnd =
		OriginalLighting.FogEnd

	Lighting.GlobalShadows =
		OriginalLighting.GlobalShadows

	Lighting.Ambient =
		OriginalLighting.Ambient

	Lighting.OutdoorAmbient =
		OriginalLighting.OutdoorAmbient
end

--==============================================================
-- COLOR
--==============================================================

local function ApplyColor()

	if not ColorEffect
		or not ColorEffect.Parent
	then

		ColorEffect =
			Instance.new(
				"ColorCorrectionEffect"
			)

		ColorEffect.Name =
			"TEAM_PRIME_COLOR"

		ColorEffect.Parent =
			Lighting
	end

	ColorEffect.Saturation =
		Config.ColorSaturation

	ColorEffect.Contrast =
		Config.ColorContrast

	ColorEffect.Brightness =
		Config.ColorBrightness
end

--==============================================================
-- ESP
--==============================================================

local function ClearESP()

	for player, objects in pairs(
		ESPObjects
	) do

		for _, object in ipairs(
			objects
		) do

			if object
				and object.Parent
			then
				object:Destroy()
			end
		end

		ESPObjects[player] =
			nil
	end
end

local function RefreshESP()

	ClearESP()

	if not ESPEnabled then
		return
	end

	for _, player in ipairs(
		Players:GetPlayers()
	) do

		if player ~= LocalPlayer
			and player.Character
		then

			local root =
				player.Character:FindFirstChild(
					"HumanoidRootPart"
				)

			if root then

				local highlight =
					Instance.new(
						"Highlight"
					)

				highlight.Name =
					"TEAM_PRIME_ESP"

				highlight.FillColor =
					GetTheme().Accent

				highlight.FillTransparency =
					0.78

				highlight.OutlineColor =
					GetTheme().Accent2

				highlight.DepthMode =
					Enum.HighlightDepthMode.AlwaysOnTop

				highlight.Parent =
					player.Character

				local tag =
					Instance.new(
						"BillboardGui"
					)

				tag.Name =
					"TEAM_PRIME_TAG"

				tag.Adornee =
					root

				tag.AlwaysOnTop =
					true

				tag.Size =
					UDim2.fromOffset(
						180,
						25
					)

				tag.StudsOffset =
					Vector3.new(
						0,
						3,
						0
					)

				tag.Parent =
					root

				AddLabel(
					tag,
					player.DisplayName,

					UDim2.fromScale(
						0,
						0
					),

					UDim2.fromScale(
						1,
						1
					),

					11,

					Enum.Font.GothamBold,

					GetTheme().Text,

					Enum.TextXAlignment.Center
				)

				ESPObjects[player] = {
					highlight,
					tag,
				}
			end
		end
	end
end

--==============================================================
-- CUBES
--==============================================================

local function ClearCubes()

	if CubeConnection then

		CubeConnection:Disconnect()

		CubeConnection =
			nil
	end

	for _, item in ipairs(
		CubeObjects
	) do

		if item.Part
			and item.Part.Parent
		then
			item.Part:Destroy()
		end
	end

	for index = #CubeObjects, 1, -1 do
		CubeObjects[index] = nil
	end

	local folder =
		workspace:FindFirstChild(
			"TEAM_PRIME_LOCAL_CUBES"
		)

	if folder then
		folder:Destroy()
	end
end

local function CreateCubes()

	ClearCubes()

	if not Config.CubesEnabled then
		return
	end

	local folder =
		Instance.new(
			"Folder"
		)

	folder.Name =
		"TEAM_PRIME_LOCAL_CUBES"

	folder.Parent =
		workspace

	for _ = 1,
		Config.CubesAmount
	do

		local part =
			Instance.new(
				"Part"
			)

		part.Name =
			"PrimeCube"

		part.Anchored =
			true

		part.CanCollide =
			false

		part.CanTouch =
			false

		part.CanQuery =
			false

		part.CastShadow =
			false

		part.Material =
			Enum.Material.Neon

		part.Color =
			GetTheme().Accent

		part.Transparency =
			Config.CubesTransparency

		local size =
			Config.CubesSize

		part.Size =
			Vector3.new(
				size,
				size,
				size
			)

		part.Parent =
			folder

		table.insert(
			CubeObjects,
			{
				Part = part,

				Angle =
					math.random()
					*
					math.pi
					*
					2,

				Distance =
					math.random(
						20,
						Config.CubesSpread
					),

				Height =
					math.random(
						-20,
						30
					),

				Seed =
					math.random()
					*
					100,
			}
		)
	end

	CubeConnection =
		RunService.RenderStepped:Connect(
			function()

				if State.Destroyed
					or
					not Config.CubesEnabled
				then
					return
				end

				local camera =
					workspace.CurrentCamera

				if not camera then
					return
				end

				local center =
					camera.CFrame.Position

				local now =
					os.clock()

				for _, item in ipairs(
					CubeObjects
				) do

					if item.Part
						and item.Part.Parent
					then

						local phase =
							now
							*
							Config.CubesSpeed
							+
							item.Seed

						local angle =
							item.Angle
							+
							phase
							*
							0.12

						local position =
							center
							+
							Vector3.new(

								math.cos(
									angle
								)
								*
								item.Distance,

								item.Height
								+
								math.sin(
									phase
								)
								*
								4,

								math.sin(
									angle
								)
								*
								item.Distance
							)

						item.Part.CFrame =
							CFrame.new(
								position
							)
							*
							CFrame.Angles(

								phase
								*
								Config.CubesRotation,

								phase
								*
								0.7,

								phase
								*
								0.4
							)
					end
				end
			end
		)
end

--==============================================================
-- MUSIC
--==============================================================

local function ExtractMusicId(input)

	input =
		tostring(
			input or ""
		)

	input =
		input:gsub(
			"%s+",
			""
		)

	if input == "" then
		return nil
	end

	local id =
		input:match(
			"^%d+$"
		)

	if id then
		return id
	end

	id =
		input:match(
			"rbxassetid://(%d+)"
		)

	if id then
		return id
	end

	id =
		input:match(
			"/library/(%d+)"
		)

	if id then
		return id
	end

	id =
		input:match(
			"/catalog/(%d+)"
		)

	if id then
		return id
	end

	return input:match(
		"(%d+)"
	)
end

local function StopMusic()

	if MusicSound then

		pcall(
			function()
				MusicSound:Stop()
			end
		)

		MusicSound:Destroy()

		MusicSound =
			nil
	end
end

--==============================================================
-- FLY
--==============================================================

local function StopFly()

	FlyState.Enabled =
		false

	if FlyState.Connection then

		FlyState.Connection:Disconnect()

		FlyState.Connection =
			nil
	end

	if FlyState.Velocity then
		FlyState.Velocity:Destroy()
	end

	if FlyState.Orientation then
		FlyState.Orientation:Destroy()
	end

	if FlyState.Attachment then
		FlyState.Attachment:Destroy()
	end

	if FlyState.Humanoid
		and
		FlyState.Humanoid.Parent
	then

		FlyState.Humanoid.AutoRotate =
			true

		FlyState.Humanoid.PlatformStand =
			false
	end

	if FlyState.Animate
		and
		FlyState.Animate.Parent
	then

		pcall(
			function()
				FlyState.Animate.Enabled =
					true
			end
		)
	end

	FlyState.Humanoid = nil
	FlyState.Root = nil
	FlyState.Animate = nil
	FlyState.Attachment = nil
	FlyState.Velocity = nil
	FlyState.Orientation = nil
end

local function StartFly()

	if not IsStudio then
		return false
	end

	StopFly()

	local character =
		LocalPlayer.Character

	if not character then
		return false
	end

	local humanoid =
		character:FindFirstChildOfClass(
			"Humanoid"
		)

	local root =
		character:FindFirstChild(
			"HumanoidRootPart"
		)

	if not humanoid
		or
		not root
	then
		return false
	end

	FlyState.Humanoid =
		humanoid

	FlyState.Root =
		root

	FlyState.Animate =
		character:FindFirstChild(
			"Animate"
		)

	if FlyState.Animate then

		pcall(
			function()
				FlyState.Animate.Enabled =
					false
			end
		)
	end

	humanoid.AutoRotate =
		false

	humanoid.PlatformStand =
		true

	local attachment =
		Instance.new(
			"Attachment"
		)

	attachment.Name =
		"TEAM_PRIME_FLY"

	attachment.Parent =
		root

	FlyState.Attachment =
		attachment

	local velocity =
		Instance.new(
			"LinearVelocity"
		)

	velocity.Name =
		"TEAM_PRIME_FLY_VELOCITY"

	velocity.Attachment0 =
		attachment

	velocity.RelativeTo =
		Enum.ActuatorRelativeTo.World

	velocity.MaxForce =
		math.huge

	velocity.VectorVelocity =
		Vector3.zero

	velocity.Parent =
		root

	FlyState.Velocity =
		velocity

	local orientation =
		Instance.new(
			"AlignOrientation"
		)

	orientation.Name =
		"TEAM_PRIME_FLY_ORIENTATION"

	orientation.Mode =
		Enum.OrientationAlignmentMode.OneAttachment

	orientation.Attachment0 =
		attachment

	orientation.MaxTorque =
		math.huge

	orientation.Responsiveness =
		200

	orientation.RigidityEnabled =
		true

	orientation.Parent =
		root

	FlyState.Orientation =
		orientation

	FlyState.Enabled =
		true

	FlyState.Connection =
		RunService.RenderStepped:Connect(
			function()

				if State.Destroyed
					or
					not FlyState.Enabled
					or
					not root.Parent
				then

					StopFly()
					return
				end

				local camera =
					workspace.CurrentCamera

				if not camera then
					return
				end

				local direction =
					Vector3.zero

				if UserInputService:IsKeyDown(
					Enum.KeyCode.W
				) then
					direction +=
						camera.CFrame.LookVector
				end

				if UserInputService:IsKeyDown(
					Enum.KeyCode.S
				) then
					direction -=
						camera.CFrame.LookVector
				end

				if UserInputService:IsKeyDown(
					Enum.KeyCode.A
				) then
					direction -=
						camera.CFrame.RightVector
				end

				if UserInputService:IsKeyDown(
					Enum.KeyCode.D
				) then
					direction +=
						camera.CFrame.RightVector
				end

				if UserInputService:IsKeyDown(
					Enum.KeyCode.Space
				) then
					direction +=
						Vector3.yAxis
				end

				if UserInputService:IsKeyDown(
					Enum.KeyCode.LeftControl
				) then
					direction -=
						Vector3.yAxis
				end

				if direction.Magnitude > 0 then

					direction =
						direction.Unit
						*
						Config.FlySpeed
				end

				velocity.VectorVelocity =
					direction

				local flatLook =
					Vector3.new(
						camera.CFrame.LookVector.X,
						0,
						camera.CFrame.LookVector.Z
					)

				if flatLook.Magnitude > 0 then

					orientation.CFrame =
						CFrame.lookAt(
							Vector3.zero,
							flatLook.Unit
						)
				end
			end
		)

	return true
end

--==============================================================
-- PAGE HELPERS
--==============================================================

local function ClearPage()

	DisconnectList(
		State.PageConnections
	)

	RegionMonitorToken += 1

	if not UI.PageContainer then
		return
	end

	for _, child in ipairs(
		UI.PageContainer:GetChildren()
	) do

		if child:IsA(
			"GuiObject"
		) then
			child:Destroy()
		end
	end

	UI.PageContainer.CanvasPosition =
		Vector2.zero
end

local function Section(
	title,
	description
)

	local frame =
		New(
			"Frame",
			UI.PageContainer
		)

	Apply(
		frame,
		{
			Size =
				UDim2.new(
					1,
					-5,
					0,
					74
				),

			BackgroundColor3 =
				GetTheme().Card,

			BorderSizePixel =
				0,
		}
	)

	AddCorner(
		frame,
		9
	)

	AddLabel(
		frame,
		title,

		UDim2.fromOffset(
			14,
			8
		),

		UDim2.new(
			1,
			-28,
			0,
			20
		),

		11,

		Enum.Font.GothamBold,

		GetTheme().Text,

		Enum.TextXAlignment.Left
	)

	AddLabel(
		frame,
		description or "",

		UDim2.fromOffset(
			14,
			32
		),

		UDim2.new(
			1,
			-28,
			0,
			34
		),

		9,

		Enum.Font.Gotham,

		GetTheme().Muted,

		Enum.TextXAlignment.Left
	)

	return frame
end

local function Card(
	title,
	description,
	callback,
	accent
)

	local button =
		New(
			"TextButton",
			UI.PageContainer
		)

	Apply(
		button,
		{
			Size =
				UDim2.new(
					1,
					-5,
					0,
					62
				),

			BackgroundColor3 =
				GetTheme().Card,

			BorderSizePixel =
				0,

			Text = "",

			AutoButtonColor =
				false,

			Active =
				true,

			Selectable =
				false,
		}
	)

	AddCorner(
		button,
		9
	)

	local stripe =
		New(
			"Frame",
			button
		)

	Apply(
		stripe,
		{
			Size =
				UDim2.fromOffset(
					3,
					62
				),

			BackgroundColor3 =
				accent
				or
				GetTheme().Accent,

			BorderSizePixel =
				0,
		}
	)

	AddLabel(
		button,
		title,

		UDim2.fromOffset(
			17,
			8
		),

		UDim2.new(
			1,
			-65,
			0,
			20
		),

		11,

		Enum.Font.GothamBold,

		GetTheme().Text,

		Enum.TextXAlignment.Left
	)

	AddLabel(
		button,
		description or "",

		UDim2.fromOffset(
			17,
			31
		),

		UDim2.new(
			1,
			-65,
			0,
			18
		),

		9,

		Enum.Font.Gotham,

		GetTheme().Muted,

		Enum.TextXAlignment.Left
	)

	AddLabel(
		button,
		"›",

		UDim2.new(
			1,
			-32,
			0,
			18
		),

		UDim2.fromOffset(
			20,
			22
		),

		20,

		Enum.Font.GothamBold,

		GetTheme().Muted,

		Enum.TextXAlignment.Right
	)

	AddHover(
		button,
		GetTheme().Card,
		GetTheme().Panel
	)

	if callback then

		TrackPage(
			button.Activated:Connect(
				function()

					if State.Destroyed then
						return
					end

					local success, err =
						pcall(
							callback
						)

					if not success then

						warn(
							"[TEAM PRIME HUB] CALLBACK:",
							err
						)
					end
				end
			)
		)
	end

	return button
end

local function Toggle(
	title,
	value,
	callback
)

	local button =
		New(
			"TextButton",
			UI.PageContainer
		)

	Apply(
		button,
		{
			Size =
				UDim2.new(
					1,
					-5,
					0,
					58
				),

			BackgroundColor3 =
				GetTheme().Card,

			BorderSizePixel =
				0,

			Text = "",

			AutoButtonColor =
				false,

			Active =
				true,

			Selectable =
				false,
		}
	)

	AddCorner(
		button,
		9
	)

	AddLabel(
		button,
		title,

		UDim2.fromOffset(
			14,
			9
		),

		UDim2.new(
			1,
			-120,
			0,
			22
		),

		11,

		Enum.Font.GothamBold,

		GetTheme().Text,

		Enum.TextXAlignment.Left
	)

	local indicator =
		AddLabel(
			button,

			value
				and
				T("on")
				or
				T("off"),

			UDim2.new(
				1,
				-90,
				0,
				18
			),

			UDim2.fromOffset(
				75,
				22
			),

			10,

			Enum.Font.GothamBold,

			value
				and
				GetTheme().Success
				or
				GetTheme().Muted,

			Enum.TextXAlignment.Right
		)

	local current =
		value == true

	AddHover(
		button,
		GetTheme().Card,
		GetTheme().Panel
	)

	TrackPage(
		button.Activated:Connect(
			function()

				current =
					not current

				indicator.Text =
					current
					and
					T("on")
					or
					T("off")

				indicator.TextColor3 =
					current
					and
					GetTheme().Success
					or
					GetTheme().Muted

				if callback then

					pcall(
						function()
							callback(
								current
							)
						end
					)
				end
			end
		)
	)

	return button
end

local function Slider(
	title,
	minimum,
	maximum,
	value,
	step,
	callback,
	formatter
)

	local frame =
		New(
			"Frame",
			UI.PageContainer
		)

	Apply(
		frame,
		{
			Size =
				UDim2.new(
					1,
					-5,
					0,
					80
				),

			BackgroundColor3 =
				GetTheme().Card,

			BorderSizePixel =
				0,
		}
	)

	AddCorner(
		frame,
		9
	)

	AddLabel(
		frame,
		title,

		UDim2.fromOffset(
			14,
			8
		),

		UDim2.new(
			1,
			-120,
			0,
			20
		),

		10,

		Enum.Font.GothamBold,

		GetTheme().Text,

		Enum.TextXAlignment.Left
	)

	local valueLabel =
		AddLabel(
			frame,
			"",

			UDim2.new(
				1,
				-95,
				0,
				8
			),

			UDim2.fromOffset(
				80,
				20
			),

			10,

			Enum.Font.GothamBold,

			GetTheme().Accent,

			Enum.TextXAlignment.Right
		)

	local bar =
		New(
			"Frame",
			frame
		)

	Apply(
		bar,
		{
			Position =
				UDim2.fromOffset(
					14,
					49
				),

			Size =
				UDim2.new(
					1,
					-28,
					0,
					6
				),

			BackgroundColor3 =
				GetTheme().Background,

			BorderSizePixel =
				0,

			Active =
				true,
		}
	)

	AddCorner(
		bar,
		6
	)

	local fill =
		New(
			"Frame",
			bar
		)

	Apply(
		fill,
		{
			Size =
				UDim2.new(
					0,
					0,
					1,
					0
				),

			BackgroundColor3 =
				GetTheme().Accent,

			BorderSizePixel =
				0,
		}
	)

	AddCorner(
		fill,
		6
	)

	local knob =
		New(
			"Frame",
			bar
		)

	Apply(
		knob,
		{
			AnchorPoint =
				Vector2.new(
					0.5,
					0.5
				),

			Position =
				UDim2.new(
					0,
					0,
					0.5,
					0
				),

			Size =
				UDim2.fromOffset(
					14,
					14
				),

			BackgroundColor3 =
				GetTheme().Accent2,

			BorderSizePixel =
				0,
		}
	)

	AddCorner(
		knob,
		7
	)

	local current =
		math.clamp(
			value,
			minimum,
			maximum
		)

	local dragging =
		false

	local function Display(number)

		if formatter then
			return formatter(
				number
			)
		end

		if step < 1 then

			return string.format(
				"%.2f",
				number
			)
		end

		return tostring(
			math.floor(
				number + 0.5
			)
		)
	end

	local function ApplyValue(number)

		local snapped =
			math.floor(
				number
				/
				step
				+
				0.5
			)
			*
			step

		current =
			math.clamp(
				snapped,
				minimum,
				maximum
			)

		local range =
			maximum
			-
			minimum

		local alpha =
			0

		if range > 0 then

			alpha =
				(
					current
					-
					minimum
				)
				/
				range
		end

		fill.Size =
			UDim2.new(
				alpha,
				0,
				1,
				0
			)

		knob.Position =
			UDim2.new(
				alpha,
				0,
				0.5,
				0
			)

		valueLabel.Text =
			Display(
				current
			)

		if callback then

			pcall(
				function()
					callback(
						current
					)
				end
			)
		end
	end

	local function FromX(x)

		local width =
			bar.AbsoluteSize.X

		if width <= 0 then
			return
		end

		local alpha =
			math.clamp(
				(
					x
					-
					bar.AbsolutePosition.X
				)
				/
				width,

				0,
				1
			)

		local result =
			minimum
			+
			(
				maximum
				-
				minimum
			)
			*
			alpha

		ApplyValue(
			result
		)
	end

	TrackPage(
		bar.InputBegan:Connect(
			function(input)

				if input.UserInputType ==
					Enum.UserInputType.MouseButton1
					or
					input.UserInputType ==
					Enum.UserInputType.Touch
				then

					dragging =
						true

					FromX(
						input.Position.X
					)
				end
			end
		)
	)

	TrackPage(
		UserInputService.InputChanged:Connect(
			function(input)

				if not dragging then
					return
				end

				if input.UserInputType ~=
					Enum.UserInputType.MouseMovement
					and
					input.UserInputType ~=
					Enum.UserInputType.Touch
				then
					return
				end

				FromX(
					input.Position.X
				)
			end
		)
	)

	TrackPage(
		UserInputService.InputEnded:Connect(
			function(input)

				if input.UserInputType ==
					Enum.UserInputType.MouseButton1
					or
					input.UserInputType ==
					Enum.UserInputType.Touch
				then

					dragging =
						false
				end
			end
		)
	)

	ApplyValue(
		current
	)

	return frame
end

--==============================================================
-- PAGES
--==============================================================

Pages.Home = function()

	ClearPage()

	UI.PageTitle.Text =
		T("home")

	UI.PageDescription.Text =
		T("subtitle")

	Section(
		T("online"),
		LocalPlayer.DisplayName
	)

	Section(
		T("world"),

		"Regions: "
		..
		tostring(
			#GetRegions()
		)
		..
		"\nCountries: "
		..
		tostring(
			#GetCountries()
		)
	)

	Section(
		"MODULE STATUS",

		"ESP: "
		..
		(
			ESPEnabled
			and
			T("on")
			or
			T("off")
		)
		..
		"\nFLY: "
		..
		(
			FlyState.Enabled
			and
			T("on")
			or
			T("off")
		)
		..
		"\nMUSIC: "
		..
		(
			MusicSound
			and
			T("on")
			or
			T("off")
		)
	)

	Card(
		T("regions"),
		"",
		function()
			Router:Open("Regions")
		end
	)

	Card(
		T("countries"),
		"",
		function()
			Router:Open("Countries")
		end
	)

	Card(
		T("visual"),
		"",
		function()
			Router:Open("Visual")
		end
	)

	Card(
		T("music"),
		"",
		function()
			Router:Open("Music")
		end
	)
end

Pages.Regions = function()

	ClearPage()

	UI.PageTitle.Text =
		T("regions")

	UI.PageDescription.Text =
		"Regions"

	local search =
		New(
			"TextBox",
			UI.PageContainer
		)

	Apply(
		search,
		{
			Size =
				UDim2.new(
					1,
					-5,
					0,
					42
				),

			BackgroundColor3 =
				GetTheme().Card,

			BorderSizePixel =
				0,

			Text = "",

			PlaceholderText =
				T("search"),

			PlaceholderColor3 =
				GetTheme().Muted,

			TextColor3 =
				GetTheme().Text,

			Font =
				Enum.Font.Gotham,

			TextSize =
				10,

			ClearTextOnFocus =
				false,
		}
	)

	AddCorner(
		search,
		8
	)

	local list =
		New(
			"Frame",
			UI.PageContainer
		)

	Apply(
		list,
		{
			Size =
				UDim2.new(
					1,
					-5,
					0,
					0
				),

			AutomaticSize =
				Enum.AutomaticSize.Y,

			BackgroundTransparency =
				1,
		}
	)

	local layout =
		Instance.new(
			"UIListLayout"
		)

	layout.Padding =
		UDim.new(
			0,
			5
		)

	layout.Parent =
		list

	local function Render()

		for _, child in ipairs(
			list:GetChildren()
		) do

			if child:IsA(
				"GuiObject"
			) then
				child:Destroy()
			end
		end

		local query =
			search.Text:lower()

		for _, region in ipairs(
			GetRegions()
		) do

			if query == ""
				or
				region.Name:lower():find(
					query,
					1,
					true
				)
			then

				local data =
					GetRegionData(
						region
					)

				if data then

					local button =
						New(
							"TextButton",
							list
						)

					Apply(
						button,
						{
							Size =
								UDim2.new(
									1,
									0,
									0,
									62
								),

							BackgroundColor3 =
								GetTheme().Card,

							BorderSizePixel =
								0,

							Text = "",

							AutoButtonColor =
								false,

							Active =
								true,

							Selectable =
								false,
						}
					)

					AddCorner(
						button,
						8
					)

					AddLabel(
						button,
						data.Name,

						UDim2.fromOffset(
							14,
							7
						),

						UDim2.new(
							1,
							-30,
							0,
							20
						),

						11,

						Enum.Font.GothamBold,

						GetTheme().Text,

						Enum.TextXAlignment.Left
					)

					AddLabel(
						button,

						tostring(
							data.Country
							or
							"N/A"
						)
						..
						" • "
						..
						T("capture")
						..
						": "
						..
						(
							data.Capture
							and
							string.format(
								"%.1f%%",
								data.Capture
							)
							or
							"N/A"
						)
						..
						" • "
						..
						T("defence")
						..
						": "
						..
						(
							data.Defence
							and
							string.format(
								"%.1f%%",
								data.Defence
							)
							or
							"N/A"
						),

						UDim2.fromOffset(
							14,
							32
						),

						UDim2.new(
							1,
							-30,
							0,
							18
						),

						9,

						Enum.Font.Gotham,

						GetTheme().Muted,

						Enum.TextXAlignment.Left
					)

					AddHover(
						button,
						GetTheme().Card,
						GetTheme().Panel
					)

					TrackPage(
						button.Activated:Connect(
							function()

								State.SelectedRegion =
									region

								Router:Open(
									"Region"
								)
							end
						)
					)
				end
			end
		end
	end

	TrackPage(
		search:GetPropertyChangedSignal(
			"Text"
		):Connect(
			Render
		)
	)

	Render()
end

Pages.Region = function()

	ClearPage()

	local data =
		GetRegionData(
			State.SelectedRegion
		)

	if not data then

		UI.PageTitle.Text =
			T("error")

		Card(
			T("back"),
			"",
			function()
				Router:Open(
					"Regions"
				)
			end
		)

		return
	end

	UI.PageTitle.Text =
		data.Name

	UI.PageDescription.Text =
		data.Instance:GetFullName()

	Section(
		T("country"),
		tostring(
			data.Country
			or
			"N/A"
		)
	)

	Section(
		T("capture"),

		data.Capture ~= nil
		and
		string.format(
			"%.2f%%",
			data.Capture
		)
		or
		"N/A"
	)

	Section(
		T("defence"),

		data.Defence ~= nil
		and
		string.format(
			"%.2f%%",
			data.Defence
		)
		or
		"N/A"
	)

	Section(
		"FEATURES",

		"Capital: "
		..
		tostring(
			data.Features.Capital
		)
		..
		"\nAirport: "
		..
		tostring(
			data.Features.Airport
		)
		..
		"\nShipyard: "
		..
		tostring(
			data.Features.Shipyard
		)
		..
		"\nAA: "
		..
		tostring(
			data.Features.AntiAircraft
		)
	)

	Section(
		"STRATEGIC SCORE",

		string.format(
			"%.1f / 100",
			GetRegionScore(
				State.SelectedRegion
			)
		)
	)

	Card(
		T("monitor"),
		"",
		function()
			Router:Open(
				"RegionMonitor"
			)
		end
	)

	if IsStudio then

		Card(
			"Capture = 100",
			"Studio test",
			function()

				if data.CaptureObject then

					data.CaptureObject.Value =
						100

					Router:Open(
						"Region"
					)
				end
			end
		)

		Card(
			"Capture = 0",
			"Studio test",
			function()

				if data.CaptureObject then

					data.CaptureObject.Value =
						0

					Router:Open(
						"Region"
					)
				end
			end
		)

		Card(
			"Defence = 0",
			"Studio test",

			function()

				if data.DefenceObject then

					data.DefenceObject.Value =
						0

					Router:Open(
						"Region"
					)
				end
			end,

			GetTheme().Danger
		)
	end

	Card(
		T("back"),
		"",
		function()
			Router:Open("Regions")
		end
	)
end

Pages.RegionMonitor = function()

	ClearPage()

	local region =
		State.SelectedRegion

	local data =
		GetRegionData(
			region
		)

	if not data then
		return
	end

	UI.PageTitle.Text =
		data.Name

	UI.PageDescription.Text =
		T("monitor")

	local section =
		Section(
			data.Name,
			""
		)

	local labels = {}

	for _, child in ipairs(
		section:GetChildren()
	) do

		if child:IsA(
			"TextLabel"
		) then
			table.insert(
				labels,
				child
			)
		end
	end

	local info =
		labels[2]

	RegionMonitorToken += 1

	local token =
		RegionMonitorToken

	task.spawn(
		function()

			while
				not State.Destroyed
				and
				State.Page ==
					"RegionMonitor"
				and
				token ==
					RegionMonitorToken
			do

				local current =
					GetRegionData(
						region
					)

				if current
					and
					info
					and
					info.Parent
				then

					info.Text =
						T("country")
						..
						": "
						..
						tostring(
							current.Country
							or
							"N/A"
						)
						..
						"\n"
						..
						T("capture")
						..
						": "
						..
						(
							current.Capture
							and
							string.format(
								"%.2f%%",
								current.Capture
							)
							or
							"N/A"
						)
						..
						"\n"
						..
						T("defence")
						..
						": "
						..
						(
							current.Defence
							and
							string.format(
								"%.2f%%",
								current.Defence
							)
							or
							"N/A"
						)
				end

				task.wait(
					0.25
				)
			end
		end
	)

	Card(
		T("back"),
		"",
		function()
			Router:Open("Region")
		end
	)
end

Pages.Countries = function()

	ClearPage()

	UI.PageTitle.Text =
		T("countries")

	local search =
		New(
			"TextBox",
			UI.PageContainer
		)

	Apply(
		search,
		{
			Size =
				UDim2.new(
					1,
					-5,
					0,
					42
				),

			BackgroundColor3 =
				GetTheme().Card,

			BorderSizePixel =
				0,

			Text = "",

			PlaceholderText =
				T("search"),

			PlaceholderColor3 =
				GetTheme().Muted,

			TextColor3 =
				GetTheme().Text,

			Font =
				Enum.Font.Gotham,

			TextSize =
				10,

			ClearTextOnFocus =
				false,
		}
	)

	AddCorner(
		search,
		8
	)

	local list =
		New(
			"Frame",
			UI.PageContainer
		)

	Apply(
		list,
		{
			Size =
				UDim2.new(
					1,
					-5,
					0,
					0
				),

			AutomaticSize =
				Enum.AutomaticSize.Y,

			BackgroundTransparency =
				1,
		}
	)

	local layout =
		Instance.new(
			"UIListLayout"
		)

	layout.Padding =
		UDim.new(
			0,
			5
		)

	layout.Parent =
		list

	local function Render()

		for _, child in ipairs(
			list:GetChildren()
		) do

			if child:IsA(
				"GuiObject"
			) then
				child:Destroy()
			end
		end

		local query =
			search.Text:lower()

		for _, country in ipairs(
			GetCountries()
		) do

			if query == ""
				or
				country.Name:lower():find(
					query,
					1,
					true
				)
			then

				local button =
					New(
						"TextButton",
						list
					)

				Apply(
					button,
					{
						Size =
							UDim2.new(
								1,
								0,
								0,
								72
							),

						BackgroundColor3 =
							GetTheme().Card,

						BorderSizePixel =
							0,

						Text = "",

						AutoButtonColor =
							false,

						Active =
							true,

						Selectable =
							false,
					}
				)

				AddCorner(
					button,
					8
				)

				AddLabel(
					button,
					country.Name,

					UDim2.fromOffset(
						14,
						8
					),

					UDim2.new(
						1,
						-25,
						0,
						20
					),

					11,

					Enum.Font.GothamBold,

					GetTheme().Text,

					Enum.TextXAlignment.Left
				)

				AddLabel(
					button,

					"Regions: "
					..
					tostring(
						country.RegionCount
					)
					..
					" • "
					..
					T("capture")
					..
					": "
					..
					(
						country.AverageCapture
						and
						string.format(
							"%.1f%%",
							country.AverageCapture
						)
						or
						"N/A"
					)
					..
					" • "
					..
					T("defence")
					..
					": "
					..
					(
						country.AverageDefence
						and
						string.format(
							"%.1f%%",
							country.AverageDefence
						)
						or
						"N/A"
					),

					UDim2.fromOffset(
						14,
						34
					),

					UDim2.new(
						1,
						-25,
						0,
						18
					),

					9,

					Enum.Font.Gotham,

					GetTheme().Muted,

					Enum.TextXAlignment.Left
				)

				AddHover(
					button,
					GetTheme().Card,
					GetTheme().Panel
				)

				TrackPage(
					button.Activated:Connect(
						function()

							State.SelectedCountry =
								country.Name

							Router:Open(
								"Country"
							)
						end
					)
				)
			end
		end
	end

	TrackPage(
		search:GetPropertyChangedSignal(
			"Text"
		):Connect(
			Render
		)
	)

	Render()
end

Pages.Country = function()

	ClearPage()

	local country =
		GetCountry(
			State.SelectedCountry
		)

	if not country then
		return
	end

	UI.PageTitle.Text =
		country.Name

	UI.PageDescription.Text =
		tostring(
			country.RegionCount
		)
		..
		" regions"

	Section(
		"OVERVIEW",

		"Regions: "
		..
		tostring(
			country.RegionCount
		)
		..
		"\nCapitals: "
		..
		tostring(
			country.CapitalCount
		)
		..
		"\nAirports: "
		..
		tostring(
			country.AirportCount
		)
		..
		"\nShipyards: "
		..
		tostring(
			country.ShipyardCount
		)
	)

	Section(
		T("capture"),

		country.AverageCapture
		and
		string.format(
			"%.2f%%",
			country.AverageCapture
		)
		or
		"N/A"
	)

	Section(
		T("defence"),

		country.AverageDefence
		and
		string.format(
			"%.2f%%",
			country.AverageDefence
		)
		or
		"N/A"
	)

	for _, region in ipairs(
		country.Regions
	) do

		local data =
			GetRegionData(
				region
			)

		if data then

			Card(
				data.Name,

				T("capture")
				..
				": "
				..
				(
					data.Capture
					and
					string.format(
						"%.1f%%",
						data.Capture
					)
					or
					"N/A"
				)
				..
				" • "
				..
				T("defence")
				..
				": "
				..
				(
					data.Defence
					and
					string.format(
						"%.1f%%",
						data.Defence
					)
					or
					"N/A"
				),

				function()

					State.SelectedRegion =
						region

					Router:Open(
						"Region"
					)
				end
			)
		end
	end

	Card(
		T("back"),
		"",
		function()
			Router:Open("Countries")
		end
	)
end

Pages.Players = function()

	ClearPage()

	UI.PageTitle.Text =
		T("players")

	UI.PageDescription.Text =
		T("localTest")

	local found =
		false

	for _, player in ipairs(
		Players:GetPlayers()
	) do

		if player ~= LocalPlayer then

			found =
				true

			Card(
				player.DisplayName,

				"@"
				..
				player.Name,

				function()

					if not IsStudio then

						Notify(
							T("error"),
							T("studioOnly")
						)

						return
					end

					local character =
						LocalPlayer.Character

					local target =
						player.Character

					local root =
						character
						and
						character:FindFirstChild(
							"HumanoidRootPart"
						)

					local targetRoot =
						target
						and
						target:FindFirstChild(
							"HumanoidRootPart"
						)

					if not root
						or
						not targetRoot
					then

						Notify(
							T("error"),
							"Character unavailable"
						)

						return
					end

					root.CFrame =
						targetRoot.CFrame
						*
						CFrame.new(
							0,
							0,
							5
						)

					State.SelectedPlayer =
						player
				end
			)
		end
	end

	if not found then

		Section(
			T("noPlayers"),
			""
		)
	end
end

--==============================================================
-- VISUAL
--==============================================================

Pages.ESP = function()

	ClearPage()

	UI.PageTitle.Text =
		T("esp")

	UI.PageDescription.Text =
		T("localTest")

	Toggle(
		T("esp"),
		ESPEnabled,

		function(value)

			ESPEnabled =
				value

			RefreshESP()
		end
	)

	Card(
		T("refresh"),
		"",
		function()

			RefreshESP()

			Notify(
				T("done"),
				T("refresh")
			)
		end
	)
end

Pages.World = function()

	ClearPage()

	UI.PageTitle.Text =
		T("world")

	UI.PageDescription.Text =
		T("localTest")

	Card(
		T("day"),
		"14:00",

		function()

			Lighting.ClockTime =
				14

			Lighting.Brightness =
				2

			Lighting.ExposureCompensation =
				0

			Lighting.FogStart =
				0

			Lighting.FogEnd =
				100000

			Lighting.GlobalShadows =
				true

			Router:Open(
				"World"
			)
		end
	)

	Card(
		T("night"),
		"00:00",

		function()

			Lighting.ClockTime =
				0

			Lighting.Brightness =
				1

			Lighting.ExposureCompensation =
				-0.3

			Lighting.FogStart =
				0

			Lighting.FogEnd =
				100000

			Lighting.GlobalShadows =
				true

			Router:Open(
				"World"
			)
		end
	)

	Card(
		T("sunset"),
		"18:30",

		function()

			Lighting.ClockTime =
				18.5

			Lighting.Brightness =
				1.5

			Lighting.ExposureCompensation =
				-0.1

			Router:Open(
				"World"
			)
		end
	)

	Card(
		T("storm"),
		"Heavy fog",

		function()

			Lighting.ClockTime =
				16

			Lighting.Brightness =
				0.8

			Lighting.ExposureCompensation =
				-0.5

			Lighting.FogStart =
				50

			Lighting.FogEnd =
				1600

			Router:Open(
				"World"
			)
		end
	)

	Card(
		T("cinematic"),
		"17:30",

		function()

			Lighting.ClockTime =
				17.5

			Lighting.Brightness =
				1

			Lighting.ExposureCompensation =
				-0.2

			Lighting.FogStart =
				0

			Lighting.FogEnd =
				5000

			Router:Open(
				"World"
			)
		end
	)

	Card(
		T("original"),
		"",

		function()

			RestoreLighting()

			Router:Open(
				"World"
			)
		end,

		GetTheme().Danger
	)

	Slider(
		T("time"),
		0,
		24,
		Lighting.ClockTime,
		0.25,

		function(value)
			Lighting.ClockTime =
				value
		end
	)

	Slider(
		T("brightness"),
		0,
		5,
		Lighting.Brightness,
		0.05,

		function(value)
			Lighting.Brightness =
				value
		end
	)

	Slider(
		T("exposure"),
		-3,
		3,
		Lighting.ExposureCompensation,
		0.05,

		function(value)
			Lighting.ExposureCompensation =
				value
		end
	)

	Slider(
		T("fog"),
		500,
		100000,
		Lighting.FogEnd,
		500,

		function(value)
			Lighting.FogEnd =
				value
		end
	)

	Toggle(
		T("shadows"),
		Lighting.GlobalShadows,

		function(value)
			Lighting.GlobalShadows =
				value
		end
	)
end

Pages.Color = function()

	ClearPage()

	UI.PageTitle.Text =
		T("color")

	UI.PageDescription.Text =
		T("localTest")

	Slider(
		T("saturation"),
		-1,
		1,
		Config.ColorSaturation,
		0.01,

		function(value)

			Config.ColorSaturation =
				value

			ApplyColor()
		end
	)

	Slider(
		T("contrast"),
		-1,
		1,
		Config.ColorContrast,
		0.01,

		function(value)

			Config.ColorContrast =
				value

			ApplyColor()
		end
	)

	Slider(
		T("colorBrightness"),
		-1,
		1,
		Config.ColorBrightness,
		0.01,

		function(value)

			Config.ColorBrightness =
				value

			ApplyColor()
		end
	)

	Card(
		T("original"),
		"",

		function()

			Config.ColorSaturation =
				0

			Config.ColorContrast =
				0

			Config.ColorBrightness =
				0

			if ColorEffect then

				ColorEffect:Destroy()

				ColorEffect =
					nil
			end

			Router:Open(
				"Color"
			)
		end,

		GetTheme().Danger
	)
end

Pages.Cubes = function()

	ClearPage()

	UI.PageTitle.Text =
		T("cubes")

	UI.PageDescription.Text =
		T("localTest")

	Toggle(
		T("cubes"),
		Config.CubesEnabled,

		function(value)

			Config.CubesEnabled =
				value

			if value then
				CreateCubes()
			else
				ClearCubes()
			end
		end
	)

	Slider(
		T("amount"),
		5,
		75,
		Config.CubesAmount,
		1,

		function(value)

			Config.CubesAmount =
				value

			if Config.CubesEnabled then
				CreateCubes()
			end
		end
	)

	Slider(
		T("size"),
		0.4,
		4,
		Config.CubesSize,
		0.1,

		function(value)

			Config.CubesSize =
				value

			for _, item in ipairs(
				CubeObjects
			) do

				if item.Part then

					item.Part.Size =
						Vector3.new(
							value,
							value,
							value
						)
				end
			end
		end
	)

	Slider(
		T("speed"),
		0,
		8,
		Config.CubesSpeed,
		0.1,

		function(value)

			Config.CubesSpeed =
				value
		end
	)

	Slider(
		T("spread"),
		20,
		150,
		Config.CubesSpread,
		5,

		function(value)

			Config.CubesSpread =
				value
		end
	)

	Slider(
		T("rotation"),
		0,
		4,
		Config.CubesRotation,
		0.1,

		function(value)

			Config.CubesRotation =
				value
		end
	)

	Slider(
		T("transparency"),
		0,
		0.9,
		Config.CubesTransparency,
		0.01,

		function(value)

			Config.CubesTransparency =
				value

			for _, item in ipairs(
				CubeObjects
			) do

				if item.Part then

					item.Part.Transparency =
						value
				end
			end
		end
	)

	Card(
		T("reset"),
		"",

		function()

			Config.CubesEnabled =
				false

			ClearCubes()

			Router:Open(
				"Cubes"
			)
		end,

		GetTheme().Danger
	)
end

Pages.Effects = function()

	ClearPage()

	UI.PageTitle.Text =
		T("effects")

	Card(
		T("cubes"),
		"",
		function()
			Router:Open("Cubes")
		end
	)
end

Pages.Visual = function()

	ClearPage()

	UI.PageTitle.Text =
		T("visual")

	UI.PageDescription.Text =
		"Visual laboratory"

	Card(
		T("esp"),
		"",
		function()
			Router:Open("ESP")
		end
	)

	Card(
		T("world"),
		"",
		function()
			Router:Open("World")
		end
	)

	Card(
		T("color"),
		"",
		function()
			Router:Open("Color")
		end
	)

	Card(
		T("effects"),
		"",
		function()
			Router:Open("Effects")
		end
	)
end

Pages.Fly = function()

	ClearPage()

	UI.PageTitle.Text =
		T("fly")

	UI.PageDescription.Text =
		"WASD • SPACE • CTRL"

	if not IsStudio then

		Section(
			T("studioOnly"),
			""
		)

		return
	end

	Toggle(
		T("fly"),
		FlyState.Enabled,

		function(value)

			if value then

				if not StartFly() then

					Notify(
						T("error"),
						"Character unavailable"
					)
				end

			else

				StopFly()
			end
		end
	)

	Slider(
		T("speed"),
		20,
		150,
		Config.FlySpeed,
		5,

		function(value)

			Config.FlySpeed =
				value
		end
	)
end

Pages.Movement = function()

	ClearPage()

	UI.PageTitle.Text =
		T("movement")

	Card(
		T("fly"),
		"WASD • SPACE • CTRL",

		function()

			Router:Open(
				"Fly"
			)
		end
	)
end

--==============================================================
-- MUSIC
--==============================================================

Pages.Music = function()

	ClearPage()

	UI.PageTitle.Text =
		T("music")

	UI.PageDescription.Text =
		T("audioId")

	local input =
		New(
			"TextBox",
			UI.PageContainer
		)

	Apply(
		input,
		{
			Size =
				UDim2.new(
					1,
					-5,
					0,
					44
				),

			BackgroundColor3 =
				GetTheme().Card,

			BorderSizePixel =
				0,

			Text = "",

			PlaceholderText =
				T("audioId"),

			PlaceholderColor3 =
				GetTheme().Muted,

			TextColor3 =
				GetTheme().Text,

			Font =
				Enum.Font.Gotham,

			TextSize =
				10,

			ClearTextOnFocus =
				false,
		}
	)

	AddCorner(
		input,
		8
	)

	Card(
		T("play"),
		"",

		function()

			local id =
				ExtractMusicId(
					input.Text
				)

			if not id then

				Notify(
					T("error"),
					T("noTrack")
				)

				return
			end

			StopMusic()

			MusicSound =
				Instance.new(
					"Sound"
				)

			MusicSound.Name =
				"TEAM_PRIME_MUSIC"

			MusicSound.SoundId =
				"rbxassetid://"
				..
				id

			MusicSound.Volume =
				Config.MusicVolume

			MusicSound.Looped =
				Config.MusicLooped

			MusicSound.Parent =
				SoundService

			MusicSound:Play()

			Notify(
				T("done"),
				T("play")
			)
		end
	)

	Card(
		T("pause"),
		"",

		function()

			if MusicSound then
				MusicSound:Pause()
			end
		end
	)

	Card(
		T("stop"),
		"",

		function()
			StopMusic()
		end,

		GetTheme().Danger
	)

	Slider(
		T("volume"),
		0,
		1,
		Config.MusicVolume,
		0.01,

		function(value)

			Config.MusicVolume =
				value

			if MusicSound then
				MusicSound.Volume =
					value
			end
		end,

		function(value)

			return string.format(
				"%d%%",
				math.floor(
					value * 100 + 0.5
				)
			)
		end
	)

	Toggle(
		T("loop"),
		Config.MusicLooped,

		function(value)

			Config.MusicLooped =
				value

			if MusicSound then
				MusicSound.Looped =
					value
			end
		end
	)
end

--==============================================================
-- WAR
--==============================================================

Pages.Targets = function()

	ClearPage()

	UI.PageTitle.Text =
		T("targets")

	local ranked = {}

	for _, region in ipairs(
		GetRegions()
	) do

		table.insert(
			ranked,
			{
				Region = region,

				Score =
					GetRegionScore(
						region
					),
			}
		)
	end

	table.sort(
		ranked,

		function(a, b)
			return a.Score >
				b.Score
		end
	)

	if #ranked == 0 then

		Section(
			T("noTarget"),
			""
		)

	else

		for index, item in ipairs(
			ranked
		) do

			if index > 25 then
				break
			end

			local data =
				GetRegionData(
					item.Region
				)

			if data then

				Card(
					"#"
					..
					tostring(
						index
					)
					..
					" "
					..
					data.Name,

					"Score: "
					..
					string.format(
						"%.1f",
						item.Score
					)
					..
					" • "
					..
					tostring(
						data.Country
						or
						"N/A"
					),

					function()

						State.SelectedRegion =
							item.Region

						Router:Open(
							"Region"
						)
					end
				)
			end
		end
	end

	Card(
		T("back"),
		"",
		function()
			Router:Open("War")
		end
	)
end

Pages.Battle = function()

	ClearPage()

	UI.PageTitle.Text =
		T("battle")

	if not State.SelectedRegion then

		Section(
			T("noTarget"),
			""
		)

		Card(
			T("regions"),
			"",
			function()
				Router:Open(
					"Regions"
				)
			end
		)

		return
	end

	local data =
		GetRegionData(
			State.SelectedRegion
		)

	if not data then
		return
	end

	local defence =
		data.Defence
		or
		50

	local capture =
		data.Capture
		or
		0

	local difficulty =
		defence
		*
		0.70
		+
		(
			100
			-
			capture
		)
		*
		0.30

	local scenarios = {
		{
			"Direct Assault",
			1.00,
			1.00,
		},

		{
			"Encirclement",
			1.12,
			0.62,
		},

		{
			"Limited Offensive",
			0.86,
			0.55,
		},

		{
			"Economic Pressure",
			0.45,
			0.10,
		},
	}

	local bestName =
		""

	local bestScore =
		-math.huge

	for _, scenario in ipairs(
		scenarios
	) do

		local ratio =
			100
			/
			math.max(
				difficulty,
				1
			)
			*
			scenario[2]

		local chance =
			50
			+
			math.log(
				math.max(
					ratio,
					0.05
				)
			)
			*
			20

		chance =
			math.clamp(
				chance,
				5,
				97
			)

		local score =
			chance
			+
			(
				100
				-
				scenario[3]
				*
				50
			)
			*
			0.25

		if score >
			bestScore
		then

			bestScore =
				score

			bestName =
				scenario[1]
		end

		Section(
			scenario[1],

			"Win chance: "
			..
			string.format(
				"%.1f%%",
				chance
			)
			..
			"\nRisk: "
			..
			string.format(
				"%.2f",
				scenario[3]
			)
		)
	end

	Section(
		"RECOMMENDED",
		bestName
	)

	Card(
		T("back"),
		"",
		function()
			Router:Open("War")
		end
	)
end

Pages.Development = function()

	ClearPage()

	UI.PageTitle.Text =
		T("development")

	local regions =
		GetRegions()

	local capitals =
		0

	local airports =
		0

	local shipyards =
		0

	for _, region in ipairs(
		regions
	) do

		local data =
			GetRegionData(
				region
			)

		if data then

			if data.Features.Capital then
				capitals += 1
			end

			if data.Features.Airport then
				airports += 1
			end

			if data.Features.Shipyard then
				shipyards += 1
			end
		end
	end

	Section(
		T("regions"),
		tostring(
			#regions
		)
	)

	Section(
		"INFRASTRUCTURE",

		"Capitals: "
		..
		tostring(
			capitals
		)
		..
		"\nAirports: "
		..
		tostring(
			airports
		)
		..
		"\nShipyards: "
		..
		tostring(
			shipyards
		)
	)

	Card(
		T("back"),
		"",
		function()
			Router:Open("War")
		end
	)
end

Pages.War = function()

	ClearPage()

	UI.PageTitle.Text =
		T("war")

	Card(
		T("targets"),
		"",
		function()
			Router:Open("Targets")
		end
	)

	Card(
		T("battle"),
		"",
		function()
			Router:Open("Battle")
		end
	)

	Card(
		T("countries"),
		"",
		function()
			Router:Open("Countries")
		end
	)

	Card(
		T("development"),
		"",
		function()
			Router:Open("Development")
		end
	)
end

--==============================================================
-- SETTINGS
--==============================================================

Pages.Language = function()

	ClearPage()

	UI.PageTitle.Text =
		T("language")

	Card(
		T("russian"),
		"RU",

		function()

			Config.Language =
				"ru"

			ApplyTheme()

			Router:Open(
				"Settings"
			)
		end
	)

	Card(
		T("english"),
		"EN",

		function()

			Config.Language =
				"en"

			ApplyTheme()

			Router:Open(
				"Settings"
			)
		end
	)
end

Pages.Design = function()

	ClearPage()

	UI.PageTitle.Text =
		T("design")

	Slider(
		T("width"),
		MobileDevice and Config.MobileMinWidth or Config.MinWidth,
		MobileDevice and Config.MobileMaxWidth or Config.MaxWidth,
		MobileDevice and Config.MobileWidth or Config.Width,
		10,

		function(value)

			if MobileDevice then
				Config.MobileWidth =
					value
			else
				Config.Width =
					value
			end

			State.NormalSize =
				GetDefaultWindowSize()

			if not State.Minimized then
				UI.Main.Size =
					State.NormalSize
			end
		end
	)

	Slider(
		T("height"),
		MobileDevice and Config.MobileMinHeight or Config.MinHeight,
		MobileDevice and Config.MobileMaxHeight or Config.MaxHeight,
		MobileDevice and Config.MobileHeight or Config.Height,
		10,

		function(value)

			if MobileDevice then
				Config.MobileHeight =
					value
			else
				Config.Height =
					value
			end

			State.NormalSize =
				GetDefaultWindowSize()

			if not State.Minimized then
				UI.Main.Size =
					State.NormalSize
			end
		end
	)

	Slider(
		T("scale"),
		0.60,
		1.25,
		MobileDevice
			and
			Config.MobileScale
			or
			Config.Scale,
		0.01,

		function(value)

			if MobileDevice then
				Config.MobileScale =
					value
			else
				Config.Scale =
					value
			end

			UI.Scale.Scale =
				value
		end,

		function(value)

			return string.format(
				"%.2fx",
				value
			)
		end
	)

	Slider(
		T("corner"),
		0,
		24,
		Config.Corner,
		1,

		function(value)

			Config.Corner =
				value

			local corner =
				UI.Main:FindFirstChildOfClass(
					"UICorner"
				)

			if corner then

				corner.CornerRadius =
					UDim.new(
						0,
						value
					)
			end
		end
	)

	Slider(
		T("animation"),
		0,
		0.5,
		Config.AnimationSpeed,
		0.01,

		function(value)

			Config.AnimationSpeed =
				value
		end
	)

	Slider(
		T("transparencyUI"),
		0,
		0.35,
		Config.Transparency,
		0.01,

		function(value)

			Config.Transparency =
				value

			UI.Sidebar.BackgroundTransparency =
				value

			UI.Content.BackgroundTransparency =
				value
		end
	)

	Slider(
		T("sidebar"),
		MobileDevice and 85 or 150,
		MobileDevice and 140 or 275,
		MobileDevice
			and
			Config.MobileSidebarWidth
			or
			Config.SidebarWidth,
		5,

		function(value)

			if MobileDevice then
				Config.MobileSidebarWidth =
					value
			else
				Config.SidebarWidth =
					value
			end

			local sidebarWidth =
				MobileDevice
				and
				Config.MobileSidebarWidth
				or
				Config.SidebarWidth

			UI.Sidebar.Size =
				UDim2.new(
					0,
					sidebarWidth,
					1,
					-20
				)

			UI.Content.Position =
				UDim2.fromOffset(
					sidebarWidth + 15,
					10
				)

			UI.Content.Size =
				UDim2.new(
					1,
					-(sidebarWidth + 25),
					1,
					-20
				)
		end
	)

	Toggle(
		T("hover"),
		Config.Hover,

		function(value)

			Config.Hover =
				value
		end
	)

	Toggle(
		T("notifications"),
		Config.Notifications,

		function(value)

			Config.Notifications =
				value
		end
	)

	Card(
		T("reset"),
		"",

		function()

			Config.Width = 900
			Config.Height = 560
			Config.Scale = 1
			Config.Corner = 12
			Config.AnimationSpeed = 0.18
			Config.Transparency = 0
			Config.SidebarWidth = 195
			Config.Hover = true
			Config.Notifications = true

			Config.MobileWidth = 380
			Config.MobileHeight = 520
			Config.MobileSidebarWidth = 105
			Config.MobileScale = 0.88

			State.NormalSize =
				GetDefaultWindowSize()

			UI.Main.Size =
				State.NormalSize

			UI.Scale.Scale =
				GetDefaultScale()

			local sidebarWidth =
				GetDefaultSidebarWidth()

			UI.Sidebar.Size =
				UDim2.new(
					0,
					sidebarWidth,
					1,
					-20
				)

			UI.Content.Position =
				UDim2.fromOffset(
					sidebarWidth + 15,
					10
				)

			UI.Content.Size =
				UDim2.new(
					1,
					-(sidebarWidth + 25),
					1,
					-20
				)

			UI.Sidebar.BackgroundTransparency =
				Config.Transparency

			UI.Content.BackgroundTransparency =
				Config.Transparency

			local corner =
				UI.Main:FindFirstChildOfClass(
					"UICorner"
				)

			if corner then

				corner.CornerRadius =
					UDim.new(
						0,
						Config.Corner
					)
			end

			Router:Open(
				"Design"
			)
		end,

		GetTheme().Danger
	)
end

Pages.Interface = function()

	ClearPage()

	UI.PageTitle.Text =
		T("interface")

	Toggle(
		T("hover"),
		Config.Hover,

		function(value)
			Config.Hover =
				value
		end
	)

	Toggle(
		T("notifications"),
		Config.Notifications,

		function(value)
			Config.Notifications =
				value
		end
	)

	Card(
		T("design"),
		"",
		function()
			Router:Open("Design")
		end
	)

	Card(
		T("language"),
		"",
		function()
			Router:Open("Language")
		end
	)
end

Pages.Settings = function()

	ClearPage()

	UI.PageTitle.Text =
		T("settings")

	Card(
		T("interface"),
		"",
		function()
			Router:Open("Interface")
		end
	)

	Card(
		T("design"),
		"",
		function()
			Router:Open("Design")
		end
	)

	Card(
		T("language"),
		"",
		function()
			Router:Open("Language")
		end
	)

	Card(
		T("theme")
		..
		": "
		..
		Config.Theme,

		"",

		function()

			if Config.Theme ==
				"Prime"
			then

				Config.Theme =
					"Glass"

			elseif Config.Theme ==
				"Glass"
			then

				Config.Theme =
					"Minimal"

			else

				Config.Theme =
					"Prime"
			end

			ApplyTheme()

			Router:Open(
				"Settings"
			)
		end
	)
end

--==============================================================
-- ADMIN / DEV
--==============================================================

Pages.Admin = function()

	ClearPage()

	UI.PageTitle.Text =
		T("admin")

	UI.PageDescription.Text =
		T("studioOnly")

	if not IsStudio then

		Section(
			T("studioOnly"),
			""
		)

		return
	end

	Section(
		T("localTest"),
		""
	)

	Card(
		"MONEY TEST",
		"Local Studio test",

		function()

			local possible = {
				Money = true,
				Cash = true,
				Balance = true,
				Gold = true,
			}

			local found =
				nil

			for _, object in ipairs(
				LocalPlayer:GetDescendants()
			) do

				if (
					object:IsA(
						"NumberValue"
					)
					or
					object:IsA(
						"IntValue"
					)
				)
					and
					possible[
						object.Name
					]
				then

					found =
						object

					break
				end
			end

			if found then

				found.Value =
					1000000

				Notify(
					T("done"),
					found.Name
				)

			else

				Notify(
					T("error"),
					"Money value not found"
				)
			end
		end
	)

	Card(
		"MANPOWER TEST",
		"Local Studio test",

		function()

			local possible = {
				Manpower = true,
				ManPower = true,
				Population = true,
			}

			local found =
				nil

			for _, object in ipairs(
				LocalPlayer:GetDescendants()
			) do

				if (
					object:IsA(
						"NumberValue"
					)
					or
					object:IsA(
						"IntValue"
					)
				)
					and
					possible[
						object.Name
					]
				then

					found =
						object

					break
				end
			end

			if found then

				found.Value =
					1000000

				Notify(
					T("done"),
					found.Name
				)

			else

				Notify(
					T("error"),
					"Manpower value not found"
				)
			end
		end
	)
end

--==============================================================
-- APPLY THEME
--==============================================================

function ApplyTheme()

	local theme =
		GetTheme()

	if UI.Main then
		UI.Main.BackgroundColor3 =
			theme.Background
	end

	if UI.TopBar then
		UI.TopBar.BackgroundColor3 =
			theme.Sidebar
	end

	if UI.Sidebar then
		UI.Sidebar.BackgroundColor3 =
			theme.Sidebar
	end

	if UI.Content then
		UI.Content.BackgroundColor3 =
			theme.Panel
	end

	if UI.TopTitle then

		UI.TopTitle.TextColor3 =
			theme.Text

		UI.TopTitle.Text =
			T("title")
	end

	if UI.TopSubtitle then

		UI.TopSubtitle.TextColor3 =
			theme.Accent

		UI.TopSubtitle.Text =
			T("subtitle")
	end

	if UI.PageTitle then
		UI.PageTitle.TextColor3 =
			theme.Text
	end

	if UI.PageDescription then
		UI.PageDescription.TextColor3 =
			theme.Muted
	end

	if UI.Status then
		UI.Status.TextColor3 =
			theme.Muted
	end

	if UI.Close then

		UI.Close.BackgroundColor3 =
			theme.Card

		UI.Close.TextColor3 =
			theme.Text
	end

	if UI.Minimize then

		UI.Minimize.BackgroundColor3 =
			theme.Card

		UI.Minimize.TextColor3 =
			theme.Text
	end

	if UI.PageContainer then
		UI.PageContainer.ScrollBarImageColor3 =
			theme.Accent
	end

	if Config.CubesEnabled then

		for _, item in ipairs(
			CubeObjects
		) do

			if item.Part then
				item.Part.Color =
					theme.Accent
			end
		end
	end

	if ESPEnabled then
		RefreshESP()
	end
end

--==============================================================
-- NAVIGATION
--==============================================================

local Navigation = {
	{
		"home",
		"Home",
	},

	{
		"regions",
		"Regions",
	},

	{
		"countries",
		"Countries",
	},

	{
		"players",
		"Players",
	},

	{
		"visual",
		"Visual",
	},

	{
		"movement",
		"Movement",
	},

	{
		"music",
		"Music",
	},

	{
		"war",
		"War",
	},

	{
		"settings",
		"Settings",
	},
}

local function RebuildSidebar()

	DisconnectList(
		State.SidebarConnections
	)

	if not UI.SidebarList then
		return
	end

	for _, child in ipairs(
		UI.SidebarList:GetChildren()
	) do

		if child:IsA(
			"GuiButton"
		) then
			child:Destroy()
		end
	end

	for index, entry in ipairs(
		Navigation
	) do

		local key =
			entry[1]

		local pageName =
			entry[2]

		local button =
			New(
				"TextButton",
				UI.SidebarList
			)

		local active =
			State.Page ==
			pageName

		Apply(
			button,
			{
				LayoutOrder =
					index,

				Size =
					UDim2.new(
						1,
						0,
						0,
						38
					),

				BackgroundColor3 =
					active
					and
					GetTheme().Accent
					or
					GetTheme().Card,

				BorderSizePixel =
					0,

				Text =
					T(key),

				TextColor3 =
					GetTheme().Text,

				Font =
					Enum.Font.GothamBold,

				TextSize =
					MobileDevice
					and
					8
					or
					10,

				TextXAlignment =
					Enum.TextXAlignment.Left,

				AutoButtonColor =
					false,

				Active =
					true,

				Selectable =
					false,

				ZIndex =
					18,
			}
		)

		AddCorner(
			button,
			8
		)

		local padding =
			Instance.new(
				"UIPadding"
			)

		padding.PaddingLeft =
			UDim.new(
				0,
				MobileDevice
				and
				8
				or
				12
			)

		padding.Parent =
			button

		TrackSidebar(
			button.Activated:Connect(
				function()

					Router:Open(
						pageName
					)
				end
			)
		)

		if Config.Hover
			and
			not MobileDevice
		then

			TrackSidebar(
				button.MouseEnter:Connect(
					function()

						if State.Page ==
							pageName
						then
							return
						end

						Animate(
							button,
							{
								BackgroundColor3 =
									GetTheme().Panel
							},
							0.08,
							Enum.EasingStyle.Quad
						)
					end
				)
			)

			TrackSidebar(
				button.MouseLeave:Connect(
					function()

						if not button.Parent then
							return
						end

						if State.Page ==
							pageName
						then

							button.BackgroundColor3 =
								GetTheme().Accent

						else

							Animate(
								button,
								{
									BackgroundColor3 =
										GetTheme().Card
								},
								0.08,
								Enum.EasingStyle.Quad
							)
						end
					end
				)
			)
		end
	end

	if IsStudio then

		local button =
			New(
				"TextButton",
				UI.SidebarList
			)

		Apply(
			button,
			{
				LayoutOrder =
					#Navigation + 1,

				Size =
					UDim2.new(
						1,
						0,
						0,
						38
					),

				BackgroundColor3 =
					State.Page ==
					"Admin"
					and
					GetTheme().Accent
					or
					GetTheme().Card,

				BorderSizePixel =
					0,

				Text =
					T("admin"),

				TextColor3 =
					GetTheme().Text,

				Font =
					Enum.Font.GothamBold,

				TextSize =
					MobileDevice
					and
					8
					or
					10,

				TextXAlignment =
					Enum.TextXAlignment.Left,

				AutoButtonColor =
					false,

				Active =
					true,

				Selectable =
					false,

				ZIndex =
					18,
			}
		)

		AddCorner(
			button,
			8
		)

		local padding =
			Instance.new(
				"UIPadding"
			)

		padding.PaddingLeft =
			UDim.new(
				0,
				MobileDevice
				and
				8
				or
				12
			)

		padding.Parent =
			button

		TrackSidebar(
			button.Activated:Connect(
				function()
					Router:Open(
						"Admin"
					)
				end
			)
		)
	end
end

--==============================================================
-- ROUTER
--==============================================================

function Router:Open(
	pageName
)

	if State.Destroyed then
		return false
	end

	if typeof(pageName) ~=
		"string"
	then
		return false
	end

	local page =
		Pages[pageName]

	if typeof(page) ~=
		"function"
	then

		warn(
			"[TEAM PRIME HUB] PAGE NOT FOUND:",
			pageName
		)

		return false
	end

	State.Page =
		pageName

	self.Name =
		pageName

	local success, err =
		pcall(
			function()
				page()
			end
		)

	if not success then

		warn(
			"[TEAM PRIME HUB] PAGE ERROR:",
			pageName,
			err
		)

		DisconnectList(
			State.PageConnections
		)

		if UI.PageContainer then

			for _, child in ipairs(
				UI.PageContainer:GetChildren()
			) do

				if child:IsA(
					"GuiObject"
				) then
					child:Destroy()
				end
			end
		end

		if UI.PageTitle then
			UI.PageTitle.Text =
				T("error")
		end

		if UI.PageDescription then
			UI.PageDescription.Text =
				tostring(
					err
				)
		end

		if UI.PageContainer then

			Section(
				T("error"),
				tostring(
					err
				)
			)

			Card(
				T("home"),
				"",

				function()
					Router:Open(
						"Home"
					)
				end
			)
		end
	end

	RebuildSidebar()

	return success
end

--==============================================================
-- BUILD GUI
--==============================================================

local old =
	PlayerGui:FindFirstChild(
		"TEAM_PRIME_CLIENT"
	)

if old then
	old:Destroy()
end

UI.ScreenGui =
	New(
		"ScreenGui",
		PlayerGui
	)

Apply(
	UI.ScreenGui,
	{
		Name =
			"TEAM_PRIME_CLIENT",

		ResetOnSpawn =
			false,

		IgnoreGuiInset =
			true,

		ZIndexBehavior =
			Enum.ZIndexBehavior.Sibling,
	}
)

UI.Main =
	New(
		"Frame",
		UI.ScreenGui
	)

Apply(
	UI.Main,
	{
		Name =
			"Main",

		AnchorPoint =
			Vector2.new(
				0.5,
				0.5
			),

		Position =
			UDim2.fromScale(
				0.5,
				0.5
			),

		Size =
			State.NormalSize,

		BackgroundColor3 =
			GetTheme().Background,

		BorderSizePixel =
			0,

		Visible =
			false,

		ClipsDescendants =
			true,

		ZIndex =
			10,
	}
)

AddCorner(
	UI.Main,
	Config.Corner
)

AddStroke(
	UI.Main,
	GetTheme().Accent,
	0.55,
	1
)

UI.Scale =
	New(
		"UIScale",
		UI.Main
	)

UI.Scale.Scale =
	GetDefaultScale()

--==============================================================
-- TOP BAR
--==============================================================

UI.TopBar =
	New(
		"Frame",
		UI.Main
	)

Apply(
	UI.TopBar,
	{
		Size =
			UDim2.new(
				1,
				0,
				0,
				62
			),

		BackgroundColor3 =
			GetTheme().Sidebar,

		BorderSizePixel =
			0,

		Active =
			true,

		ZIndex =
			50,

		ClipsDescendants =
			false,
	}
)

UI.TopTitle =
	AddLabel(
		UI.TopBar,
		T("title"),

		UDim2.fromOffset(
			18,
			7
		),

		UDim2.new(
			1,
			-150,
			0,
			25
		),

		MobileDevice
		and
		13
		or
		17,

		Enum.Font.GothamBlack,

		GetTheme().Text,

		Enum.TextXAlignment.Left
	)

UI.TopTitle.ZIndex =
	51

UI.TopSubtitle =
	AddLabel(
		UI.TopBar,
		T("subtitle"),

		UDim2.fromOffset(
			19,
			34
		),

		UDim2.new(
			1,
			-150,
			0,
			15
		),

		MobileDevice
		and
		7
		or
		9,

		Enum.Font.GothamBold,

		GetTheme().Accent,

		Enum.TextXAlignment.Left
	)

UI.TopSubtitle.ZIndex =
	51

--==============================================================
-- WINDOW BUTTONS
--==============================================================

UI.Minimize =
	New(
		"TextButton",
		UI.TopBar
	)

Apply(
	UI.Minimize,
	{
		Position =
			UDim2.new(
				1,
				-82,
				0.5,
				-16
			),

		Size =
			UDim2.fromOffset(
				32,
				32
			),

		BackgroundColor3 =
			GetTheme().Card,

		BorderSizePixel =
			0,

		Text =
			"—",

		TextColor3 =
			GetTheme().Text,

		Font =
			Enum.Font.GothamBold,

		TextSize =
			16,

		AutoButtonColor =
			false,

		Active =
			true,

		Selectable =
			false,

		ZIndex =
			100,
	}
)

AddCorner(
	UI.Minimize,
	7
)

UI.Close =
	New(
		"TextButton",
		UI.TopBar
	)

Apply(
	UI.Close,
	{
		Position =
			UDim2.new(
				1,
				-43,
				0.5,
				-16
			),

		Size =
			UDim2.fromOffset(
				32,
				32
			),

		BackgroundColor3 =
			GetTheme().Card,

		BorderSizePixel =
			0,

		Text =
			"×",

		TextColor3 =
			GetTheme().Text,

		Font =
			Enum.Font.GothamBold,

		TextSize =
			19,

		AutoButtonColor =
			false,

		Active =
			true,

		Selectable =
			false,

		ZIndex =
			100,
	}
)

AddCorner(
	UI.Close,
	7
)

--==============================================================
-- BODY
--==============================================================

UI.Body =
	New(
		"Frame",
		UI.Main
	)

Apply(
	UI.Body,
	{
		Position =
			UDim2.fromOffset(
				0,
				62
			),

		Size =
			UDim2.new(
				1,
				0,
				1,
				-62
			),

		BackgroundTransparency =
			1,

		ZIndex =
			15,
	}
)

--==============================================================
-- SIDEBAR
--==============================================================

local InitialSidebarWidth =
	GetDefaultSidebarWidth()

UI.Sidebar =
	New(
		"Frame",
		UI.Body
	)

Apply(
	UI.Sidebar,
	{
		Position =
			UDim2.fromOffset(
				10,
				10
			),

		Size =
			UDim2.new(
				0,
				InitialSidebarWidth,
				1,
				-20
			),

		BackgroundColor3 =
			GetTheme().Sidebar,

		BorderSizePixel =
			0,

		ClipsDescendants =
			true,

		ZIndex =
			16,
	}
)

AddCorner(
	UI.Sidebar,
	10
)

UI.SidebarList =
	New(
		"ScrollingFrame",
		UI.Sidebar
	)

Apply(
	UI.SidebarList,
	{
		Position =
			UDim2.fromOffset(
				8,
				10
			),

		Size =
			UDim2.new(
				1,
				-16,
				1,
				-20
			),

		BackgroundTransparency =
			1,

		BorderSizePixel =
			0,

		ScrollBarThickness =
			2,

		ScrollBarImageColor3 =
			GetTheme().Accent,

		AutomaticCanvasSize =
			Enum.AutomaticSize.Y,

		CanvasSize =
			UDim2.new(),

		ZIndex =
			17,
	}
)

local sidebarLayout =
	Instance.new(
		"UIListLayout"
	)

sidebarLayout.Padding =
	UDim.new(
		0,
		6
	)

sidebarLayout.SortOrder =
	Enum.SortOrder.LayoutOrder

sidebarLayout.Parent =
	UI.SidebarList

--==============================================================
-- CONTENT
--==============================================================

UI.Content =
	New(
		"Frame",
		UI.Body
	)

Apply(
	UI.Content,
	{
		Position =
			UDim2.fromOffset(
				InitialSidebarWidth + 15,
				10
			),

		Size =
			UDim2.new(
				1,
				-(InitialSidebarWidth + 25),
				1,
				-20
			),

		BackgroundColor3 =
			GetTheme().Panel,

		BorderSizePixel =
			0,

		ClipsDescendants =
			true,

		ZIndex =
			16,
	}
)

AddCorner(
	UI.Content,
	10
)

UI.PageTitle =
	AddLabel(
		UI.Content,
		"",

		UDim2.fromOffset(
			20,
			13
		),

		UDim2.new(
			1,
			-40,
			0,
			28
		),

		MobileDevice
		and
		15
		or
		20,

		Enum.Font.GothamBlack,

		GetTheme().Text,

		Enum.TextXAlignment.Left
	)

UI.PageDescription =
	AddLabel(
		UI.Content,
		"",

		UDim2.fromOffset(
			20,
			42
		),

		UDim2.new(
			1,
			-40,
			0,
			20
		),

		MobileDevice
		and
		7
		or
		9,

		Enum.Font.Gotham,

		GetTheme().Muted,

		Enum.TextXAlignment.Left
	)

UI.PageContainer =
	New(
		"ScrollingFrame",
		UI.Content
	)

Apply(
	UI.PageContainer,
	{
		Position =
			UDim2.fromOffset(
				15,
				70
			),

		Size =
			UDim2.new(
				1,
				-30,
				1,
				-85
			),

		BackgroundTransparency =
			1,

		BorderSizePixel =
			0,

		ScrollBarThickness =
			3,

		ScrollBarImageColor3 =
			GetTheme().Accent,

		AutomaticCanvasSize =
			Enum.AutomaticSize.Y,

		CanvasSize =
			UDim2.new(),

		ZIndex =
			17,
	}
)

local pageLayout =
	Instance.new(
		"UIListLayout"
	)

pageLayout.Padding =
	UDim.new(
		0,
		7
	)

pageLayout.SortOrder =
	Enum.SortOrder.LayoutOrder

pageLayout.Parent =
	UI.PageContainer

UI.Status =
	AddLabel(
		UI.Main,
		"● "
		..
		T("online"),

		UDim2.new(
			0,
			25,
			1,
			-24
		),

		UDim2.fromOffset(
			300,
			18
		),

		MobileDevice
		and
		7
		or
		9,

		Enum.Font.GothamBold,

		GetTheme().Muted,

		Enum.TextXAlignment.Left
	)

UI.Status.ZIndex =
	30

--==============================================================
-- DRAG
--==============================================================

local function IsInside(
	gui,
	point
)

	if not gui
		or
		not gui.Parent
	then
		return false
	end

	local position =
		gui.AbsolutePosition

	local size =
		gui.AbsoluteSize

	return
		point.X >= position.X
		and
		point.X <=
			position.X + size.X
		and
		point.Y >= position.Y
		and
		point.Y <=
			position.Y + size.Y
end

local function IsControl(point)

	return
		IsInside(
			UI.Close,
			point
		)
		or
		IsInside(
			UI.Minimize,
			point
		)
end

Track(
	UI.TopBar.InputBegan:Connect(
		function(input)

			if State.Destroyed
				or
				not State.Started
			then
				return
			end

			if State.Minimized then
				return
			end

			local valid =
				input.UserInputType ==
				Enum.UserInputType.MouseButton1
				or
				input.UserInputType ==
				Enum.UserInputType.Touch

			if not valid then
				return
			end

			if IsControl(
				input.Position
			) then
				return
			end

			State.Dragging =
				true

			State.DragStart =
				input.Position

			State.DragOrigin =
				UI.Main.Position
		end
	)
)

Track(
	UserInputService.InputChanged:Connect(
		function(input)

			if State.Destroyed
				or
				not State.Dragging
			then
				return
			end

			if input.UserInputType ~=
				Enum.UserInputType.MouseMovement
				and
				input.UserInputType ~=
				Enum.UserInputType.Touch
			then
				return
			end

			local delta =
				input.Position
				-
				State.DragStart

			UI.Main.Position =
				UDim2.new(

					State.DragOrigin.X.Scale,

					State.DragOrigin.X.Offset
					+
					delta.X,

					State.DragOrigin.Y.Scale,

					State.DragOrigin.Y.Offset
					+
					delta.Y
				)
		end
	)
)

Track(
	UserInputService.InputEnded:Connect(
		function(input)

			if input.UserInputType ==
				Enum.UserInputType.MouseButton1
				or
				input.UserInputType ==
				Enum.UserInputType.Touch
			then
				State.Dragging =
					false
			end
		end
	)
)

--==============================================================
-- WINDOW CONTROLS
--==============================================================

Track(
	UI.Minimize.Activated:Connect(
		function()

			if State.Destroyed
				or
				State.WindowTweening
			then
				return
			end

			State.WindowTweening =
				true

			if State.Minimized then

				State.Minimized =
					false

				UI.Body.Visible =
					true

				UI.Main.Size =
					MobileDevice
					and
					UDim2.fromOffset(
						230,
						50
					)
					or
					UDim2.fromOffset(
						340,
						58
					)

				local tween =
					Animate(
						UI.Main,
						{
							Size =
								State.NormalSize
						},
						0.22,
						Enum.EasingStyle.Quint
					)

				if tween then
					tween.Completed:Wait()
				end

			else

				State.NormalSize =
					UI.Main.Size

				State.Minimized =
					true

				local tween =
					Animate(
						UI.Main,
						{
							Size =
								MobileDevice
								and
								UDim2.fromOffset(
									230,
									50
								)
								or
								UDim2.fromOffset(
									340,
									58
								)
						},
						0.22,
						Enum.EasingStyle.Quint
					)

				if tween then
					tween.Completed:Wait()
				end

				if not State.Destroyed then
					UI.Body.Visible =
						false
				end
			end

			State.WindowTweening =
				false
		end
	)
)

Track(
	UI.Close.Activated:Connect(
		function()

			if State.Destroyed then
				return
			end

			State.Destroyed =
				true

			State.Dragging =
				false

			State.WindowTweening =
				true

			StopFly()
			ClearESP()
			ClearCubes()
			StopMusic()
			RestoreLighting()

			if ColorEffect then

				ColorEffect:Destroy()

				ColorEffect =
					nil
			end

			local main =
				UI.Main

			if main
				and
				main.Parent
			then

				local tween =
					TweenService:Create(

						main,

						TweenInfo.new(
							0.20,
							Enum.EasingStyle.Quint,
							Enum.EasingDirection.In
						),

						{
							Size =
								MobileDevice
								and
								UDim2.fromOffset(
									210,
									40
								)
								or
								UDim2.fromOffset(
									300,
									45
								),

							BackgroundTransparency =
								1,
						}
					)

				tween:Play()

				task.wait(
					0.22
				)
			end

			DisconnectList(
				State.PageConnections
			)

			DisconnectList(
				State.SidebarConnections
			)

			DisconnectList(
				State.Connections
			)

			if UI.ScreenGui
				and
				UI.ScreenGui.Parent
			then
				UI.ScreenGui:Destroy()
			end
		end
	)
)

--==============================================================
-- HOTKEY
--==============================================================

Track(
	UserInputService.InputBegan:Connect(
		function(input, processed)

			if processed
				or
				State.Destroyed
				or
				not State.Started
			then
				return
			end

			if input.KeyCode ==
				Config.HubKey
			then

				if State.Minimized then

					State.Minimized =
						false

					UI.Body.Visible =
						true

					UI.Main.Visible =
						true

					Animate(
						UI.Main,
						{
							Size =
								State.NormalSize
						},
						0.22
					)

				else

					if UI.Main.Visible then

						local fade =
							Animate(
								UI.Main,
								{
									BackgroundTransparency =
										0.35
								},
								0.08
							)

						if fade then
							fade.Completed:Wait()
						end

						if not State.Destroyed then

							UI.Main.BackgroundTransparency =
								0

							UI.Main.Visible =
								false
						end

					else

						ShowWindow()
					end
				end
			end

			if input.KeyCode ==
				Config.FlyKey
				and
				IsStudio
			then

				if FlyState.Enabled then
					StopFly()
				else
					StartFly()
				end
			end
		end
	)
)

--==============================================================
-- PLAYER EVENTS
--==============================================================

Track(
	Players.PlayerRemoving:Connect(
		function(player)

			local objects =
				ESPObjects[player]

			if objects then

				for _, object in ipairs(
					objects
				) do

					if object
						and object.Parent
					then
						object:Destroy()
					end
				end

				ESPObjects[player] =
					nil
			end
		end
	)
)

Track(
	Players.PlayerAdded:Connect(
		function()

			if ESPEnabled then

				task.delay(
					0.3,
					function()

						if not State.Destroyed
							and
							ESPEnabled
						then
							RefreshESP()
						end
					end
				)
			end
		end
	)
)

Track(
	LocalPlayer.CharacterAdded:Connect(
		function()

			StopFly()

			task.delay(
				0.35,

				function()

					if not State.Destroyed
						and
						ESPEnabled
					then
						RefreshESP()
					end
				end
			)
		end
	)
)

--==============================================================
-- RESPONSIVE UPDATE
--==============================================================

local function ApplyResponsiveLayout()

	if not UI.Main
		or
		not UI.Scale
	then
		return
	end

	local camera =
		workspace.CurrentCamera

	if not camera then
		return
	end

	local viewport =
		camera.ViewportSize

	--==========================================================
	-- PHONE
	--==========================================================

	if MobileDevice then

		local width =
			Config.MobileWidth

		local height =
			Config.MobileHeight

		-- Автоматически уменьшаем UI,
		-- если экран телефона меньше стандартного
		local availableWidth =
			math.max(
				viewport.X - 20,
				260
			)

		local availableHeight =
			math.max(
				viewport.Y - 40,
				360
			)

		local fitX =
			availableWidth
			/
			width

		local fitY =
			availableHeight
			/
			height

		local fit =
			math.min(
				fitX,
				fitY,
				1
			)

		local finalScale =
			math.min(
				Config.MobileScale,
				fit
			)

		UI.Scale.Scale =
			math.max(
				finalScale,
				0.62
			)

		UI.Main.Size =
			UDim2.fromOffset(
				width,
				height
			)

		local sidebarWidth =
			Config.MobileSidebarWidth

		UI.Sidebar.Size =
			UDim2.new(
				0,
				sidebarWidth,
				1,
				-20
			)

		UI.Content.Position =
			UDim2.fromOffset(
				sidebarWidth + 15,
				10
			)

		UI.Content.Size =
			UDim2.new(
				1,
				-(sidebarWidth + 25),
				1,
				-20
			)

	else

		--========================================================
		-- PC
		--========================================================

		UI.Scale.Scale =
			Config.Scale

		UI.Main.Size =
			UDim2.fromOffset(
				Config.Width,
				Config.Height
			)

		local sidebarWidth =
			Config.SidebarWidth

		UI.Sidebar.Size =
			UDim2.new(
				0,
				sidebarWidth,
				1,
				-20
			)

		UI.Content.Position =
			UDim2.fromOffset(
				sidebarWidth + 15,
				10
			)

		UI.Content.Size =
			UDim2.new(
				1,
				-(sidebarWidth + 25),
				1,
				-20
			)
	end

	State.NormalSize =
		UI.Main.Size
end

if Camera then
	Track(
		Camera:GetPropertyChangedSignal(
			"ViewportSize"
		):Connect(
			function()
				if not State.Destroyed then
					ApplyResponsiveLayout()
				end
			end
		)
	)
end

--==============================================================
-- SHOW WINDOW
--==============================================================

function ShowWindow()

	if State.Destroyed then
		return
	end

	State.Minimized =
		false

	UI.Body.Visible =
		true

	UI.Main.Visible =
		true

	local startWidth =
		MobileDevice
		and
		math.max(
			220,
			Config.MobileWidth - 45
		)
		or
		math.max(
			300,
			Config.Width - 80
		)

	local startHeight =
		MobileDevice
		and
		math.max(
			200,
			Config.MobileHeight - 45
		)
		or
		math.max(
			250,
			Config.Height - 60
		)

	UI.Main.Size =
		UDim2.fromOffset(
			startWidth,
			startHeight
		)

	UI.Main.BackgroundTransparency =
		1

	Animate(
		UI.Main,
		{
			Size =
				State.NormalSize,

			BackgroundTransparency =
				0,
		},
		0.25,
		Enum.EasingStyle.Quint
	)
end

--==============================================================
-- LANGUAGE SPLASH
--==============================================================

local function LanguageSplash()

	local splash =
		New(
			"Frame",
			UI.ScreenGui
		)

	Apply(
		splash,
		{
			Size =
				UDim2.fromScale(
					1,
					1
				),

			BackgroundColor3 =
				Color3.fromRGB(
					4,
					7,
					12
				),

			BorderSizePixel =
				0,

			ZIndex =
				1000,
		}
	)

	local card =
		New(
			"Frame",
			splash
		)

	Apply(
		card,
		{
			AnchorPoint =
				Vector2.new(
					0.5,
					0.5
				),

			Position =
				UDim2.fromScale(
					0.5,
					0.5
				),

			Size =
				MobileDevice
				and
				UDim2.fromOffset(
					330,
					300
				)
				or
				UDim2.fromOffset(
					560,
					330
				),

			BackgroundColor3 =
				Themes.Prime.Panel,

			BorderSizePixel =
				0,

			ZIndex =
				1001,
		}
	)

	AddCorner(
		card,
		16
	)

	AddStroke(
		card,
		Themes.Prime.Accent,
		0.45,
		1
	)

	AddLabel(
		card,
		"TEAM PRIME HUB",

		UDim2.fromOffset(
			20,
			32
		),

		UDim2.new(
			1,
			-40,
			0,
			40
		),

		MobileDevice
		and
		21
		or
		28,

		Enum.Font.GothamBlack,

		Themes.Prime.Text,

		Enum.TextXAlignment.Center
	)

	AddLabel(
		card,
		"CONTROL EUROPE",

		UDim2.fromOffset(
			20,
			73
		),

		UDim2.new(
			1,
			-40,
			0,
			20
		),

		MobileDevice
		and
		8
		or
		10,

		Enum.Font.GothamBold,

		Themes.Prime.Accent,

		Enum.TextXAlignment.Center
	)

	AddLabel(
		card,
		"ВЫБЕРИТЕ ЯЗЫК / SELECT LANGUAGE",

		UDim2.fromOffset(
			20,
			118
		),

		UDim2.new(
			1,
			-40,
			0,
			26
		),

		MobileDevice
		and
		9
		or
		12,

		Enum.Font.GothamBold,

		Themes.Prime.Text,

		Enum.TextXAlignment.Center
	)

	local ru =
		New(
			"TextButton",
			card
		)

	Apply(
		ru,
		{
			Position =
				MobileDevice
				and
				UDim2.fromOffset(
					25,
					160
				)
				or
				UDim2.fromOffset(
					45,
					175
				),

			Size =
				MobileDevice
				and
				UDim2.fromOffset(
					280,
					55
				)
				or
				UDim2.fromOffset(
					220,
					65
				),

			BackgroundColor3 =
				Themes.Prime.Card,

			BorderSizePixel =
				0,

			Text =
				"РУССКИЙ",

			TextColor3 =
				Themes.Prime.Text,

			Font =
				Enum.Font.GothamBold,

			TextSize =
				MobileDevice
				and
				11
				or
				13,

			AutoButtonColor =
				false,

			Active =
				true,

			Selectable =
				false,

			ZIndex =
				1002,
		}
	)

	AddCorner(
		ru,
		10
	)

	local en =
		New(
			"TextButton",
			card
		)

	Apply(
		en,
		{
			Position =
				MobileDevice
				and
				UDim2.fromOffset(
					25,
					225
				)
				or
				UDim2.fromOffset(
					295,
					175
				),

			Size =
				MobileDevice
				and
				UDim2.fromOffset(
					280,
					55
				)
				or
				UDim2.fromOffset(
					220,
					65
				),

			BackgroundColor3 =
				Themes.Prime.Card,

			BorderSizePixel =
				0,

			Text =
				"ENGLISH",

			TextColor3 =
				Themes.Prime.Text,

			Font =
				Enum.Font.GothamBold,

			TextSize =
				MobileDevice
				and
				11
				or
				13,

			AutoButtonColor =
				false,

			Active =
				true,

			Selectable =
				false,

			ZIndex =
				1002,
		}
	)

	AddCorner(
		en,
		10
	)

	local selected =
		false

	local function Choose(
		language,
		button
	)

		if selected
			or
			State.Destroyed
		then
			return
		end

		selected =
			true

		Config.Language =
			language

		button.BackgroundColor3 =
			Themes.Prime.Accent

		if language ==
			"ru"
		then
			button.Text =
				"ЗАПУСК..."
		else
			button.Text =
				"STARTING..."
		end

		Animate(
			button,
			{
				Size =
					MobileDevice
					and
					UDim2.fromOffset(
						290,
						60
					)
					or
					UDim2.fromOffset(
						230,
						70
					)
			},
			0.08,
			Enum.EasingStyle.Quad
		)

		task.wait(
			0.14
		)

		Animate(
			card,
			{
				Size =
					MobileDevice
					and
					UDim2.fromOffset(
						300,
						270
					)
					or
					UDim2.fromOffset(
						500,
						300
					),

				BackgroundTransparency =
					1
			},
			0.18,
			Enum.EasingStyle.Quint
		)

		Animate(
			splash,
			{
				BackgroundTransparency =
					1
			},
			0.18,
			Enum.EasingStyle.Quint
		)

		task.wait(
			0.20
		)

		if splash
			and
			splash.Parent
		then
			splash:Destroy()
		end

		State.Started =
			true

		UI.Main.Visible =
			true

		UI.TopTitle.Text =
			T("title")

		UI.TopSubtitle.Text =
			T("subtitle")

		UI.Status.Text =
			"● "
			..
			T("ready")

		ApplyTheme()
		ApplyResponsiveLayout()

		RebuildSidebar()

		Router:Open(
			"Home"
		)

		ShowWindow()
	end

	Track(
		ru.Activated:Connect(
			function()
				Choose(
					"ru",
					ru
				)
			end
		)
	)

	Track(
		en.Activated:Connect(
			function()
				Choose(
					"en",
					en
				)
			end
		)
	)

	-- Hover только на ПК
	if not MobileDevice then

		Track(
			ru.MouseEnter:Connect(
				function()

					if selected then
						return
					end

					Animate(
						ru,
						{
							BackgroundColor3 =
								Themes.Prime.Accent
						},
						0.08,
						Enum.EasingStyle.Quad
					)
				end
			)
		)

		Track(
			ru.MouseLeave:Connect(
				function()

					if selected then
						return
					end

					Animate(
						ru,
						{
							BackgroundColor3 =
								Themes.Prime.Card
						},
						0.08,
						Enum.EasingStyle.Quad
					)
				end
			)
		)

		Track(
			en.MouseEnter:Connect(
				function()

					if selected then
						return
					end

					Animate(
						en,
						{
							BackgroundColor3 =
								Themes.Prime.Accent
						},
						0.08,
						Enum.EasingStyle.Quad
					)
				end
			)
		)

		Track(
			en.MouseLeave:Connect(
				function()

					if selected then
						return
					end

					Animate(
						en,
						{
							BackgroundColor3 =
								Themes.Prime.Card
						},
						0.08,
						Enum.EasingStyle.Quad
					)
				end
			)
		)
	end
end

--==============================================================
-- BOOT
--==============================================================

print(
	"[TEAM PRIME HUB] V26 initialized:",
	LocalPlayer.Name,
	"| Device:",
	MobileDevice and "PHONE" or "PC"
)

ApplyResponsiveLayout()
LanguageSplash()
```
