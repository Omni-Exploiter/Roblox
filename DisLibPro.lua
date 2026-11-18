local DiscordLib = {}
local cloneref = cloneref or function(o) return o end
local COREGUI = cloneref(game:GetService("CoreGui"))
local Players = cloneref(game:GetService("Players"))
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")
local pfp, user, tag
local userinfo = {}
local Sections = {}
local Lighting = game:GetService("Lighting")
local ThemeUpdateConnections = {}
local currentFont = Enum.Font.GothamBold
local currentWindowSize = 1
local savedSizeBeforeMax = nil
local savedPosBeforeMax = nil
local isMaximized = false
local savedSizeBeforeMax = nil
local savedPosBeforeMax = nil
local savedAnchorBeforeMax = nil
local SettingsPanelOpen = false
local currentWindowScaleX = 1
local currentWindowScaleY = 1
local function GetAsset(id, defaultExt)
if type(id) ~= "string" or not id:match("^https?://") then
        return id
    end
    local cleanUrl = id:gsub("%?.*", "") 
    local ext = cleanUrl:match("%.(%w+)$") or defaultExt or "mp3"
    local fileName = "asset_" .. HttpService:GenerateGUID(false) .. "." .. ext
    local success, data = pcall(function() return game:HttpGet(id) end)
    if success and data then
        writefile(fileName, data)
        return getcustomasset(fileName)
    end
    return id
end

local XOR_SEEDS = {
    math.random(1,255),
    math.random(1,255),
    math.random(1,255),
    math.random(1,255)
}

local function RotateBits(v, s)
    return bit32.band(
        bit32.bor(
            bit32.lshift(v, s),
            bit32.rshift(v, 8 - s)
        ),
        255
    )
end

local function XorEncode(str)
    local buffer = table.create(#str)

    for i = 1, #str do
        local byte = string.byte(str, i)

        local k1 = XOR_SEEDS[((i - 1) % #XOR_SEEDS) + 1]
        local k2 = bit32.band((i * 73) + k1, 255)
        local k3 = RotateBits(bit32.bxor(k1, k2), (i % 7) + 1)

        local encoded = bit32.bxor(byte, k1)
        encoded = bit32.bxor(encoded, k2)
        encoded = bit32.bxor(encoded, k3)

        encoded = RotateBits(encoded, (i % 5) + 1)

        buffer[i] = string.char(encoded)
    end

    return table.concat(buffer)
end

local ENC = {
    MainFrame = XorEncode("MainFrame"),
    TopFrame = XorEncode("TopFrame"),
    Title = XorEncode("Title"),
    Userpad = XorEncode("Userpad"),
    UserIcon = XorEncode("UserIcon"),
    UserImage = XorEncode("UserImage"),
    UserCircleImage = XorEncode("UserCircleImage"),
    UserName = XorEncode("UserName"),
    UserTag = XorEncode("UserTag"),
    ServersHoldFrame = XorEncode("ServersHoldFrame"),
    ServersHold = XorEncode("ServersHold"),
    ServersHoldLayout = XorEncode("ServersHoldLayout"),
    ServersHoldPadding = XorEncode("ServersHoldPadding"),
    ChannelsHoldFrame = XorEncode("ChannelsHoldFrame"),
    ChannelsHold = XorEncode("ChannelsHold"),
    ChannelsHoldLayout = XorEncode("ChannelsHoldLayout"),
    Shadow = XorEncode("Shadow"),
    ServerSelectionBg = XorEncode("ServerSelectionBg"),
    ServerIcon = XorEncode("ServerIcon"),
    ServerIconBorder = XorEncode("ServerIconBorder"),
    ChannelSelectionBg = XorEncode("ChannelSelectionBg"),
    ChannelGlow = XorEncode("ChannelGlow"),
    ChannelIndicator = XorEncode("ChannelIndicator"),
    ChannelIcon = XorEncode("ChannelIcon"),
    ChannelLabel = XorEncode("ChannelLabel"),
    SectionLayout = XorEncode("SectionLayout"),
    SectionPadding = XorEncode("SectionPadding"),
    SectionTitle = XorEncode("SectionTitle"),
    Ripple = XorEncode("Ripple"),
    ButtonTitle = XorEncode("ButtonTitle"),
    ButtonDesc = XorEncode("ButtonDesc"),
    ToggleLabel = XorEncode("ToggleLabel"),
    ToggleDesc = XorEncode("ToggleDesc"),
    ToggleFrame = XorEncode("ToggleFrame"),
    ToggleFill = XorEncode("ToggleFill"),
    ToggleCircle = XorEncode("ToggleCircle"),
    ToggleFillGradient = XorEncode("ToggleFillGradient"),
    BindTitle = XorEncode("BindTitle"),
    BindDesc = XorEncode("BindDesc"),
    BindButtonBorder = XorEncode("BindButtonBorder"),
    BindButton = XorEncode("BindButton"),
    STitle = XorEncode("STitle"),
    SVal = XorEncode("SVal"),
    SDesc = XorEncode("SDesc"),
    SB = XorEncode("SB"),
    SFL = XorEncode("SFL"),
    SFG = XorEncode("SFG"),
    SBtn = XorEncode("SBtn"),
    DTitle = XorEncode("DTitle"),
    DDesc = XorEncode("DDesc"),
    DArrow = XorEncode("DArrow"),
    MDTitle = XorEncode("MDTitle"),
    MDCount = XorEncode("MDCount"),
    MDDesc = XorEncode("MDDesc"),
    MDArrow = XorEncode("MDArrow"),
    MDList = XorEncode("MDList"),
    TTBTitle = XorEncode("TTBTitle"),
    TTBDesc = XorEncode("TTBDesc"),
    TSTitle = XorEncode("TSTitle"),
    TSDesc = XorEncode("TSDesc"),
    TextboxTitle = XorEncode("TextboxTitle"),
    TextboxDesc = XorEncode("TextboxDesc"),
    ParagraphTitle = XorEncode("ParagraphTitle"),
    ParagraphContent = XorEncode("ParagraphContent"),
    ColorDisplay = XorEncode("ColorDisplay"),
    ColorButton = XorEncode("ColorButton"),
    ColorButtonBorder = XorEncode("ColorButtonBorder"),
    CPTitle = XorEncode("CPTitle"),
    CPOverlay = XorEncode("CPOverlay"),
    CPPopup = XorEncode("CPPopup"),
    SearchBox = XorEncode("SearchBox"),
    DropdownList = XorEncode("DropdownList"),
    TC = XorEncode("TC"),
    TF = XorEncode("TF"),
    TCircle = XorEncode("TCircle"),
    TBtn = XorEncode("TBtn"),
    SF = XorEncode("SF"),
    SV = XorEncode("SV"),
    CK = XorEncode("CK"),
    OL = XorEncode("OL"),
    WindowControls      = XorEncode("WindowControls"),
    CtrlBtn_Maximize    = XorEncode("CtrlBtn_Maximize"),
    CtrlBtn_Minimize    = XorEncode("CtrlBtn_Minimize"),
    CtrlBtn_Settings    = XorEncode("CtrlBtn_Settings"),
    CtrlBtn_Search      = XorEncode("CtrlBtn_Search"),
    SearchOverlay       = XorEncode("SearchOverlay"),
    SearchPanel         = XorEncode("SearchPanel"),
    SearchInput         = XorEncode("SearchInput"),
    SearchResults       = XorEncode("SearchResults"),
    SearchResultItem    = XorEncode("SearchResultItem"),
    SettingsOverlay     = XorEncode("SettingsOverlay"),
    SettingsPanel       = XorEncode("SettingsPanel"),
    SettingsTitle       = XorEncode("SettingsTitle"),
    SettingsClose       = XorEncode("SettingsClose"),
    SettingsContent     = XorEncode("SettingsContent"),
    SettingsSearch      = XorEncode("SettingsSearch"),
    SettingsSection     = XorEncode("SettingsSection"),
    SettingsOption      = XorEncode("SettingsOption"),
    RestoreBtn          = XorEncode("RestoreBtn"),
    CloseBtn            = XorEncode("CloseBtn"),
    MaxBtn              = XorEncode("MaxBtn"),
    MinBtn              = XorEncode("MinBtn"),
    SetBtn              = XorEncode("SetBtn"),
    SearchBtn           = XorEncode("SearchBtn"),
    SearchHint          = XorEncode("SearchHint"),
    BorderHolder = XorEncode("BorderHolder"),
    BorderFrame = XorEncode("BorderFrame"),
    ProgressBg = XorEncode("ProgressBg"),
    ProgressFill = XorEncode("ProgressFill"),
    AccentBar = XorEncode("AccentBar"),
    IconFrame = XorEncode("IconFrame"),
    Icon = XorEncode("Icon"),
    CloseBtn = XorEncode("CloseBtn"),
    NotificationMain = XorEncode("NotificationMain"),
    GradientBorder = XorEncode("GradientBorder"),
    ContentFrame = XorEncode("ContentFrame"),
    Background = XorEncode("Background"),
    DialogMain = XorEncode("DialogMain"),
    Border = XorEncode("Border"),
    KeyInput = XorEncode("KeyInput"),
    AB = XorEncode("AB"),
    ABE = XorEncode("ABE"),
    SDGlow = XorEncode("SDGlow"),
    MDBtn = XorEncode("MDBtn"),
    ToggleButton = XorEncode("ToggleButton")
}

local ENC_PREFIX = {
    Seperator = XorEncode("Seperator"),
    Toggle_ = XorEncode("Toggle_"),
    Bind_ = XorEncode("Bind_"),
    Slider_ = XorEncode("Slider_"),
    ToggleSlider_ = XorEncode("ToggleSlider_"),
    ToggleTextbox_ = XorEncode("ToggleTextbox_"),
    Colorpicker_ = XorEncode("Colorpicker_"),
    Textbox_ = XorEncode("Textbox_"),
    Dropdown_ = XorEncode("Dropdown_"),
    MultiDropdown_ = XorEncode("MultiDropdown_"),
    Button_ = XorEncode("Button_"),
    Paragraph_ = XorEncode("Paragraph_"),
    Label_ = XorEncode("Label_"),
    Opt_ = XorEncode("Opt_"),
    CK_ = XorEncode("CK_"),
    SettingsRow_    = XorEncode("SettingsRow_"),
    SearchResult_   = XorEncode("SearchResult_"),
    CtrlBtn         = XorEncode("CtrlBtn"),
    OL_ = XorEncode("OL_"),
    DialogButton_ = XorEncode("DialogButton_"),
    Model_ = XorEncode("Model_"),
    Audio_ = XorEncode("Audio_"),
    Video_ = XorEncode("Video_"),
    Image_ = XorEncode("Image_"),
    SectionFrame = XorEncode("SectionFrame")
}

getgenv().ABC3728 = false
getgenv().ABC3616 = false
getgenv().ABC7472 = false
getgenv().ABC8281 = false

local function protectGui(gui)
    if get_hidden_gui or gethui then
        gui.Parent = (get_hidden_gui or gethui)()
    elseif syn and syn.protect_gui then
        syn.protect_gui(gui)
        gui.Parent = game.CoreGui
    elseif game.CoreGui:FindFirstChild("RobloxGui") then
        gui.Parent = game.CoreGui:FindFirstChild("RobloxGui")
    else
        gui.Parent = game.CoreGui
    end
end
local Themes = {
    Dark = {
        Main = Color3.fromRGB(25, 25, 30),
        Secondary = Color3.fromRGB(35, 35, 42),
        Tertiary = Color3.fromRGB(45, 45, 55),
        Accent = Color3.fromRGB(100, 140, 255),
        AccentGradient = Color3.fromRGB(140, 100, 255),
        Text = Color3.fromRGB(255, 255, 255),
        TextMuted = Color3.fromRGB(160, 165, 175),
        Userpad = Color3.fromRGB(30, 30, 38),
        UserIcon = Color3.fromRGB(40, 40, 50),
        Hover = Color3.fromRGB(55, 55, 68),
        Border = Color3.fromRGB(60, 60, 75),
        Shadow = Color3.fromRGB(0, 0, 0),
        ServerBorder = Color3.fromRGB(100, 140, 255),
        NotificationBg = Color3.fromRGB(30, 30, 38),
        NotificationBorder = Color3.fromRGB(100, 140, 255)
    },
    Light = {
        Main = Color3.fromRGB(240, 242, 248),
        Secondary = Color3.fromRGB(228, 230, 238),
        Tertiary = Color3.fromRGB(215, 218, 228),
        Accent = Color3.fromRGB(80, 120, 255),
        AccentGradient = Color3.fromRGB(120, 80, 255),
        Text = Color3.fromRGB(20, 20, 30),
        TextMuted = Color3.fromRGB(120, 125, 140),
        Userpad = Color3.fromRGB(235, 237, 244),
        UserIcon = Color3.fromRGB(220, 222, 232),
        Hover = Color3.fromRGB(240, 242, 250),
        Border = Color3.fromRGB(180, 185, 200),
        Shadow = Color3.fromRGB(100, 100, 120),
        ServerBorder = Color3.fromRGB(80, 120, 255),
        NotificationBg = Color3.fromRGB(235, 237, 244),
        NotificationBorder = Color3.fromRGB(80, 120, 255)
    },
    Amoled = {
        Main = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(8, 8, 12),
        Tertiary = Color3.fromRGB(15, 15, 22),
        Accent = Color3.fromRGB(100, 140, 255),
        AccentGradient = Color3.fromRGB(140, 100, 255),
        Text = Color3.fromRGB(255, 255, 255),
        TextMuted = Color3.fromRGB(140, 145, 155),
        Userpad = Color3.fromRGB(5, 5, 10),
        UserIcon = Color3.fromRGB(12, 12, 18),
        Hover = Color3.fromRGB(20, 20, 30),
        Border = Color3.fromRGB(30, 30, 40),
        Shadow = Color3.fromRGB(0, 0, 0),
        ServerBorder = Color3.fromRGB(100, 140, 255),
        NotificationBg = Color3.fromRGB(5, 5, 10),
        NotificationBorder = Color3.fromRGB(100, 140, 255)
    }
}
local PredefinedColors = {
    White = Color3.fromRGB(255, 255, 255),
    Black = Color3.fromRGB(0, 0, 0),
    Red = Color3.fromRGB(255, 0, 0),
    Green = Color3.fromRGB(0, 255, 0),
    Blue = Color3.fromRGB(0, 0, 255),
    Yellow = Color3.fromRGB(255, 255, 0),
    Cyan = Color3.fromRGB(0, 255, 255),
    Magenta = Color3.fromRGB(255, 0, 255),
    Orange = Color3.fromRGB(255, 165, 0),
    Purple = Color3.fromRGB(128, 0, 128),
    Pink = Color3.fromRGB(255, 192, 203),
    Brown = Color3.fromRGB(165, 42, 42),
    Gray = Color3.fromRGB(128, 128, 128),
    Silver = Color3.fromRGB(192, 192, 192),
    Gold = Color3.fromRGB(255, 215, 0),
    DiscordBlurple = Color3.fromRGB(88, 101, 242),
    DiscordGreen = Color3.fromRGB(87, 242, 135),
    DiscordRed = Color3.fromRGB(242, 63, 67),
    NeonPink = Color3.fromRGB(255, 20, 147),
    NeonBlue = Color3.fromRGB(77, 77, 255),
    Midnight = Color3.fromRGB(25, 25, 50),
    Ocean = Color3.fromRGB(0, 105, 148),
    Lava = Color3.fromRGB(255, 69, 0),
    Ice = Color3.fromRGB(173, 216, 230),
    Mint = Color3.fromRGB(189, 252, 201)
}

local AdvancedThemes = {
    Hacker = {Main=Color3.fromRGB(0,10,0),Secondary=Color3.fromRGB(0,20,0),Tertiary=Color3.fromRGB(0,35,0),Accent=Color3.fromRGB(0,255,0),AccentGradient=Color3.fromRGB(0,180,0),Text=Color3.fromRGB(0,255,0),TextMuted=Color3.fromRGB(0,150,0),Hover=Color3.fromRGB(0,50,0),Border=Color3.fromRGB(0,80,0),Shadow=Color3.fromRGB(0,0,0),ServerBorder=Color3.fromRGB(0,255,0),NotificationBg=Color3.fromRGB(0,15,0),NotificationBorder=Color3.fromRGB(0,255,0),Userpad=Color3.fromRGB(0,15,0),UserIcon=Color3.fromRGB(0,25,0)},
    ["Mario Bros"] = {Main=Color3.fromRGB(40,30,30),Secondary=Color3.fromRGB(60,20,20),Tertiary=Color3.fromRGB(80,30,30),Accent=Color3.fromRGB(255,50,50),AccentGradient=Color3.fromRGB(255,150,50),Text=Color3.fromRGB(255,255,255),TextMuted=Color3.fromRGB(255,200,150),Hover=Color3.fromRGB(100,40,40),Border=Color3.fromRGB(255,215,0),Shadow=Color3.fromRGB(0,0,0),ServerBorder=Color3.fromRGB(255,215,0),NotificationBg=Color3.fromRGB(50,20,20),NotificationBorder=Color3.fromRGB(255,50,50),Userpad=Color3.fromRGB(50,20,20),UserIcon=Color3.fromRGB(70,25,25)},
    ["Ocean Blue"] = {Main=Color3.fromRGB(10,20,40),Secondary=Color3.fromRGB(15,30,60),Tertiary=Color3.fromRGB(20,45,80),Accent=Color3.fromRGB(0,150,255),AccentGradient=Color3.fromRGB(0,200,200),Text=Color3.fromRGB(200,230,255),TextMuted=Color3.fromRGB(100,160,200),Hover=Color3.fromRGB(30,60,100),Border=Color3.fromRGB(0,100,200),Shadow=Color3.fromRGB(0,0,20),ServerBorder=Color3.fromRGB(0,150,255),NotificationBg=Color3.fromRGB(12,25,50),NotificationBorder=Color3.fromRGB(0,200,255),Userpad=Color3.fromRGB(12,25,50),UserIcon=Color3.fromRGB(18,35,65)},
    Sunset = {Main=Color3.fromRGB(40,20,30),Secondary=Color3.fromRGB(60,25,40),Tertiary=Color3.fromRGB(80,30,50),Accent=Color3.fromRGB(255,100,50),AccentGradient=Color3.fromRGB(255,50,150),Text=Color3.fromRGB(255,220,200),TextMuted=Color3.fromRGB(200,150,130),Hover=Color3.fromRGB(100,35,60),Border=Color3.fromRGB(255,150,100),Shadow=Color3.fromRGB(20,0,10),ServerBorder=Color3.fromRGB(255,100,50),NotificationBg=Color3.fromRGB(50,22,35),NotificationBorder=Color3.fromRGB(255,150,100),Userpad=Color3.fromRGB(50,22,35),UserIcon=Color3.fromRGB(65,28,45)},
    ["Neon City"] = {Main=Color3.fromRGB(10,5,25),Secondary=Color3.fromRGB(20,10,40),Tertiary=Color3.fromRGB(30,15,55),Accent=Color3.fromRGB(255,0,255),AccentGradient=Color3.fromRGB(0,255,255),Text=Color3.fromRGB(255,255,255),TextMuted=Color3.fromRGB(200,150,255),Hover=Color3.fromRGB(40,20,70),Border=Color3.fromRGB(255,0,255),Shadow=Color3.fromRGB(0,0,0),ServerBorder=Color3.fromRGB(0,255,255),NotificationBg=Color3.fromRGB(15,8,30),NotificationBorder=Color3.fromRGB(255,0,255),Userpad=Color3.fromRGB(15,8,30),UserIcon=Color3.fromRGB(25,12,45)},
    Cyberpunk = {Main=Color3.fromRGB(15,5,25),Secondary=Color3.fromRGB(25,10,40),Tertiary=Color3.fromRGB(40,15,55),Accent=Color3.fromRGB(255,200,0),AccentGradient=Color3.fromRGB(255,0,255),Text=Color3.fromRGB(255,255,100),TextMuted=Color3.fromRGB(200,150,50),Hover=Color3.fromRGB(50,20,70),Border=Color3.fromRGB(255,200,0),Shadow=Color3.fromRGB(0,0,0),ServerBorder=Color3.fromRGB(255,0,255),NotificationBg=Color3.fromRGB(20,8,30),NotificationBorder=Color3.fromRGB(255,200,0),Userpad=Color3.fromRGB(20,8,30),UserIcon=Color3.fromRGB(30,12,45)},
    Sakura = {Main=Color3.fromRGB(40,25,35),Secondary=Color3.fromRGB(55,30,45),Tertiary=Color3.fromRGB(70,35,55),Accent=Color3.fromRGB(255,150,200),AccentGradient=Color3.fromRGB(255,200,220),Text=Color3.fromRGB(255,220,240),TextMuted=Color3.fromRGB(200,150,180),Hover=Color3.fromRGB(85,40,65),Border=Color3.fromRGB(255,180,210),Shadow=Color3.fromRGB(20,10,15),ServerBorder=Color3.fromRGB(255,150,200),NotificationBg=Color3.fromRGB(45,28,38),NotificationBorder=Color3.fromRGB(255,200,220),Userpad=Color3.fromRGB(45,28,38),UserIcon=Color3.fromRGB(60,32,48)},
    Lava = {Main=Color3.fromRGB(40,10,5),Secondary=Color3.fromRGB(55,15,8),Tertiary=Color3.fromRGB(70,20,10),Accent=Color3.fromRGB(255,100,0),AccentGradient=Color3.fromRGB(255,200,0),Text=Color3.fromRGB(255,200,150),TextMuted=Color3.fromRGB(200,120,80),Hover=Color3.fromRGB(85,25,15),Border=Color3.fromRGB(255,150,0),Shadow=Color3.fromRGB(20,5,0),ServerBorder=Color3.fromRGB(255,100,0),NotificationBg=Color3.fromRGB(45,12,8),NotificationBorder=Color3.fromRGB(255,200,0),Userpad=Color3.fromRGB(45,12,8),UserIcon=Color3.fromRGB(60,18,10)},
    Ice = {Main=Color3.fromRGB(20,30,50),Secondary=Color3.fromRGB(25,40,65),Tertiary=Color3.fromRGB(30,50,80),Accent=Color3.fromRGB(100,200,255),AccentGradient=Color3.fromRGB(200,230,255),Text=Color3.fromRGB(220,240,255),TextMuted=Color3.fromRGB(150,190,220),Hover=Color3.fromRGB(35,60,95),Border=Color3.fromRGB(150,210,255),Shadow=Color3.fromRGB(0,10,30),ServerBorder=Color3.fromRGB(100,200,255),NotificationBg=Color3.fromRGB(22,35,55),NotificationBorder=Color3.fromRGB(200,230,255),Userpad=Color3.fromRGB(22,35,55),UserIcon=Color3.fromRGB(28,45,70)},
    Vampire = {Main=Color3.fromRGB(30,5,10),Secondary=Color3.fromRGB(45,10,15),Tertiary=Color3.fromRGB(60,15,20),Accent=Color3.fromRGB(200,0,0),AccentGradient=Color3.fromRGB(150,0,50),Text=Color3.fromRGB(255,200,200),TextMuted=Color3.fromRGB(200,120,120),Hover=Color3.fromRGB(75,20,25),Border=Color3.fromRGB(150,0,0),Shadow=Color3.fromRGB(15,0,0),ServerBorder=Color3.fromRGB(200,0,0),NotificationBg=Color3.fromRGB(35,8,12),NotificationBorder=Color3.fromRGB(150,0,50),Userpad=Color3.fromRGB(35,8,12),UserIcon=Color3.fromRGB(50,12,18)}
}
local CONFIG_DIR = "DisLibPro/Configs"
local currentConfigData = {}

local function sanitizeForSave(value)
    local t = typeof(value)
    if t == "Color3" then
        return {R = value.R, G = value.G, B = value.B}
    elseif t == "table" then
        local new = {}
        for k, v in pairs(value) do
            if type(k) == "string" then new[k] = sanitizeForSave(v) end
        end
        return new
    elseif t == "string" or t == "number" or t == "boolean" or value == nil then
        return value
    end
    return nil
end

function DiscordLib:SaveConfig(configName)
    if not (writefile and makefolder and isfolder) then return false end
    configName = tostring(configName or getgenv().ConfigName or "Default")
    local filePath = CONFIG_DIR .. "/" .. configName .. ".json"
    local function ensureFolder(path)
        local current = ""
        for folder in string.gmatch(path, "[^/]+") do
            current = (current == "" and folder) or (current .. "/" .. folder)
            local ok, exists = pcall(isfolder, current)
            if not ok or not exists then pcall(makefolder, current) end
        end
    end
    ensureFolder(CONFIG_DIR)
    local settings = self:ExportSettings()
    local saveData = {
        windowSize = settings.windowSize,
        windowSizeX = settings.windowSizeX,
        windowSizeY = settings.windowSizeY,
        font = settings.font,
        themeName = settings.themeName,
        theme = sanitizeForSave(settings.theme)
    }
    local ok, encoded = pcall(function() return HttpService:JSONEncode(saveData) end)
    if not ok then return false end
    local success = pcall(function() writefile(filePath, encoded) end)
    if success then currentConfigData = saveData end
    return success
end

function DiscordLib:LoadConfig(configName)
    configName = tostring(configName or getgenv().ConfigName or "Default")
    local filePath = CONFIG_DIR .. "/" .. configName .. ".json"
    local exists = false
    if isfile then
        local ok, r = pcall(isfile, filePath); exists = ok and r
    else
        local ok, r = pcall(readfile, filePath); exists = ok and r
    end
    if not exists then return false end
    local content = readfile(filePath)
    local ok, data = pcall(function() return HttpService:JSONDecode(content) end)
    if not ok or type(data) ~= "table" then return false end
    currentConfigData = data
    if data.windowSize then pcall(function() self:SetWindowSize(data.windowSize) end) end
    if data.windowSizeX and data.windowSizeY then
        pcall(function() self:SetWindowSize(data.windowSizeX, data.windowSizeY) end)
    end
    if data.themeName then
        pcall(function() self:SetTheme(data.themeName) end)
    elseif data.theme and next(data.theme) then
        local t = {}
        for k, v in pairs(data.theme) do
            if type(v) == "table" and v.R and v.G and v.B then
                t[k] = Color3.new(v.R, v.G, v.B)
            end
        end
        if data.font and Enum.Font[data.font] then t.Font = Enum.Font[data.font] end
        if next(t) then pcall(function() self:SetAdvancedTheme(t) end) end
    end
    return true
end

function DiscordLib:DeleteConfig(configName)
    configName = tostring(configName or getgenv().ConfigName or "Default")
    local filePath = CONFIG_DIR .. "/" .. configName .. ".json"
    local ok = pcall(function() delfile(filePath) end)
    if ok then currentConfigData = {} end
    return ok
end

function DiscordLib:GetConfigInfo(configName)
    configName = tostring(configName or getgenv().ConfigName or "Default")
    local filePath = CONFIG_DIR .. "/" .. configName .. ".json"
    local exists = isfile and isfile(filePath)
    if not exists then return nil end
    local content = readfile(filePath)
    local ok, data = pcall(function() return HttpService:JSONDecode(content) end)
    return ok and data or nil
end
local currentTheme = Themes.Dark
local currentTransparency = 0

local ServerButtons = {}
local ServerChannels = {}

local function CreateFrame(e,t,n,o,i,s,r)
  local a=Instance.new("Frame")
  a.Name=t or XorEncode("");a.Parent=e;a.BackgroundColor3=n or currentTheme.Tertiary
  a.BackgroundTransparency=o ~= nil and o or 1;a.BorderSizePixel=0
  a.Size=i or UDim2.new(0,370,0,50);a.Position=s or UDim2.new(0,0,0,0)
  a.ZIndex=r or 1;a.ClipsDescendants=true;return a
end

local function CreateCorner(e,t)
  local n=Instance.new("UICorner")
  n.CornerRadius=UDim.new(0,t or 6);n.Name=EncriptyText(math.random(6,12));n.Parent=e;return n
end

local function CreateLabel(e,t,n,o,i,s,r,a,l)
  local c=Instance.new("TextLabel")
  c.Name=t or XorEncode("");c.Parent=e;c.BackgroundTransparency=1
  c.Size=r or UDim2.new(0,200,0,20);c.Position=a or UDim2.new(0,10,0,0)
  c.Font=s or currentFont;c.Text=n or XorEncode("");c.TextColor3=o or currentTheme.Text
  c.TextSize=i or 14;c.TextXAlignment=Enum.TextXAlignment.Left;c.ZIndex=l or 7;return c
end

local function CreateTextButton(e,t,n,o,i)
  local s=Instance.new("TextButton")
  s.Name=t or XorEncode("");s.Parent=e;s.BackgroundColor3=currentTheme.Tertiary;s.BorderSizePixel=0
  s.Size=n or UDim2.new(0,200,0,30);s.Position=o or UDim2.new(0,0,0,0)
  s.Text=XorEncode("");s.Font=currentFont;s.TextColor3=currentTheme.Text;s.TextSize=14
  s.AutoButtonColor=false;s.ZIndex=i or 7;s.ClipsDescendants=true;return s
end

function EncriptyText(Y)
local length = Y or math.random(10, 20)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end

if not getgenv().NewNameY or getgenv().NewNameY == nil or getgenv().NewNameY == "" then
    getgenv().NewNameY = EncriptyText()
else
    for _, XP in pairs(game:GetService("CoreGui"):GetDescendants()) do
        if XP.Name == getgenv().NewNameY then XP:Destroy() end
    end
end

if not getgenv().NameButton3817 or getgenv().NameButton3817 == nil or getgenv().NameButton3817 == "" then
    getgenv().NameButton3817 = EncriptyText()
else
    for _, XP in pairs(game:GetService("CoreGui"):GetDescendants()) do
        if XP.Name == getgenv().NameButton3817 then XP:Destroy() end
    end
end

local activeNotifications = {}
local currentServer = ""
local currentChannel = ""

pcall(function()
    userinfo = HttpService:JSONDecode(readfile("discordlibinfo.txt"));
end)
pfp = userinfo["pfp"] or "https://www.roblox.com/headshot-thumbnail/image?userId=" .. Players.LocalPlayer.UserId .. "&width=420&height=420&format=png"
user = userinfo["user"] or Players.LocalPlayer.Name
tag = userinfo["tag"] or tostring(math.random(1000, 9999))

local function CreateShadow(e,t,n)
  local o=Instance.new("ImageLabel")
  o.Name=ENC.Shadow;o.Parent=e;o.BackgroundTransparency=1
  o.Image="rbxassetid://6014261993";o.ImageColor3=currentTheme.Shadow
  o.ImageTransparency=0.7;o.ScaleType=Enum.ScaleType.Slice
  o.SliceCenter=Rect.new(49,49,49,49)
  o.Size=t or UDim2.new(1,30,1,30)
  o.Position=n or UDim2.new(0,-15,0,-15)
  o.ZIndex=0;return o
end

local function MakeDraggable(e,t)
  local n,o,i,s
  e.InputBegan:Connect(function(e)
    if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then
      n=true;i=e.Position;s=t.Position
      e.Changed:Connect(function()if e.UserInputState==Enum.UserInputState.End then n=false end end)
    end
  end)
  e.InputChanged:Connect(function(e)
    if e.UserInputType==Enum.UserInputType.MouseMovement or e.UserInputType==Enum.UserInputType.Touch then o=e end
  end)
  UserInputService.InputChanged:Connect(function(e)
    if e==o and n then
      local r=e.Position-i
      t.Position=UDim2.new(s.X.Scale,s.X.Offset+r.X,s.Y.Scale,s.Y.Offset+r.Y)
    end
  end)
end

local Discord = Instance.new("ScreenGui")
Discord.IgnoreGuiInset = true
Discord.Name = getgenv().NewNameY
protectGui(Discord)
Discord.ZIndexBehavior = Enum.ZIndexBehavior.Global
getgenv().DiscordLibParentY = Discord

local isMinimized = false
local savedSize = UDim2.new(0, 619, 0, 389)
local savedPosition = UDim2.new(0.5, 0, 0.5, 0)
local minimizeAnimating = false
local UpdateProtectedTitle = nil
function DiscordLib:MinimizeUI()
  if minimizeAnimating then return end
  minimizeAnimating=true
  local e=Discord:FindFirstChild(ENC.MainFrame)
  if not e then minimizeAnimating=false;return end
  if not isMinimized then savedSize=e.Size;savedPosition=e.Position end
  isMinimized=not isMinimized
  getgenv().IsMinimized=isMinimized
  local t=isMinimized and UDim2.new(0,0,0,0)or savedSize
  local n=isMinimized and UDim2.new(1,0,1,0)or savedPosition
  TweenService:Create(e,TweenInfo.new(0.3,Enum.EasingStyle.Quad),{Size=t,Position=n}):Play()
  task.wait(0.15)
  local o=e:FindFirstChild(ENC.ServersHoldFrame)
  local i=e:FindFirstChild(ENC.ChannelsHoldFrame)
  local s=e:FindFirstChild(ENC.Userpad)
  if o then o.Visible=not isMinimized end
  if i then i.Visible=not isMinimized end
  if s then s.Visible=not isMinimized end
  for _,t in pairs(Sections)do if t and t.Parent then t.Visible=not isMinimized end end
  if not isMinimized then
    local e=currentServer..":"..currentChannel
    for t,n in pairs(Sections)do if n and n.Parent then n.Visible=t==e end end
  end
  if type(UpdateProtectedTitle) == "function" then
    UpdateProtectedTitle(isMinimized and "[Minimized]" or (TitleSetHub or "Discord UI"))
  end
  task.wait(0.3)
  minimizeAnimating=false
end

local function createMinimizeButton()
  local e=Instance.new("ScreenGui")
  e.Name=getgenv().NameButton3817;e.ResetOnSpawn=false
  protectGui(e)
  e.ZIndexBehavior=Enum.ZIndexBehavior.Global;e.IgnoreGuiInset=true
  getgenv().Abc4717=true
  local t=100
  local n=35
  local o=math.floor(t*currentWindowSize)
  local i=math.floor(n*currentWindowSize)
  local s=Instance.new("TextButton")
  s.Name=ENC.ToggleButton;s.Parent=e;s.BackgroundColor3=currentTheme.Main;s.BorderSizePixel=0
  s.Position=UDim2.new(0.8,0,0.9,0);s.Size=UDim2.new(0,o,0,i)
  s.Font=currentFont;s.TextColor3=currentTheme.Text
  s.TextSize=math.floor(16*currentWindowSize)
  s.ZIndex=2;s.AutoButtonColor=false;s.ClipsDescendants=true;s.Draggable=true
  CreateCorner(s,math.floor(10*currentWindowSize))
  local r=CreateFrame(e,ENC.BorderHolder,nil,1,UDim2.new(0,o+4,0,i+4),UDim2.new(0.8,-2,0.9,-2),1)
  local a=CreateFrame(r,ENC.BorderFrame,currentTheme.Accent,0,UDim2.new(1,0,1,0),nil,1)
  CreateCorner(a,math.floor(12*currentWindowSize))
  local l=Instance.new("UIGradient")
  l.Rotation=45
  l.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(0.5,currentTheme.AccentGradient),ColorSequenceKeypoint.new(1,currentTheme.Accent)})
  l.Parent=a
  s:GetPropertyChangedSignal("Position"):Connect(function()
    if r and r.Parent then r.Position=UDim2.new(s.Position.X.Scale,s.Position.X.Offset-2,s.Position.Y.Scale,s.Position.Y.Offset-2)end
  end)
  TweenService:Create(l,TweenInfo.new(3,Enum.EasingStyle.Linear,Enum.EasingDirection.In,-1),{Rotation=405}):Play()
  TweenService:Create(a,TweenInfo.new(2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),{BackgroundTransparency=0.3}):Play()
  local function c()
    if not s or not s.Parent then return end
    local e=currentWindowSize or 1
    if type(e)~="number"then e=1 end
    local n=math.floor(t*e)
    local i=math.floor(35*e)
    local c=math.floor(10*e)
    local d=math.floor(12*e)
    local h=math.floor(16*e)
    s.Size=UDim2.new(0,n,0,i)
    s.TextSize=h
    local u=s:FindFirstChildOfClass("UICorner")
    if u then u.CornerRadius=UDim.new(0,c)end
    if r and r.Parent then
      r.Size=UDim2.new(0,n+4,0,i+4)
      r.Position=UDim2.new(s.Position.X.Scale,s.Position.X.Offset-2,s.Position.Y.Scale,s.Position.Y.Offset-2)
      if a and a.Parent then
        local e=a:FindFirstChildOfClass("UICorner")
        if e then e.CornerRadius=UDim.new(0,d)end
      end
    end
  end
  local d=DiscordLib.SetWindowSize
  if d then
    DiscordLib.SetWindowSize=function(e,t,y)
      if t and type(t)=="number"then d(e,t,y);c()end
    end
  end
  local h=currentWindowSize
  local u
  u=RunService.Heartbeat:Connect(function()
    if not s or not s.Parent then if u then u:Disconnect()end;return end
    local e=currentWindowSize or 1
    if e~=h then h=e;c()end
  end)
  s.AncestryChanged:Connect(function()if not s.Parent and u then u:Disconnect()end end)
  local p=false
  local f=function()
    if not getgenv().Abc4717 then return end
    local e=currentWindowSize or 1
    local n=math.floor(t*e)
    local o=math.floor(35*e)
    p=not p
    local i=p and currentTheme.Accent or currentTheme.Main
    TweenService:Create(s,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3=i}):Play()
    s.Text=p and"Hide"or"Show"
    s.TextColor3=p and currentTheme.Text or currentTheme.Text
    local r=1.05
    TweenService:Create(s,TweenInfo.new(0.15),{Size=UDim2.new(0,math.floor(n*r),0,math.floor(o*r))}):Play()
    task.wait(0.15)
    TweenService:Create(s,TweenInfo.new(0.15),{Size=UDim2.new(0,n,0,o)}):Play()
    if Discord and getgenv().Abc4717 then
      task.spawn(function()getgenv().Abc4717=false;task.wait(2);getgenv().Abc4717=true end)
      DiscordLib:MinimizeUI()
    end
  end
  local m=Vector2.new(0,0)
  s.InputBegan:Connect(function(v)
    if v.UserInputType==Enum.UserInputType.MouseButton1 or v.UserInputType==Enum.UserInputType.Touch then
      m=Vector2.new(v.Position.X,v.Position.Y)
    end
  end)
  local y=false
  s.MouseButton1Click:Connect(function()
    if not getgenv().Abc4717 then return end
    if y then return end
    y=true
    local v=m or Vector2.new(s.AbsolutePosition.X+s.AbsoluteSize.X/2,s.AbsolutePosition.Y+s.AbsoluteSize.Y/2)
    local b=Instance.new("Frame")
    b.Name=ENC.Ripple;b.Parent=s;b.AnchorPoint=Vector2.new(0.5,0.5)
    b.BackgroundColor3=currentTheme.Accent;b.BackgroundTransparency=0.5
    b.BorderSizePixel=0;b.ZIndex=10;b.ClipsDescendants=false
    local g=s.AbsolutePosition
    local w=v.X-g.X;local _=v.Y-g.Y
    b.Position=UDim2.new(0,w,0,_)
    b.Size=UDim2.new(0,2,0,2)
    local D=Instance.new("UICorner")
    D.CornerRadius=UDim.new(0,1);D.Parent=b
    TweenService:Create(b,TweenInfo.new(0.6,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,80,0,80),BackgroundTransparency=1}):Play()
    task.spawn(function()
      local E=0;while E<0.6 and b and b.Parent do
        local S=b.AbsoluteSize.X
        if S>0 then pcall(function()D.CornerRadius=UDim.new(0,S/2)end)end;task.wait(0.025);E=E+0.025
      end
    end)
    task.delay(0.6,function()if b and b.Parent then b:Destroy()end end)
    f()
    task.delay(0.6,function()y=false end)
  end)
  local v=function()
    if not s or not s.Parent then
      for B,A in ipairs(ThemeUpdateConnections)do
        if A==v then table.remove(ThemeUpdateConnections,B);break end
      end
      return
    end
    s.BackgroundColor3=p and currentTheme.Accent or currentTheme.Main
    s.TextColor3=currentTheme.Text
    a.BackgroundColor3=currentTheme.Accent
    l.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(0.5,currentTheme.AccentGradient),ColorSequenceKeypoint.new(1,currentTheme.Accent)})
  end
  table.insert(ThemeUpdateConnections,v)
  v()
  if Discord then p=Discord.Enabled;f()else s.Text="Show";s.BackgroundColor3=currentTheme.Main;s.TextColor3=currentTheme.Text end
  getgenv().MinimizeButton=s
  c()
end

local function UpdateAllSizes(ratioX, ratioY)
    ratioX = ratioX or currentWindowScaleX or currentWindowSize or 1
    ratioY = ratioY or currentWindowScaleY or currentWindowSize or 1
    local uiRatio = math.min(ratioX, ratioY)

    local mainFrame = Discord:FindFirstChild(ENC.MainFrame)
    if not mainFrame then return end
    local mw = math.floor(619 * ratioX)

    local topFrame = mainFrame:FindFirstChild(ENC.TopFrame)
    if topFrame then 
        topFrame.Size = UDim2.new(0, mw, 0, 24)
        local title = topFrame:FindFirstChild(ENC.Title)
        if title then 
            title.Size = UDim2.new(0, mw - 269, 0, 28)
            title.TextSize = math.floor(14 * uiRatio) 
        end
    end
    local userpad = nil
    if topFrame then
        for _, child in ipairs(topFrame:GetChildren()) do
            if child.Name == ENC.Userpad then 
                userpad = child
                break 
            end
        end
    end
    if not userpad then
        userpad = mainFrame:FindFirstChild(ENC.Userpad)
    end
    if userpad then
        local uw = math.floor(159 * ratioX)
        local uh = math.floor(28 * uiRatio)
        userpad.Size = UDim2.new(0, uw, 0, uh)
        userpad.Position = UDim2.new(1, -uw, 0, 0)
        local userIcon = userpad:FindFirstChild(ENC.UserIcon)
        if userIcon then
            local is = math.floor(22 * uiRatio)
            userIcon.Size = UDim2.new(0, is, 0, is)
            userIcon.Position = UDim2.new(0.05, 0, 0.1, 0)
            local userImage = userIcon:FindFirstChild(ENC.UserImage)
            if userImage then 
                userImage.Size = UDim2.new(0, is, 0, is) 
            end
            local userCircleImage = userImage and userImage:FindFirstChild(ENC.UserCircleImage)
            if userCircleImage then 
                userCircleImage.Size = UDim2.new(0, is, 0, is) 
            end
        end
        local userName = userpad:FindFirstChild(ENC.UserName)
        if userName then 
            userName.TextSize = math.floor(11 * uiRatio) 
            userName.Size = UDim2.new(0, math.floor(100 * ratioX), 0, math.floor(14 * uiRatio))
        end
        local userTag = userpad:FindFirstChild(ENC.UserTag)
        if userTag then 
            userTag.TextSize = math.floor(10 * uiRatio) 
            userTag.Size = UDim2.new(0, math.floor(100 * ratioX), 0, math.floor(14 * uiRatio))
        end
    end
    local serversFrame = mainFrame:FindFirstChild(ENC.ServersHoldFrame)
    if serversFrame then
        local sfw = math.floor(60 * ratioX)
        local sfh = math.floor(350 * ratioY)
        serversFrame.Size = UDim2.new(0, sfw, 0, sfh)
        local serversHold = serversFrame:FindFirstChild(ENC.ServersHold)
        if serversHold then 
            serversHold.Size = UDim2.new(0, math.floor(50 * ratioX), 0, math.floor(340 * ratioY)) 
            for _, child in ipairs(serversHold:GetChildren()) do
                if child:IsA("TextButton") then
                    local ss = math.floor(40 * uiRatio)
                    child.Size = UDim2.new(0, ss, 0, ss)
                    child.TextSize = math.floor(14 * uiRatio)
                    local corner = child:FindFirstChildOfClass("UICorner")
                    if corner then
                        corner.CornerRadius = UDim.new(0, math.floor(20 * uiRatio))
                    end
                    local icon = child:FindFirstChild(ENC.ServerIcon)
                    if icon then
                        icon.Size = UDim2.new(0, ss - 4, 0, ss - 4)
                        icon.Position = UDim2.new(0, 2, 0, 2)
                        local iconCorner = icon:FindFirstChildOfClass("UICorner")
                        if iconCorner then
                            iconCorner.CornerRadius = UDim.new(0, math.floor(18 * uiRatio))
                        end
                    end
                    local bg = child:FindFirstChild(ENC.ServerSelectionBg)
                    if bg then 
                        bg.Size = UDim2.new(0, ss + 6, 0, ss + 6) 
                    end
                end
            end
            local layout = serversHold:FindFirstChild(ENC.ServersHoldLayout)
            if layout then
                task.wait()
                serversHold.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
            end
        end
    end
    local channelsFrame = mainFrame:FindFirstChild(ENC.ChannelsHoldFrame)
    if channelsFrame then
        local cfw = math.floor(130 * ratioX)
        local cfh = math.floor(350 * ratioY)
        channelsFrame.Size = UDim2.new(0, cfw, 0, cfh)
        local channelsHold = channelsFrame:FindFirstChild(ENC.ChannelsHold)
        if channelsHold then 
            local chw = math.floor(120 * ratioX)
            channelsHold.Size = UDim2.new(0, chw, 0, math.floor(340 * ratioY))
            channelsHold.Position = UDim2.new(0, math.floor(5 * ratioX), 0, math.floor(5 * ratioY))
            for _, child in ipairs(channelsHold:GetChildren()) do
                if child:IsA("TextButton") then
                    local newCw = math.floor(110 * ratioX)
                    local newChh = math.floor(24 * uiRatio)
                    child.Size = UDim2.new(0, newCw, 0, newChh)
                    local corner = child:FindFirstChildOfClass("UICorner")
                    if corner then
                        corner.CornerRadius = UDim.new(0, math.floor(6 * uiRatio))
                    end
                    local icon = child:FindFirstChild(ENC.ChannelIcon)
                    if icon then
                        icon.TextSize = math.floor(14 * uiRatio)
                    end
                    local label = child:FindFirstChild(ENC.ChannelLabel)
                    if label then
                        label.TextSize = math.floor(12 * uiRatio)
                        label.Size = UDim2.new(0, newCw - 28, 0, newChh)
                    end
                    local indicator = child:FindFirstChild(ENC.ChannelIndicator)
                    if indicator and indicator.Visible then
                        local indSize = math.floor(6 * uiRatio)
                        indicator.Size = UDim2.new(0, indSize, 0, indSize)
                    end
                    local selBg = child:FindFirstChild(ENC.ChannelSelectionBg)
                    if selBg then
                        local selCorner = selBg:FindFirstChildOfClass("UICorner")
                        if selCorner then
                            selCorner.CornerRadius = UDim.new(0, math.floor(6 * uiRatio))
                        end
                    end
                end
            end
            local layout = channelsHold:FindFirstChild(ENC.ChannelsHoldLayout)
            if layout then
                task.wait()
                channelsHold.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
            end
        end
    end
    for _, sectionFrame in pairs(Sections) do
        if sectionFrame and sectionFrame.Parent then
            local secW = math.floor(390 * ratioX)
            local secH = math.floor(350 * ratioY)
            sectionFrame.Size = UDim2.new(1 - 0.35 - 0.02, 0, 0.90, 0)  
        sectionFrame.Position = UDim2.new(0.35, 0, 0.08, 0)
            local sectionTitle = sectionFrame:FindFirstChild(ENC.SectionTitle)
            if sectionTitle then
                sectionTitle.TextSize = math.floor(16 * uiRatio)
                sectionTitle.Size = UDim2.new(0, secW - 10, 0, math.floor(25 * uiRatio))
            end
            for _, child in ipairs(sectionFrame:GetChildren()) do
                if child:IsA("Frame") or child:IsA("TextButton") then
                    local cname = child.Name or ""
                    local prefijoSeperator = ENC_PREFIX.Seperator
                    local prefijoToggle = ENC_PREFIX.Toggle_
                    local prefijoBind = ENC_PREFIX.Bind_
                    local prefijoSlider = ENC_PREFIX.Slider_
                    local prefijoToggleSlider = ENC_PREFIX.ToggleSlider_
                    local prefijoToggleTextbox = ENC_PREFIX.ToggleTextbox_
                    local prefijoColorpicker = ENC_PREFIX.Colorpicker_
                    local prefijoTextbox = ENC_PREFIX.Textbox_
                    local prefijoDropdown = ENC_PREFIX.Dropdown_
                    local prefijoMultiDropdown = ENC_PREFIX.MultiDropdown_
                    local prefijoButton = ENC_PREFIX.Button_
                    local prefijoParagraph = ENC_PREFIX.Paragraph_
                    local prefijoLabel = ENC_PREFIX.Label_
                    
                    if cname == prefijoSeperator then 
                        child.Size = UDim2.new(0, secW - 15, 0, 2)
                    elseif string.sub(cname, 1, #prefijoLabel) == prefijoLabel then 
                        child.Size = UDim2.new(0, secW - 10, 0, child.Size.Y.Offset)
                        child.TextSize = math.floor(11 * uiRatio)
                    elseif string.sub(cname, 1, #prefijoToggle) == prefijoToggle then 
                        child.Size = UDim2.new(0, secW - 15, 0, child.Size.Y.Offset)
                        local tf = child:FindFirstChild(ENC.ToggleFrame)
                        if tf then 
                            tf.Position = UDim2.new(0, secW - 40, 0, tf.Position.Y.Offset) 
                        end
                    elseif string.sub(cname, 1, #prefijoBind) == prefijoBind then 
                        child.Size = UDim2.new(0, secW - 14, 0, child.Size.Y.Offset)
                        local bbb = child:FindFirstChild(ENC.BindButtonBorder)
                        if bbb then 
                            bbb.Position = UDim2.new(0, secW - 130, 0.5, -12) 
                        end
                    elseif string.sub(cname, 1, #prefijoSlider) == prefijoSlider and string.sub(cname, 1, #prefijoToggleSlider) ~= prefijoToggleSlider then 
                        child.Size = UDim2.new(0, secW - 15, 0, child.Size.Y.Offset)
                        local sv = child:FindFirstChild(ENC.SVal)
                        if sv then 
                            sv.Position = UDim2.new(0, secW - 95, 0, sv.Position.Y.Offset) 
                        end
                        local sb = child:FindFirstChild(ENC.SB)
                        if sb then 
                            sb.Size = UDim2.new(0, secW - 40, 0, 10) 
                        end
                    elseif string.sub(cname, 1, #prefijoToggleSlider) == prefijoToggleSlider then 
    child.Size = UDim2.new(0, secW, 0, child.Size.Y.Offset)
    local tc = child:FindFirstChild(ENC.TC)
    if tc then 
        local ratioX = currentWindowScaleX or 1
        local ratioY = currentWindowScaleY or 1
        tc.Position = UDim2.new(0, math.floor(290 * ratioX), 0, math.floor(5 * ratioY))
    end
    local sv = child:FindFirstChild(ENC.SV)
    if sv then 
        sv.Position = UDim2.new(0, math.floor(220 * ratioX), 0, math.floor(5 * ratioY))
    end
    local sf = child:FindFirstChild(ENC.SF)
    if sf then 
        sf.Size = UDim2.new(0, secW - 20, 0, 32)
        local sb = sf:FindFirstChild(ENC.SB)
        if sb then 
            sb.Size = UDim2.new(0, secW - 40, 0, 10) 
        end
        local sliderFill = sb and sb:FindFirstChild(ENC.SFL)
        local knob = sb and sb:FindFirstChild(ENC.SBtn)
        if knob and sliderFill and sb then
            local percent = sliderFill.Size.X.Scale
            local sbWidth = sb.Size.X.Offset
            local bs = 16
            knob.Position = UDim2.new(0, math.clamp(percent * sbWidth - bs/2, 0, sbWidth - bs), 0.5, -bs/2)
        end
    end
                    elseif string.sub(cname, 1, #prefijoToggleTextbox) == prefijoToggleTextbox then 
    child.Size = UDim2.new(1, -5, 0, child.Size.Y.Offset)
    local tc = child:FindFirstChild(ENC.TC)
    if tc then 
        tc.Position = UDim2.new(1, -30, 0, 5)
    end
    local txf = child:FindFirstChild(ENC.SF)
    if txf then 
        txf.Size = UDim2.new(1, -14, 0, 34)
        local tbox = txf:FindFirstChild(XorEncode("Textbox"))
        if tbox then 
            tbox.Size = UDim2.new(1, -10, 0, 24) 
        end
    end
                    elseif string.sub(cname, 1, #prefijoColorpicker) == prefijoColorpicker then 
    child.Size = UDim2.new(0, secW - 14, 0, child.Size.Y.Offset)
    local cbb = child:FindFirstChild(ENC.ColorButtonBorder)
    if cbb then 
        local ratio = currentWindowSize or 1
        local btnW = math.floor(60 * ratio)
        cbb.Size = UDim2.new(0, btnW + 4, 0, math.floor(24 * ratio))
        cbb.Position = UDim2.new(1, -23, 0.5, 0)
        local innerBtn = cbb:FindFirstChild(ENC.ColorButton)
        if innerBtn then
            innerBtn.Size = UDim2.new(0, btnW, 0, math.floor(20 * ratio))
            local colorDisplay = innerBtn:FindFirstChild(ENC.ColorDisplay)
            if colorDisplay then
                colorDisplay.Size = UDim2.new(0, btnW - 4, 1, -4)
            end
        end
    end
                    elseif string.sub(cname, 1, #prefijoTextbox) == prefijoTextbox then 
                        child.Size = UDim2.new(0, secW - 15, 0, 58)
                        local tx = child:FindFirstChild(XorEncode("Textbox"))
                        if tx then 
                            tx.Size = UDim2.new(0, secW - 40, 0, 24) 
                        end
                    elseif string.sub(cname, 1, #prefijoDropdown) == prefijoDropdown then 
                        child.Size = UDim2.new(0, secW - 20, 0, child.Size.Y.Offset)
                        local dlf = child:FindFirstChild(ENC.DropdownList)
                        if dlf and dlf.Visible then
                            dlf.Size = UDim2.new(1, 0, 0, dlf.Size.Y.Offset)
                            for _, opt in ipairs(dlf:GetChildren()) do
                                if opt:IsA("TextButton") and string.sub(opt.Name, 1, #ENC_PREFIX.Opt_) == ENC_PREFIX.Opt_ then
                                    opt.Size = UDim2.new(1, -35, 0, 28)
                                end
                            end
                        end
                        local sb = child:FindFirstChild(ENC.SearchBox)
                        if sb then
                            sb.Size = UDim2.new(1, -10, 0, 24)
                        end
                    elseif string.sub(cname, 1, #prefijoMultiDropdown) == prefijoMultiDropdown then 
                        child.Size = UDim2.new(0, secW - 10, 0, child.Size.Y.Offset)
                        local cl = child:FindFirstChild(ENC.MDCount)
                        if cl then 
                            cl.Position = UDim2.new(0, secW - 130, 0, cl.Position.Y.Offset) 
                        end
                        local dlf = child:FindFirstChild(ENC.MDList)
                        if dlf and dlf.Visible then
                            dlf.Size = UDim2.new(1, 0, 0, dlf.Size.Y.Offset)
                            for _, opt in ipairs(dlf:GetChildren()) do
                                if opt:IsA("TextButton") and string.sub(opt.Name, 1, #ENC_PREFIX.Opt_) == ENC_PREFIX.Opt_ then
                                    opt.Size = UDim2.new(1, -10, 0, 28)
                                end
                            end
                        end
                        local sb = child:FindFirstChild(ENC.SearchBox)
                        if sb then
                            sb.Size = UDim2.new(1, -10, 0, 24)
                        end
                    elseif string.sub(cname, 1, #prefijoButton) == prefijoButton or string.sub(cname, 1, #prefijoParagraph) == prefijoParagraph then 
    local innerDesc = child:FindFirstChild(ENC.ButtonDesc)
        or child:FindFirstChild(ENC.ParagraphContent)
    if innerDesc then
        innerDesc.Size = innerDesc.Size
    end
    local innerDesc = child:FindFirstChild(ENC.ButtonDesc)
    if innerDesc then
        local neededH = innerDesc.TextBounds.Y
        if neededH > 0 then
            local newH = 20 + neededH + 8 + 24
            child.Size = UDim2.new(1, -8, 0, math.max(child.Size.Y.Offset, newH))
        end
    end
                    end
                    local prefijoModel = ENC_PREFIX.Model_
                    local prefijoVideo = ENC_PREFIX.Video_
                    local prefijoAudio = ENC_PREFIX.Audio_
                    local prefijoImage = ENC_PREFIX.Image_
                    if string.sub(cname,1,#prefijoModel)==prefijoModel or string.sub(cname,1,#prefijoVideo)==prefijoVideo or string.sub(cname,1,#prefijoAudio)==prefijoAudio then
                        local desiredWidth = secW
                        local desiredHeight = math.floor(child.Size.Y.Offset)

                        child.Size = UDim2.new(0, desiredWidth - 15, 0, desiredHeight)

                        for _,obj in ipairs(child:GetDescendants()) do
                            if obj:IsA("ViewportFrame") or obj:IsA("VideoFrame") then
                                local paddingX = 20
                                local paddingY = 78

                                local newWidth = math.max(desiredWidth - paddingX, 0)
                                local newHeight = math.max(desiredHeight - paddingY, 0)

                                obj.Size = UDim2.new(0, newWidth, 0, newHeight)
                            end
                        end
                    elseif string.sub(cname,1,#prefijoImage)==prefijoImage then
                        local desiredWidth = secW
                        local desiredHeight = math.floor(child.Size.Y.Offset)
                        child.Size = UDim2.new(0, desiredWidth - 15, 0, desiredHeight)

                        local imgTitle = child:FindFirstChild(ENC.SectionTitle)
                        if imgTitle then
                            imgTitle.Size = UDim2.new(1, -20, 0, imgTitle.Size.Y.Offset)
                            imgTitle.TextSize = math.floor(14 * uiRatio)
                        end
                        local imgDesc = child:FindFirstChild(ENC.ButtonDesc)
                        if imgDesc then
                            imgDesc.Size = UDim2.new(1, -20, 0, imgDesc.Size.Y.Offset)
                            imgDesc.TextSize = math.floor(12 * uiRatio)
                        end
                        for _, obj in ipairs(child:GetChildren()) do
                            if obj:IsA("ImageLabel") then
                                obj.Size = UDim2.new(1, -20, 0, obj.Size.Y.Offset)
                            elseif obj:IsA("TextButton") and obj.Name == XorEncode("ImageClick") then
                                obj.Size = UDim2.new(1, -20, 0, obj.Size.Y.Offset)
                            end
                        end
                    end
                    for _, label in ipairs(child:GetDescendants()) do
                        if label:IsA("TextLabel") then
                            local labelName = label.Name or ""
                            if labelName == ENC.DTitle or labelName == ENC.MDTitle then
                                label.TextSize = math.floor(14 * uiRatio)
                            elseif labelName == ENC.DDesc or labelName == ENC.MDDesc then
                                label.TextSize = math.floor(12 * uiRatio)
                            elseif labelName == ENC.DArrow or labelName == ENC.MDArrow then
                                label.TextSize = math.floor(14 * uiRatio)
                            elseif labelName == ENC.MDCount then
                                label.TextSize = math.floor(12 * uiRatio)
                            end
                        end
                    end
                end
            end
        end
    end
end

local BASE_WINDOW_SIZE = Vector2.new(619, 389)
local WindowUIScale

local MIN_SCALE_AXIS = 0.7
local MAX_SCALE_AXIS = 10

local recalcDebounce = nil
local function RecalculateWindowScale()
    local mainFrame = Discord and Discord:FindFirstChild(ENC.MainFrame)
    if not mainFrame then return end
    if minimizeAnimating then return end

    local width = mainFrame.Size.X.Offset
    local height = mainFrame.Size.Y.Offset
    if width < 10 or height < 10 then return end

    local scaleX = math.clamp(width / BASE_WINDOW_SIZE.X, MIN_SCALE_AXIS, MAX_SCALE_AXIS)
    local scaleY = math.clamp(height / BASE_WINDOW_SIZE.Y, MIN_SCALE_AXIS, MAX_SCALE_AXIS)

    currentWindowScaleX = scaleX
    currentWindowScaleY = scaleY
    currentWindowSize = math.min(scaleX, scaleY)

    if WindowUIScale and math.abs(WindowUIScale.Scale - 1) > 0.001 then
        WindowUIScale.Scale = 1
    end

    pcall(UpdateAllSizes, scaleX, scaleY)
end
local function RecalculateWindowScaleDebounced()
    if recalcDebounce then
        task.cancel(recalcDebounce)
    end
    recalcDebounce = task.delay(0.05, function()
        recalcDebounce = nil
        RecalculateWindowScale()
    end)
end

function DiscordLib:SetWindowSize(scaleX, scaleY)
    scaleX = tonumber(scaleX) or 1
    scaleY = tonumber(scaleY) or scaleX
    local mainFrame = Discord and Discord:FindFirstChild(ENC.MainFrame)
    if not mainFrame then return end
    mainFrame.Size = UDim2.new(0, math.floor(BASE_WINDOW_SIZE.X * scaleX), 0, math.floor(BASE_WINDOW_SIZE.Y * scaleY))
    RecalculateWindowScale()
end

local ABC3662 = 0
local currentThemeName = "Dark"
function DiscordLib:SetTheme(themeName)
    local currentTime = tick()
    if currentTime - ABC3662 < 0.3 then
        return
    end
    ABC3662 = currentTime
    local newTheme
    if type(themeName) == "string" then
        local selectedTheme = Themes[themeName]
        if not selectedTheme then
            themeName = "Dark"
            selectedTheme = Themes.Dark
        end
        currentThemeName = themeName
        newTheme = {}
        for key, value in pairs(selectedTheme) do
            if typeof(value) == "Color3" then
                newTheme[key] = value
            else
                newTheme[key] = value
            end
        end
    elseif typeof(themeName) == "Color3" then
        currentThemeName = nil
        local isLight = (themeName.R * 0.299 + themeName.G * 0.587 + themeName.B * 0.114) > 0.5
        newTheme = {
            Main = themeName,
            Secondary = themeName:lerp(Color3.new(0, 0, 0), isLight and 0.15 or 0.2),
            Tertiary = themeName:lerp(Color3.new(0, 0, 0), isLight and 0.25 or 0.3),
            Accent = themeName:lerp(Color3.new(isLight and 0 or 1, isLight and 0 or 1, isLight and 0 or 1), isLight and 0.7 or 0.4),
            AccentGradient = themeName:lerp(Color3.new(isLight and 0 or 1, 0, isLight and 0 or 1), isLight and 0.7 or 0.4),
            Text = isLight and Color3.new(0, 0, 0) or Color3.new(1, 1, 1),
            TextMuted = isLight and Color3.new(0.3, 0.3, 0.3) or Color3.new(0.7, 0.7, 0.7),
            Userpad = themeName:lerp(Color3.new(0, 0, 0), isLight and 0.2 or 0.4),
            UserIcon = themeName:lerp(Color3.new(0, 0, 0), isLight and 0.3 or 0.5),
            Hover = themeName:lerp(Color3.new(isLight and 0 or 1, isLight and 0 or 1, isLight and 0 or 1), isLight and 0.1 or 0.2),
            Border = isLight and Color3.new(0.7, 0.7, 0.7) or Color3.new(0, 0, 0),
            Shadow = isLight and Color3.new(0.5, 0.5, 0.5) or Color3.new(0, 0, 0),
            ServerBorder = isLight and themeName:lerp(Color3.new(0, 0, 0), 0.7) or themeName:lerp(Color3.new(1, 1, 1), 0.4),
            NotificationBg = themeName:lerp(Color3.new(0, 0, 0), isLight and 0.15 or 0.3),
            NotificationBorder = isLight and themeName:lerp(Color3.new(0, 0, 0), 0.7) or themeName:lerp(Color3.new(1, 1, 1), 0.4)
        }
    elseif type(themeName) == "table" then
        currentThemeName = nil
        newTheme = {}
        for key, value in pairs(themeName) do
            newTheme[key] = value
        end
    else
        currentThemeName = "Dark"
        newTheme = {}
        for key, value in pairs(Themes.Dark) do
            newTheme[key] = value
        end
    end
    currentTheme = newTheme
    for _, updateFunc in ipairs(ThemeUpdateConnections) do
        pcall(updateFunc)
    end
end

local function CreateWindowControlButton(parent, name, symbol, order, tooltipText)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = parent
    btn.BackgroundTransparency = 1
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(0, 26, 0, 20)
    btn.Position = UDim2.new(1, -28 * order, 0.5, -10)
    btn.Font = Enum.Font.GothamBold
    btn.Text = symbol
    btn.TextColor3 = currentTheme.TextMuted
    btn.TextSize = 14
    btn.AutoButtonColor = false
    btn.ZIndex = 5
    btn.AnchorPoint = Vector2.new(1, 0.5)
    CreateCorner(btn, 4)

    local hovered = false
    btn.MouseEnter:Connect(function()
        hovered = true
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundTransparency = 0.7,
            BackgroundColor3 = currentTheme.Hover
        }):Play()
        btn.TextColor3 = currentTheme.Text
    end)
    btn.MouseLeave:Connect(function()
        hovered = false
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundTransparency = 1
        }):Play()
        btn.TextColor3 = currentTheme.TextMuted
    end)

    table.insert(ThemeUpdateConnections, function()
        if not hovered then
            btn.TextColor3 = currentTheme.TextMuted
        else
            btn.BackgroundColor3 = currentTheme.Hover
        end
    end)

    return btn
end

function DiscordLib:Window(XyZ)
    TitleSetHub = XyZ or "Discord UI"
    local MainFrame = CreateFrame(Discord, ENC.MainFrame, currentTheme.Main, 0, UDim2.new(0, 619, 0, 389), UDim2.new(0.5, 0, 0.5, 0), 1)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    CreateCorner(MainFrame, 10)
    local mainShadow = CreateShadow(MainFrame)
    WindowUIScale = Instance.new("UIScale")
    WindowUIScale.Scale = 1
    WindowUIScale.Parent = MainFrame
MainFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(RecalculateWindowScaleDebounced)
    
    local ResizeGrip = Instance.new("Frame")
    ResizeGrip.Name = ENC.ResizeGrip or EncriptyText(math.random(8,14))
    ResizeGrip.AnchorPoint = Vector2.new(1, 1)
    ResizeGrip.Position = UDim2.new(1, 0, 1, 0)
    ResizeGrip.Size = UDim2.new(0, 18, 0, 18)
    ResizeGrip.BackgroundTransparency = 1
    ResizeGrip.ZIndex = 50
    ResizeGrip.Parent = MainFrame
    
    local GripIcon = Instance.new("ImageLabel")
    GripIcon.BackgroundTransparency = 1
    GripIcon.AnchorPoint = Vector2.new(1, 1)
    GripIcon.Position = UDim2.new(1, -2, 1, -2)
    GripIcon.Size = UDim2.new(0, 14, 0, 14)
    GripIcon.Image = "rbxassetid://3926305904"
    GripIcon.ImageRectOffset = Vector2.new(884, 284)
    GripIcon.ImageRectSize = Vector2.new(36, 36)
    GripIcon.ImageTransparency = 0.5
    GripIcon.ZIndex = 51
    GripIcon.Parent = ResizeGrip
    
    table.insert(ThemeUpdateConnections, function()
        GripIcon.ImageColor3 = currentTheme.TextMuted
    end)
    
    do
        local resizing, startInputPos, startSizeVec
        local UIS = game:GetService("UserInputService")
        ResizeGrip.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                resizing = true
                startInputPos = Vector2.new(input.Position.X, input.Position.Y)
                startSizeVec = Vector2.new(MainFrame.AbsoluteSize.X, MainFrame.AbsoluteSize.Y)
            end
        end)
        UIS.InputChanged:Connect(function(input)
            if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = Vector2.new(input.Position.X, input.Position.Y) - startInputPos
                local MIN_SCALE = 0.7
                local minW = math.floor(BASE_WINDOW_SIZE.X * MIN_SCALE)
                local minH = math.floor(BASE_WINDOW_SIZE.Y * MIN_SCALE)
                local newW = math.clamp(startSizeVec.X + delta.X, minW, 3000)
                local newH = math.clamp(startSizeVec.Y + delta.Y, minH, 2000)
                MainFrame.Size = UDim2.new(0, newW, 0, newH)
                savedSize = MainFrame.Size
            end
        end)
        UIS.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                if resizing then
                    resizing = false
                    savedSize = MainFrame.Size
                end
            end
        end)
    end
    
    local TopFrame = CreateFrame(MainFrame, ENC.TopFrame, currentTheme.Main, 0.1, UDim2.new(0, 619, 0, 24), nil, 2)
    CreateCorner(TopFrame, 10)
    
local WindowControls = Instance.new("Frame")
WindowControls.Name = ENC.WindowControls
WindowControls.Parent = TopFrame
WindowControls.BackgroundTransparency = 1
WindowControls.Position = UDim2.new(1, -120, 0, 10)
WindowControls.Size = UDim2.new(0, 130, 0, 20)
WindowControls.ZIndex = 4

local function MaximizeWindow()
    if isMaximized then return end
    isMaximized = true
    savedSizeBeforeMax = MainFrame.Size
    savedPosBeforeMax = MainFrame.Position
    savedAnchorBeforeMax = MainFrame.AnchorPoint
    Discord.IgnoreGuiInset = true
    MainFrame.AnchorPoint = Vector2.new(0, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0)
    }):Play()
    task.wait(0.3)
    local w = MainFrame.AbsoluteSize.X
    local h = MainFrame.AbsoluteSize.Y
    local scaleX = w / BASE_WINDOW_SIZE.X
    local scaleY = h / BASE_WINDOW_SIZE.Y
    currentWindowScaleX = scaleX
    currentWindowScaleY = scaleY
    currentWindowSize = math.min(scaleX, scaleY)
    pcall(UpdateAllSizes, scaleX, scaleY)
end

local function RestoreWindow()
    if not isMaximized then return end
    isMaximized = false
    local sz = savedSizeBeforeMax or UDim2.new(0, 619, 0, 389)
    local ps = savedPosBeforeMax or UDim2.new(0.5, 0, 0.5, 0)
    local ap = savedAnchorBeforeMax or Vector2.new(0.5, 0.5)

    MainFrame.AnchorPoint = ap
    TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = ps,
        Size = sz
    }):Play()
    task.delay(0.3, function()
        savedSize = sz
    end)
end

DiscordLib.MaximizeWindow = MaximizeWindow
DiscordLib.RestoreWindow = RestoreWindow
DiscordLib.ToggleMaximize = function()
    if isMaximized then RestoreWindow() else MaximizeWindow() end
end

local SearchBtnCtrl = CreateWindowControlButton(WindowControls, ENC.SearchBtn, "🔍", 4, "Search")
local SettingsBtnCtrl = CreateWindowControlButton(WindowControls, ENC.SetBtn, "⚙", 3, "Settings")
local MinBtnCtrl = CreateWindowControlButton(WindowControls, ENC.MinBtn, "—", 2, "Minimize")
local MaxBtnCtrl = CreateWindowControlButton(WindowControls, ENC.MaxBtn, "☐", 1, "Maximize")

MaxBtnCtrl.MouseButton1Click:Connect(function()
    if isMaximized then
        RestoreWindow()
        MaxBtnCtrl.Text = "+"
    else
        MaximizeWindow()
        MaxBtnCtrl.Text = "-"
    end
end)
MinBtnCtrl.MouseButton1Click:Connect(function()
    if isMaximized then RestoreWindow() end
    DiscordLib:MinimizeUI()
end)

local SearchBarHolder = CreateFrame(
    MainFrame,
    XorEncode("SearchBarHolder"),
    currentTheme.Secondary,
    0,
    UDim2.new(0, 390, 0, 32),
    UDim2.new(0.35, 0, 0.08, -36),
    20
)
SearchBarHolder.Visible = false
CreateCorner(SearchBarHolder, 8)

local SearchBarInput = Instance.new("TextBox")
SearchBarInput.Name = XorEncode("SearchBarInput")
SearchBarInput.Parent = SearchBarHolder
SearchBarInput.BackgroundColor3 = currentTheme.Tertiary
SearchBarInput.BorderSizePixel = 0
SearchBarInput.Position = UDim2.new(0, 6, 0, 4)
SearchBarInput.Size = UDim2.new(1, -40, 0, 24)
SearchBarInput.Font = currentFont
SearchBarInput.PlaceholderText = "Filter section..."
SearchBarInput.PlaceholderColor3 = currentTheme.TextMuted
SearchBarInput.Text = ""
SearchBarInput.TextColor3 = currentTheme.Text
SearchBarInput.TextSize = 13
SearchBarInput.ClearTextOnFocus = false
SearchBarInput.ZIndex = 21
CreateCorner(SearchBarInput, 5)
local sbPad = Instance.new("UIPadding")
sbPad.Parent = SearchBarInput
sbPad.PaddingLeft = UDim.new(0, 8)

local SearchBarClose = CreateTextButton(SearchBarHolder, nil, UDim2.new(0, 24, 0, 24), UDim2.new(1, -30, 0, 4), 21)
SearchBarClose.Text = "X"
SearchBarClose.TextColor3 = currentTheme.TextMuted
SearchBarClose.TextSize = 16
SearchBarClose.BackgroundTransparency = 1
CreateCorner(SearchBarClose, 4)

local function GetElementText(obj)
    local parts = {}
    for _, d in ipairs(obj:GetDescendants()) do
        if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then
            if d.Text and d.Text ~= "" then
                table.insert(parts, d.Text)
            end
        end
    end
    return string.lower(table.concat(parts, " "))
end

local function FilterCurrentSection(query)
    query = string.lower(query or "")
    local path = currentServer .. ":" .. currentChannel
    local sectionFrame = Sections[path]
    if not sectionFrame or not sectionFrame.Parent then return end

    for _, child in ipairs(sectionFrame:GetChildren()) do
        if child:IsA("Frame") or child:IsA("TextButton") then
            local cname = child.Name or ""
            if cname ~= ENC.SectionTitle
               and cname ~= ENC.SectionLayout
               and not child:IsA("UIListLayout")
               and not child:IsA("UIPadding") then
                if query == "" then
                    child.Visible = true
                else
                    local text = GetElementText(child)
                    child.Visible = string.find(text, query, 1, true) ~= nil
                end
            end
        end
    end
end

SearchBarInput:GetPropertyChangedSignal("Text"):Connect(function()
    FilterCurrentSection(SearchBarInput.Text)
end)

local function CloseSearchBar()
    SearchBarHolder.Visible = false
    SearchBarInput.Text = ""
    FilterCurrentSection("") 
end

local function OpenSearchBar()
    SearchBarHolder.Visible = true
    SearchBarInput.Text = ""
    FilterCurrentSection("")
    task.wait(0.05)
    SearchBarInput:CaptureFocus()
end

SearchBarClose.MouseButton1Click:Connect(CloseSearchBar)

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Escape and SearchBarHolder.Visible then
        CloseSearchBar()
    end
end)

table.insert(ThemeUpdateConnections, function()
    SearchBarHolder.BackgroundColor3 = currentTheme.Secondary
    SearchBarInput.BackgroundColor3 = currentTheme.Tertiary
    SearchBarInput.TextColor3 = currentTheme.Text
    SearchBarInput.PlaceholderColor3 = currentTheme.TextMuted
    SearchBarClose.TextColor3 = currentTheme.TextMuted
end)

SearchBtnCtrl.MouseButton1Click:Connect(function()
    if SearchBarHolder.Visible then
        CloseSearchBar()
    else
        OpenSearchBar()
    end
end)

local SettingsOverlay = CreateFrame(Discord, ENC.SettingsOverlay, Color3.new(0,0,0), 1, UDim2.new(1,0,1,0), nil, 900)
SettingsOverlay.Active = true
SettingsOverlay.Visible = false
SettingsOverlay.ZIndex = 900

local SettingsPanel = CreateFrame(SettingsOverlay, ENC.SettingsPanel, currentTheme.Main, 0, UDim2.new(0, 480, 0, 440), UDim2.new(0.5, -240, 0.5, -220), 901)
CreateCorner(SettingsPanel, 12)
local settingsShadow = CreateShadow(SettingsPanel)

local STitle = CreateLabel(SettingsPanel, ENC.SettingsTitle, "ￄ1�77ￄ1�75  Settings", currentTheme.Text, 18, Enum.Font.GothamBold, UDim2.new(1, -50, 0, 28), UDim2.new(0, 18, 0, 12), 902)
local SClose = CreateTextButton(SettingsPanel, ENC.SettingsClose, UDim2.new(0, 28, 0, 28), UDim2.new(1, -38, 0, 10), 903)
SClose.Text = "��"
SClose.TextColor3 = currentTheme.TextMuted
SClose.TextSize = 20
SClose.BackgroundTransparency = 1
CreateCorner(SClose, 4)

local TabBar = CreateFrame(SettingsPanel, nil, currentTheme.Secondary, 0, UDim2.new(1, -30, 0, 32), UDim2.new(0, 15, 0, 50), 902)
CreateCorner(TabBar, 6)
local tabLayout = Instance.new("UIListLayout")
tabLayout.Parent = TabBar
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 4)
tabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
local tabPad = Instance.new("UIPadding")
tabPad.Parent = TabBar
tabPad.PaddingLeft = UDim.new(0, 4)

local SettingsContent = Instance.new("ScrollingFrame")
SettingsContent.Name = ENC.SettingsContent
SettingsContent.Parent = SettingsPanel
SettingsContent.BackgroundTransparency = 1
SettingsContent.BorderSizePixel = 0
SettingsContent.Position = UDim2.new(0, 15, 0, 90)
SettingsContent.Size = UDim2.new(1, -30, 1, -105)
SettingsContent.CanvasSize = UDim2.new(0, 0, 0, 0)
SettingsContent.ScrollBarThickness = 4
SettingsContent.ScrollBarImageColor3 = currentTheme.Accent
SettingsContent.ZIndex = 902
SettingsContent.AutomaticCanvasSize = Enum.AutomaticSize.Y

local SCLayout = Instance.new("UIListLayout")
SCLayout.Parent = SettingsContent
SCLayout.SortOrder = Enum.SortOrder.LayoutOrder
SCLayout.Padding = UDim.new(0, 6)

local currentTab = "Themes"
local tabButtons = {}

local function ClearSettingsContent()
    for _, c in ipairs(SettingsContent:GetChildren()) do
        if not c:IsA("UIListLayout") then c:Destroy() end
    end
end

local function BuildThemesTab()
    ClearSettingsContent()

    local function Row(text)
        local lbl = CreateLabel(SettingsContent, ENC_PREFIX.SettingsRow_ .. XorEncode(text),
            text, currentTheme.TextMuted, 12, currentFont, UDim2.new(1, -10, 0, 18), UDim2.new(0, 4, 0, 8), 903)
        return lbl
    end

    Row("PREDEFINED THEMES")
    local themeNames = {"Dark", "Light", "Amoled"}
    for _, tn in ipairs(themeNames) do
        local btn = CreateTextButton(SettingsContent, nil, UDim2.new(1, -10, 0, 34), nil, 903)
        btn.BackgroundColor3 = currentTheme.Tertiary
        btn.Text = "  " .. tn
        btn.TextColor3 = currentTheme.Text
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.TextSize = 13
        btn.Font = currentFont
        CreateCorner(btn, 6)
        btn.MouseButton1Click:Connect(function()
            DiscordLib:SetTheme(tn)
            DiscordLib:Notification({title = "Theme", desc = tn .. " applied", time = 2})
        end)
    end

    Row("ADVANCED THEMES")
    local advNames = {}
    for k in pairs(AdvancedThemes) do table.insert(advNames, k) end
    table.sort(advNames)
    for _, tn in ipairs(advNames) do
        local btn = CreateTextButton(SettingsContent, nil, UDim2.new(1, -10, 0, 32), nil, 903)
        btn.BackgroundColor3 = currentTheme.Tertiary
        btn.Text = "  " .. tn
        btn.TextColor3 = currentTheme.Text
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.TextSize = 12
        btn.Font = currentFont
        CreateCorner(btn, 6)
        btn.MouseButton1Click:Connect(function()
            DiscordLib:SetAdvancedTheme(AdvancedThemes[tn])
            DiscordLib:Notification({title = "Theme", desc = tn .. " applied", time = 2})
        end)
    end

    Row("CUSTOM COLOR")
    local colorList = {}
    for k in pairs(PredefinedColors) do table.insert(colorList, k) end
    table.sort(colorList)
    for _, cn in ipairs(colorList) do
        local btn = CreateTextButton(SettingsContent, nil, UDim2.new(1, -10, 0, 30), nil, 903)
        btn.BackgroundColor3 = PredefinedColors[cn]
        btn.Text = "  " .. cn
        btn.TextColor3 = (PredefinedColors[cn].R + PredefinedColors[cn].G + PredefinedColors[cn].B) / 3 > 0.5
            and Color3.new(0,0,0) or Color3.new(1,1,1)
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.TextSize = 12
        btn.Font = currentFont
        CreateCorner(btn, 6)
        btn.MouseButton1Click:Connect(function()
            DiscordLib:SetTheme(PredefinedColors[cn])
            DiscordLib:Notification({title = "Color", desc = cn .. " applied", time = 2})
        end)
    end
end

local function BuildConfigTab()
    ClearSettingsContent()

    local function Row(text)
        CreateLabel(SettingsContent, nil, text, currentTheme.TextMuted, 12, currentFont,
            UDim2.new(1, -10, 0, 18), UDim2.new(0, 4, 0, 8), 903)
    end

    Row("CONFIGURATION")

    local function MakeBtn(text, cb)
        local b = CreateTextButton(SettingsContent, nil, UDim2.new(1, -10, 0, 34), nil, 903)
        b.BackgroundColor3 = currentTheme.Tertiary
        b.Text = "  " .. text
        b.TextColor3 = currentTheme.Text
        b.TextXAlignment = Enum.TextXAlignment.Left
        b.TextSize = 13
        b.Font = currentFont
        CreateCorner(b, 6)
        b.MouseButton1Click:Connect(cb)
        return b
    end

    MakeBtn("Check Configuration", function()
        local info = ""
        local data = DiscordLib:GetConfigInfo()
        if data then
            info = "Theme: " .. tostring(data.themeName or "Custom") .. "\n"
            info = info .. "Font: " .. tostring(data.font or "None") .. "\n"
            info = info .. "Size: " .. tostring(data.windowSize or "None") .. "\n"
        else
            info = "No configuration found."
        end
        DiscordLib:Dialog({Title = "Current Configuration", Content = info, Buttons = {{Text = "Close"}}})
    end)

    MakeBtn("Save Configuration", function()
        DiscordLib:SaveConfig()
        DiscordLib:Notification({title = "Config", desc = "Configuration saved", time = 2})
    end)

    MakeBtn("Load Configuration", function()
        if DiscordLib:LoadConfig() then
            DiscordLib:Notification({title = "Config", desc = "Configuration loaded", time = 2})
        else
            DiscordLib:Notification({title = "Config", desc = "No configuration found", time = 2})
        end
    end)

    MakeBtn("Delete Configuration", function()
        DiscordLib:Dialog({
            Title = "Delete Configuration",
            Content = "Are you sure? This cannot be undone.",
            Buttons = {
                {Text = "Cancel"},
                {Text = "Delete", Callback = function()
                    DiscordLib:DeleteConfig()
                    DiscordLib:Notification({title = "Config", desc = "Deleted", time = 2})
                end}
            }
        })
    end)

    Row("UI SCALE")
    local scaleOptions = {"0.5","0.6","0.7","0.8","0.9","1.0","1.1","1.2","1.3","1.4","1.5"}
    for _, s in ipairs(scaleOptions) do
        MakeBtn("Scale " .. s, function()
            DiscordLib:SetWindowSize(tonumber(s))
            DiscordLib:Notification({title = "UI Scale", desc = "Set to " .. s, time = 1.5})
        end)
    end
end

local function BuildFontsTab()
    ClearSettingsContent()
    CreateLabel(SettingsContent, nil, "FONTS", currentTheme.TextMuted, 12, currentFont,
        UDim2.new(1, -10, 0, 18), UDim2.new(0, 4, 0, 8), 903)
    local fonts = {"Gotham","GothamBold","GothamSemibold","GothamBlack","Arial","ArialBold",
        "SourceSans","SourceSansBold","SourceSansLight","SourceSansItalic",
        "SciFi","Fantasy","Bodoni","Highway","Sarasa","PermanentMarker",
        "Bangers","Aldrich","Arcade","FredokaOne","Cartoon"}
    for _, fn in ipairs(fonts) do
        local b = CreateTextButton(SettingsContent, nil, UDim2.new(1, -10, 0, 32), nil, 903)
        b.BackgroundColor3 = currentTheme.Tertiary
        b.Text = "  " .. fn
        b.TextColor3 = currentTheme.Text
        b.TextXAlignment = Enum.TextXAlignment.Left
        b.TextSize = 13
        b.Font = Enum.Font[fn]
        CreateCorner(b, 6)
        b.MouseButton1Click:Connect(function()
            DiscordLib:SetFont(fn)
            DiscordLib:Notification({title = "Font", desc = fn .. " applied", time = 1.5})
        end)
    end
end

local function BuildEffectsTab()
    ClearSettingsContent()
    CreateLabel(SettingsContent, nil, "EFFECTS", currentTheme.TextMuted, 12, currentFont,
        UDim2.new(1, -10, 0, 18), UDim2.new(0, 4, 0, 8), 903)

    if not DiscordLib._blurInstance then
        DiscordLib._blurInstance = DiscordLib:CreateAcrylicBlur()
    end
    local blur = DiscordLib._blurInstance

    local blurBtn = CreateTextButton(SettingsContent, nil, UDim2.new(1, -10, 0, 34), nil, 903)
    blurBtn.BackgroundColor3 = currentTheme.Tertiary
    blurBtn.Text = "  Blur Effect: " .. (blur:IsEnabled() and "ON" or "OFF")
    blurBtn.TextColor3 = currentTheme.Text
    blurBtn.TextXAlignment = Enum.TextXAlignment.Left
    blurBtn.TextSize = 13
    blurBtn.Font = currentFont
    CreateCorner(blurBtn, 6)
    blurBtn.MouseButton1Click:Connect(function()
        blur:Toggle()
        blurBtn.Text = "  Blur Effect: " .. (blur:IsEnabled() and "ON" or "OFF")
    end)

    CreateLabel(SettingsContent, nil, "Intensity: " .. math.floor(blur:GetIntensity() * 100) .. "%",
        currentTheme.TextMuted, 12, currentFont, UDim2.new(1, -10, 0, 18), UDim2.new(0, 4, 0, 6), 903)

    for _, inten in ipairs({0, 25, 50, 75, 100}) do
        local b = CreateTextButton(SettingsContent, nil, UDim2.new(1, -10, 0, 28), nil, 903)
        b.BackgroundColor3 = currentTheme.Tertiary
        b.Text = "  " .. inten .. "%"
        b.TextColor3 = currentTheme.Text
        b.TextXAlignment = Enum.TextXAlignment.Left
        b.TextSize = 12
        CreateCorner(b, 6)
        b.MouseButton1Click:Connect(function()
            blur:SetIntensity(inten / 100)
            DiscordLib:Notification({title = "Blur", desc = "Intensity: " .. inten .. "%", time = 1.5})
        end)
    end
end

local tabBuilders = {
    Themes = BuildThemesTab,
    Config = BuildConfigTab,
    Fonts = BuildFontsTab,
    Effects = BuildEffectsTab
}

local function SwitchTab(name)
    currentTab = name
    for n, btn in pairs(tabButtons) do
        btn.BackgroundColor3 = (n == name) and currentTheme.Accent or currentTheme.Tertiary
        btn.TextColor3 = currentTheme.Text
    end
    tabBuilders[name]()
end

for _, tabName in ipairs({"Themes", "Config", "Fonts", "Effects"}) do
    local tb = CreateTextButton(TabBar, nil, UDim2.new(0, 100, 0, 24), nil, 903)
    tb.BackgroundColor3 = currentTheme.Tertiary
    tb.Text = tabName
    tb.TextColor3 = currentTheme.Text
    tb.TextSize = 12
    tb.Font = currentFont
    CreateCorner(tb, 5)
    tb.MouseButton1Click:Connect(function() SwitchTab(tabName) end)
    tabButtons[tabName] = tb
end

local function OpenSettings()
    SettingsPanelOpen = true
    SettingsOverlay.Visible = true
    SettingsOverlay.BackgroundTransparency = 1
    SettingsPanel.BackgroundTransparency = 1
    TweenService:Create(SettingsOverlay, TweenInfo.new(0.25), {BackgroundTransparency = 0.6}):Play()
    TweenService:Create(SettingsPanel, TweenInfo.new(0.25), {BackgroundTransparency = 0}):Play()
    SwitchTab(currentTab)
end

local function CloseSettings()
    SettingsPanelOpen = false
    TweenService:Create(SettingsOverlay, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
    TweenService:Create(SettingsPanel, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
    task.delay(0.2, function() SettingsOverlay.Visible = false end)
end

SClose.MouseButton1Click:Connect(CloseSettings)
SettingsOverlay.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local mp = Vector2.new(input.Position.X, input.Position.Y)
        local fp, fs = SettingsPanel.AbsolutePosition, SettingsPanel.AbsoluteSize
        if mp.X < fp.X or mp.X > fp.X + fs.X or mp.Y < fp.Y or mp.Y > fp.Y + fs.Y then
            CloseSettings()
        end
    end
end)

SettingsBtnCtrl.MouseButton1Click:Connect(function()
    if SettingsPanelOpen then CloseSettings() else OpenSettings() end
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.F and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        if SearchBarHolder.Visible then CloseSearchBar() else OpenSearchBar() end
    end
    if input.KeyCode == Enum.KeyCode.Escape then
        if SettingsPanelOpen then CloseSettings() end
        if SearchBarHolder.Visible then CloseSearchBar() end
    end
end)

table.insert(ThemeUpdateConnections, function()
    SettingsPanel.BackgroundColor3 = currentTheme.Main
    STitle.TextColor3 = currentTheme.Text
    SClose.TextColor3 = currentTheme.TextMuted
    TabBar.BackgroundColor3 = currentTheme.Secondary
    settingsShadow.ImageColor3 = currentTheme.Shadow
    for n, btn in pairs(tabButtons) do
        btn.BackgroundColor3 = (n == currentTab) and currentTheme.Accent or currentTheme.Tertiary
        btn.TextColor3 = currentTheme.Text
    end
end)

    local function CreateProtectedText(parent, text, color, size, font, pos, zindex)
        local TextService = game:GetService("TextService")
        local Holder = Instance.new("Frame")
        Holder.Name = EncriptyText(math.random(8,14))
        Holder.BackgroundTransparency = 1
        Holder.Visible = true
        Holder.BorderSizePixel = 0
        Holder.Size = UDim2.new(0, 350, 0, 28)
        Holder.Position = pos or UDim2.new(0.01, 0, 0, 0)
        Holder.ClipsDescendants = false
        Holder.ZIndex = zindex or 3
        Holder.Parent = parent
        local Offset = 0
        local Labels = {}
        for i = 1, #text do
            local Char = text:sub(i, i)
            local Label = Instance.new("TextLabel")
            Label.Name = EncriptyText(math.random(6,12))
            Label.BackgroundTransparency = 1
            Label.BorderSizePixel = 0
            Label.Font = font
            Label.TextSize = size
            Label.TextColor3 = color
            Label.TextTransparency = 0
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextYAlignment = Enum.TextYAlignment.Center
            Label.RichText = false
            Label.ClipsDescendants = false
            Label.ZIndex = zindex or 3
            Label.Text = utf8.char(string.byte(Char))
            local Bounds = TextService:GetTextSize(Char, size, font, Vector2.new(math.huge, math.huge))
            local Width = math.max(Bounds.X + math.floor(size * 0.08), 4)
            if Char == " " then Width = math.max(Bounds.X, size * 0.28) end
            Label.Size = UDim2.new(0, Width, 1, 0)
            Label.Position = UDim2.new(0, Offset, 0, 0)
            Label.Parent = Holder
            table.insert(Labels, Label)
            Offset += Width
        end
        Holder.Size = UDim2.new(0, Offset + 4, 0, 28)
        local function UpdateTheme()
            for _, lbl in ipairs(Labels) do
                if lbl and lbl.Parent then
                    lbl.TextColor3 = currentTheme.TextMuted
                    lbl.Font = currentFont
                    lbl.TextSize = math.floor(14 * (currentWindowSize or 1))
                end
            end
        end
        table.insert(ThemeUpdateConnections, UpdateTheme)
        return Holder
    end
    
    local Title = CreateProtectedText(TopFrame, TitleSetHub, currentTheme.TextMuted, 14, currentFont, UDim2.new(0.01, 0, 0, 0), 3)
    
    UpdateProtectedTitle = function(newText)
        if not Title or not Title.Parent then return end
        for _, child in ipairs(Title:GetChildren()) do child:Destroy() end
        local TextService = game:GetService("TextService")
        local offset = 0
        for i = 1, #newText do
            local Char = newText:sub(i, i)
            local lbl = Instance.new("TextLabel")
            lbl.BackgroundTransparency = 1
            lbl.BorderSizePixel = 0
            lbl.Font = currentFont
            lbl.TextSize = 14
            lbl.TextColor3 = currentTheme.TextMuted
            lbl.TextTransparency = 0
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.TextYAlignment = Enum.TextYAlignment.Center
            lbl.RichText = false
            lbl.ZIndex = 3
            lbl.Text = utf8.char(string.byte(Char))
            local Bounds = TextService:GetTextSize(Char, 14, currentFont, Vector2.new(math.huge, math.huge))
            local Width = math.max(Bounds.X + math.floor(14 * 0.08), 4)
            if Char == " " then Width = math.max(Bounds.X, 14 * 0.28) end
            lbl.Size = UDim2.new(0, Width, 1, 0)
            lbl.Position = UDim2.new(0, offset, 0, 0)
            lbl.Parent = Title
            offset = offset + Width
        end
        Title.Size = UDim2.new(0, offset + 4, 0, 28)
    end

    MakeDraggable(TopFrame, MainFrame)
    
    local ServersHoldFrame = CreateFrame(MainFrame, ENC.ServersHoldFrame, currentTheme.Secondary, 0.1, UDim2.new(0, 60, 0, 350), UDim2.new(0.01, 0, 0.08, 0), 2)
    CreateCorner(ServersHoldFrame, 8)
    local ServersHold = Instance.new("ScrollingFrame")
    ServersHold.Name = ENC.ServersHold; ServersHold.Parent = ServersHoldFrame; ServersHold.Active = true
    ServersHold.BackgroundTransparency = 1; ServersHold.BorderSizePixel = 0
    ServersHold.Position = UDim2.new(0, 5, 0, 5); ServersHold.Size = UDim2.new(0, 50, 0, 340)
    ServersHold.CanvasSize = UDim2.new(0, 0, 0, 0); ServersHold.ScrollBarThickness = 0; ServersHold.ZIndex = 3
    local ServersHoldLayout = Instance.new("UIListLayout")
    ServersHoldLayout.Name = ENC.ServersHoldLayout; ServersHoldLayout.Parent = ServersHold
    ServersHoldLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ServersHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder; ServersHoldLayout.Padding = UDim.new(0, 3)
    local ServersHoldPadding = Instance.new("UIPadding")
    ServersHoldPadding.Name = ENC.ServersHoldPadding; ServersHoldPadding.Parent = ServersHold; ServersHoldPadding.PaddingTop = UDim.new(0, 5)
    
    local ChannelsHoldFrame = CreateFrame(MainFrame, ENC.ChannelsHoldFrame, currentTheme.Secondary, 0.1, UDim2.new(0, 130, 0, 350), UDim2.new(0.12, 0, 0.08, 0), 2)
    CreateCorner(ChannelsHoldFrame, 8)
    local ChannelsHold = Instance.new("ScrollingFrame")
    ChannelsHold.Name = ENC.ChannelsHold; ChannelsHold.Parent = ChannelsHoldFrame; ChannelsHold.Active = true
    ChannelsHold.BackgroundTransparency = 1; ChannelsHold.BorderSizePixel = 0
    ChannelsHold.Position = UDim2.new(0, 5, 0, 5); ChannelsHold.Size = UDim2.new(0, 120, 0, 340)
    ChannelsHold.CanvasSize = UDim2.new(0, 0, 0, 0); ChannelsHold.ScrollBarThickness = 4; ChannelsHold.ZIndex = 3
    local ChannelsHoldLayout = Instance.new("UIListLayout")
    ChannelsHoldLayout.Name = ENC.ChannelsHoldLayout; ChannelsHoldLayout.Parent = ChannelsHold
    ChannelsHoldLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    ChannelsHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder; ChannelsHoldLayout.Padding = UDim.new(0, 2)
    
    local Servers = {}
    local function registerThemeUpdate(updateFunc) table.insert(ThemeUpdateConnections, updateFunc) end
    
    registerThemeUpdate(function()
        MainFrame.BackgroundColor3 = currentTheme.Main
        TopFrame.BackgroundColor3 = currentTheme.Main
        Title.TextColor3 = currentTheme.TextMuted
        mainShadow.ImageColor3 = currentTheme.Shadow
    end)
    registerThemeUpdate(function()
        ServersHoldFrame.BackgroundColor3 = currentTheme.Secondary
        ChannelsHoldFrame.BackgroundColor3 = currentTheme.Secondary
    end)
    function DiscordLib:SelectServer(Name)
        if minimizeAnimating then return end
        for _, s in pairs(Sections) do if s and s.Parent then s.Visible = false end end
        for os, chs in pairs(ServerChannels) do 
            for _, cd in pairs(chs) do 
                if type(cd) == "table" and cd.Button then 
                    cd.Button.Visible = (os == Name)
                    if os ~= Name then
                        if cd.isSelected then
                            cd.isSelected = false
                            cd.Button.BackgroundColor3 = currentTheme.Tertiary
                            cd.Button.BackgroundTransparency = 0.7
                        end
                    end
                end 
            end 
        end
        for n, d in pairs(ServerButtons) do 
            if d.Button then 
                local it = n == Name
                d.Selected = it
                local bg = d.Button:FindFirstChild(ENC.ServerSelectionBg)
                local ic = d.Button:FindFirstChild(ENC.ServerIcon)
                TweenService:Create(d.Button, TweenInfo.new(it and 0.2 or 0.15), {BackgroundTransparency = it and 0 or 0.5}):Play()
                if bg then TweenService:Create(bg, TweenInfo.new(it and 0.25 or 0.2), {BackgroundTransparency = it and 0.15 or 1}):Play() end
                if ic then 
                    local bd = ic:FindFirstChild(ENC.ServerIconBorder)
                    if bd then TweenService:Create(bd, TweenInfo.new(0.3), {Transparency = it and 0 or 0.7}):Play() end 
                end 
            end 
        end
        currentServer = Name; currentChannel = nil
        local sc = ServerChannels[Name] and ServerChannels[Name]._savedChannel
        if sc and ServerChannels[Name][sc] then 
            currentChannel = sc
            local scc = ServerChannels[Name][sc]
            if scc and scc.Button then 
                scc.isSelected = true
                scc.Button.BackgroundColor3 = currentTheme.Accent
                scc.Button.BackgroundTransparency = 0
                local g = scc.Button:FindFirstChild(ENC.ChannelGlow)
                if g then g.BackgroundTransparency = 0 end
                local ind = scc.Button:FindFirstChild(ENC.ChannelIndicator)
                if ind then ind.Visible = true; ind.Size = UDim2.new(0,6,0,6) end
                local sbg = scc.Button:FindFirstChild(ENC.ChannelSelectionBg)
                if sbg then sbg.BackgroundTransparency = 0 end
            end
            local fn = Name .. ":" .. sc
            local ts = Sections[fn]
            if ts and ts.Parent then ts.Visible = true end
        end
    end
    function DiscordLib:SelectChannel(serverName, channelName)
        if minimizeAnimating then return end
        if serverName and channelName and ServerChannels[serverName] and ServerChannels[serverName][channelName] then
            ServerChannels[serverName]._savedChannel = channelName
            for _, s in pairs(Sections) do 
                if s and s.Parent then s.Visible = false end 
            end
            currentServer = serverName
            currentChannel = channelName
            for n, d in pairs(ServerButtons) do 
                if d.Button then 
                    local it = n == serverName
                    d.Selected = it
                    local bg = d.Button:FindFirstChild(ENC.ServerSelectionBg)
                    local ic = d.Button:FindFirstChild(ENC.ServerIcon)
                    TweenService:Create(d.Button, TweenInfo.new(it and 0.2 or 0.15), {BackgroundTransparency = it and 0 or 0.5}):Play()
                    if bg then TweenService:Create(bg, TweenInfo.new(it and 0.25 or 0.2), {BackgroundTransparency = it and 0.15 or 1}):Play() end
                    if ic then 
                        local bd = ic:FindFirstChild(ENC.ServerIconBorder)
                        if bd then TweenService:Create(bd, TweenInfo.new(0.3), {Transparency = it and 0 or 0.7}):Play() end 
                    end 
                end 
            end
            for cn, cd in pairs(ServerChannels[serverName]) do 
                if type(cd) == "table" and cd.Button then 
                    cd.Button.Visible = true
                    if cd.isSelected and cn ~= channelName then
                        cd.isSelected = false
                        cd.Button.BackgroundColor3 = currentTheme.Tertiary
                        cd.Button.BackgroundTransparency = 0.7
                        local g = cd.Button:FindFirstChild(ENC.ChannelGlow)
                        if g then g.BackgroundTransparency = 1 end
                        local ind = cd.Button:FindFirstChild(ENC.ChannelIndicator)
                        if ind then ind.Visible = false end
                        local sbg = cd.Button:FindFirstChild(ENC.ChannelSelectionBg)
                        if sbg then sbg.BackgroundTransparency = 1 end
                    end
                end 
            end
            local channelData = ServerChannels[serverName][channelName]
            if channelData and channelData.selectChannel then
                channelData.selectChannel(true)
            end
            for os, chs in pairs(ServerChannels) do 
                if os ~= serverName then 
                    for _, cd in pairs(chs) do 
                        if type(cd) == "table" and cd.Button then 
                            cd.Button.Visible = false 
                        end 
                    end 
                end 
            end
            local fn = serverName .. ":" .. channelName
            local ts = Sections[fn]
            if ts and ts.Parent then 
                ts.Visible = true
                TweenService:Create(ts, TweenInfo.new(0.3), {BackgroundTransparency = 0.1}):Play() 
            end
        end
    end
    function Servers:Server(Name, Image)
        if ServerButtons[Name] then 
            return ServerButtons[Name].Button 
        end
        ServerChannels[Name] = ServerChannels[Name] or {}
        local serverSize = math.floor(40 * currentWindowSize)
        local ServerBtn = CreateTextButton(ServersHold, XorEncode(Name), UDim2.new(0, serverSize, 0, serverSize), nil, 4)
        ServerBtn.BackgroundTransparency = 0.5; ServerBtn.Text = ""
        CreateCorner(ServerBtn, math.floor(20 * currentWindowSize))
        local ServerSelectionBg = CreateFrame(ServerBtn, ENC.ServerSelectionBg, currentTheme.Accent, 1, UDim2.new(0, serverSize + 6, 0, serverSize + 6), UDim2.new(0, -3, 0, -3), 1)
        local ServerSelectionBgGradient = Instance.new("UIGradient")
        ServerSelectionBgGradient.Rotation = 45
        ServerSelectionBgGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, currentTheme.Accent), ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)})
        ServerSelectionBgGradient.Parent = ServerSelectionBg
        local ServerIcon = Instance.new("ImageLabel")
        ServerIcon.Name = ENC.ServerIcon; ServerIcon.Parent = ServerBtn; ServerIcon.BackgroundTransparency = 1
        ServerIcon.Size = UDim2.new(0, serverSize - 4, 0, serverSize - 4); ServerIcon.Position = UDim2.new(0, 2, 0, 2)
        ServerIcon.Image = Image; ServerIcon.ZIndex = 5
        CreateCorner(ServerIcon, math.floor(18 * currentWindowSize))
        local ServerIconBorder = Instance.new("UIStroke")
        ServerIconBorder.Name = ENC.ServerIconBorder; ServerIconBorder.Parent = ServerIcon
        ServerIconBorder.Color = currentTheme.ServerBorder; ServerIconBorder.Transparency = 0.7
        ServerIconBorder.Thickness = 1.5; ServerIconBorder.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        ServersHold.CanvasSize = UDim2.new(0, 0, 0, ServersHoldLayout.AbsoluteContentSize.Y)
        ServerButtons[Name] = {Button = ServerBtn, Selected = false}
        registerThemeUpdate(function()
            ServerBtn.BackgroundColor3 = currentTheme.Tertiary
            ServerSelectionBg.BackgroundColor3 = currentTheme.Accent
            ServerSelectionBgGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, currentTheme.Accent), ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)})
            ServerIconBorder.Color = currentTheme.ServerBorder
        end)
        ServerBtn.MouseButton1Click:Connect(function()
            if minimizeAnimating then return end
            for name, data in pairs(ServerButtons) do
                if data.Button and data.Button ~= ServerBtn then data.Selected = false
                    local otherBg = data.Button:FindFirstChild(ENC.ServerSelectionBg)
                    if otherBg then TweenService:Create(otherBg, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play() end
                    TweenService:Create(data.Button, TweenInfo.new(0.2), {BackgroundTransparency = 0.5}):Play()
                    local otherIcon = data.Button:FindFirstChild(ENC.ServerIcon)
                    if otherIcon then local ob = otherIcon:FindFirstChild(ENC.ServerIconBorder); if ob then TweenService:Create(ob, TweenInfo.new(0.3), {Transparency = 0.7}):Play() end end
                end
            end
            ServerButtons[Name].Selected = true
            TweenService:Create(ServerSelectionBg, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.15}):Play()
            TweenService:Create(ServerBtn, TweenInfo.new(0.25), {BackgroundTransparency = 0}):Play()
            TweenService:Create(ServerIconBorder, TweenInfo.new(0.3), {Transparency = 0}):Play()
            DiscordLib:SelectServer(Name)
        end)
        ServerBtn.MouseEnter:Connect(function() if not ServerButtons[Name].Selected then TweenService:Create(ServerBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.3}):Play() end end)
        ServerBtn.MouseLeave:Connect(function() if not ServerButtons[Name].Selected then TweenService:Create(ServerBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.5}):Play() end end)
        return ServerBtn
    end
function Servers:Channel(serverName, channelName)
    if not serverName or not channelName then return {} end
    ServerChannels[serverName] = ServerChannels[serverName] or {}
    local function createChannel()
        local ratio = currentWindowSize
        local cw = math.floor(110 * ratio)
        local chh = math.floor(24 * ratio)
        local ChannelBtn = CreateTextButton(ChannelsHold, XorEncode(channelName), UDim2.new(0, cw, 0, chh), nil, 4)
        ChannelBtn.BackgroundColor3 = currentTheme.Tertiary
        ChannelBtn.BackgroundTransparency = 0.7
        ChannelBtn.Visible = (currentServer == serverName)
        ChannelBtn.Text = ""
        local corner = CreateCorner(ChannelBtn, math.floor(6 * ratio))
        local ChannelSelectionBg = CreateFrame(ChannelBtn, ENC.ChannelSelectionBg, currentTheme.Accent, 1, UDim2.new(1, 0, 1, 0), nil, 3)
        local bgCorner = CreateCorner(ChannelSelectionBg, math.floor(6 * ratio))
        local ChannelSelectionGradient = Instance.new("UIGradient")
        ChannelSelectionGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, currentTheme.Accent), ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)})
        ChannelSelectionGradient.Parent = ChannelSelectionBg
        local ChannelGlow = CreateFrame(ChannelBtn, ENC.ChannelGlow, currentTheme.Accent, 1, UDim2.new(0, 3, 1, 0), nil, 4)
        CreateCorner(ChannelGlow, 2)
        local ChannelIndicator = CreateFrame(ChannelBtn, ENC.ChannelIndicator, currentTheme.Accent, 0, UDim2.new(0, 0, 0, 0), UDim2.new(0, 2, 0.5, -3), 5)
        ChannelIndicator.Visible = false
        CreateCorner(ChannelIndicator, 1)
        local ChannelIcon = CreateLabel(ChannelBtn, ENC.ChannelIcon, "#", currentTheme.TextMuted, math.floor(14 * ratio), currentFont, UDim2.new(0, 15, 0, chh), UDim2.new(0, 8, 0, 0), 5)
        local ChannelLabel = CreateLabel(ChannelBtn, ENC.ChannelLabel, channelName, currentTheme.Text, math.floor(12 * ratio), currentFont, UDim2.new(0, cw - 28, 0, chh), UDim2.new(0, 25, 0, 0), 5)
        ChannelLabel.TextTruncate = Enum.TextTruncate.AtEnd
        ChannelsHold.CanvasSize = UDim2.new(0, 0, 0, ChannelsHoldLayout.AbsoluteContentSize.Y)
        local channelObj = {
            Button = ChannelBtn,
            Icon = ChannelIcon,
            Label = ChannelLabel,
            isSelected = false,
            isAnimating = false
        }
        ServerChannels[serverName][channelName] = channelObj
        table.insert(ThemeUpdateConnections, function()
            ChannelSelectionGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, currentTheme.Accent), ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)})
            ChannelGlow.BackgroundColor3 = currentTheme.Accent
            ChannelIndicator.BackgroundColor3 = currentTheme.Accent
            if not channelObj.isSelected then
                ChannelBtn.BackgroundColor3 = currentTheme.Tertiary
                ChannelIcon.TextColor3 = currentTheme.TextMuted
                ChannelLabel.TextColor3 = currentTheme.Text
            else
                ChannelBtn.BackgroundColor3 = currentTheme.Accent
                ChannelIcon.TextColor3 = currentTheme.Text
                ChannelLabel.TextColor3 = currentTheme.Text
            end
        end)
        local function selectChannel(instant)
            if channelObj.isAnimating or (channelObj.isSelected and not instant) then return end
            channelObj.isAnimating = true
            for _, cd in pairs(ServerChannels[serverName]) do
                if type(cd) == "table" and cd.Button and cd.Button ~= ChannelBtn and cd.isSelected then
                    cd.isSelected = false
                    TweenService:Create(cd.Button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = currentTheme.Tertiary,
                        BackgroundTransparency = 0.7
                    }):Play()
                    local g = cd.Button:FindFirstChild(ENC.ChannelGlow)
                    if g then TweenService:Create(g, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play() end
                    local ind = cd.Button:FindFirstChild(ENC.ChannelIndicator)
                    if ind then 
                        TweenService:Create(ind, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
                        task.delay(0.2, function() if ind and ind.Parent then ind.Visible = false end end)
                    end
                    local sbg = cd.Button:FindFirstChild(ENC.ChannelSelectionBg)
                    if sbg then TweenService:Create(sbg, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play() end
                    if cd.Icon then TweenService:Create(cd.Icon, TweenInfo.new(0.25), {TextColor3 = currentTheme.TextMuted}):Play() end
                    if cd.Label then TweenService:Create(cd.Label, TweenInfo.new(0.25), {TextColor3 = currentTheme.Text}):Play() end
                end
            end
            channelObj.isSelected = true
            if instant then
                ChannelSelectionBg.BackgroundTransparency = 0
                ChannelGlow.BackgroundTransparency = 0
                ChannelIndicator.Visible = true
                ChannelIndicator.Size = UDim2.new(0, math.floor(6 * ratio), 0, math.floor(6 * ratio))
                ChannelBtn.BackgroundColor3 = currentTheme.Accent
                ChannelBtn.BackgroundTransparency = 0
                ChannelIcon.TextColor3 = currentTheme.Text
                ChannelLabel.TextColor3 = currentTheme.Text
                channelObj.isAnimating = false
            else
                TweenService:Create(ChannelSelectionBg, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                TweenService:Create(ChannelGlow, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                ChannelIndicator.Visible = true
                local indSize = math.floor(6 * ratio)
                TweenService:Create(ChannelIndicator, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, indSize, 0, indSize)}):Play()
                TweenService:Create(ChannelBtn, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = currentTheme.Accent,
                    BackgroundTransparency = 0
                }):Play()
                TweenService:Create(ChannelIcon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = currentTheme.Text}):Play()
                TweenService:Create(ChannelLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = currentTheme.Text}):Play()
                task.delay(0.4, function() channelObj.isAnimating = false end)
            end
        end
        ChannelBtn.MouseButton1Click:Connect(function()
            if minimizeAnimating then return end
            selectChannel(false)
            DiscordLib:SelectChannel(serverName, channelName)
        end)
        ChannelBtn.MouseEnter:Connect(function()
            if not channelObj.isSelected and not channelObj.isAnimating then
                TweenService:Create(ChannelBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = currentTheme.Hover,
                    BackgroundTransparency = 0.4
                }):Play()
            end
        end)
        ChannelBtn.MouseLeave:Connect(function()
            if not channelObj.isSelected and not channelObj.isAnimating then
                TweenService:Create(ChannelBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = currentTheme.Tertiary,
                    BackgroundTransparency = 0.7
                }):Play()
            end
        end)
        channelObj.selectChannel = selectChannel
        return channelObj
    end
    local channelObj = createChannel()
    local SectionFrame = Instance.new("ScrollingFrame")
    local SectionLayout = Instance.new("UIListLayout")
    local SectionPadding = Instance.new("UIPadding")
    local fullName = serverName .. ":" .. channelName
    SectionFrame.Name = XorEncode(fullName)
    SectionFrame.Parent = MainFrame
    SectionFrame.BackgroundColor3 = currentTheme.Secondary
    SectionFrame.BackgroundTransparency = currentTransparency > 0 and currentTransparency or 0.1
    SectionFrame.BorderSizePixel = 0
    SectionFrame.Position = UDim2.new(0.35, 0, 0.08, 0)
    SectionFrame.Size = UDim2.new(0, math.floor(390 * currentWindowSize), 0, 350)
    SectionFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    SectionFrame.ScrollBarThickness = 4
    SectionFrame.Visible = false
    SectionFrame.ZIndex = 5
    CreateCorner(SectionFrame, 8)
    local SectionTitle = CreateLabel(SectionFrame, ENC.SectionTitle, "# " .. channelName .. "  " .. serverName, currentTheme.Text, 16, currentFont, UDim2.new(0, 380, 0, 25), nil, 6)
    SectionLayout.Name = ENC.SectionLayout
    SectionLayout.Parent = SectionFrame
    SectionLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    SectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SectionLayout.Padding = UDim.new(0, 3)
    SectionPadding.Name = ENC.SectionPadding
    SectionPadding.Parent = SectionFrame
    SectionPadding.PaddingLeft = UDim.new(0, 6)
    SectionPadding.PaddingTop = UDim.new(0, 30)
    Sections[fullName] = SectionFrame
    table.insert(ThemeUpdateConnections, function()
        SectionFrame.BackgroundColor3 = currentTheme.Secondary
        SectionTitle.TextColor3 = currentTheme.Text
    end)
local function GetSectionContentWidth()
    if not SectionFrame or not SectionFrame.Parent then return 370 end
    local pad = SectionFrame:FindFirstChild(ENC.SectionPadding)
    local padLeft = pad and pad.PaddingLeft.Offset or 0
    local totalW = SectionFrame.AbsoluteSize.X
    if totalW <= 0 then return 370 end
    return math.max(totalW - padLeft - 10, 100)
end
    local Section = {}
    function Section:Label(text)
        local Label = CreateLabel(SectionFrame, ENC_PREFIX.Label_ .. XorEncode(text), text, currentTheme.Text, 11, currentFont, UDim2.new(0, 370, 0, 18), UDim2.new(0, 10, 0, 5), 6)
        Label.TextWrapped = true; Label.RichText = true; Label.LineHeight = 1.2; Label.AutomaticSize = Enum.AutomaticSize.Y
        Label:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35) end)
        SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
        registerThemeUpdate(function() Label.TextColor3 = currentTheme.Text end)
        return Label
    end
function Section:Paragraph(title, content)
    local ParagraphFrame = CreateFrame(SectionFrame, ENC_PREFIX.Paragraph_ .. XorEncode(title), currentTheme.Tertiary, 0, UDim2.new(1, -14, 0, 50), nil, 6)
    CreateCorner(ParagraphFrame, 6)
    local TitleLabel = CreateLabel(ParagraphFrame, ENC.ParagraphTitle, tostring(title or ""), currentTheme.Text, 14, currentFont, UDim2.new(1, -20, 0, 0), UDim2.new(0, 10, 0, 8), 7)
    TitleLabel.TextWrapped = true
    TitleLabel.RichText = false
    TitleLabel.AutomaticSize = Enum.AutomaticSize.Y
    TitleLabel.TextYAlignment = Enum.TextYAlignment.Top
    local ContentLabel = CreateLabel(ParagraphFrame, ENC.ParagraphContent, tostring(content or ""), currentTheme.TextMuted, 12, currentFont, UDim2.new(1, -20, 0, 0), UDim2.new(0, 10, 0, 8), 7)
    ContentLabel.TextWrapped = true
    ContentLabel.RichText = false
    ContentLabel.AutomaticSize = Enum.AutomaticSize.Y
    ContentLabel.TextYAlignment = Enum.TextYAlignment.Top
    local function updateParagraphSize()
        if not ParagraphFrame or not ParagraphFrame.Parent then return end
        local fw = ParagraphFrame.AbsoluteSize.X
        if fw <= 0 then fw = 370 end
        TitleLabel.Size = UDim2.new(0, fw - 20, 0, 0)
        ContentLabel.Size = UDim2.new(0, fw - 20, 0, 0)
        task.wait()
        local titleH = TitleLabel.TextBounds.Y
        local contentH = ContentLabel.TextBounds.Y
        local th = titleH + contentH + 30
        ContentLabel.Position = UDim2.new(0, 10, 0, titleH + 12)
        ParagraphFrame.Size = UDim2.new(1, -14, 0, th)
        SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
    end
    TitleLabel:GetPropertyChangedSignal("TextBounds"):Connect(updateParagraphSize)
    ContentLabel:GetPropertyChangedSignal("TextBounds"):Connect(updateParagraphSize)
    ParagraphFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateParagraphSize)
    task.wait()
    updateParagraphSize()
    registerThemeUpdate(function()
        ParagraphFrame.BackgroundColor3 = currentTheme.Tertiary
        TitleLabel.TextColor3 = currentTheme.Text
        ContentLabel.TextColor3 = currentTheme.TextMuted
        task.defer(updateParagraphSize)
    end)
    local API = {}
    function API:SetTitle(t)
        TitleLabel.Text = tostring(t or "")
        task.defer(updateParagraphSize)
        return self
    end
    function API:SetContent(c)
        ContentLabel.Text = tostring(c or "")
        task.defer(updateParagraphSize)
        return self
    end
    function API:SetBoth(t, c)
        TitleLabel.Text = tostring(t or "")
        ContentLabel.Text = tostring(c or "")
        task.defer(updateParagraphSize)
        return self
    end
    function API:SetVisible(v)
        ParagraphFrame.Visible = v
        return self
    end
    function API:Destroy()
        ParagraphFrame:Destroy()
    end
    setmetatable(API, {
        __index = function(_, key)
            if rawget(API, key) then return rawget(API, key) end
            local v = ParagraphFrame[key]
            if type(v) == "function" then
                return function(_, ...) return v(ParagraphFrame, ...) end
            end
            return v
        end,
        __newindex = function(_, key, value)
            ParagraphFrame[key] = value
        end
    })
    return API
end
    function Section:Seperator()
        local Sep = CreateFrame(SectionFrame, ENC_PREFIX.Seperator, currentTheme.TextMuted, 0.5, UDim2.new(0, 370, 0, 2), nil, 6)
        CreateCorner(Sep, 1)
        local pt = Instance.new("UIPadding"); pt.Parent = Sep; pt.PaddingTop = UDim.new(0, 5); pt.PaddingBottom = UDim.new(0, 5)
        SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 40)
        registerThemeUpdate(function() Sep.BackgroundColor3 = currentTheme.TextMuted end)
        return Sep
    end

function Section:Button(e,t,n)
    if type(t)=="function"then n=t;t=nil end
    local i=12; local s=20; local r=8; local a=12; local l=36; local c=t~=nil
    local realW = SectionFrame.AbsoluteSize.X
    if realW <= 0 then realW = 370 end
    if c then
        local el=CreateLabel(SectionFrame,nil,t,nil,a,currentFont,UDim2.new(0,realW-i*2,0,5000))
        el.TextWrapped=true
        el.RichText=true
        el.Visible=false
        task.wait()
        l = s + el.TextBounds.Y + 24
        el:Destroy()
    end
    local d = CreateFrame(SectionFrame, ENC_PREFIX.Button_ .. XorEncode(e), currentTheme.Tertiary, 0, UDim2.new(1, -14, 0, l), nil, 6)
    CreateCorner(d,6)
    local h=CreateTextButton(d,XorEncode(e.."Btn"),UDim2.new(1,0,1,0),nil,7)
    h.BackgroundTransparency=1; h.Text=""
    local u=CreateLabel(d,ENC.ButtonTitle,e,currentTheme.Text,14,currentFont,
        UDim2.new(1,-i*2,0,s),UDim2.new(0,i,0,c and r or 0),8)
    u.TextYAlignment=Enum.TextYAlignment.Center
    local p
    if c then
        p=CreateLabel(d,ENC.ButtonDesc,t,currentTheme.TextMuted,a,currentFont,
            UDim2.new(1,-i*2,0,l-s-r-4),UDim2.new(0,i,0,r+s+2),8)
        p.TextWrapped=true; p.RichText=true
    end

    local BlindOverlay = Instance.new("Frame")
    BlindOverlay.Name = EncriptyText(math.random(8, 14))
    BlindOverlay.Parent = d
    BlindOverlay.Size = UDim2.new(1, 0, 1, 0)
    BlindOverlay.BackgroundColor3 = currentTheme.Main
    BlindOverlay.BackgroundTransparency = 1
    BlindOverlay.BorderSizePixel = 0
    BlindOverlay.ZIndex = 20
    BlindOverlay.Visible = false
    BlindOverlay.Active = true
    CreateCorner(BlindOverlay, 6)

    local LockIcon = Instance.new("TextLabel")
    LockIcon.Parent = BlindOverlay
    LockIcon.BackgroundTransparency = 1
    LockIcon.Size = UDim2.new(0, 20, 0, 20)
    LockIcon.Position = UDim2.new(1, -30, 0.5, -10)
    LockIcon.Text = "🔒"
    LockIcon.TextSize = 14
    LockIcon.Font = currentFont
    LockIcon.TextColor3 = currentTheme.TextMuted
    LockIcon.TextTransparency = 1
    LockIcon.ZIndex = 21

    registerThemeUpdate(function()
        d.BackgroundColor3=currentTheme.Tertiary
        u.TextColor3=currentTheme.Text
        if p then p.TextColor3=currentTheme.TextMuted end
        BlindOverlay.BackgroundColor3 = currentTheme.Main
        LockIcon.TextColor3 = currentTheme.TextMuted
    end)

    local currentCallback   = n
    local longPressCallback = nil
    local longPressTime     = 5
    local cooldownTime      = 0
    local lastClickTime     = 0
    local isInCooldown      = false
    local longPressThread   = nil
    local longPressFired    = false
    local blinded           = false

    local f=false;local m=false;local y=Vector2.new(0,0)

    h.InputBegan:Connect(function(v)
        if blinded then return end
        if v.UserInputType==Enum.UserInputType.MouseButton1 or v.UserInputType==Enum.UserInputType.Touch then
            y=Vector2.new(v.Position.X,v.Position.Y)
            longPressFired = false
            if longPressCallback then
                longPressThread = task.delay(longPressTime, function()
                    if not blinded and not longPressFired and d and d.Parent then
                        longPressFired = true
                        task.spawn(function()
                            pcall(longPressCallback, true)
                        end)
                    end
                end)
            end
        end
    end)
    h.InputEnded:Connect(function(v)
        if v.UserInputType==Enum.UserInputType.MouseButton1 or v.UserInputType==Enum.UserInputType.Touch then
            if longPressThread then
                pcall(function() task.cancel(longPressThread) end)
                longPressThread = nil
            end
        end
    end)
    h.MouseEnter:Connect(function()
        if blinded then return end
        if getgenv().ABC8281 or getgenv().ABC3616 or getgenv().ABC3728 then return end
        f=true
        if not m and not isInCooldown then
            TweenService:Create(d,TweenInfo.new(0.15),{BackgroundColor3=currentTheme.Hover,BackgroundTransparency=0.1}):Play()
        end
    end)
    h.MouseLeave:Connect(function()
        if blinded then return end
        f=false
        if not m and not isInCooldown then
            TweenService:Create(d,TweenInfo.new(0.15),{BackgroundColor3=currentTheme.Tertiary,BackgroundTransparency=0}):Play()
        end
    end)
    h.MouseButton1Click:Connect(function()
        if blinded then return end
        if minimizeAnimating or m then return end
        if getgenv().ABC8281 or getgenv().ABC3616 then return end
        if getgenv().ABC3728 then return end
        local now = tick()
        if isInCooldown or (now - lastClickTime) < cooldownTime then
            return
        end
        lastClickTime = now
        if longPressFired then
            return
        end
        m=true
        TweenService:Create(d,TweenInfo.new(0.08),{BackgroundColor3=currentTheme.Hover,BackgroundTransparency=0.1}):Play()
        local v=y or Vector2.new(d.AbsolutePosition.X+d.AbsoluteSize.X/2,d.AbsolutePosition.Y+d.AbsoluteSize.Y/2)
        local b=Instance.new("Frame")
        b.Name=ENC.Ripple;b.Parent=d;b.AnchorPoint=Vector2.new(0.5,0.5)
        b.BackgroundColor3=Color3.fromRGB(255,255,255);b.BackgroundTransparency=0.65
        b.BorderSizePixel=0;b.ZIndex=10;b.ClipsDescendants=false
        local g=d.AbsolutePosition
        local w=v.X-g.X;local _=v.Y-g.Y
        b.Position=UDim2.new(0,w,0,_)
        b.Size=UDim2.new(0,2,0,2)
        local D=Instance.new("UICorner")
        D.CornerRadius=UDim.new(0,1);D.Parent=b
        TweenService:Create(b,TweenInfo.new(0.6,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,80,0,80),BackgroundTransparency=1}):Play()
        task.spawn(function()
            local E=0;while E<0.6 and b and b.Parent do
                local S=b.AbsoluteSize.X
                if S>0 then pcall(function()D.CornerRadius=UDim.new(0,S/2)end)end;task.wait(0.025);E=E+0.025
            end
        end)
        task.delay(0.1,function()
            m=false
            if d and d.Parent and not blinded then
                TweenService:Create(d,TweenInfo.new(0.1),{BackgroundColor3=f and currentTheme.Hover or currentTheme.Tertiary,BackgroundTransparency=f and 0.1 or 0}):Play()
            end
        end)
        task.delay(0.6,function()if b and b.Parent then b:Destroy()end end)
        if cooldownTime > 0 then
            isInCooldown = true
            TweenService:Create(d, TweenInfo.new(0.2), {BackgroundTransparency = 0.6}):Play()
            task.delay(cooldownTime, function()
                isInCooldown = false
                if d and d.Parent and not blinded then
                    TweenService:Create(d, TweenInfo.new(0.2), {
                        BackgroundTransparency = f and 0.1 or 0,
                        BackgroundColor3 = f and currentTheme.Hover or currentTheme.Tertiary
                    }):Play()
                end
            end)
        end
        if currentCallback and not blinded then
            task.spawn(function() pcall(currentCallback) end)
        end
    end)
    SectionFrame.CanvasSize=UDim2.new(0,0,0,SectionLayout.AbsoluteContentSize.Y+35)

    local API = {}
    function API:SetTitle(text)
        u.Text = tostring(text or "")
        return self
    end
    function API:SetDesc(text)
        if p then
            p.Text = tostring(text or "")
            task.defer(function()
                if d and d.Parent and p and p.Parent then
                    local needed = s + p.TextBounds.Y + r + 24
                    d.Size = UDim2.new(1, -14, 0, math.max(l, needed))
                    SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
                end
            end)
        end
        return self
    end
    function API:NewCallback(fn)
        currentCallback = fn
        return self
    end
    function API:LongPress(fn)
        longPressCallback = fn
        return self
    end
    function API:TimePress(seconds)
        longPressTime = tonumber(seconds) or 5
        return self
    end
    function API:WaitClick(seconds)
        cooldownTime = tonumber(seconds) or 0
        return self
    end

    function API:Blind(value)
        if value == nil then return blinded end
        local newState = value and true or false
        if newState == blinded then return blinded end
        blinded = newState

        if blinded then
            if longPressThread then
                pcall(function() task.cancel(longPressThread) end)
                longPressThread = nil
            end
            longPressFired = false
            f = false
            if not isInCooldown then
                TweenService:Create(d, TweenInfo.new(0.15),
                    {BackgroundColor3 = currentTheme.Tertiary, BackgroundTransparency = 0}):Play()
            end
            BlindOverlay.Visible = true
            LockIcon.Visible = true
            TweenService:Create(BlindOverlay, TweenInfo.new(0.2), {BackgroundTransparency = 0.55}):Play()
            TweenService:Create(LockIcon,      TweenInfo.new(0.2), {TextTransparency = 0}):Play()
        else
            TweenService:Create(BlindOverlay, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            TweenService:Create(LockIcon,      TweenInfo.new(0.2), {TextTransparency = 1}):Play()
            task.delay(0.2, function()
                if not blinded then
                    BlindOverlay.Visible = false
                    LockIcon.Visible = false
                end
            end)
        end
        return blinded
    end
    function API:Unblind()     return self:Blind(false) end
    function API:IsBlinded()   return blinded end

    setmetatable(API, {
        __index = function(_, key)
            if rawget(API, key) then return rawget(API, key) end
            local v = d[key]
            if type(v) == "function" then
                return function(_, ...) return v(d, ...) end
            end
            return v
        end,
        __newindex = function(_, key, value)
            d[key] = value
        end
    })

    return API
end

    function Section:Model(text, desc, modelOrCallback)
        local model = nil
        if typeof(modelOrCallback) == "Instance" then 
            model = modelOrCallback 
        end
        
        local Holder = CreateFrame(
            SectionFrame, 
            ENC_PREFIX.Model_..XorEncode(text), 
            currentTheme.Tertiary, 
            0, 
            UDim2.new(0, 370, 0, 220), 
            nil, 
            6
        )
        CreateCorner(Holder, 6)
        
        local Title = CreateLabel(
            Holder, 
            ENC.ModelTitle, 
            text, 
            currentTheme.Text, 
            14, 
            currentFont, 
            UDim2.new(1, -20, 0, 20), 
            UDim2.new(0, 10, 0, 8), 
            7
        )
        
        local Desc = desc and CreateLabel(
            Holder, 
            ENC.ModelDesc, 
            desc, 
            currentTheme.TextMuted, 
            12, 
            currentFont, 
            UDim2.new(1, -20, 0, 16), 
            UDim2.new(0, 10, 0, 28), 
            7
        )
        
        local Viewport = Instance.new("ViewportFrame")
        Viewport.Name = ENC.ModelViewport or "Viewport"
        Viewport.Parent = Holder
        Viewport.BackgroundColor3 = currentTheme.Secondary
        Viewport.BackgroundTransparency = 0
        Viewport.BorderSizePixel = 0
        Viewport.Position = UDim2.new(0, 5, 0, desc and 48 or 32)
        Viewport.Size = UDim2.new(1, -30, 1, desc and -52 or -42)
        Viewport.ZIndex = 7
        Viewport.Ambient = Color3.fromRGB(200, 200, 200)
        Viewport.LightColor = Color3.fromRGB(255, 255, 255)
        Viewport.LightDirection = Vector3.new(-1, -2, -1)
        CreateCorner(Viewport, 6)
        
        local InputCatcher = Instance.new("TextButton")
        InputCatcher.Name = "InputCatcher"
        InputCatcher.BackgroundTransparency = 1
        InputCatcher.Text = ""
        InputCatcher.Size = UDim2.new(1, 0, 1, 0)
        InputCatcher.Active = true
        InputCatcher.ZIndex = 8
        InputCatcher.Parent = Viewport

        local Shield = Instance.new("TextButton")
        Shield.Name = "InteractionShield"
        Shield.BackgroundTransparency = 1
        Shield.Text = ""
        Shield.Size = UDim2.new(100, 0, 100, 0)
        Shield.Position = UDim2.new(-50, 0, -50, 0)
        Shield.Active = true
        Shield.ZIndex = 99999
        Shield.Visible = false
        Shield.Parent = Holder

        local WorldModel = Instance.new("WorldModel")
        WorldModel.Parent = Viewport

        local cam = Instance.new("Camera")
        cam.FieldOfView = 70
        cam.Parent = Viewport
        Viewport.CurrentCamera = cam

        local camCenter = Vector3.new(0, 0, 0)
        local camRadius = 10
        local camAngleX = 0
        local camAngleY = math.rad(20)
        
        local isDragging = false
        local isPinching = false
        local initialPinchR = 10
        local currentDragInput = nil
        local lastMousePos = Vector2.new()
        
        local lockID = "Model_" .. tostring(math.random(1000, 9999))
        
        local rsConn
        rsConn = RunService.RenderStepped:Connect(function(dt)
            if not Viewport.Parent then
                rsConn:Disconnect()
                return
            end
            
            if not isDragging and not isPinching then
                camAngleX = camAngleX + (math.rad(15) * dt)
            end
            
            local height = math.sin(camAngleY) * camRadius
            local horizDist = math.cos(camAngleY) * camRadius
            local posX = math.sin(camAngleX) * horizDist
            local posZ = math.cos(camAngleX) * horizDist
            
            local finalPos = camCenter + Vector3.new(posX, height, posZ)
            cam.CFrame = CFrame.lookAt(finalPos, camCenter)
        end)

        InputCatcher.InputBegan:Connect(function(input)
            local isMouse = input.UserInputType == Enum.UserInputType.MouseButton1
            local isTouch = input.UserInputType == Enum.UserInputType.Touch
            
            if isMouse or isTouch then
                local abc = getgenv().ABC3728
                if abc and abc ~= lockID then return end
                if currentDragInput then return end
                
                currentDragInput = input
                isDragging = true
                lastMousePos = Vector2.new(
                    input.Position.X, 
                    input.Position.Y
                )
                
                getgenv().ABC3728 = lockID
                Shield.Visible = true
                
                if SectionFrame:IsA("ScrollingFrame") then
                    SectionFrame.ScrollingEnabled = false
                end
            end
        end)

        InputCatcher.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseWheel then
                local zoomDelta = input.Position.Z * (camRadius * 0.15)
                camRadius = math.clamp(
                    camRadius - zoomDelta, 
                    0.5, 
                    500
                )
            end
        end)

        UserInputService.TouchPinch:Connect(function(pos, scale, vel, state)
            if not Viewport.Parent then return end
            
            local center = Vector2.new(0, 0)
            if #pos > 0 then
                for _, p in ipairs(pos) do
                    center = center + p
                end
                center = center / #pos
            end
            
            local absPos = InputCatcher.AbsolutePosition
            local absSize = InputCatcher.AbsoluteSize
            local inX = center.X >= absPos.X and center.X <= absPos.X + absSize.X
            local inY = center.Y >= absPos.Y and center.Y <= absPos.Y + absSize.Y
            
            if (inX and inY) or isPinching then
                if state == Enum.UserInputState.Begin then
                    local abc = getgenv().ABC3728
                    if abc and abc ~= lockID then return end
                    
                    isPinching = true
                    initialPinchR = camRadius
                    
                    getgenv().ABC3728 = lockID
                    Shield.Visible = true
                    
                    if SectionFrame:IsA("ScrollingFrame") then
                        SectionFrame.ScrollingEnabled = false
                    end
                    
                elseif state == Enum.UserInputState.Change then
                    if isPinching then
                        camRadius = math.clamp(
                            initialPinchR / scale, 
                            0.5, 
                            500
                        )
                    end
                    
                elseif state == Enum.UserInputState.End then
                    isPinching = false
                    
                    if not isDragging then
                        if getgenv().ABC3728 == lockID then
                            getgenv().ABC3728 = nil
                        end
                        Shield.Visible = false
                        
                        if SectionFrame:IsA("ScrollingFrame") then
                            SectionFrame.ScrollingEnabled = true
                        end
                    end
                end
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if isDragging and input == currentDragInput then
                local currentPos = Vector2.new(
                    input.Position.X, 
                    input.Position.Y
                )
                local delta = currentPos - lastMousePos
                lastMousePos = currentPos
                
                camAngleX = camAngleX - math.rad(delta.X * 0.6)
                local newY = camAngleY + math.rad(delta.Y * 0.6)
                camAngleY = math.clamp(
                    newY, 
                    math.rad(-85), 
                    math.rad(85)
                )
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if isDragging and input == currentDragInput then
                isDragging = false
                currentDragInput = nil
                
                if not isPinching then
                    if getgenv().ABC3728 == lockID then
                        getgenv().ABC3728 = nil
                    end
                    Shield.Visible = false
                    
                    if SectionFrame:IsA("ScrollingFrame") then
                        SectionFrame.ScrollingEnabled = true
                    end
                end
            end
        end)

        local function setModel(inst)
            for _, c in ipairs(WorldModel:GetChildren()) do
                pcall(function() c:Destroy() end)
            end

            if not inst or typeof(inst) ~= "Instance" then return end

            local clone
            local ok = pcall(function()
                local oldArch = inst.Archivable
                inst.Archivable = true
                clone = inst:Clone()
                inst.Archivable = oldArch
            end)

            if not ok or not clone then return end

            pcall(function()
                for _, part in ipairs(clone:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CastShadow = false
                    end
                    if part:IsA("Script") 
                    or part:IsA("LocalScript") 
                    or part:IsA("ModuleScript") then
                        part:Destroy()
                    end
                end
            end)

            local wrapper = clone
            if not clone:IsA("Model") then
                wrapper = Instance.new("Model")
                clone.Parent = wrapper
            end

            wrapper.Parent = WorldModel

            task.defer(function()
                if not WorldModel.Parent then return end
                if not wrapper.Parent then return end

                pcall(function()
                    wrapper:PivotTo(CFrame.new(0, 0, 0))
                end)

                local cf, size = CFrame.new(0,0,0), Vector3.new(4,4,4)
                pcall(function()
                    cf, size = wrapper:GetBoundingBox()
                end)

                local maxDim = math.max(size.X, size.Y, size.Z)
                if maxDim <= 0.001 then maxDim = 4 end

                camCenter = cf.Position
                local fovRad = math.rad(cam.FieldOfView)
                local dist = (maxDim / 2) / math.tan(fovRad / 2)
                camRadius = dist * 1.35
            end)
        end

        if model then setModel(model) end

        registerThemeUpdate(function()
            Holder.BackgroundColor3 = currentTheme.Tertiary
            Title.TextColor3 = currentTheme.Text
            if Desc then 
                Desc.TextColor3 = currentTheme.TextMuted 
            end
            Viewport.BackgroundColor3 = currentTheme.Secondary
        end)
        
        local tgSize = SectionLayout.AbsoluteContentSize.Y + 35
        SectionFrame.CanvasSize = UDim2.new(0, 0, 0, tgSize)

        local ModelObj = {Viewport = Viewport, Camera = cam}
        function ModelObj:SetModel(inst) setModel(inst) end
        return ModelObj
    end

function Section:Audio(text, description, soundId, callback)
    local args = {description, soundId, callback}
    description, soundId, callback = nil, nil, nil
    for _,v in ipairs(args) do
        if type(v)=="function" then callback=v
        elseif type(v)=="string" then 
            if v:match("^https?://") or v:match("^rbxassetid") or v:match("^%d+$") or v=="" then soundId=v else description=v end 
        end 
    end

    local baseH = description and 90 or 70
    local Holder = CreateFrame(SectionFrame, ENC_PREFIX.Audio_..XorEncode(text), currentTheme.Tertiary, 0, UDim2.new(1, -20, 0, baseH), nil, 6)
    CreateCorner(Holder, 6)

    local TitleLabel = CreateLabel(Holder, ENC.AudioTitle, text, currentTheme.Text, 14, currentFont, UDim2.new(1, -150, 0, 20), UDim2.new(0, 10, 0, 8), 7)
    TitleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    
    local DescLabel
    if description and description ~= "" then 
        DescLabel = CreateLabel(Holder, XorEncode(text.."_desc"), description, currentTheme.TextMuted, 11, currentFont, UDim2.new(1, -150, 0, 16), UDim2.new(0, 10, 0, 26), 7) 
        DescLabel.TextWrapped = true
        DescLabel.TextTruncate = Enum.TextTruncate.AtEnd
    end

    local Sound = Instance.new("Sound", Holder)
    Sound.Name = XorEncode(text.."_sound")
    Sound.SoundId = GetAsset(soundId or "", "mp3")
    Sound.Volume = 0.5

    local function CreateAudioBtn(name, txt, xOffset)
        local b = CreateTextButton(Holder, XorEncode(text..name), UDim2.new(0, 55, 0, 24), nil, 8)
        b.AnchorPoint = Vector2.new(1, 0)
        b.Position = UDim2.new(1, xOffset, 0, 8)
        b.Text = txt
        b.TextColor3 = currentTheme.Text
        b.BackgroundColor3 = currentTheme.Secondary
        CreateCorner(b, 6)
        return b
    end

    local PlayBtn = CreateAudioBtn("Play", "Play", -10)
    local RestartBtn = CreateAudioBtn("Restart", "Restart", -70)
    local LoopBtn = CreateAudioBtn("Loop", "Loop: Off", -130)

    local SB = CreateFrame(Holder, XorEncode(text.."_sliderback"), currentTheme.Secondary, 0, UDim2.new(1, -20, 0, 8), UDim2.new(0, 10, 1, -25), 8)
    SB.AnchorPoint = Vector2.new(0, 1) 
    CreateCorner(SB, 4)
    
    local SF = CreateFrame(SB, XorEncode(text.."_sliderfill"), currentTheme.Accent, 0, UDim2.new(0, 0, 1, 0), nil, 9)
    CreateCorner(SF, 4)
    
    local Knob = Instance.new("Frame", Holder)
    Knob.Name = XorEncode(text.."_knob")
    Knob.Size = UDim2.new(0, 14, 0, 14)
    Knob.AnchorPoint = Vector2.new(0.5, 0.5)
    Knob.BackgroundColor3 = Color3.new(1,1,1)
    Knob.ZIndex = 20
    CreateCorner(Knob, 50)

    local TimeLabel = CreateLabel(Holder, XorEncode(text.."_time"), "0:00 / 0:00", currentTheme.TextMuted, 10, currentFont, UDim2.new(0, 80, 0, 16), UDim2.new(1, -15, 1, -40), 8)
    TimeLabel.AnchorPoint = Vector2.new(1, 1)
    TimeLabel.TextXAlignment = Enum.TextXAlignment.Right

    local drag = false
    local function updateSliderVisual(rel)
        rel = math.clamp(rel, 0, 1)
        SF.Size = UDim2.new(rel, 0, 1, 0)
        local absX = SB.AbsolutePosition.X
        local absW = SB.AbsoluteSize.X
        local knobX = absX + (rel * absW)
        
        Knob.Position = UDim2.new(0, knobX - Holder.AbsolutePosition.X, 1, -28) 
    end

    SB.InputBegan:Connect(function(i) 
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then drag=true; updateSliderVisual((i.Position.X - SB.AbsolutePosition.X) / SB.AbsoluteSize.X) end 
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(i)
        if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local rel = math.clamp((i.Position.X - SB.AbsolutePosition.X) / SB.AbsoluteSize.X, 0, 1)
            if Sound.TimeLength > 0 then Sound.TimePosition = rel * Sound.TimeLength end
            updateSliderVisual(rel)
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(i) 
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then drag=false end 
    end)

    PlayBtn.MouseButton1Click:Connect(function()
        if Sound.IsPlaying then 
            Sound:Pause()
            PlayBtn.Text = "Play" 
        else 
            Sound:Resume()
            PlayBtn.Text = "Pause" 
        end
    end)

    RestartBtn.MouseButton1Click:Connect(function() 
        Sound.TimePosition = 0
        Sound:Play()
        PlayBtn.Text = "Pause" 
    end)

    LoopBtn.MouseButton1Click:Connect(function(b) 
        Sound.Looped = not Sound.Looped
        b.Text = Sound.Looped and "Loop: On" or "Loop: Off" 
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if not Holder.Parent then return end
        local c, d = Sound.TimePosition, Sound.TimeLength
        TimeLabel.Text = string.format("%d:%02d / %d:%02d", math.floor(c/60), c%60, math.floor(d/60), d%60)
        if not drag and d > 0 then updateSliderVisual(c/d) end
    end)

    Sound.Ended:Connect(function() 
        PlayBtn.Text = "Play" 
    end)

    registerThemeUpdate(function()
        Holder.BackgroundColor3 = currentTheme.Tertiary
        TitleLabel.TextColor3 = currentTheme.Text
        if DescLabel then DescLabel.TextColor3 = currentTheme.TextMuted end
        PlayBtn.BackgroundColor3 = currentTheme.Secondary; PlayBtn.TextColor3 = currentTheme.Text
        RestartBtn.BackgroundColor3 = currentTheme.Secondary; RestartBtn.TextColor3 = currentTheme.Text
        LoopBtn.BackgroundColor3 = currentTheme.Secondary; LoopBtn.TextColor3 = currentTheme.Text
        SB.BackgroundColor3 = currentTheme.Secondary
        SF.BackgroundColor3 = currentTheme.Accent
        TimeLabel.TextColor3 = currentTheme.TextMuted
    end)
    return {
        Sound=Sound, 
        Play=function() Sound:Resume(); PlayBtn.Text="Pause" end, 
        Stop=function() Sound:Stop(); PlayBtn.Text="Play" end, 
        Time=function(s) Sound.TimePosition=s end,
        SetAudio=function(id) Sound:Stop(); Sound.SoundId=GetAsset(id, "mp3"); PlayBtn.Text="Play" end
    }
end

function Section:Image(imageId, title, description, callback)
    if type(title) == "function" then
        callback = title
        title = ""
        description = ""
    elseif type(description) == "function" then
        callback = description
        description = ""
    end

    title = title or ""
    description = description or ""
    imageId = imageId or ""

    local finalImage
    if type(imageId) == "string" and imageId:match("^https?://") then
        finalImage = GetAsset(imageId, "png")
    else
        finalImage = imageId
    end

    local hasTitle = title ~= ""
    local hasDesc  = description ~= ""


    local textHeight = (hasTitle and 22 or 0) + (hasDesc and 20 or 0)
    local imgHeight  = 160
    local holderHeight = 10 + textHeight + imgHeight + 10

    local Holder = CreateFrame(
        SectionFrame,
        ENC_PREFIX.Image_ .. XorEncode(tostring(os.clock())),
        currentTheme.Tertiary,
        0,
        UDim2.new(0, 370, 0, holderHeight),
        nil,
        6
    )
    CreateCorner(Holder, 6)

    local currentY = 10

    local TitleLabel
    if hasTitle then
        TitleLabel = CreateLabel(
            Holder,
            ENC.SectionTitle,
            title,
            currentTheme.Text,
            14,
            currentFont,
            UDim2.new(1, -20, 0, 20),
            UDim2.new(0, 10, 0, currentY),
            7
        )
        currentY = currentY + 22
    end

    local DescLabel
    if hasDesc then
        DescLabel = CreateLabel(
            Holder,
            ENC.ButtonDesc,
            description,
            currentTheme.TextMuted,
            12,
            currentFont,
            UDim2.new(1, -20, 0, 18),
            UDim2.new(0, 10, 0, currentY),
            7
        )
        currentY = currentY + 20
    end


    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = ENC.Icon
    ImageLabel.Parent = Holder
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Position = UDim2.new(0, 10, 0, currentY)
    ImageLabel.Size = UDim2.new(1, -20, 0, imgHeight)
    ImageLabel.Image = finalImage
    ImageLabel.ScaleType = Enum.ScaleType.Fit
    ImageLabel.ZIndex = 7

    local ClickZone = nil
    if callback then
        ClickZone = Instance.new("TextButton")
        ClickZone.Name = XorEncode("ImageClick")
        ClickZone.Parent = Holder
        ClickZone.BackgroundTransparency = 1
        ClickZone.Position = ImageLabel.Position
        ClickZone.Size = ImageLabel.Size
        ClickZone.Text = ""
        ClickZone.ZIndex = 8
        ClickZone.AutoButtonColor = false
        ClickZone.MouseButton1Click:Connect(callback)
    end

    registerThemeUpdate(function()
        Holder.BackgroundColor3 = currentTheme.Tertiary
        if TitleLabel then TitleLabel.TextColor3 = currentTheme.Text end
        if DescLabel then DescLabel.TextColor3 = currentTheme.TextMuted end
    end)

    local api = {}

    function api:Callback(fn)
        if ClickZone then
            ClickZone.MouseButton1Click:Connect(fn)
        else
            ClickZone = Instance.new("TextButton")
            ClickZone.Name = XorEncode("ImageClick")
            ClickZone.Parent = Holder
            ClickZone.BackgroundTransparency = 1
            ClickZone.Position = ImageLabel.Position
            ClickZone.Size = ImageLabel.Size
            ClickZone.Text = ""
            ClickZone.ZIndex = 8
            ClickZone.AutoButtonColor = false
            ClickZone.MouseButton1Click:Connect(fn)
        end
    end

    function api:SetTitle(text)
        if TitleLabel then TitleLabel.Text = text end
    end

    function api:SetDescription(text)
        if DescLabel then DescLabel.Text = text end
    end

    function api:SetImage(id)
        if type(id) == "string" and id:match("^https?://") then
            ImageLabel.Image = GetAsset(id, "png")
        else
            ImageLabel.Image = id or ""
        end
    end
    return api
end

function Section:Video(text, arg2, arg3, arg4)
    local description = ""
    local videoId = ""
    local callback = nil

    if type(arg2) == "string" and (arg2:find("rbxassetid") or arg2:find("http")) then
        videoId = arg2
        callback = arg3
    else
        description = arg2
        videoId = arg3
        callback = arg4
    end

    local success, finalVideoId = pcall(function() return GetAsset(videoId or "", "mp4") end)
    if not success then finalVideoId = videoId end

    local hasDesc = (description ~= "" and description ~= nil)
    local holderHeight = hasDesc and 350 or 320
    
    local Holder = CreateFrame(SectionFrame, ENC_PREFIX.Video_..XorEncode(text), currentTheme.Tertiary, 0, UDim2.new(1, -20, 0, holderHeight), nil, 6)
    CreateCorner(Holder, 6)

    local Title = CreateLabel(Holder, ENC.VideoTitle or "VideoTitle", text or "Video", currentTheme.Text, 14, currentFont, UDim2.new(1,-20,0,30), UDim2.new(0,10,0,0), 7)
    local DescLabel
    if hasDesc then
        DescLabel = CreateLabel(Holder, "VideoDesc", description, currentTheme.TextMuted, 12, currentFont, UDim2.new(1,-20,0,20), UDim2.new(0,10,0,25), 7)
        DescLabel.TextWrapped = true
    end

    local videoY = hasDesc and 50 or 35
    local VideoFrame = Instance.new("VideoFrame")
    VideoFrame.Name = ENC.VideoFrame or "VideoFrame"
    VideoFrame.Parent = Holder
    VideoFrame.Video = finalVideoId 
    VideoFrame.BackgroundColor3 = currentTheme.Secondary
    VideoFrame.BorderSizePixel = 0
    VideoFrame.Position = UDim2.new(0,10,0,videoY)
    VideoFrame.Size = UDim2.new(1,-20,0,160)
    VideoFrame.ZIndex = 7
    VideoFrame.Looped = true
    CreateCorner(VideoFrame, 6)

    local ControlsFrame = CreateFrame(Holder, "Controls", nil, 1, UDim2.new(1, -20, 0, 60), UDim2.new(0, 10, 1, -70), 8)
    ControlsFrame.BackgroundTransparency = 1

    local SliderTrack = CreateTextButton(ControlsFrame, "VideoSlider", UDim2.new(1,0,0,10), UDim2.new(0,0,0,0), 8)
    SliderTrack.BackgroundColor3 = currentTheme.Secondary
    SliderTrack.Text = ""
    CreateCorner(SliderTrack, 6)
    
    local SliderBar = Instance.new("Frame", SliderTrack)
    SliderBar.Name = "ProgressBar"
    SliderBar.Size = UDim2.new(0, 0, 1, 0)
    SliderBar.BackgroundColor3 = currentTheme.Accent
    SliderBar.BorderSizePixel = 0
    CreateCorner(SliderBar, 6)

    local ButtonsRow = CreateFrame(ControlsFrame, "Buttons", nil, 1, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 20), 8)
    ButtonsRow.BackgroundTransparency = 1
    
    local function VidBtn(name, txt, posX)
        local b = CreateTextButton(ButtonsRow, name, UDim2.new(0,75,0,24), UDim2.new(0, posX, 0, 0), 8)
        b.Text = txt
        CreateCorner(b, 6)
        return b
    end
    
    local PlayBtn = VidBtn("VideoPlay", "Pause", 0)
    local RestartBtn = VidBtn("VideoRestart", "Restart", 85)
    local LoopBtn = VidBtn("VideoLoop", "Loop: On", 170)
    local MuteBtn = VidBtn("VideoMute", "Mute", 255)

    local TimeLabel = CreateLabel(ControlsFrame, "VideoTimer", "0:00 / 0:00", currentTheme.Text, 12, currentFont, UDim2.new(1, -90, 0, 20), UDim2.new(1, 0, 0, 25), 8)
    TimeLabel.TextXAlignment = Enum.TextXAlignment.Right

    SliderTrack.MouseButton1Click:Connect(function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        local relativeX = mouse.X - SliderTrack.AbsolutePosition.X
        local percentage = math.clamp(relativeX / SliderTrack.AbsoluteSize.X, 0, 1)
        VideoFrame.TimePosition = percentage * VideoFrame.TimeLength
    end)

    PlayBtn.MouseButton1Click:Connect(function()
        if VideoFrame.Playing then VideoFrame:Pause(); PlayBtn.Text = "Play"
        else VideoFrame:Play(); PlayBtn.Text = "Pause" end
    end)
    
    RestartBtn.MouseButton1Click:Connect(function() 
        VideoFrame.TimePosition = 0; VideoFrame:Play(); PlayBtn.Text = "Pause" 
    end)
    
    LoopBtn.MouseButton1Click:Connect(function()
        VideoFrame.Looped = not VideoFrame.Looped
        LoopBtn.Text = VideoFrame.Looped and "Loop: On" or "Loop: Off"
    end)
    
    MuteBtn.MouseButton1Click:Connect(function()
        VideoFrame.Volume = (VideoFrame.Volume > 0) and 0 or 1
        MuteBtn.Text = (VideoFrame.Volume == 0) and "Unmute" or "Mute"
    end)

    RunService.RenderStepped:Connect(function()
        if VideoFrame.TimeLength > 0 then
            local p = VideoFrame.TimePosition / VideoFrame.TimeLength
            SliderBar.Size = UDim2.new(p, 0, 1, 0)
            local cur = math.floor(VideoFrame.TimePosition)
            local tot = math.floor(VideoFrame.TimeLength)
            TimeLabel.Text = string.format("%d:%02d / %d:%02d", math.floor(cur/60), cur%60, math.floor(tot/60), tot%60)
        end
    end)

    registerThemeUpdate(function()
        Holder.BackgroundColor3 = currentTheme.Tertiary
        Title.TextColor3 = currentTheme.Text
        if DescLabel then DescLabel.TextColor3 = currentTheme.TextMuted end
        
        VideoFrame.BackgroundColor3 = currentTheme.Secondary
        SliderTrack.BackgroundColor3 = currentTheme.Secondary
        SliderBar.BackgroundColor3 = currentTheme.Accent
        TimeLabel.TextColor3 = currentTheme.Text
        
        local btnBg = currentTheme.Secondary
        local btnTxt = currentTheme.Text
        PlayBtn.BackgroundColor3 = btnBg; PlayBtn.TextColor3 = btnTxt
        RestartBtn.BackgroundColor3 = btnBg; RestartBtn.TextColor3 = btnTxt
        LoopBtn.BackgroundColor3 = btnBg; LoopBtn.TextColor3 = btnTxt
        MuteBtn.BackgroundColor3 = btnBg; MuteBtn.TextColor3 = btnTxt
    end)

    SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
    
    local VideoObj = {VideoFrame = VideoFrame}
    function VideoObj:Play() VideoFrame:Play(); PlayBtn.Text="Pause" end
    function VideoObj:Pause() VideoFrame:Pause(); PlayBtn.Text="Play" end
    function VideoObj:SetTitle(t) Title.Text = t end
    function VideoObj:SetDescription(t) if DescLabel then DescLabel.Text = t end end
    function VideoObj:SetVideo(id) VideoFrame.Video = GetAsset(id, "mp4") end
    return VideoObj
end

function Section:Toggle(text, desc, default, callback)
    if type(desc) == "boolean" then callback = default; default = desc; desc = nil
    elseif type(desc) == "function" then callback = desc; default = false; desc = nil end
    local bh = 38; local ty = 8; local dy = 26; local tgy = 7
    if desc then local tl = CreateLabel(nil, nil, desc, nil, 12, currentFont, UDim2.new(0, 300, 0, 1000)); tl.TextWrapped = true; bh = 38 + tl.TextBounds.Y + 15; dy = 22; tgy = 8; tl:Destroy() end
    local Toggle = CreateTextButton(SectionFrame, ENC_PREFIX.Toggle_ .. XorEncode(text), UDim2.new(1, -14, 0, bh), nil, 6)
    CreateCorner(Toggle, 6)
    local ToggleLabel = CreateLabel(Toggle, ENC.ToggleLabel, text, currentTheme.Text, 14, currentFont, UDim2.new(0, 280, 0, 18), UDim2.new(0, 10, 0, ty), 7); ToggleLabel.TextYAlignment = Enum.TextYAlignment.Center
    local DescLabel
    if desc then DescLabel = CreateLabel(Toggle, ENC.ToggleDesc, desc, currentTheme.TextMuted, 12, currentFont, UDim2.new(0, 300, 0, bh - 38), UDim2.new(0, 10, 0, dy), 7); DescLabel.TextWrapped = true; DescLabel.RichText = true; DescLabel.AutomaticSize = Enum.AutomaticSize.Y end
    local ToggleFrame = CreateFrame(Toggle, ENC.ToggleFrame, currentTheme.Secondary, 0, UDim2.new(0, 44, 0, 24), UDim2.new(1, -10, 0, tgy), 7)
    ToggleFrame.AnchorPoint = Vector2.new(1, 0)
    ToggleFrame.BorderSizePixel = 1; ToggleFrame.BorderColor3 = currentTheme.Border; CreateCorner(ToggleFrame, 12)
    local ToggleFill = CreateFrame(ToggleFrame, ENC.ToggleFill, currentTheme.Accent, 0, UDim2.new(0, 0, 1, 0), nil, 8); CreateCorner(ToggleFill, 12)
    local ToggleFillGradient = Instance.new("UIGradient"); ToggleFillGradient.Rotation = 90; ToggleFillGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, currentTheme.Accent), ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)}); ToggleFillGradient.Parent = ToggleFill; ToggleFillGradient.Name = ENC.ToggleFillGradient
    local ToggleCircle = CreateFrame(ToggleFrame, ENC.ToggleCircle, Color3.fromRGB(255, 255, 255), 0, UDim2.new(0, 18, 0, 18), UDim2.new(0, 3, 0.5, -9), 9); CreateCorner(ToggleCircle, 12)

    local BlindOverlay = Instance.new("Frame")
    BlindOverlay.Name = EncriptyText(math.random(8, 14))
    BlindOverlay.Parent = Toggle
    BlindOverlay.Size = UDim2.new(1, 0, 1, 0)
    BlindOverlay.BackgroundColor3 = currentTheme.Main
    BlindOverlay.BackgroundTransparency = 1
    BlindOverlay.BorderSizePixel = 0
    BlindOverlay.ZIndex = 20
    BlindOverlay.Visible = false
    BlindOverlay.Active = true
    CreateCorner(BlindOverlay, 6)
    local LockIcon = Instance.new("TextLabel")
    LockIcon.Parent = BlindOverlay
    LockIcon.BackgroundTransparency = 1
    LockIcon.Size = UDim2.new(0, 20, 0, 20)
    LockIcon.Position = UDim2.new(1, -30, 0.5, -10)
    LockIcon.Text = "🔒"
    LockIcon.TextSize = 14
    LockIcon.TextColor3 = currentTheme.TextMuted
    LockIcon.TextTransparency = 1
    LockIcon.ZIndex = 21

    local toggled  = default or false
    local isAnimating = false
    local blinded  = false

    if toggled then
        ToggleFill.Size = UDim2.new(1, 0, 1, 0)
        ToggleFrame.BackgroundColor3 = currentTheme.Accent
        ToggleCircle.Position = UDim2.new(1, -21, 0.5, -9)
    end

    registerThemeUpdate(function()
        Toggle.BackgroundColor3 = currentTheme.Tertiary; ToggleLabel.TextColor3 = currentTheme.Text
        if DescLabel then DescLabel.TextColor3 = currentTheme.TextMuted end
        ToggleFrame.BorderColor3 = currentTheme.Border
        ToggleFrame.BackgroundColor3 = toggled and currentTheme.Accent or currentTheme.Secondary
        ToggleFillGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, currentTheme.Accent), ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)})
        BlindOverlay.BackgroundColor3 = currentTheme.Main
        LockIcon.TextColor3 = currentTheme.TextMuted
    end)

    local function updateToggle()
        if minimizeAnimating or isAnimating or blinded then return end
        isAnimating = true; toggled = not toggled
        if toggled then
            TweenService:Create(ToggleFrame, TweenInfo.new(0.25), {BackgroundColor3 = currentTheme.Accent}):Play()
            TweenService:Create(ToggleFill, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = UDim2.new(1, 0, 1, 0)}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Position = UDim2.new(1, -21, 0.5, -9)}):Play()
            task.delay(0.35, function() isAnimating = false end)
        else
            TweenService:Create(ToggleFrame, TweenInfo.new(0.25), {BackgroundColor3 = currentTheme.Secondary}):Play()
            TweenService:Create(ToggleFill, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 1, 0)}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.25, Enum.EasingStyle.Back), {Position = UDim2.new(0, 3, 0.5, -9)}):Play()
            task.delay(0.3, function() isAnimating = false end)
        end
        if callback then callback(toggled) end
    end

    Toggle.MouseButton1Click:Connect(function()
        if blinded then return end
        updateToggle()
    end)

    if toggled and callback then task.spawn(function() callback(toggled) end) end
    SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)

    local function applyBlindVisual(state)
        if state then
            BlindOverlay.Visible = true
            LockIcon.Visible = true
            TweenService:Create(BlindOverlay, TweenInfo.new(0.2), {BackgroundTransparency = 0.55}):Play()
            TweenService:Create(LockIcon,    TweenInfo.new(0.2), {TextTransparency = 0}):Play()
        else
            TweenService:Create(BlindOverlay, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            TweenService:Create(LockIcon,    TweenInfo.new(0.2), {TextTransparency = 1}):Play()
            task.delay(0.2, function()
                if not blinded then
                    BlindOverlay.Visible = false
                    LockIcon.Visible = false
                end
            end)
        end
    end

    local api = setmetatable({
        Blind = function(self, value)
            if value == nil then return blinded end
            local newState = value and true or false
            if newState == blinded then return blinded end
            blinded = newState
            applyBlindVisual(blinded)
            return blinded
        end,
        Unblind   = function(self) return self:Blind(false) end,
        IsBlinded = function(self) return blinded end,
        Get       = function(self) return toggled end,
        Toggle    = function(self)
            if blinded then return toggled end
            updateToggle()
            return toggled
        end,
        Set       = function(self, value)
            if blinded then return toggled end
            local target = value and true or false
            if target == toggled then return toggled end
            updateToggle()
            return toggled
        end,
        Button = Toggle
    }, {
        __index = function(t, k)
            local v = Toggle[k]
            if type(v) == "function" then
                return function(...)
                    local args = { ... }
                    if args[1] == t then args[1] = Toggle end
                    return v(table.unpack(args))
                end
            end
            return v
        end,
        __newindex = function(t, k, v) Toggle[k] = v end
    })

    return api
end
function Section:Colorpicker(e,t,n,o)
    if type(t)== "userdata" and typeof(t)== "Color3" then o=n;n=t;t=nil end
    local i=38;local s=60;local r=370-s-14
    if t then local l=CreateLabel(nil,nil,t,nil,12,currentFont,UDim2.new(0,360,0,1000));l.TextWrapped=true;i=38+l.TextBounds.Y+8;l:Destroy()end
    
    local a=CreateFrame(SectionFrame,ENC_PREFIX.Colorpicker_..XorEncode(e),currentTheme.Tertiary,0,UDim2.new(0,350,0,i),nil,6);CreateCorner(a,6)
    local c=(i/2)-12 

    local d=CreateFrame(a,ENC.ColorButtonBorder,currentTheme.Border,0,UDim2.new(0,s+4,0,24),UDim2.new(1,-s+35,0,c+10),7);
    d.AnchorPoint = Vector2.new(1, 0.5) 
    CreateCorner(d,5)
    
    local h=CreateTextButton(d,ENC.ColorButton,UDim2.new(0,s,0,20),UDim2.new(0,2,0,2),8);h.BackgroundColor3=currentTheme.Secondary
    local u=n or Color3.fromRGB(255,255,255);local p=u
    local f=CreateFrame(h,ENC.ColorDisplay,u,0,UDim2.new(0,s-4,1,-4),UDim2.new(0,2,0,2),9);CreateCorner(f,4)
    
    local m=CreateLabel(a,ENC.CPTitle,e,currentTheme.Text,13,currentFont,UDim2.new(1,-s-24,0,t and 18 or i),UDim2.new(0,10,0,t and 5 or 0),7);m.TextYAlignment=Enum.TextYAlignment.Center
    local y=nil
    if t then y=CreateLabel(a,XorEncode("ColorpickerDesc"),t,currentTheme.TextMuted,12,currentFont,UDim2.new(1,-s-24,0,i-28),UDim2.new(0,10,0,26),7);y.TextWrapped=true;y.RichText=true;y.TextYAlignment=Enum.TextYAlignment.Top end
    
    local v=false;local b=nil;local g=nil;local k={};local w=nil
    
    local function Cleanup()
        for e,t in ipairs(k)do if t then pcall(function()t:Disconnect()end)end end;table.clear(k)
        if w then pcall(function()w:Disconnect()end);w=nil end
    end
    
    local function ClosePopup()
        if not v then return end;v=false; Cleanup()
        if g then g:Destroy();g=nil end;b=nil
        if getgenv().ABC3728== "ColorPicker" then getgenv().ABC3728=nil end
    end
    
    local function OpenPopup()
        if v or minimizeAnimating then return end;v=true
        g=Instance.new("TextButton");g.Name=ENC.CPOverlay;g.Parent=MainFrame;g.Size=UDim2.new(1,0,1,0)
        g.Position=UDim2.new(0,0,0,0);g.BackgroundColor3=Color3.new(0,0,0);g.BackgroundTransparency=1
        g.Text=" ";g.AutoButtonColor=false;g.BorderSizePixel=0;g.Modal=true;g.ZIndex=999
        
        b=CreateFrame(g,ENC.CPPopup,currentTheme.Main,0,UDim2.new(0,340,0,310),UDim2.new(0.5,-170,0.5,-155),1000);CreateCorner(b,12)
        
        local E=CreateLabel(b,nil,e,currentTheme.Text,18,currentFont,UDim2.new(0,310,0,24),UDim2.new(0,15,0,10),1001)
        local T=CreateFrame(b,nil,currentTheme.Border,0,UDim2.new(0,310,0,1),UDim2.new(0,15,0,38),1001)
        local A=CreateLabel(b,nil,"Custom Color",currentTheme.Text,12,currentFont,UDim2.new(0,100,0,18),UDim2.new(0,15,0,48),1001)
        local S=CreateFrame(b,nil,Color3.new(1,1,1),0,UDim2.new(0,310,0,16),UDim2.new(0,15,0,70),1001);CreateCorner(S,8)
        local R=Instance.new("UIGradient");R.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.17,Color3.fromRGB(255,255,0)),ColorSequenceKeypoint.new(0.33,Color3.fromRGB(0,255,0)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(0.67,Color3.fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.83,Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))});R.Parent=S
        local N=CreateFrame(b,nil,Color3.new(1,1,1),0,UDim2.new(0,8,0,18),UDim2.new(0,0,0,69),1005);N.BorderSizePixel=2;N.BorderColor3=Color3.fromRGB(40,40,40);CreateCorner(N,4)
        local O=Color3.new(p.R,p.G,p.B)
        local I={};local C={};local V={};local P={};local H={};local G=false;local F={false,false,false}
        local M=100;local U=80
        local W={{"R",Color3.fromRGB(255,0,0)},{"G",Color3.fromRGB(0,255,0)},{"B",Color3.fromRGB(0,0,255)}}
        
        for X=1,3 do
            local Y=15+(X-1)*105
            local Z=CreateFrame(b,nil,currentTheme.Tertiary,0,UDim2.new(0,90,0,55),UDim2.new(0,Y,0,M),1001);CreateCorner(Z,6)
            P[X]=CreateLabel(Z,nil,W[X][1]..": 0",currentTheme.Text,12,currentFont,UDim2.new(0,80,0,16),UDim2.new(0,5,0,2),1002)
            I[X]=CreateTextButton(Z,nil,UDim2.new(0,80,0,10),UDim2.new(0,5,0,22),1002);I[X].BackgroundColor3=currentTheme.Secondary;I[X].Text=" ";CreateCorner(I[X],5)
            C[X]=CreateFrame(I[X],nil,W[X][2],0,UDim2.new(0,0,1,0),nil,1003);CreateCorner(C[X],5)
            V[X]=CreateFrame(b,nil,Color3.new(1,1,1),0,UDim2.new(0,14,0,18),UDim2.new(0,0,0,0),1006);V[X].BorderSizePixel=2;V[X].BorderColor3=Color3.fromRGB(40,40,40);CreateCorner(V[X],7)
            H[X]=Instance.new("TextBox");H[X].Parent=Z;H[X].BackgroundColor3=currentTheme.Secondary;H[X].BorderSizePixel=0;H[X].Position=UDim2.new(0,5,0,34);H[X].Size=UDim2.new(0,80,0,18);H[X].Font=currentFont;H[X].TextSize=11;H[X].TextColor3=currentTheme.Text;H[X].ZIndex=1002;CreateCorner(H[X],4)
        end
        
        local X=CreateLabel(b,nil,"Preview",currentTheme.Text,12,currentFont,UDim2.new(0,60,0,20),UDim2.new(0,15,0,168),1001)
        local Y=CreateFrame(b,nil,currentTheme.Tertiary,0,UDim2.new(0,100,0,40),UDim2.new(0,15,0,190),1001);CreateCorner(Y,6)
        local Z=CreateFrame(Y,nil,O,0,UDim2.new(0,90,0,30),UDim2.new(0,5,0,5),1002);CreateCorner(Z,4)
        local Q=Instance.new("TextBox");Q.Parent=b;Q.BackgroundColor3=currentTheme.Secondary;Q.BorderSizePixel=0;Q.Position=UDim2.new(0,125,0,190);Q.Size=UDim2.new(0,200,0,40);Q.Font=currentFont;Q.TextSize=14;Q.TextColor3=currentTheme.Text;Q.ZIndex=1002;CreateCorner(Q,6)
        local J=CreateTextButton(b,nil,UDim2.new(0,150,0,32),UDim2.new(0,15,0,250),1010);J.Text="Confirm";J.TextColor3=Color3.new(1,1,1);J.BackgroundColor3=currentTheme.Accent;CreateCorner(J,8)
        local K=Instance.new("UIGradient");K.Rotation=90;K.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)});K.Parent=J
        local ee=CreateTextButton(b,nil,UDim2.new(0,150,0,32),UDim2.new(0,175,0,250),1010);ee.Text="Cancel";ee.TextColor3=currentTheme.Text;ee.BackgroundColor3=currentTheme.Tertiary;CreateCorner(ee,8)
        
        local function B(e) N.Position=UDim2.new(0,(e*310)-4,0,69) end
        local function te()
            Z.BackgroundColor3=O;local e=Color3.toHSV(O);B(e)
            local t={math.floor(O.R*255),math.floor(O.G*255),math.floor(O.B*255)}
            for n=1,3 do local o=t[n]/255;C[n].Size=UDim2.new(o,0,1,0)
                local r=I[n].AbsolutePosition;local s=I[n].AbsoluteSize
                V[n].Position=UDim2.new(0,r.X-b.AbsolutePosition.X+(o*s.X)-7,0,r.Y-b.AbsolutePosition.Y-4)
                P[n].Text=W[n][1]..":  "..t[n];H[n].Text=tostring(t[n])
            end
            Q.Text=string.format("#%02X%02X%02X",t[1],t[2],t[3])
        end
        local function ne(e) local t=e.Position.X-S.AbsolutePosition.X;local n=math.clamp(t/S.AbsoluteSize.X,0,1);O=Color3.fromHSV(n,1,1);te() end
        local function oe(e,t)
            local n=t.Position.X-I[e].AbsolutePosition.X;local o=math.clamp(n/I[e].AbsoluteSize.X,0,1)
            if e==1 then O=Color3.new(o,O.G,O.B)elseif e==2 then O=Color3.new(O.R,o,O.B)else O=Color3.new(O.R,O.G,o)end;te()
        end
        
        table.insert(k,S.InputBegan:Connect(function(e) if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then if getgenv().ABC3728 then return end G=true;getgenv().ABC3728="ColorPicker";ne(e) end end))
        table.insert(k,N.InputBegan:Connect(function(e) if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then if getgenv().ABC3728 then return end G=true;getgenv().ABC3728="ColorPicker";ne(e) end end))
        for e=1,3 do
            table.insert(k,I[e].InputBegan:Connect(function(t) if t.UserInputType==Enum.UserInputType.MouseButton1 or t.UserInputType==Enum.UserInputType.Touch then if getgenv().ABC3728 then return end F[e]=true;getgenv().ABC3728="ColorPicker";oe(e,t) end end))
            table.insert(k,V[e].InputBegan:Connect(function(t) if t.UserInputType==Enum.UserInputType.MouseButton1 or t.UserInputType==Enum.UserInputType.Touch then if getgenv().ABC3728 then return end F[e]=true;getgenv().ABC3728="ColorPicker";oe(e,t) end end))
            table.insert(k,H[e].FocusLost:Connect(function() local t=tonumber(H[e].Text);if t then t=math.clamp(t,0,255)/255 if e==1 then O=Color3.new(t,O.G,O.B)elseif e==2 then O=Color3.new(O.R,t,O.B)else O=Color3.new(O.R,O.G,t)end;te()end end))
        end
        table.insert(k,Q.FocusLost:Connect(function() local e=Q.Text:gsub("#","");if#e==6 then local t=tonumber(e:sub(1,2),16);local n=tonumber(e:sub(3,4),16);local o=tonumber(e:sub(5,6),16);if t and n and o then O=Color3.fromRGB(t,n,o);te()end end end))
        table.insert(k,UserInputService.InputChanged:Connect(function(e) if e.UserInputType==Enum.UserInputType.MouseMovement or e.UserInputType==Enum.UserInputType.Touch then if G then ne(e)end;for t=1,3 do if F[t]then oe(t,e)end end end end))
        table.insert(k,UserInputService.InputEnded:Connect(function(e) if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then G=false;for t=1,3 do F[t]=false end;if getgenv().ABC3728=="ColorPicker"then getgenv().ABC3728=nil end end end))
        table.insert(k,J.MouseButton1Click:Connect(function()p=O;f.BackgroundColor3=p;if o then task.spawn(o,p)end;ClosePopup()end))
        table.insert(k,ee.MouseButton1Click:Connect(ClosePopup))
        table.insert(k,g.InputBegan:Connect(function(e) if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then local t=Vector2.new(e.Position.X,e.Position.Y) local n=b.AbsolutePosition;local i=b.AbsoluteSize if t.X<n.X or t.X>n.X+i.X or t.Y<n.Y or t.Y>n.Y+i.Y then ClosePopup()end end end))
        
        w=RunService.Heartbeat:Connect(function()
            if not b or not b.Parent then return end
            b.BackgroundColor3=currentTheme.Main;E.TextColor3=currentTheme.Text;T.BackgroundColor3=currentTheme.Border;A.TextColor3=currentTheme.Text;X.TextColor3=currentTheme.Text;Y.BackgroundColor3=currentTheme.Tertiary;Q.BackgroundColor3=currentTheme.Secondary;Q.TextColor3=currentTheme.Text;ee.BackgroundColor3=currentTheme.Tertiary;ee.TextColor3=currentTheme.Text;J.BackgroundColor3=currentTheme.Accent
            K.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)})
            for e=1,3 do P[e].TextColor3=currentTheme.Text;H[e].BackgroundColor3=currentTheme.Secondary;H[e].TextColor3=currentTheme.Text;I[e].BackgroundColor3=currentTheme.Secondary end
        end)
        TweenService:Create(g,TweenInfo.new(0.25),{BackgroundTransparency=0.5}):Play();te()
    end
    
registerThemeUpdate(function()
    a.BackgroundColor3=currentTheme.Tertiary
    d.BackgroundColor3=currentTheme.Border
    h.BackgroundColor3=currentTheme.Secondary
    m.TextColor3=currentTheme.Text
    if y then y.TextColor3=currentTheme.TextMuted end 
    local ratio = currentWindowSize or 1
    local btnW = math.floor(s * ratio)
    d.Size = UDim2.new(0, btnW + 4, 0, math.floor(24 * ratio))
    h.Size = UDim2.new(0, btnW, 0, math.floor(20 * ratio))
    f.Size = UDim2.new(0, btnW - 4, 1, -4)
end)
    
    h.MouseButton1Click:Connect(OpenPopup)
    d.InputBegan:Connect(function(e)if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then OpenPopup()end end)
    SectionFrame.CanvasSize=UDim2.new(0,0,0,SectionLayout.AbsoluteContentSize.Y+35)
    return{SetColor=function(_,e)p=e;f.BackgroundColor3=e;if o then task.spawn(o,e)end end,GetColor=function()return p end,Frame=a}
end
function Section:Bind(e,t,n,o)
    if type(t)=="userdata"and typeof(t)=="EnumItem"then o=n;n=t;t=nil
    elseif type(t)=="function"then o=t;t=nil;n=nil
    elseif type(n)=="function"then
        if type(t)=="string"then o=n;n=nil
        else o=n;n=t;t=nil end
    end
    local i=type(n)=="userdata"and typeof(n)=="EnumItem"and n or Enum.KeyCode.Unknown
    local s=32
    if t and type(t)=="string"then local el=CreateLabel(nil,nil,t,nil,12,currentFont,UDim2.new(0,340,0,1000));el.TextWrapped=true;s=32+el.TextBounds.Y+12;el:Destroy()end
    local r=CreateFrame(SectionFrame,ENC_PREFIX.Bind_..XorEncode(e),currentTheme.Tertiary,0,UDim2.new(0,370,0,s),nil,6);CreateCorner(r,6)
    local a=CreateLabel(r,ENC.BindTitle,e,currentTheme.Text,14,currentFont,UDim2.new(0,240,0,20),UDim2.new(0,10,0,t and 5 or 8),7);a.TextYAlignment=Enum.TextYAlignment.Center;a.TextTruncate=Enum.TextTruncate.AtEnd;a.ClipsDescendants=true
    local c=CreateFrame(r,ENC.BindButtonBorder,currentTheme.Border,0,UDim2.new(0,104,0,24),UDim2.new(0,256,0,t and 4 or 5),7);CreateCorner(c,5)
    local d=CreateTextButton(c,ENC.BindButton,UDim2.new(0,100,0,20),UDim2.new(0,2,0,2),8);d.BackgroundColor3=currentTheme.Secondary;d.Text=tostring(i):gsub("Enum.KeyCode.","");d.TextColor3=currentTheme.TextMuted;d.TextSize=13;d.AutoButtonColor=false
    local h
    if t and type(t)=="string"then h=CreateLabel(r,ENC.BindDesc,t,currentTheme.TextMuted,12,currentFont,UDim2.new(0,350,0,18),UDim2.new(0,10,0,28),7);h.TextWrapped=true;h.RichText=true;h.AutomaticSize=Enum.AutomaticSize.Y;h.ClipsDescendants=true end
    local u=false;local p=false;local f=i
    local m=function()
        if not r or not r.Parent then
            for B,A in ipairs(ThemeUpdateConnections)do if A==m then table.remove(ThemeUpdateConnections,B);break end end
            return
        end
        r.BackgroundColor3=currentTheme.Tertiary;a.TextColor3=currentTheme.Text
        c.BackgroundColor3=currentTheme.Border;d.BackgroundColor3=currentTheme.Secondary;d.TextColor3=currentTheme.TextMuted
        if h then h.TextColor3=currentTheme.TextMuted end
    end
    table.insert(ThemeUpdateConnections,m)
    local y=function()
        if u then return end;u=true;d.Text="..."
        local el=UserInputService.InputBegan:Connect(function(t)
            if t.UserInputType==Enum.UserInputType.Keyboard then
                f=t.KeyCode;d.Text=tostring(f):gsub("Enum.KeyCode.","")
                if o then task.spawn(o,f)end
                el:Disconnect();u=false
            end
        end)
        task.delay(10,function()if u then el:Disconnect();u=false;d.Text=tostring(f):gsub("Enum.KeyCode.","")end end)
    end
    d.MouseButton1Click:Connect(function()
        if minimizeAnimating or u then return end
        if getgenv().ABC8281 or getgenv().ABC3616 then return end
        if getgenv().ABC3728 then return end
        if p then return end;p=true
        TweenService:Create(d,TweenInfo.new(0.1),{BackgroundColor3=currentTheme.Hover}):Play()
        task.delay(0.1,function()p=false;if d and d.Parent then TweenService:Create(d,TweenInfo.new(0.1),{BackgroundColor3=currentTheme.Secondary}):Play()end end)
        y()
    end)
    SectionFrame.CanvasSize=UDim2.new(0,0,0,SectionLayout.AbsoluteContentSize.Y+35)
    return{
        SetBind=function(_,el)f=el;d.Text=tostring(f):gsub("Enum.KeyCode.","");if o then o(f)end end,
        GetBind=function()return f end,
        Frame=r
    }
end
function Section:ToggleTextbox(e, t, n, o, i, s, r)
    if type(e) ~= "boolean" then
        r = s; s = i; i = o; o = n; n = t; t = e; e = false
    end
    if type(t) ~= "string" then t = "ToggleTextbox" end
    if type(n) == "function" then
        r = n; n = nil; o = ""; i = nil; s = ""
    elseif type(o) == "function" then
        r = o; o = ""; i = nil; s = ""
    elseif type(i) == "function" then
        r = i; i = nil; s = ""
    elseif type(s) == "function" then
        r = s; s = ""
    end
    local VALID_TYPES = {
        ["number"] = true, ["numbers"] = true,
        ["integer"] = true, ["int"] = true,
        ["float"] = true,
        ["letter"] = true, ["letters"] = true,
        ["alphanumeric"] = true, ["alphanum"] = true
    }
    if type(n) == "string" and VALID_TYPES[string.lower(n)] then
        local newCb  = (type(s) == "function" and s) or (type(r) == "function" and r)
        local newDef = (type(i) == "string" and i) or ""
        local newPh  = (type(o) == "string" and o) or ""
        local newTy  = n
        n = nil
        o = newPh
        i = newTy
        s = newDef
        r = newCb
    end
    if type(n) ~= "string" or n == "" then n = nil end
    if type(o) ~= "string" then o = "" end
    if type(s) ~= "string" then s = tostring(s or "") end
    if type(i) == "string" then
        local lower = string.lower(i)
        if VALID_TYPES[lower] then i = lower else i = nil end
    else
        i = nil
    end
    if type(r) ~= "function" then r = nil end
    local function ApplyFilter(text, filterType)
        if type(text) ~= "string" then text = tostring(text or "") end
        if not filterType then return text end
        local ft = string.lower(filterType)

        if ft == "number" or ft == "numbers" or ft == "float" then
            local cleaned = text:gsub("[^%d%.%-]", "")
            local out, hasDot = "", false
            for ci = 1, #cleaned do
                local ch = cleaned:sub(ci, ci)
                if ch == "-" then
                    if ci == 1 then out = out .. "-" end
                elseif ch == "." then
                    if not hasDot then hasDot = true; out = out .. "." end
                else
                    out = out .. ch
                end
            end
            return out
        elseif ft == "integer" or ft == "int" then
            local cleaned = text:gsub("[^%d%-]", "")
            local out = ""
            for ci = 1, #cleaned do
                local ch = cleaned:sub(ci, ci)
                if ch == "-" then
                    if ci == 1 then out = out .. "-" end
                else
                    out = out .. ch
                end
            end
            return out
        elseif ft == "letter" or ft == "letters" then
            return text:gsub("[^%a]", "")
        elseif ft == "alphanumeric" or ft == "alphanum" then
            return text:gsub("[^%w]", "")
        end
        return text
    end
    local hasDesc = n ~= nil
    local frameH = hasDesc and 86 or 66
    local h = CreateFrame(
        SectionFrame,
        ENC_PREFIX.ToggleTextbox_ .. XorEncode(t),
        currentTheme.Tertiary, 0,
        UDim2.new(1, -16, 0, frameH),
        nil, 6
    )
    CreateCorner(h, 6)
    local u = CreateLabel(h, ENC.TTBTitle, t, currentTheme.Text, 14, currentFont,
        UDim2.new(1, -70, 0, 20), UDim2.new(0, 10, 0, 5), 7)
    u.TextYAlignment = Enum.TextYAlignment.Center
    local p
    if hasDesc then
        p = CreateLabel(h, ENC.TTBDesc, n, currentTheme.TextMuted, 12, currentFont,
            UDim2.new(1, -20, 0, 16), UDim2.new(0, 10, 0, 24), 7)
        p.TextWrapped = true
        p.RichText = true
    end
    local f = 5
    local m = CreateFrame(h, ENC.TC, currentTheme.Secondary, 0,
        UDim2.new(0, 46, 0, 26), UDim2.new(1, -10, 0, f), 7)
    m.AnchorPoint = Vector2.new(1, 0)
    m.BorderSizePixel = 1
    m.BorderColor3 = currentTheme.Border
    m.ClipsDescendants = true
    CreateCorner(m, 13)
    local y = CreateFrame(m, ENC.TF, currentTheme.Accent, 0,
        UDim2.new(0, 0, 1, 0), UDim2.new(0, 0, 0, 0), 8)
    y.ClipsDescendants = true
    CreateCorner(y, 13)
    local v = Instance.new("UIGradient")
    v.Rotation = 90
    v.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, currentTheme.Accent),
        ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)
    })
    v.Parent = y
    local b = CreateFrame(m, ENC.TCircle, currentTheme.Text, 0,
        UDim2.new(0, 18, 0, 18), UDim2.new(0, 3, 0.5, -9), 9)
    CreateCorner(b, 9)
    local inputY = hasDesc and 48 or 32
    local k = Instance.new("TextBox")
    k.Name = XorEncode("Textbox")
    k.Parent = h
    k.BackgroundColor3 = currentTheme.Secondary
    k.BorderSizePixel = 0
    k.Size = UDim2.new(1, -28, 0, 28)
    k.Position = UDim2.new(0, 8, 0, inputY)
    k.Font = currentFont
    k.Text = ApplyFilter(s, i) 
    k.TextColor3 = currentTheme.Text
    k.PlaceholderText = o
    k.PlaceholderColor3 = currentTheme.TextMuted
    k.TextSize = 14
    k.ClearTextOnFocus = false
    k.ZIndex = 8
    k.TextXAlignment = Enum.TextXAlignment.Center
    k.TextYAlignment = Enum.TextYAlignment.Center
    CreateCorner(k, 6)
    local enabledState = e and true or false
    local animating = false
    local lastValid = k.Text
    local function fireCallback()
        if r then
            task.spawn(function()
                pcall(r, k.Text, enabledState)
            end)
        end
    end
    local function applyVisual(instant)
        local bgC = enabledState and currentTheme.Accent or currentTheme.Secondary
        local fillS = enabledState and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 0, 1, 0)
        local circleP = enabledState and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
        if instant then
            m.BackgroundColor3 = bgC
            y.Size = fillS
            b.Position = circleP
        else
            TweenService:Create(m, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = bgC}):Play()
            TweenService:Create(y, TweenInfo.new(0.3, Enum.EasingStyle.Back),
                {Size = fillS}):Play()
            TweenService:Create(b, TweenInfo.new(0.3, Enum.EasingStyle.Back),
                {Position = circleP}):Play()
        end
    end
    local function doToggle()
        if animating then return end
        animating = true
        enabledState = not enabledState
        applyVisual(false)
        task.delay(0.35, function() animating = false end)
        fireCallback()
    end
    local function doSet(state, silent)
        state = state and true or false
        if state == enabledState then return end
        enabledState = state
        applyVisual(true)
        if not silent then fireCallback() end
    end
    m.InputBegan:Connect(function(input)
        if minimizeAnimating then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            doToggle()
        end
    end)
    k.FocusLost:Connect(function()
        lastValid = k.Text
    end)
    k:GetPropertyChangedSignal("Text"):Connect(function()
        local filtered = ApplyFilter(k.Text, i)
        if filtered ~= k.Text then
            local cursor = k.CursorPosition
            k.Text = filtered
            pcall(function()
                k.CursorPosition = math.min(cursor - 1, #k.Text + 1)
            end)
        end
    end)
    local function applyTheme()
        local currentW = h.AbsoluteSize.X
        if currentW <= 0 then return end
        if p then p.Size = UDim2.new(1, -20, 0, 16) end
        u.Size = UDim2.new(1, -70, 0, 20)
        h.BackgroundColor3 = currentTheme.Tertiary
        u.TextColor3 = currentTheme.Text
        if p then p.TextColor3 = currentTheme.TextMuted end
        m.BorderColor3 = currentTheme.Border
        v.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, currentTheme.Accent),
            ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)
        })
        b.BackgroundColor3 = currentTheme.Text
        k.BackgroundColor3 = currentTheme.Secondary
        k.TextColor3 = currentTheme.Text
        k.PlaceholderColor3 = currentTheme.TextMuted
        if not animating then applyVisual(true) end
    end
    table.insert(ThemeUpdateConnections, applyTheme)
    local parentFrame = SectionFrame.Parent
    if parentFrame and parentFrame:IsA("Frame") then
        parentFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(applyTheme)
    end
    SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
    applyTheme()
    applyVisual(true)
    local API = {
        ToggleFrame = h,
        Textbox = k,
    }
    function API:SetText(text)
        local tt = ApplyFilter(tostring(text or ""), i)
        k.Text = tt
        lastValid = tt
        return self
    end
    function API:GetText()
        return k.Text
    end
    function API:SetValue(value)
        doSet(value, false)
        return self
    end
    function API:GetValue()
        return enabledState
    end
    function API:SetState(value)
        doSet(value, false)
        return self
    end
    function API:GetState()
        return enabledState
    end
    function API:SetEnabled(value)
        doSet(value, false)
        return self
    end
    function API:IsEnabled()
        return enabledState
    end
    function API:SetFilter(filterType)
        if type(filterType) == "string" then
            local lower = string.lower(filterType)
            if VALID_TYPES[lower] then
                i = lower
                k.Text = ApplyFilter(k.Text, i)
            end
        else
            i = nil
        end
        return self
    end
    function API:GetFilter()
        return i
    end
    function API:SetPlaceholder(text)
        k.PlaceholderText = tostring(text or "")
        return self
    end
    function API:SetTitle(text)
        u.Text = tostring(text or "")
        return self
    end
    function API:SetDescription(text)
        if p then p.Text = tostring(text or "") end
        return self
    end
    function API:TextboxXP(fn)
        if type(fn) == "function" then
            k.FocusLost:Connect(function(enterPressed)
                if enterPressed then
                    task.spawn(function() pcall(fn, k.Text) end)
                end
            end)
        end
        return self
    end
    function API:Destroy()
        h:Destroy()
    end
    return API
end
        function Section:Textbox(e,t,n,o,i)
            if type(t)=="string"and type(n)=="string"then
            elseif type(t)=="string"and type(n)~="string"then
                i=i or(type(o)=="function"and o or nil)
                o=type(n)=="boolean"and n or false
                n=t;t=nil
            else t=nil end
            if type(o)=="function"then i=o;o=false end
            n=type(n)=="string"and n or""
            o=type(o)=="boolean"and o or false
            i=type(i)=="function"and i or function()end
            local s=game:GetService("TextService")
            local r=370;local a=10;local l=18;local c=6;local d=11;local h=24;local u=4;local p=0
            local f=type(t)=="string"and t~=""
            local m=0
            if f then
                local el=s:GetTextSize(t,d,currentFont,Vector2.new(r-a*2-20,math.huge))
                m=el.Y
            end
            local y=c;local v=y+l+u;local b
            if f then b=v+m+u else b=y+l+u end
            local g=b+h+c
            local k=CreateFrame(SectionFrame,ENC_PREFIX.Textbox_..XorEncode(e),currentTheme.Tertiary,0,UDim2.new(1,-p,0,g),nil,6)
            k.Size=UDim2.new(1,-p,0,g)
            CreateCorner(k,6)
            local w=CreateLabel(k,ENC.TextboxTitle,e,currentTheme.Text,13,currentFont,UDim2.new(1,-a*2-20,0,l),UDim2.new(0,a,0,y),8)
            local _
            if f then
                _=CreateLabel(k,ENC.TextboxDesc,t,currentTheme.TextMuted,d,currentFont,UDim2.new(1,-a*2-20,0,m),UDim2.new(0,a,0,v),8)
                _.TextWrapped=true;_.RichText=true;_.Size=UDim2.new(1,-a*2-20,0,m)
            end
            local D=Instance.new("TextBox")
            D.Name=XorEncode("Textbox");D.Parent=k;D.BackgroundColor3=currentTheme.Secondary;D.BorderSizePixel=0
            D.Size=UDim2.new(1,-a*2,0,h);D.Position=UDim2.new(0,a,0,b);D.Font=currentFont
            D.Text="";D.TextColor3=currentTheme.Text;D.PlaceholderColor3=currentTheme.TextMuted
            D.PlaceholderText=n;D.TextSize=12;D.ClearTextOnFocus=false;D.ZIndex=8
            CreateCorner(D,4)
            local L=Instance.new("UIPadding");L.Parent=D;L.PaddingLeft=UDim.new(0,6)
            local function E()
                local el=m
                if f and _ then
                    local t=s:GetTextSize(_.Text,_.TextSize,_.Font,Vector2.new(_.AbsoluteSize.X,math.huge))
                    el=t.Y;_.Size=UDim2.new(1,-a*2-20,0,el)
                end
                local t
                if f then t=v+el+u else t=y+l+u end
                D.Position=UDim2.new(0,a,0,t)
                local n=t+h+c;k.Size=UDim2.new(1,-p,0,n)
                SectionFrame.CanvasSize=UDim2.new(0,0,0,SectionLayout.AbsoluteContentSize.Y+35)
            end
            if f and _ then _:GetPropertyChangedSignal("AbsoluteSize"):Connect(E)end
            registerThemeUpdate(function()
                k.BackgroundColor3=currentTheme.Tertiary;w.TextColor3=currentTheme.Text
                if _ then _.TextColor3=currentTheme.TextMuted end
                D.BackgroundColor3=currentTheme.Secondary;D.TextColor3=currentTheme.Text;D.PlaceholderColor3=currentTheme.TextMuted;E()
            end)
            if o then
                D:GetPropertyChangedSignal("Text"):Connect(function()
                    local el=D.Text:gsub("[^%d%-]","")
                    local t=0;local n=""
                    for o=1,#el do
                        local i=el:sub(o,o)
                        if i=="-"then t=t+1;if t==1 and o==1 then n=n..i end
                        else n=n..i end
                    end
                    if n~=D.Text then local el=D.CursorPosition;D.Text=n;D.CursorPosition=math.min(el,#D.Text+1)end
                end)
            end
            D.Focused:Connect(function()TweenService:Create(D,TweenInfo.new(0.15),{BackgroundColor3=currentTheme.Hover:Lerp(currentTheme.Secondary,0.95)}):Play()end)
            D.FocusLost:Connect(function(el)
                TweenService:Create(D,TweenInfo.new(0.15),{BackgroundColor3=currentTheme.Secondary}):Play()
                if el then i(D.Text)end
            end)
            E()
            return{SetText=function(_,el)D.Text=tostring(el or"")end,GetText=function()return D.Text end,SetVisible=function(_,el)k.Visible=el;E()end,Destroy=function()k:Destroy();SectionFrame.CanvasSize=UDim2.new(0,0,0,SectionLayout.AbsoluteContentSize.Y+35)end}
        end
        function Section:Slider(text, desc, min, max, default, callback)
            if type(desc) == "number" then callback = default; default = max; max = min; min = desc; desc = nil end
            local bh = 70
            if desc then local tl = CreateLabel(nil, nil, desc, nil, 12, currentFont, UDim2.new(0, 340, 0, 1000)); tl.TextWrapped = true; bh = 70 + tl.TextBounds.Y + 15; tl:Destroy() end
            local SF = CreateFrame(SectionFrame, ENC_PREFIX.Slider_ .. XorEncode(text), currentTheme.Tertiary, 0, UDim2.new(0, 370, 0, bh), nil, 6); CreateCorner(SF, 6)
            local STitle = CreateLabel(SF, ENC.STitle, text, currentTheme.Text, 14, currentFont, UDim2.new(0, 250, 0, 18), UDim2.new(0, 10, 0, 8), 7); STitle.TextYAlignment = Enum.TextYAlignment.Center
            local VL = CreateLabel(SF, ENC.SVal, tostring(default), currentTheme.Accent, 14, currentFont, UDim2.new(0, 50, 0, 18), UDim2.new(0, 300, 0, 8), 7); VL.TextXAlignment = Enum.TextXAlignment.Right; VL.TextYAlignment = Enum.TextYAlignment.Center
            local DL
            if desc then DL = CreateLabel(SF, ENC.SDesc, desc, currentTheme.TextMuted, 12, currentFont, UDim2.new(0, 340, 0, 18), UDim2.new(0, 10, 0, 28), 7); DL.TextWrapped = true; DL.RichText = true; DL.AutomaticSize = Enum.AutomaticSize.Y end
            local by = desc and DL.AbsoluteSize.Y + 42 or 50
            local SB = CreateFrame(SF, ENC.SB, currentTheme.Secondary, 0, UDim2.new(0, 350, 0, 10), UDim2.new(0, 10, 0, by), 7); CreateCorner(SB, 5); SB.ClipsDescendants = false
            local SFL = CreateFrame(SB, ENC.SFL, currentTheme.Accent, 0, UDim2.new((default-min)/(max-min), 0, 1, 0), nil, 8)
            local SFG = Instance.new("UIGradient"); SFG.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)}); SFG.Parent = SFL; SFG.Name = ENC.SFG; CreateCorner(SFL, 5)
            local bs = 16
            local SBtn = CreateTextButton(SF, ENC.SBtn, UDim2.new(0, bs, 0, bs), UDim2.new(0, 0, 0, 0), 10)
            SBtn.BackgroundColor3 = Color3.fromRGB(255,255,255); SBtn.Text = ""; CreateCorner(SBtn, 8); SBtn.ZIndex = 10
            local function updateButtonPosition()
                if not SBtn or not SBtn.Parent then return end
                local percent = SFL.Size.X.Scale
                local sbWidth = SB.Size.X.Offset
                local minPos = 10 - bs/2 + 2
                local maxPos = 10 + sbWidth - bs/2 - 2
                pcall(function()
                    SBtn.Position = UDim2.new(0, math.clamp(10 + percent * sbWidth - bs/2, minPos, maxPos), 0, by-3)
                end)
            end
            updateButtonPosition()
            registerThemeUpdate(function() 
                SF.BackgroundColor3 = currentTheme.Tertiary; STitle.TextColor3 = currentTheme.Text; VL.TextColor3 = currentTheme.Accent; 
                if DL then DL.TextColor3 = currentTheme.TextMuted end; SB.BackgroundColor3 = currentTheme.Secondary; 
                SFG.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)}) 
            end)
            local val = default; local dragging = false; local sliderId = "Slider_" .. tostring({})
            local function updateSlider(input) 
                if minimizeAnimating then return end
                if not SB or not SB.Parent then return end
                if getgenv().ABC3728 and getgenv().ABC3728 ~= sliderId then return end
                local percent = math.clamp((input.Position.X - SB.AbsolutePosition.X) / SB.AbsoluteSize.X, 0, 1)
                val = math.floor((min + (max-min)*percent)*100)/100
                VL.Text = tostring(val)
                SFL.Size = UDim2.new(percent, 0, 1, 0)
                updateButtonPosition()
                if callback then callback(val) end
            end
            SB.InputBegan:Connect(function(i) 
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
                    if getgenv().ABC3728 then return end; getgenv().ABC3728 = sliderId; dragging = true; updateSlider(i) 
                end 
            end)
            SBtn.InputBegan:Connect(function(i) 
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
                    if getgenv().ABC3728 then return end; getgenv().ABC3728 = sliderId; dragging = true; updateSlider(i) 
                end 
            end)
            UserInputService.InputChanged:Connect(function(i) 
                if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then 
                    updateSlider(i) 
                end 
            end)
            UserInputService.InputEnded:Connect(function(i) 
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
                    if dragging then dragging = false; getgenv().ABC3728 = nil end 
                end 
            end)
            local sizeConnection
            sizeConnection = SF:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                updateButtonPosition()
            end)
            SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 40)
            return {
                Change = function(_, nv) 
                    nv = math.clamp(nv, min, max); val = nv; 
                    local p = (val-min)/(max-min); VL.Text = tostring(math.floor(val*100)/100); 
                    SFL.Size = UDim2.new(p,0,1,0); 
                    updateButtonPosition(); 
                    if callback then callback(val) end 
                end, 
                GetValue = function(_) return val end,
                Destroy = function(_)
                    if sizeConnection then sizeConnection:Disconnect() end
                    SF:Destroy()
                end
            }
        end
function Section:ToggleSlider(e,t,n,o,i,s,r)
    if type(o)=="function"then r=o;o=i;i=n;n=e;e=false
    elseif type(i)=="function"then r=i;i=o;o=n;n=e;e=false
    elseif type(s)=="function"then r=s;s=i;i=o;o=n;n=e;e=false
    elseif type(n)=="function"then r=n;n=o;o=i;i=200;e=false end
    local a=85
    if t then local el=CreateLabel(nil,nil,t,nil,12,currentFont,UDim2.new(0,340,0,1000));el.TextWrapped=true;a=85+el.TextBounds.Y+12;el:Destroy()end
    local l=CreateFrame(SectionFrame,ENC_PREFIX.ToggleSlider_..XorEncode(e),currentTheme.Tertiary,0,UDim2.new(0,370,0,a),nil,6);CreateCorner(l,6)
    local c=CreateLabel(l,ENC.TSTitle,e,currentTheme.Text,14,currentFont,UDim2.new(0,170,0,18),UDim2.new(0,10,0,8),7);c.TextYAlignment=Enum.TextYAlignment.Center
    local d=CreateLabel(l,ENC.SV,tostring(s or i or 0),currentTheme.Accent,15,currentFont,UDim2.new(0,60,0,24),UDim2.new(0,220,0,5),7);d.TextXAlignment=Enum.TextXAlignment.Center;d.TextYAlignment=Enum.TextYAlignment.Center
    local h=CreateFrame(l,ENC.TC,currentTheme.Secondary,0,UDim2.new(0,46,0,26),UDim2.new(0,290,0,5),7);h.BorderSizePixel=1;h.BorderColor3=currentTheme.Border;CreateCorner(h,13);h.ClipsDescendants=false
    local u=CreateFrame(h,ENC.TF,currentTheme.Accent,0,UDim2.new(0,0,1,0),nil,8);CreateCorner(u,13)
    local p=Instance.new("UIGradient");p.Rotation=90;p.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)});p.Parent=u
    local f=CreateFrame(h,ENC.TCircle,Color3.fromRGB(255,255,255),0,UDim2.new(0,20,0,20),UDim2.new(0,3,0.5,-10),9);CreateCorner(f,10)
    local m=CreateTextButton(h,ENC.TBtn,UDim2.new(1,0,1,0),nil,10);m.BackgroundTransparency=1;m.ZIndex=10
    local y
    if t then y=CreateLabel(l,ENC.TSDesc,t,currentTheme.TextMuted,12,currentFont,UDim2.new(0,340,0,18),UDim2.new(0,10,0,30),7);y.TextWrapped=true;y.RichText=true;y.AutomaticSize=Enum.AutomaticSize.Y end
    local v=t and y.AbsoluteSize.Y+42 or 48
    local b=CreateFrame(l,ENC.SF,currentTheme.Secondary,0,UDim2.new(0,360,0,32),UDim2.new(0,5,0,v),6);CreateCorner(b,8)
    local g=CreateFrame(b,ENC.SB,currentTheme.Tertiary,0,UDim2.new(0,340,0,10),UDim2.new(0,10,0.5,-5),7);CreateCorner(g,5);g.ClipsDescendants=false
    local k=CreateFrame(g,ENC.SFL,currentTheme.Accent,0,UDim2.new(((s or i or 0)-(o or 0))/((i or 200)-(o or 0)),0,1,0),nil,8)
    local w=Instance.new("UIGradient");w.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)});w.Parent=k;CreateCorner(k,5)
    local _=16
    local D=CreateTextButton(g,ENC.SBtn,UDim2.new(0,_,0,_),UDim2.new(0,0,0,0),10)
    D.BackgroundColor3=Color3.fromRGB(255,255,255);D.Text="";CreateCorner(D,8);D.ZIndex=10
    local function L()
        if not D or not D.Parent then return end
        local el=k.Size.X.Scale
        local t=g.Size.X.Offset
        pcall(function()D.Position=UDim2.new(0,el*t-_/2,0.5,-_/2)end)
    end
    L()
    registerThemeUpdate(function()
        l.BackgroundColor3=currentTheme.Tertiary;c.TextColor3=currentTheme.Text;d.TextColor3=currentTheme.Accent
        h.BorderColor3=currentTheme.Border
        if not O then h.BackgroundColor3=E and currentTheme.Accent or currentTheme.Secondary end
        p.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)})
        if y then y.TextColor3=currentTheme.TextMuted end;b.BackgroundColor3=currentTheme.Secondary;g.BackgroundColor3=currentTheme.Tertiary
        w.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)})
        task.defer(L)
    end)
    local E=n or false;local T,A=o or 0,i or 200;local S=math.clamp(s or i or T,T,A);local R=false;local N=false;local I="ToggleSlider_"..tostring({});local C=nil
    if E then u.Size=UDim2.new(1,0,1,0);h.BackgroundColor3=currentTheme.Accent;f.Position=UDim2.new(1,-23,0.5,-10)end
    local function V(el)
        if minimizeAnimating then return end
        if not g or not g.Parent then return end
        if getgenv().ABC3728 and getgenv().ABC3728~=I then return end
        local t=math.clamp((el.Position.X-g.AbsolutePosition.X)/g.AbsoluteSize.X,0,1)
        local n=math.floor((T+(A-T)*t)*100)/100
        if n~=S then
            S=n;d.Text=tostring(n);k.Size=UDim2.new(t,0,1,0);L()
            if E and r then r(E,n)end
            if E and C then C(n)end
        end
    end
    g.InputBegan:Connect(function(el)
        if el.UserInputType==Enum.UserInputType.MouseButton1 or el.UserInputType==Enum.UserInputType.Touch then
            if getgenv().ABC3728 then return end;getgenv().ABC3728=I;R=true;V(el)
        end
    end)
    D.InputBegan:Connect(function(el)
        if el.UserInputType==Enum.UserInputType.MouseButton1 or el.UserInputType==Enum.UserInputType.Touch then
            if getgenv().ABC3728 then return end;getgenv().ABC3728=I;R=true;V(el)
        end
    end)
    UserInputService.InputChanged:Connect(function(el)
        if R and(el.UserInputType==Enum.UserInputType.MouseMovement or el.UserInputType==Enum.UserInputType.Touch)then V(el)end
    end)
    UserInputService.InputEnded:Connect(function(el)
        if el.UserInputType==Enum.UserInputType.MouseButton1 or el.UserInputType==Enum.UserInputType.Touch then
            if R then R=false;getgenv().ABC3728=nil end
        end
    end)
    local O=false
    local B
    B=l:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()L()end)
    local function F(el)
        if minimizeAnimating or N then return end;N=true;E=not E
        if E then
            TweenService:Create(h,TweenInfo.new(0.25),{BackgroundColor3=currentTheme.Accent}):Play()
            TweenService:Create(u,TweenInfo.new(0.3,Enum.EasingStyle.Back),{Size=UDim2.new(1,0,1,0)}):Play()
            TweenService:Create(f,TweenInfo.new(0.3,Enum.EasingStyle.Back),{Position=UDim2.new(1,-23,0.5,-10)}):Play()
            task.delay(0.35,function()N=false;L()end)
        else
            TweenService:Create(h,TweenInfo.new(0.25),{BackgroundColor3=currentTheme.Secondary}):Play()
            TweenService:Create(u,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size=UDim2.new(0,0,1,0)}):Play()
            TweenService:Create(f,TweenInfo.new(0.25,Enum.EasingStyle.Back),{Position=UDim2.new(0,3,0.5,-10)}):Play()
            task.delay(0.3,function()N=false;L()end)
        end
        if not el and r then r(E,S)end
        if not el and C then C(S)end
    end
    m.MouseButton1Click:Connect(function()F(false)end)
    SectionFrame.CanvasSize=UDim2.new(0,0,0,SectionLayout.AbsoluteContentSize.Y+35)
    local G={SetValue=function(_,el)
        el=math.clamp(el,T,A)
        if el~=S then S=el;local t=(S-T)/(A-T);d.Text=tostring(math.floor(S*100)/100);k.Size=UDim2.new(t,0,1,0);L()
            if E and r then r(E,S)end
            if E and C then C(S)end
        end
    end,GetValue=function(_)return S end,SetState=function(_,el,t)if el~=E then F(t or false)end end,GetState=function(_)return E end,Value=function(_)return S end,SetRange=function(_,el,t)
        T,A=el,t;S=math.clamp(S,T,A);local n=(S-T)/(A-T);d.Text=tostring(S);k.Size=UDim2.new(n,0,1,0);L()
        if E and r then r(E,S)end
        if E and C then C(S)end
    end,GetRange=function(_)return T,A end,Destroy=function(_)if B then B:Disconnect()end;l:Destroy()end,SliderXP=function(_,el)C=el;return G end}
    return G
end
        function Section:Dropdown(text, desc, options, callback)
            if type(desc) == "table" then callback = options; options = desc; desc = nil end
            local baseH = 32
            if desc then local tl = CreateLabel(nil, nil, desc, nil, 12, currentFont, UDim2.new(0, 340, 0, 1000)); tl.TextWrapped = true; baseH = 32 + tl.TextBounds.Y + 12; tl:Destroy() end
            local DF = CreateFrame(SectionFrame, ENC_PREFIX.Dropdown_ .. XorEncode(text), currentTheme.Tertiary, 0, UDim2.new(1, -14, 0, baseH), nil, 6); DF.ClipsDescendants = false
            local TL = CreateLabel(DF, ENC.DTitle, text .. ":", currentTheme.Text, 14, currentFont, UDim2.new(1, -50, 0, 18), UDim2.new(0, 10, 0, 7), 7); TL.TextYAlignment = Enum.TextYAlignment.Center
            local DL
            if desc then DL = CreateLabel(DF, ENC.DDesc, desc, currentTheme.TextMuted, 12, currentFont, UDim2.new(1, -20, 0, baseH-40), UDim2.new(0, 10, 0, 26), 7); DL.TextWrapped = true; DL.RichText = true; DL.AutomaticSize = Enum.AutomaticSize.Y end
            local DA = CreateTextButton(DF, ENC.DArrow, UDim2.new(0, 24, 0, 24), UDim2.new(1, -30, 0, 4), 7); DA.Text = "<"; DA.TextColor3 = currentTheme.Accent; DA.BackgroundTransparency = 1
            local SB = Instance.new("TextBox"); SB.Name = ENC.SearchBox; SB.Parent = DF; SB.BackgroundColor3 = currentTheme.Secondary; SB.BorderSizePixel = 0
            SB.Position = UDim2.new(0, 5, 0, baseH); SB.Size = UDim2.new(1, -10, 0, 24); SB.Font = currentFont; SB.PlaceholderText = "Search..."; SB.Text = ""; SB.TextColor3 = currentTheme.Text; SB.PlaceholderColor3 = currentTheme.TextMuted; SB.TextSize = 12; SB.Visible = false; SB.ZIndex = 9; CreateCorner(SB, 5)
            local DLF = Instance.new("ScrollingFrame"); DLF.Name = ENC.DropdownList; DLF.Parent = DF; DLF.BackgroundColor3 = currentTheme.Secondary
            DLF.BorderSizePixel = 1; DLF.BorderColor3 = currentTheme.Border; DLF.Visible = false; DLF.ScrollBarThickness = 6; DLF.ScrollBarImageColor3 = currentTheme.Accent; DLF.ZIndex = 9; DLF.AutomaticCanvasSize = Enum.AutomaticSize.Y; DLF.ScrollingDirection = Enum.ScrollingDirection.Y; DLF.CanvasSize = UDim2.new(0,0,0,0); CreateCorner(DLF, 6)
            local DLL = Instance.new("UIListLayout"); DLL.Parent = DLF; DLL.Padding = UDim.new(0, 2); DLL.HorizontalAlignment = Enum.HorizontalAlignment.Center
            registerThemeUpdate(function() DF.BackgroundColor3 = currentTheme.Tertiary; TL.TextColor3 = currentTheme.Text; DA.TextColor3 = currentTheme.Accent; if DL then DL.TextColor3 = currentTheme.TextMuted end; DLF.BackgroundColor3 = currentTheme.Secondary; DLF.BorderColor3 = currentTheme.Border; DLF.ScrollBarImageColor3 = currentTheme.Accent; SB.BackgroundColor3 = currentTheme.Secondary end)
            local expanded = false; local selected = nil; local items = {}; local optionButtons = {}
            local function updateDropdownSize()
    local parentW = SectionFrame.AbsoluteSize.X
    if parentW <= 0 then parentW = 390 end
    local secW = parentW - 14

    if expanded then
        local sh = (#items > 10 and 28 or 0)
        local ch = DLL.AbsoluteContentSize.Y
        local th = math.min(ch, 200)
        DLF.Position = UDim2.new(0, 0, 0, baseH + sh)
        DLF.Size = UDim2.new(1, 0, 0, th)
        DF.Size = UDim2.new(0, secW, 0, baseH + sh + th + 4)
    else
        DLF.Size = UDim2.new(1, 0, 0, 0)
        DF.Size = UDim2.new(1, -14, 0, baseH)
    end
    SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
end
            local function filterOptions(st) st = st:lower(); for o, b in pairs(optionButtons) do b.Visible = st == "" or o:lower():find(st, 1, true) end; if expanded then updateDropdownSize() end end
            SB:GetPropertyChangedSignal("Text"):Connect(function() filterOptions(SB.Text) end)
            local dropdownObject = {}
            function dropdownObject:Add(option)
                if optionButtons[option] then return end; table.insert(items, option)
                local OB = CreateTextButton(DLF, ENC_PREFIX.Opt_ .. XorEncode(option), UDim2.new(1, -10, 0, 28), nil, 10); OB.Text = option; OB.TextColor3 = currentTheme.Text; OB.TextSize = 13; OB.BackgroundColor3 = currentTheme.Tertiary; OB.BackgroundTransparency = 0.3; CreateCorner(OB, 5)
                OB.MouseButton1Click:Connect(function() if minimizeAnimating then return end; selected = option; TL.Text = text .. ": " .. selected; if callback then callback(option) end; expanded = false; DLF.Visible = false; SB.Visible = false; SB.Text = ""; DA.Text = "<"; updateDropdownSize() end)
                optionButtons[option] = OB; updateDropdownSize()
            end
            function dropdownObject:Remove(option) local b = optionButtons[option]; if b then b:Destroy(); optionButtons[option] = nil; if selected == option then selected = nil; TL.Text = text .. ":"; if callback then callback(nil) end end; for i,v in ipairs(items) do if v == option then table.remove(items,i); break end end; updateDropdownSize() end end
            function dropdownObject:Clear() for o,b in pairs(optionButtons) do b:Destroy() end; optionButtons={}; items={}; selected=nil; TL.Text=text..":"; if callback then callback(nil) end; updateDropdownSize() end
            function dropdownObject:GetOptions() return items end
            function dropdownObject:GetSelected() return selected end
            function dropdownObject:SetSelected(option) if optionButtons[option] then selected=option; TL.Text=text..": "..selected; if callback then callback(selected) end; if expanded then expanded=false; DLF.Visible=false; SB.Visible=false; SB.Text=""; DA.Text="<"; updateDropdownSize() end end end
            DA.MouseButton1Click:Connect(function() if minimizeAnimating then return end; expanded = not expanded; if expanded then if #items > 10 then SB.Visible = true; SB.Text = "" end; DLF.Visible = true; DA.Text = ">" else SB.Visible = false; SB.Text = ""; DLF.Visible = false; DA.Text = "<" end; updateDropdownSize() end)
            local inputConnection
            inputConnection = UserInputService.InputBegan:Connect(function(input)
                if expanded and input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not DF:IsDescendantOf(input.Target) and input.Target ~= DA and input.Target ~= DLF and input.Target ~= SB then
                        expanded = false; DLF.Visible = false; SB.Visible = false; SB.Text = ""; DA.Text = ">"; updateDropdownSize()
                    end
                end
            end)
            DF.AncestryChanged:Connect(function() if not DF.Parent and inputConnection then inputConnection:Disconnect() end end)
            for _, o in ipairs(options or {}) do dropdownObject:Add(o) end
            SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
            return dropdownObject
        end
        function Section:MultiDropdown(text, desc, options, callback)
            if type(desc) == "table" then callback = options; options = desc; desc = nil end
            local baseH = 32
            if desc then local tl = CreateLabel(nil, nil, desc, nil, 12, currentFont, UDim2.new(0, 340, 0, 1000)); tl.TextWrapped = true; baseH = 32 + tl.TextBounds.Y + 12; tl:Destroy() end
            local MDF = CreateFrame(SectionFrame, ENC_PREFIX.MultiDropdown_ .. XorEncode(text), currentTheme.Tertiary, 0, UDim2.new(1, -14, 0, baseH), nil, 6); CreateCorner(MDF, 6); MDF.ClipsDescendants = false
            local TL = CreateLabel(MDF, ENC.MDTitle, text .. ":", currentTheme.Text, 14, currentFont, UDim2.new(0, 200, 0, 18), UDim2.new(0, 10, 0, 8), 7); TL.TextYAlignment = Enum.TextYAlignment.Center
            local CL = CreateLabel(MDF, ENC.MDCount, "(0 selected)", currentTheme.Accent, 12, currentFont, UDim2.new(0, 100, 0, 18), UDim2.new(0, 210, 0, 8), 7); CL.TextYAlignment = Enum.TextYAlignment.Center
            local DL
            if desc then DL = CreateLabel(MDF, ENC.MDDesc, desc, currentTheme.TextMuted, 12, currentFont, UDim2.new(0, 340, 0, baseH-40), UDim2.new(0, 10, 0, 26), 7); DL.TextWrapped = true; DL.RichText = true; DL.AutomaticSize = Enum.AutomaticSize.Y end
            local DA = CreateTextButton(MDF, ENC.MDArrow, UDim2.new(0, 24, 0, 24), UDim2.new(1, -30, 0, 5), 7); DA.Text = "<"; DA.TextColor3 = currentTheme.Accent; DA.BackgroundTransparency = 1
            local SB = Instance.new("TextBox"); SB.Name = ENC.SearchBox; SB.Parent = MDF; SB.BackgroundColor3 = currentTheme.Secondary; SB.BorderSizePixel = 0; SB.Font = currentFont; SB.PlaceholderText = "Search..."; SB.Text = ""; SB.TextColor3 = currentTheme.Text; SB.PlaceholderColor3 = currentTheme.TextMuted; SB.TextSize = 12; SB.Visible = false; SB.ZIndex = 9; CreateCorner(SB, 5)
            local DBtn = CreateTextButton(MDF, ENC.MDBtn, UDim2.new(1, 0, 0, baseH), nil, 8); DBtn.BackgroundTransparency = 1
            local DLF = Instance.new("ScrollingFrame"); DLF.Name = ENC.MDList; DLF.Parent = MDF; DLF.BackgroundColor3 = currentTheme.Secondary; DLF.BorderSizePixel = 1; DLF.BorderColor3 = currentTheme.Border; DLF.Visible = false; DLF.ScrollBarThickness = 6; DLF.ScrollBarImageColor3 = currentTheme.Accent; DLF.ZIndex = 9; DLF.AutomaticCanvasSize = Enum.AutomaticSize.Y; DLF.ScrollingDirection = Enum.ScrollingDirection.Y; DLF.CanvasSize = UDim2.new(0,0,0,0); CreateCorner(DLF, 6)
            local DLL = Instance.new("UIListLayout"); DLL.Parent = DLF; DLL.Padding = UDim.new(0, 2); DLL.HorizontalAlignment = Enum.HorizontalAlignment.Center
            registerThemeUpdate(function() MDF.BackgroundColor3 = currentTheme.Tertiary; TL.TextColor3 = currentTheme.Text; CL.TextColor3 = currentTheme.Accent; DA.TextColor3 = currentTheme.Accent; if DL then DL.TextColor3 = currentTheme.TextMuted end; DLF.BackgroundColor3 = currentTheme.Secondary; DLF.BorderColor3 = currentTheme.Border; DLF.ScrollBarImageColor3 = currentTheme.Accent; SB.BackgroundColor3 = currentTheme.Secondary end)
            local expanded = false; local selectedOptions = {}; local items = {}; local optionButtons = {}
            local function updateMDSize()
    local parentW = SectionFrame.AbsoluteSize.X
    if parentW <= 0 then parentW = 390 end
    local secW = parentW - 14

    if expanded then
        local sh = (#items > 8 and 28 or 0)
        if #items > 8 then
            SB.Position = UDim2.new(0, 5, 0, baseH)
            SB.Size = UDim2.new(1, -10, 0, 24)
        end
        local ly = baseH + sh
        DLF.Position = UDim2.new(0, 0, 0, ly)
        local ch = DLL.AbsoluteContentSize.Y
        local th = math.min(ch, 200)
        DLF.Size = UDim2.new(1, 0, 0, th)
        MDF.Size = UDim2.new(0, secW, 0, ly + th + 4)
    else
        DLF.Size = UDim2.new(1, 0, 0, 0)
        MDF.Size = UDim2.new(1, -14, 0, baseH)
    end
    SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
end
SectionFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
    task.defer(updateMDSize)
end)
            local function uc() local c=0; for _ in pairs(selectedOptions) do c=c+1 end; CL.Text="("..c.." selected)" end
            local function tc() if callback then local sl={}; for o,_ in pairs(selectedOptions) do table.insert(sl,o) end; callback(sl) end end
            local function fo(st) st=st:lower(); for o,d in pairs(optionButtons) do if d and d.Button then d.Button.Visible = st=="" or o:lower():find(st,1,true) end end; if expanded then updateMDSize() end end
            SB:GetPropertyChangedSignal("Text"):Connect(function() fo(SB.Text) end)
            local function to(option, sc) if selectedOptions[option] then selectedOptions[option]=nil; local d=optionButtons[option]; if d then d.Selected=false; d.Checkmark.Text="-"; TweenService:Create(d.Button, TweenInfo.new(0.2), {BackgroundColor3=currentTheme.Tertiary, BackgroundTransparency=0.3}):Play() end else selectedOptions[option]=true; local d=optionButtons[option]; if d then d.Selected=true; d.Checkmark.Text="+"; TweenService:Create(d.Button, TweenInfo.new(0.2), {BackgroundColor3=currentTheme.Accent, BackgroundTransparency=0}):Play() end end; uc(); if not sc then tc() end end
            local mdo = {}
            function mdo:Add(option) if optionButtons[option] then return end; table.insert(items, option)
                local OB = CreateTextButton(DLF, ENC_PREFIX.Opt_ .. XorEncode(option), UDim2.new(1, -10, 0, 28), nil, 10); OB.Text = ""; OB.TextColor3 = currentTheme.Text; OB.TextSize = 13; OB.BackgroundColor3 = currentTheme.Tertiary; OB.BackgroundTransparency = 0.3; CreateCorner(OB, 5)
                local CK = CreateLabel(OB, ENC.CK, "-", currentTheme.Text, 16, currentFont, UDim2.new(0, 20, 0, 28), UDim2.new(0, 8, 0, 0), 11); CK.TextXAlignment=Enum.TextXAlignment.Center; CK.TextYAlignment=Enum.TextYAlignment.Center
                local OL = CreateLabel(OB, ENC.OL, option, currentTheme.Text, 13, currentFont, UDim2.new(0, 320, 0, 28), UDim2.new(0, 32, 0, 0), 11); OL.TextYAlignment=Enum.TextYAlignment.Center
                optionButtons[option] = {Button=OB, Checkmark=CK, Label=OL, Selected=false}
                OB.MouseButton1Click:Connect(function() if minimizeAnimating then return end; to(option, false) end); updateMDSize()
            end
            function mdo:Remove(option) local d=optionButtons[option]; if d then if selectedOptions[option] then selectedOptions[option]=nil; uc(); tc() end; d.Button:Destroy(); optionButtons[option]=nil; for i,v in ipairs(items) do if v==option then table.remove(items,i); break end end; updateMDSize() end end
            function mdo:Clear() for o,d in pairs(optionButtons) do d.Button:Destroy() end; optionButtons={}; items={}; selectedOptions={}; uc(); tc(); updateMDSize() end
            function mdo:GetOptions() return items end
            function mdo:GetSelected() local sl={}; for o,_ in pairs(selectedOptions) do table.insert(sl,o) end; return sl end
            function mdo:SetSelected(option, state) if optionButtons[option] then local cs = selectedOptions[option]~=nil; if cs~=state then to(option,true); tc() end end end
            function mdo:SelectAll() for _,o in ipairs(items) do if not selectedOptions[o] then selectedOptions[o]=true; local d=optionButtons[o]; if d then d.Selected=true; d.Checkmark.Text="+"; TweenService:Create(d.Button, TweenInfo.new(0.2), {BackgroundColor3=currentTheme.Accent, BackgroundTransparency=0}):Play() end end end; uc(); tc() end
            function mdo:UnSelectAll() for o,_ in pairs(selectedOptions) do local d=optionButtons[o]; if d then d.Selected=false; d.Checkmark.Text="-"; TweenService:Create(d.Button, TweenInfo.new(0.2), {BackgroundColor3=currentTheme.Tertiary, BackgroundTransparency=0.3}):Play() end end; selectedOptions={}; uc(); tc() end
            function mdo:ToggleDropdown() if minimizeAnimating then return end; expanded = not expanded; if expanded then if #items > 8 then SB.Visible=true; SB.Text="" end; DLF.Visible=true; DA.Text=">" else SB.Visible=false; SB.Text=""; DLF.Visible=false; DA.Text="<" end; updateMDSize() end
            DBtn.MouseButton1Click:Connect(function() mdo:ToggleDropdown() end)
            local inputConnection
            inputConnection = UserInputService.InputBegan:Connect(function(input)
                if expanded and input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not MDF:IsDescendantOf(input.Target) and input.Target ~= DA and input.Target ~= DLF and input.Target ~= SB then
                        expanded = false; DLF.Visible = false; SB.Visible = false; SB.Text = ""; DA.Text = ">"; updateMDSize()
                    end
                end
            end)
            MDF.AncestryChanged:Connect(function() if not MDF.Parent and inputConnection then inputConnection:Disconnect() end end)
            for _, o in ipairs(options or {}) do mdo:Add(o) end
            SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
            return mdo
        end
        return Section
    end
local WindowObject = {}
    function WindowObject:Server(Name, Image) return Servers:Server(Name, Image) end
    function WindowObject:Channel(serverName, channelName) return Servers:Channel(serverName, channelName) end
    function WindowObject:CreateSection(serverName, channelName) return Servers:Channel(serverName, channelName) end
    WindowObject.SelectServer = function(...) return DiscordLib.SelectServer(DiscordLib, ...) end
    WindowObject.SelectChannel = function(...) return DiscordLib.SelectChannel(DiscordLib, ...) end
    WindowObject.SetTheme = function(...) return DiscordLib.SetTheme(DiscordLib, ...) end
    WindowObject.SetFont = function(...) return DiscordLib.SetFont(DiscordLib, ...) end
    WindowObject.SetWindowSize = function(...) return DiscordLib.SetWindowSize(DiscordLib, ...) end
    WindowObject.SetTransparency = function(...) return DiscordLib.SetTransparency(DiscordLib, ...) end
    WindowObject.Dialog = function(...) return DiscordLib.Dialog(DiscordLib, ...) end
    WindowObject.MinimizeUI = function(...) return DiscordLib.MinimizeUI(DiscordLib, ...) end
local function RegisterSearchItem(path, itemType, text, extra)

end

DiscordLib._RegisterSearchItem = RegisterSearchItem
    return WindowObject
end
function DiscordLib:CreateAcrylicBlur()
    local ae = false
    local ai = 0.5
    local af = nil
    local be = nil
    local rsConnection = nil
    
    local function cbe()
        if be then return end
        be = Instance.new("BlurEffect")
        be.Name = ENC.ABE
        be.Parent = Lighting
        be.Size = 0
        be.Enabled = false
    end
    
    local function caf()
        if af then return end
        local mf = Discord:FindFirstChild(ENC.MainFrame)
        if not mf then return end
        af = CreateFrame(Discord, ENC.AB, Color3.fromRGB(30,30,30), 1, mf.Size, mf.Position, 0)
        af.AnchorPoint = mf.AnchorPoint
        af.Active = false
        CreateCorner(af, 10)
        mf:GetPropertyChangedSignal("Position"):Connect(function()
            if af and af.Parent then af.Position = mf.Position end
        end)
        mf:GetPropertyChangedSignal("Size"):Connect(function()
            if af and af.Parent then af.Size = mf.Size end
        end)
    end
    
    local function updateBlur()
        if not ae then return end
        if getgenv().IsMinimized then
            if be and be.Parent then
                be.Enabled = false
                be.Size = 0
            end
            if af and af.Parent then
                af.BackgroundTransparency = 1
            end
        else
            if be and be.Parent then
                be.Enabled = true
                be.Size = 24 * ai
            end
            if af and af.Parent then
                af.BackgroundTransparency = 0.85 + (ai * 0.1)
            end
        end
    end
    
    local function Enable()
        if ae then return end
        cbe()
        caf()
        ae = true
        getgenv().BlurEnabled = true
        updateBlur()
        if not rsConnection then
            rsConnection = RunService.RenderStepped:Connect(updateBlur)
        end
    end
    
    local function Disable()
        ae = false
        getgenv().BlurEnabled = false
        if be and be.Parent then
            be.Enabled = false
            be.Size = 0
        end
        if af and af.Parent then
            af.BackgroundTransparency = 1
        end
        if rsConnection then
            rsConnection:Disconnect()
            rsConnection = nil
        end
    end
    
    local function SetIntensity(intensity)
        ai = math.clamp(intensity, 0, 1)
        if ae then
            updateBlur()
        end
    end
    
    local function Toggle()
        if ae then
            Disable()
        else
            Enable()
        end
    end
    
    return {
        Enable = Enable,
        Disable = Disable,
        Toggle = Toggle,
        SetIntensity = SetIntensity,
        GetIntensity = function() return ai end,
        IsEnabled = function() return ae end,
        GetBlurEffect = function() return be end
    }
end

local NOTIF_WIDTH  = 340
local NOTIF_HEIGHT = 92
local NOTIF_GAP    = 8
local NOTIF_TOP    = 30

local NotificationTypes = {
    Success = Color3.fromRGB(87, 242, 135),
    Error   = Color3.fromRGB(242, 63, 67),
    Warning = Color3.fromRGB(255, 186, 66),
    Info    = Color3.fromRGB(100, 140, 255),
}

local function RepositionNotifications()
    for i, entry in ipairs(activeNotifications) do
        if entry and entry.Frame and entry.Frame.Parent then
            local targetY = NOTIF_TOP + ((i - 1) * (NOTIF_HEIGHT + NOTIF_GAP))
            TweenService:Create(entry.Frame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { Position = UDim2.new(0.5, -NOTIF_WIDTH / 2, 0, targetY) }
            ):Play()
        end
    end
end

function DiscordLib:Notification(options)
    options = options or {}
    local title    = options.title or options.Title or "Notification"
    local desc     = options.desc  or options.Description or options.Desc or ""
    local duration = tonumber(options.time or options.duration or 3)
    local typeName = options.type or options.Type
    local accent   = (typeName and NotificationTypes[typeName]) or currentTheme.Accent
    local gradient = currentTheme.AccentGradient or accent
    local hasIcon  = (options.icon ~= nil and tostring(options.icon) ~= "")

    local Frame = CreateFrame(
        Discord, ENC.NotificationMain, currentTheme.NotificationBg, 0,
        UDim2.new(0, NOTIF_WIDTH, 0, NOTIF_HEIGHT),
        UDim2.new(0.5, -NOTIF_WIDTH / 2, 0, -NOTIF_HEIGHT - 10), 500
    )
    Frame.AnchorPoint = Vector2.new(0, 0)
    Frame.ClipsDescendants = true
    CreateCorner(Frame, 10)

    local shadow = CreateShadow(Frame)
    shadow.ZIndex = 499
    shadow.ImageTransparency = 0.55

    local gradientOverlay = CreateFrame(Frame, ENC.Background, currentTheme.NotificationBg, 0,
        UDim2.new(1, 0, 1, 0), nil, 501)
    CreateCorner(gradientOverlay, 10)
    local bgGrad = Instance.new("UIGradient")
    bgGrad.Rotation = 120
    bgGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, currentTheme.NotificationBg),
        ColorSequenceKeypoint.new(0.55, currentTheme.Secondary),
        ColorSequenceKeypoint.new(1, currentTheme.Tertiary),
    })
    bgGrad.Parent = gradientOverlay

    local topStripe = CreateFrame(Frame, ENC.AccentBar, accent, 0,
        UDim2.new(1, 0, 0, 3), UDim2.new(0, 0, 0, 0), 502)
    local stripeGrad = Instance.new("UIGradient")
    stripeGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, accent),
        ColorSequenceKeypoint.new(0.5, gradient),
        ColorSequenceKeypoint.new(1, accent),
    })
    stripeGrad.Parent = topStripe

    local stroke = Instance.new("UIStroke")
    stroke.Name = ENC.GradientBorder
    stroke.Thickness = 1.5
    stroke.Transparency = 0.2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    local strokeGrad = Instance.new("UIGradient")
    strokeGrad.Rotation = 45
    strokeGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, accent),
        ColorSequenceKeypoint.new(0.5, gradient),
        ColorSequenceKeypoint.new(1, accent),
    })
    strokeGrad.Parent = stroke
    stroke.Parent = Frame

    local contentLeft = 16
    local contentRight = 38

    if hasIcon then
        local iconFrame = CreateFrame(Frame, ENC.IconFrame, currentTheme.Tertiary, 0,
            UDim2.new(0, 36, 0, 36), UDim2.new(0, 14, 0, 16), 502)
        CreateCorner(iconFrame, 8)
        local iconStroke = Instance.new("UIStroke")
        iconStroke.Color = accent
        iconStroke.Thickness = 1.5
        iconStroke.Transparency = 0.25
        iconStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        iconStroke.Parent = iconFrame
        local iconImg = Instance.new("ImageLabel")
        iconImg.Name = ENC.Icon
        iconImg.Parent = iconFrame
        iconImg.BackgroundTransparency = 1
        iconImg.Size = UDim2.new(1, -8, 1, -8)
        iconImg.Position = UDim2.new(0, 4, 0, 4)
        iconImg.Image = options.icon
        iconImg.ScaleType = Enum.ScaleType.Fit
        iconImg.ZIndex = 503
        contentLeft = 60
    end

    local contentFrame = CreateFrame(Frame, ENC.ContentFrame, currentTheme.Main, 1,
        UDim2.new(1, -(contentLeft + contentRight), 1, -20),
        UDim2.new(0, contentLeft, 0, 14), 502)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = ENC.Title
    titleLabel.Parent = contentFrame
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(1, 0, 0, 18)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.Font = currentFont
    titleLabel.Text = title
    titleLabel.TextColor3 = currentTheme.Text
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.ZIndex = 503

    local divider = CreateFrame(Frame, XorEncode("NotifDivider"), accent, 0,
        UDim2.new(1, -(contentLeft + contentRight), 0, 1),
        UDim2.new(0, contentLeft, 0, 38), 503)
    local divGrad = Instance.new("UIGradient")
    divGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.12, 0.5),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(0.88, 0.5),
        NumberSequenceKeypoint.new(1, 1),
    })
    divGrad.Parent = divider

    local descLabel = Instance.new("TextLabel")
    descLabel.Name = ENC.ButtonDesc
    descLabel.Parent = contentFrame
    descLabel.BackgroundTransparency = 1
    descLabel.Size = UDim2.new(1, 0, 0, 40)
    descLabel.Position = UDim2.new(0, 0, 0, 26)
    descLabel.Font = currentFont
    descLabel.Text = desc
    descLabel.TextColor3 = currentTheme.TextMuted
    descLabel.TextSize = 12
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.TextYAlignment = Enum.TextYAlignment.Top
    descLabel.TextWrapped = true
    descLabel.ZIndex = 503

    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = ENC.CloseBtn
    closeBtn.Parent = Frame
    closeBtn.BackgroundTransparency = 1
    closeBtn.BackgroundColor3 = currentTheme.Hover
    closeBtn.Size = UDim2.new(0, 22, 0, 22)
    closeBtn.Position = UDim2.new(1, -30, 0, 10)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = currentTheme.TextMuted
    closeBtn.TextSize = 13
    closeBtn.AutoButtonColor = false
    closeBtn.ZIndex = 504
    CreateCorner(closeBtn, 5)

    closeBtn.MouseEnter:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.15), {
            BackgroundTransparency = 0.6,
            TextColor3 = currentTheme.Text,
        }):Play()
    end)
    closeBtn.MouseLeave:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.15), {
            BackgroundTransparency = 1,
            TextColor3 = currentTheme.TextMuted,
        }):Play()
    end)

    local progressBg = CreateFrame(Frame, ENC.ProgressBg, currentTheme.Tertiary, 0.4,
        UDim2.new(1, -24, 0, 2), UDim2.new(0, 12, 1, -8), 502)
    CreateCorner(progressBg, 1)
    local progressFill = CreateFrame(progressBg, ENC.ProgressFill, accent, 0,
        UDim2.new(1, 0, 1, 0), nil, 503)
    CreateCorner(progressFill, 1)
    local progGrad = Instance.new("UIGradient")
    progGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, accent),
        ColorSequenceKeypoint.new(1, gradient),
    })
    progGrad.Parent = progressFill

    local entry = { Frame = Frame, dismissed = false }
    table.insert(activeNotifications, 1, entry)
    RepositionNotifications()

    local function dismiss()
        if entry.dismissed then return end
        entry.dismissed = true
        TweenService:Create(Frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -NOTIF_WIDTH / 2, 0, -NOTIF_HEIGHT - 30),
        }):Play()
        TweenService:Create(gradientOverlay, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(stroke, TweenInfo.new(0.3), { Transparency = 1 }):Play()
        TweenService:Create(shadow, TweenInfo.new(0.3), { ImageTransparency = 1 }):Play()
        TweenService:Create(contentFrame, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(progressBg, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(topStripe, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(divider, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()

        task.delay(0.32, function()
            for i, n in ipairs(activeNotifications) do
                if n == entry then table.remove(activeNotifications, i); break end
            end
            if Frame and Frame.Parent then Frame:Destroy() end
            RepositionNotifications()
        end)
    end

    closeBtn.MouseButton1Click:Connect(dismiss)

    if duration > 0 then
        local startTime = tick()
        task.spawn(function()
            while Frame and Frame.Parent and not entry.dismissed do
                local elapsed = tick() - startTime
                local remaining = math.max(0, 1 - elapsed / duration)
                progressFill.Size = UDim2.new(remaining, 0, 1, 0)
                if remaining <= 0 then dismiss(); break end
                task.wait()
            end
        end)
    else
        progressBg.Visible = false
    end

    table.insert(ThemeUpdateConnections, function()
        if not (Frame and Frame.Parent) then return end
        local newAccent = (typeName and NotificationTypes[typeName]) or currentTheme.Accent
        local newGradient = currentTheme.AccentGradient or newAccent

        Frame.BackgroundColor3 = currentTheme.NotificationBg
        gradientOverlay.BackgroundColor3 = currentTheme.NotificationBg
        bgGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, currentTheme.NotificationBg),
            ColorSequenceKeypoint.new(0.55, currentTheme.Secondary),
            ColorSequenceKeypoint.new(1, currentTheme.Tertiary),
        })
        stripeGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, newAccent),
            ColorSequenceKeypoint.new(0.5, newGradient),
            ColorSequenceKeypoint.new(1, newAccent),
        })
        progGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, newAccent),
            ColorSequenceKeypoint.new(1, newGradient),
        })
        strokeGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, newAccent),
            ColorSequenceKeypoint.new(0.5, newGradient),
            ColorSequenceKeypoint.new(1, newAccent),
        })
        titleLabel.TextColor3 = currentTheme.Text
        descLabel.TextColor3 = currentTheme.TextMuted
        progressBg.BackgroundColor3 = currentTheme.Tertiary
        shadow.ImageColor3 = currentTheme.Shadow
        stroke.Color = newAccent
        topStripe.BackgroundColor3 = newAccent
        divider.BackgroundColor3 = newAccent
        progressFill.BackgroundColor3 = newAccent
        closeBtn.TextColor3 = currentTheme.TextMuted
        closeBtn.BackgroundColor3 = currentTheme.Hover
    end)

    return {
        Frame = Frame,
        Dismiss = dismiss,
        SetTitle = function(t) titleLabel.Text = tostring(t or "") end,
        SetDescription = function(d) descLabel.Text = tostring(d or "") end,
        SetType = function(t)
            local col = NotificationTypes[t] or currentTheme.Accent
            topStripe.BackgroundColor3 = col
            divider.BackgroundColor3 = col
            progressFill.BackgroundColor3 = col
            stroke.Color = col
        end,
    }
end


function DiscordLib:Loader(e)
  if getgenv().ABC3616 or getgenv().ABC8281 then return nil end
  local t=e and e.title or"Loading..."
  local n=e and e.desc or""
  local o=e and e.time or 3
  local i=e and e.image
  if e and e.useLoader==false then return end
  getgenv().ABC7472=true
  local s=Discord:FindFirstChild(ENC.MainFrame)
  local r=getgenv().MinimizeButton
  local a=r and r.Parent
  if s then s.Visible=false end
  if a then a.Enabled=false end
  if Discord then Discord.Enabled=false end
  local l=Instance.new("ScreenGui")
  l.Name=XorEncode("LG_")..EncriptyText()
  protectGui(l)
  l.ZIndexBehavior=Enum.ZIndexBehavior.Global
  l.IgnoreGuiInset=true
  local c=CreateFrame(l,nil,Color3.fromRGB(0,0,0),1,UDim2.new(1,0,1,0),nil,999)
  local d=n~=""
  local h=150
  if d then
    local el=Instance.new("TextLabel")
    el.Font=currentFont
    el.TextSize=13
    el.Text=n
    el.Size=UDim2.new(0,300,0,1000)
    el.TextWrapped=true
    el.RichText=true
    el.LineHeight=1.3
    el.Parent=l
    el.Visible=false
    task.wait()
    h=150+el.TextBounds.Y+10
    el:Destroy()
  end
  local u=CreateFrame(c,nil,Color3.fromRGB(8,6,22),1,UDim2.new(0,460,0,h+20),UDim2.new(0.5,0,0.5,0),1000)
  u.AnchorPoint=Vector2.new(0.5,0.5)
  CreateCorner(u,4)
  local p=Instance.new("UIStroke")
  p.Color=Color3.fromRGB(25,15,70)
  p.Thickness=2
  p.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
  p.Parent=u
  local f=CreateFrame(u,nil,Color3.fromRGB(10,8,28),1,UDim2.new(1,-16,1,-16),UDim2.new(0,8,0,8),1001)
  CreateCorner(f,2)
  f.ClipsDescendants=true
  local m=CreateFrame(f,nil,nil,1,UDim2.new(1,0,1,0),nil,1002)
  local y=CreateFrame(m,nil,Color3.fromRGB(70,40,160),1,UDim2.new(0,4,1,0),nil,1003)
  local v=Instance.new("UIGradient")
  v.Rotation=180
  v.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(70,40,160)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(150,100,240)),ColorSequenceKeypoint.new(1,Color3.fromRGB(70,40,160))})
  v.Parent=y
  TweenService:Create(v,TweenInfo.new(2,Enum.EasingStyle.Linear,Enum.EasingDirection.In,-1),{Rotation=540}):Play()
  local b=i and 130 or 25
  local g=i and 265 or 370
  local k,w
  if i then
    k=CreateFrame(m,nil,Color3.fromRGB(18,14,45),1,UDim2.new(0,90,0,90),UDim2.new(0,25,0,22),1006)
    CreateCorner(k,4)
    w=Instance.new("ImageLabel")
    w.Parent=k
    w.BackgroundTransparency=1
    w.Position=UDim2.new(0,6,0,6)
    w.Size=UDim2.new(0,78,0,78)
    w.Image=i
    w.ImageTransparency=1
    w.ZIndex=1007
    CreateCorner(w,2)
    TweenService:Create(k,TweenInfo.new(0.6,Enum.EasingStyle.Back),{BackgroundTransparency=0}):Play()
    TweenService:Create(w,TweenInfo.new(0.6,Enum.EasingStyle.Back),{ImageTransparency=0}):Play()
  end
  local _=CreateLabel(m,nil,t,Color3.fromRGB(180,160,240),24,currentFont,UDim2.new(0,g,0,30),UDim2.new(0,b,0,32),1003)
  _.TextTransparency=1
  _.TextXAlignment=Enum.TextXAlignment.Left
  local D
  if d then
    D=CreateLabel(m,nil,n,Color3.fromRGB(130,110,180),13,currentFont,UDim2.new(0,g,0,0),UDim2.new(0,b,0,65),1003)
    D.TextTransparency=1
    D.TextXAlignment=Enum.TextXAlignment.Left
    D.TextYAlignment=Enum.TextYAlignment.Top
    D.TextWrapped=true
    D.RichText=true
    D.LineHeight=1.3
    D.AutomaticSize=Enum.AutomaticSize.Y
  end
  local L=d and(D and 65+D.TextBounds.Y+16 or 72)or 72
  local E=CreateFrame(m,nil,Color3.fromRGB(18,14,45),1,UDim2.new(0,g,0,12),UDim2.new(0,b,0,L),1003)
  E.BorderSizePixel=1
  E.BorderColor3=Color3.fromRGB(25,15,70)
  CreateCorner(E,2)
  local T=CreateFrame(E,nil,Color3.fromRGB(80,50,180),1,UDim2.new(0,0,1,-2),UDim2.new(0,1,0,1),1004)
  local A=Instance.new("UIGradient")
  A.Rotation=0
  A.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(80,50,180)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(160,110,240)),ColorSequenceKeypoint.new(1,Color3.fromRGB(120,80,220))})
  A.Parent=T
  CreateCorner(T,2)
  local S=CreateFrame(m,nil,nil,1,UDim2.new(0,g,0,22),UDim2.new(0,b,0,L+18),1003)
  local R=CreateFrame(S,nil,Color3.fromRGB(150,100,240),1,UDim2.new(0,8,0,8),UDim2.new(0,0,0.5,-4),1004)
  CreateCorner(R,4)
  local N=Instance.new("ImageLabel")
  N.Name=ENC.SDGlow
  N.Parent=R
  N.BackgroundTransparency=1
  N.Size=UDim2.new(1,20,1,20)
  N.Position=UDim2.new(0,-10,0,-10)
  N.Image="rbxassetid://6014261993"
  N.ImageColor3=Color3.fromRGB(150,100,240)
  N.ImageTransparency=0.5
  N.ScaleType=Enum.ScaleType.Slice
  N.SliceCenter=Rect.new(49,49,49,49)
  N.ZIndex=1003
  local O=CreateLabel(S,nil,"Initializing...",Color3.fromRGB(130,110,180),12,currentFont,UDim2.new(0,g-14,0,22),UDim2.new(0,14,0,0),1003)
  O.TextTransparency=1
  O.TextXAlignment=Enum.TextXAlignment.Left
  TweenService:Create(c,TweenInfo.new(0.5),{BackgroundTransparency=0.7}):Play()
  TweenService:Create(u,TweenInfo.new(0.6,Enum.EasingStyle.Back),{BackgroundTransparency=0}):Play()
  TweenService:Create(f,TweenInfo.new(0.6,Enum.EasingStyle.Back),{BackgroundTransparency=0}):Play()
  TweenService:Create(y,TweenInfo.new(0.5),{BackgroundTransparency=0}):Play()
  TweenService:Create(_,TweenInfo.new(0.5,Enum.EasingStyle.Quad),{TextTransparency=0}):Play()
  TweenService:Create(E,TweenInfo.new(0.5),{BackgroundTransparency=0}):Play()
  TweenService:Create(T,TweenInfo.new(0.5),{BackgroundTransparency=0}):Play()
  TweenService:Create(O,TweenInfo.new(0.5),{TextTransparency=0}):Play()
  TweenService:Create(R,TweenInfo.new(0.5,Enum.EasingStyle.Back),{BackgroundTransparency=0}):Play()
  TweenService:Create(N,TweenInfo.new(0.5),{ImageTransparency=0.5}):Play()
  if D then TweenService:Create(D,TweenInfo.new(0.5),{TextTransparency=0}):Play() end
  task.spawn(function()
    while R and R.Parent do
      TweenService:Create(R,TweenInfo.new(0.6,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{BackgroundTransparency=0.4}):Play()
      TweenService:Create(N,TweenInfo.new(0.6,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{ImageTransparency=0.7}):Play()
      task.wait(0.6)
      if R and R.Parent then
        TweenService:Create(R,TweenInfo.new(0.6,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{BackgroundTransparency=0}):Play()
        TweenService:Create(N,TweenInfo.new(0.6,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{ImageTransparency=0.5}):Play()
        task.wait(0.6)
      end
    end
  end)
  local I={{"Initializing...",0.25,o*0.3},{"Loading modules...",0.55,o*0.3},{"Setting up UI...",0.80,o*0.25},{"Almost ready...",0.95,o*0.1},{"Complete!",1,o*0.05}}
  for _,el in ipairs(I)do
    if O and O.Parent then O.Text=el[1] end
    TweenService:Create(T,TweenInfo.new(el[3],Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(el[2],0,1,-2)}):Play()
    task.wait(el[3])
  end
  task.wait(0.4)
  TweenService:Create(c,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
  TweenService:Create(u,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
  TweenService:Create(f,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
  TweenService:Create(y,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
  TweenService:Create(_,TweenInfo.new(0.4),{TextTransparency=1}):Play()
  TweenService:Create(E,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
  TweenService:Create(T,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
  TweenService:Create(O,TweenInfo.new(0.4),{TextTransparency=1}):Play()
  TweenService:Create(R,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
  TweenService:Create(N,TweenInfo.new(0.4),{ImageTransparency=1}):Play()
  if D then TweenService:Create(D,TweenInfo.new(0.4),{TextTransparency=1}):Play() end
  if k then TweenService:Create(k,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play() end
  if w then TweenService:Create(w,TweenInfo.new(0.4),{ImageTransparency=1}):Play() end
  task.wait(0.5)
  l:Destroy()
  if s then s.Visible=true end
  if a then a.Enabled=true end
  if Discord then Discord.Enabled=true end
  getgenv().ABC7472=false
end

function DiscordLib:KeySystem(e)
  if getgenv().ABC7472 or getgenv().ABC8281 then return nil end
  local t=e.key or""
  local n=e.encryptedKey or""
  local o=e.title or"Key System"
  local i=e.note or""
  local s=e.image
  local r=e.callback
  local a=e.cancelCallback
  getgenv().ABC3616=true
  local l=t
  if n~=""then l=n end
  local c=Discord:FindFirstChild(ENC.MainFrame)
  local d=getgenv().MinimizeButton
  local h=d and d.Parent
  if c then c.Visible=false end
  if h then h.Enabled=false end
  if Discord then Discord.Enabled=false end
  local u=Instance.new("ScreenGui")
  u.Name=XorEncode("KeySystem_")..EncriptyText()
  u.ResetOnSpawn=false
  protectGui(u)
  u.ZIndexBehavior=Enum.ZIndexBehavior.Global
  u.IgnoreGuiInset=true
  local p=CreateFrame(u,nil,Color3.fromRGB(0,0,0),1,UDim2.new(1,0,1,0),nil,999)
  local f=CreateFrame(p,nil,Color3.fromRGB(8,6,22),1,UDim2.new(0,480,0,340),UDim2.new(0.5,-240,0.5,-170),1000)
  CreateCorner(f,4)
  local m=Instance.new("UIStroke")
  m.Color=Color3.fromRGB(25,15,70)
  m.Thickness=2
  m.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
  m.Parent=f
  local y=CreateFrame(f,nil,Color3.fromRGB(10,8,28),1,UDim2.new(1,-16,1,-16),UDim2.new(0,8,0,8),1001)
  CreateCorner(y,2)
  y.ClipsDescendants=true
  local v=CreateFrame(y,nil,nil,1,UDim2.new(1,0,1,0),nil,1002)
  local b=CreateFrame(v,nil,Color3.fromRGB(70,40,160),1,UDim2.new(0,4,1,0),nil,1003)
  local g=Instance.new("UIGradient")
  g.Rotation=180
  g.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(70,40,160)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(150,100,240)),ColorSequenceKeypoint.new(1,Color3.fromRGB(70,40,160))})
  g.Parent=b
  local k,w
  if s then
    k=CreateFrame(v,nil,Color3.fromRGB(18,14,45),1,UDim2.new(0,80,0,80),UDim2.new(0.5,-40,0,30),1006)
    CreateCorner(k,4)
    w=Instance.new("ImageLabel")
    w.Parent=k
    w.BackgroundTransparency=1
    w.Position=UDim2.new(0,5,0,5)
    w.Size=UDim2.new(0,70,0,70)
    w.Image=s
    w.ImageTransparency=1
    w.ZIndex=1007
    CreateCorner(w,2)
  end
  local _=CreateLabel(v,nil,o,Color3.fromRGB(180,160,240),24,currentFont,UDim2.new(0,420,0,30),UDim2.new(0,30,0,s and 120 or 30),1003)
  _.TextTransparency=1
  _.TextXAlignment=Enum.TextXAlignment.Center
  local D
  if i~=""then
    D=CreateLabel(v,nil,i,Color3.fromRGB(130,110,180),13,currentFont,UDim2.new(0,420,0,0),UDim2.new(0,30,0,s and 155 or 65),1003)
    D.TextTransparency=1
    D.TextXAlignment=Enum.TextXAlignment.Center
    D.TextWrapped=true
    D.RichText=true
    D.LineHeight=1.3
    D.AutomaticSize=Enum.AutomaticSize.Y
  end
  local L=s and(i~=""and 185 or 175)or(i~=""and 95 or 70)
  local E=Instance.new("TextBox")
  E.Name=ENC.KeyInput
  E.Parent=v
  E.BackgroundColor3=Color3.fromRGB(18,14,45)
  E.BackgroundTransparency=1
  E.BorderSizePixel=1
  E.BorderColor3=Color3.fromRGB(25,15,70)
  E.Position=UDim2.new(0.5,-175,0,L)
  E.Size=UDim2.new(0,350,0,45)
  E.Font=currentFont
  E.PlaceholderText="Enter your key..."
  E.Text=""
  E.TextColor3=Color3.fromRGB(200,180,240)
  E.PlaceholderColor3=Color3.fromRGB(80,60,120)
  E.TextSize=16
  E.ZIndex=1002
  E.TextXAlignment=Enum.TextXAlignment.Center
  CreateCorner(E,3)
  local T=L+60
  local A=CreateTextButton(v,nil,UDim2.new(0,170,0,40),UDim2.new(0.5,-175,0,T),1002)
  A.Text="UNLOCK"
  A.TextColor3=Color3.fromRGB(255,255,255)
  A.BackgroundColor3=Color3.fromRGB(70,40,160)
  A.TextTransparency=1
  CreateCorner(A,3)
  local S=Instance.new("UIGradient")
  S.Rotation=90
  S.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(70,40,160)),ColorSequenceKeypoint.new(1,Color3.fromRGB(120,80,220))})
  S.Parent=A
  local R=CreateTextButton(v,nil,UDim2.new(0,170,0,40),UDim2.new(0.5,5,0,T),1002)
  R.Text="CANCEL"
  R.TextColor3=Color3.fromRGB(180,160,240)
  R.BackgroundColor3=Color3.fromRGB(18,14,45)
  R.TextTransparency=1
  R.BorderSizePixel=1
  R.BorderColor3=Color3.fromRGB(25,15,70)
  CreateCorner(R,3)
  local N=CreateLabel(v,nil,"",Color3.fromRGB(255,80,80),12,currentFont,UDim2.new(0,420,0,20),UDim2.new(0,30,0,T+50),1003)
  N.TextTransparency=1
  N.TextXAlignment=Enum.TextXAlignment.Center
  N.Visible=false
  local O=false
  local I=false
  local C=0
  local _V=5
  local function B()
    if c then c.Visible=true end
    if h then h.Enabled=true end
    if Discord then Discord.Enabled=true end
    getgenv().ABC3616=false
  end
  local function F(el)
    if O then return end
    N.Text=el
    N.Visible=true
    N.TextTransparency=0
    local t=f.Position
    task.spawn(function()
      for el=1,3 do
        f.Position=f.Position+UDim2.new(0,4,0,0)
        task.wait(0.04)
        f.Position=f.Position+UDim2.new(0,-8,0,0)
        task.wait(0.04)
        f.Position=f.Position+UDim2.new(0,4,0,0)
        task.wait(0.04)
      end
      f.Position=t
    end)
    task.delay(3,function()
      if N and N.Parent then N.Visible=false end
    end)
  end
  local function G(el)
    if O or I then return end
    if#el<1 then F("Please enter a key")return end
    if el==l then
      I=true
      N.Text="Key accepted!"
      N.TextColor3=Color3.fromRGB(80,255,80)
      N.Visible=true
      N.TextTransparency=0
      E.Active=false
      A.Active=false
      R.Active=false
      task.wait(0.8)
      TweenService:Create(p,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
      TweenService:Create(f,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
      TweenService:Create(y,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
      task.wait(0.5)
      O=true
      if u and u.Parent then u:Destroy()end
      B()
      if r then task.spawn(r)end
    else
      C=C+1
      E.Text=""
      if C>=_V then
        F("Too many attempts. Closing...")
        E.Active=false
        A.Active=false
        R.Active=false
        task.wait(2)
        TweenService:Create(p,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
        TweenService:Create(f,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
        task.wait(0.5)
        O=true
        if u and u.Parent then u:Destroy()end
        B()
        if a then task.spawn(a)end
      else
        F(string.format("Invalid key (%d/%d attempts)",C,_V))
        E:CaptureFocus()
      end
    end
  end
  local function H()
    if O or I then return end
    O=true
    TweenService:Create(p,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
    TweenService:Create(f,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
    TweenService:Create(y,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
    task.wait(0.3)
    if u and u.Parent then u:Destroy()end
    B()
    if a then task.spawn(a)end
  end
  A.MouseButton1Click:Connect(function()G(E.Text)end)
  R.MouseButton1Click:Connect(function()H()end)
  E.FocusLost:Connect(function(el)
    if el and not O and not I then G(E.Text)end
  end)
  TweenService:Create(p,TweenInfo.new(0.5),{BackgroundTransparency=0.7}):Play()
  TweenService:Create(f,TweenInfo.new(0.6,Enum.EasingStyle.Back),{BackgroundTransparency=0}):Play()
  TweenService:Create(y,TweenInfo.new(0.6,Enum.EasingStyle.Back),{BackgroundTransparency=0}):Play()
  TweenService:Create(b,TweenInfo.new(0.5),{BackgroundTransparency=0}):Play()
  TweenService:Create(_,TweenInfo.new(0.5,Enum.EasingStyle.Quad),{TextTransparency=0}):Play()
  TweenService:Create(E,TweenInfo.new(0.5),{BackgroundTransparency=0,TextTransparency=0}):Play()
  TweenService:Create(A,TweenInfo.new(0.5),{BackgroundTransparency=0,TextTransparency=0}):Play()
  TweenService:Create(R,TweenInfo.new(0.5),{BackgroundTransparency=0,TextTransparency=0}):Play()
  if D then TweenService:Create(D,TweenInfo.new(0.5),{TextTransparency=0}):Play()end
  if k then TweenService:Create(k,TweenInfo.new(0.6,Enum.EasingStyle.Back),{BackgroundTransparency=0}):Play()end
  if w then TweenService:Create(w,TweenInfo.new(0.6,Enum.EasingStyle.Back),{ImageTransparency=0}):Play()end
  task.spawn(function()
    while g and g.Parent do
      TweenService:Create(g,TweenInfo.new(2,Enum.EasingStyle.Linear,Enum.EasingDirection.In,-1),{Rotation=540}):Play()
      task.wait(2)
    end
  end)
  A.MouseEnter:Connect(function()TweenService:Create(A,TweenInfo.new(0.2),{BackgroundTransparency=0.1}):Play()end)
  A.MouseLeave:Connect(function()TweenService:Create(A,TweenInfo.new(0.2),{BackgroundTransparency=0}):Play()end)
  R.MouseEnter:Connect(function()TweenService:Create(R,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(25,20,50)}):Play()end)
  R.MouseLeave:Connect(function()TweenService:Create(R,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(18,14,45)}):Play()end)
  task.wait(0.6)
  E:CaptureFocus()
end

function DiscordLib:Dialog(e)
    if getgenv().ABC3616 or getgenv().ABC7472 then return nil end

    e = e or {}
    local t = tostring(e.Title or "Dialog")
    local n = tostring(e.Content or "")

    local o = {}
    if type(e.Buttons) == "table" then
        for _, btn in ipairs(e.Buttons) do
            if btn ~= nil then
                local text, cb
                if type(btn) == "string" then
                    text = btn
                elseif type(btn) == "table" then
                    text = btn.Text or btn.text or btn.Name or btn.name
                    cb   = btn.Callback or btn.callback
                else
                    text = tostring(btn)
                end
                if text == nil or text == "" then
                    text = "Button " .. tostring(#o + 1)
                end
                table.insert(o, { Text = tostring(text), Callback = cb })
            end
        end
    end

    getgenv().ABC8281 = true

    local isClosed = false
    local selectedResponse = nil
    local connections = {}

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = XorEncode("Dialog_") .. EncriptyText()
    screenGui.ResetOnSpawn = false
    protectGui(screenGui)
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    screenGui.IgnoreGuiInset = true

    local bgOverlay = CreateFrame(screenGui, ENC.Background, Color3.fromRGB(0,0,0), 1, UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), 1)
    bgOverlay.Active = true
    bgOverlay.ClipsDescendants = false
    bgOverlay.BackgroundTransparency = 1

    local btnH = 40
    local btnGap = 15
    local maxCols = 2
    local dialogW = 420
    local baseH = 200

    local mainFrame = CreateFrame(bgOverlay, ENC.DialogMain, currentTheme.Main, 0, UDim2.new(0,dialogW,0,baseH), UDim2.new(0.5,-dialogW/2,0.5,-baseH/2), 2)
    mainFrame.ClipsDescendants = false
    CreateCorner(mainFrame, 12)

    local borderFrame = CreateFrame(mainFrame, ENC.Border, Color3.fromRGB(255,255,255), 0.5, UDim2.new(1,4,1,4), UDim2.new(0,-2,0,-2), 0)
    borderFrame.ClipsDescendants = false
    CreateCorner(borderFrame, 13)
    local gradient = Instance.new("UIGradient")
    gradient.Rotation = 45
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, currentTheme.Accent),
        ColorSequenceKeypoint.new(0.5, currentTheme.AccentGradient),
        ColorSequenceKeypoint.new(1, currentTheme.Accent)
    })
    gradient.Parent = borderFrame

    local gradientConn = RunService.Heartbeat:Connect(function()
        if gradient and gradient.Parent then
            gradient.Rotation = (gradient.Rotation + 1) % 360
        end
    end)
    table.insert(connections, gradientConn)

    local titleLabel = CreateLabel(mainFrame, XorEncode("Title"), t, currentTheme.Text, 18, Enum.Font.GothamBold, UDim2.new(1,-40,0,30), UDim2.new(0,20,0,20), 3)
    local contentLabel = CreateLabel(mainFrame, XorEncode("Content"), n, currentTheme.TextMuted, 14, currentFont, UDim2.new(1,-40,0,0), UDim2.new(0,20,0,60), 3)
    contentLabel.TextWrapped = true
    contentLabel.RichText = true
    contentLabel.LineHeight = 1.5
    contentLabel.AutomaticSize = Enum.AutomaticSize.Y

    local createdButtons = {}

    local function closeDialog(callback)
        if isClosed and callback == nil then
        end
        getgenv().ABC8281 = false
        TweenService:Create(borderFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()
        TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()
        TweenService:Create(titleLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
        TweenService:Create(contentLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
        for _, btn in ipairs(createdButtons) do
            if btn and btn.Parent then
                TweenService:Create(btn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
            end
        end
        TweenService:Create(bgOverlay, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()
        task.delay(0.35, function()
            for _, c in ipairs(connections) do
                pcall(function() c:Disconnect() end)
            end
            connections = {}
            if screenGui and screenGui.Parent then screenGui:Destroy() end
            if callback then task.spawn(callback) end
        end)
    end

    local function setupButtons()
        task.wait()

        local contentH = contentLabel.AbsoluteSize.Y
        if not contentH or contentH < 20 then contentH = 40 end

        local totalBtns = #o
        if totalBtns == 0 then

            local totalH = 20 + 30 + 10 + contentH + 40
            TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, dialogW, 0, totalH),
                Position = UDim2.new(0.5, -dialogW/2, 0.5, -totalH/2)
            }):Play()
            return
        end

        local rowsNeeded = math.ceil(totalBtns / maxCols)
        if rowsNeeded < 1 then rowsNeeded = 1 end
        local buttonsAreaH = (rowsNeeded * btnH) + ((rowsNeeded - 1) * btnGap)

        local totalH = 20 + 30 + 10 + contentH + 20 + buttonsAreaH + 20

        TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, dialogW, 0, totalH),
            Position = UDim2.new(0.5, -dialogW/2, 0.5, -totalH/2)
        }):Play()

        createdButtons = {}
        local paddingX = 30
        local availableW = dialogW - (paddingX * 2)
        local colW = (availableW - ((maxCols - 1) * btnGap)) / maxCols

        for idx = 1, totalBtns do
            local btnData = o[idx]
            local btnText = btnData.Text or ("Button " .. tostring(idx))
            local btnCallback = btnData.Callback

            local zeroIndex = idx - 1
            local row = math.floor(zeroIndex / maxCols)
            local col = zeroIndex % maxCols

            local btnsInThisRow = math.min(maxCols, totalBtns - (row * maxCols))
            if btnsInThisRow < 1 then btnsInThisRow = 1 end
            local rowTotalW = (btnsInThisRow * colW) + ((btnsInThisRow - 1) * btnGap)
            local startX = (dialogW - rowTotalW) / 2

            local posY = 20 + 30 + 10 + contentH + 20 + (row * (btnH + btnGap))
            local posX = startX + (col * (colW + btnGap))

            local btn = CreateTextButton(
                mainFrame,
                ENC_PREFIX.DialogButton_ .. XorEncode(tostring(idx)),
                UDim2.new(0, colW, 0, btnH),
                UDim2.new(0, posX, 0, posY),
                10
            )
            btn.BackgroundColor3 = currentTheme.Accent
            btn.BackgroundTransparency = 0
            btn.Text = btnText
            btn.Font = Enum.Font.GothamBold
            btn.TextColor3 = Color3.fromRGB(255,255,255)
            btn.TextSize = 14
            btn.AutoButtonColor = false
            btn.ClipsDescendants = false
            CreateCorner(btn, 8)
            table.insert(createdButtons, btn)

            local btnGrad = Instance.new("UIGradient")
            btnGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, currentTheme.Accent), ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)})
            btnGrad.Parent = btn

            btn.MouseEnter:Connect(function()
                if isClosed then return end
                TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.1}):Play()
            end)
            btn.MouseLeave:Connect(function()
                if isClosed then return end
                TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
                btn.BackgroundColor3 = currentTheme.Accent
            end)
            btn.MouseButton1Down:Connect(function()
                if isClosed then return end
                TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(0, colW*0.95, 0, btnH*0.95)}):Play()
            end)
            btn.MouseButton1Up:Connect(function()
                if isClosed then return end
                TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(0, colW, 0, btnH)}):Play()
            end)
            btn.MouseButton1Click:Connect(function()
                if isClosed then return end
                isClosed = true
                selectedResponse = btnText
                btn.BackgroundColor3 = currentTheme.Accent
                btn.BackgroundTransparency = 0
                if btnCallback then task.spawn(function() pcall(btnCallback, btnText) end) end
                closeDialog()
            end)
        end
    end

    local overlayConn = bgOverlay.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if isClosed then return end
            local mousePos = Vector2.new(input.Position.X, input.Position.Y)
            local framePos = mainFrame.AbsolutePosition
            local frameSize = mainFrame.AbsoluteSize
            local outside = mousePos.X < framePos.X or mousePos.X > framePos.X + frameSize.X
                or mousePos.Y < framePos.Y or mousePos.Y > framePos.Y + frameSize.Y
            if outside then
                isClosed = true
                selectedResponse = nil
                closeDialog()
            end
        end
    end)
    table.insert(connections, overlayConn)

    TweenService:Create(bgOverlay, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.5}):Play()
    mainFrame.BackgroundTransparency = 1
    TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()

    task.spawn(setupButtons)

    local themeUpdateFunc = function()
        if not mainFrame or not mainFrame.Parent then
            for i, func in ipairs(ThemeUpdateConnections) do
                if func == themeUpdateFunc then table.remove(ThemeUpdateConnections, i); break end
            end
            return
        end
        pcall(function()
            mainFrame.BackgroundColor3 = currentTheme.Main
            titleLabel.TextColor3 = currentTheme.Text
            contentLabel.TextColor3 = currentTheme.TextMuted
            if gradient and gradient.Parent then
                gradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, currentTheme.Accent),
                    ColorSequenceKeypoint.new(0.5, currentTheme.AccentGradient),
                    ColorSequenceKeypoint.new(1, currentTheme.Accent)
                })
            end
            if not isClosed then
                for _, btn in ipairs(createdButtons) do
                    if btn and btn.Parent then
                        btn.BackgroundColor3 = currentTheme.Accent
                    end
                end
            end
        end)
    end
    table.insert(ThemeUpdateConnections, themeUpdateFunc)

    local forceClose = function()
        if isClosed then return end
        isClosed = true
        selectedResponse = nil
        closeDialog()
    end

    return {
        Close = forceClose,
        GetResponse = function() return selectedResponse end,
        WaitForResponse = function()
            while not isClosed do task.wait() end
            return selectedResponse
        end
    }
end

local ABC6151 = 0
function DiscordLib:SetFont(e)
    local currentTime = tick()
    if currentTime - ABC6151 < 0.3 then return end
    ABC6151 = currentTime
  local t
  if type(e)=="string"then
    t=Enum.Font[e]
  elseif typeof(e)=="EnumItem"then
    t=e
  end
  if not t then return end
  currentFont=t
  local n=Discord:FindFirstChild(ENC.MainFrame)
  if not n then return end
  local function o(r)
    for _,i in ipairs(r:GetDescendants())do
      if i:IsA("TextLabel")or i:IsA("TextButton")or i:IsA("TextBox")then
        i.Font=currentFont
      end
    end
  end
  o(n)
  local s=getgenv().MinimizeButton
  if s and s.Parent then
    s.Font=currentFont
    o(s.Parent)
  end
end

local ABC2661 = 0
function DiscordLib:SetAdvancedTheme(themeConfig)
    local currentTime = tick()
    if currentTime - ABC2661 < 0.3 then
        return
    end
    ABC2661 = currentTime

    if type(themeConfig) ~= "table" then
        return
    end

    if themeConfig.Font then
        local fontEnum

        if type(themeConfig.Font) == "string" then
            fontEnum = Enum.Font[themeConfig.Font]
        elseif typeof(themeConfig.Font) == "EnumItem" then
            fontEnum = themeConfig.Font
        end

        if fontEnum then
            currentFont = fontEnum

            local mainFrame = Discord:FindFirstChild(ENC.MainFrame)
            if mainFrame then
                for _, child in ipairs(mainFrame:GetDescendants()) do
                    if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                        child.Font = currentFont
                    end
                end
            end

            local minimizeBtn = getgenv().MinimizeButton
            if minimizeBtn and minimizeBtn.Parent then
                minimizeBtn.Font = currentFont

                for _, child in ipairs(minimizeBtn.Parent:GetDescendants()) do
                    if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                        child.Font = currentFont
                    end
                end
            end
        end
    end

    if themeConfig.ThemeName and type(themeConfig.ThemeName) == "string" and Themes[themeConfig.ThemeName] then
        currentThemeName = themeConfig.ThemeName

        currentTheme = {}
        for key, value in pairs(Themes[themeConfig.ThemeName]) do
            currentTheme[key] = value
        end
    elseif themeConfig.themeName and type(themeConfig.themeName) == "string" and Themes[themeConfig.themeName] then
        currentThemeName = themeConfig.themeName

        currentTheme = {}
        for key, value in pairs(Themes[themeConfig.themeName]) do
            currentTheme[key] = value
        end
    elseif themeConfig.Theme and type(themeConfig.Theme) == "string" and Themes[themeConfig.Theme] then
        currentThemeName = themeConfig.Theme

        currentTheme = {}
        for key, value in pairs(Themes[themeConfig.Theme]) do
            currentTheme[key] = value
        end
    elseif themeConfig.theme and type(themeConfig.theme) == "string" and Themes[themeConfig.theme] then
        currentThemeName = themeConfig.theme

        currentTheme = {}
        for key, value in pairs(Themes[themeConfig.theme]) do
            currentTheme[key] = value
        end
    elseif not currentTheme then
        currentThemeName = "Dark"
        currentTheme = {}

        for key, value in pairs(Themes.Dark) do
            currentTheme[key] = value
        end
    end

    local tKeys = {
        "Main",
        "Secondary",
        "Tertiary",
        "Accent",
        "AccentGradient",
        "Text",
        "TextMuted",
        "Userpad",
        "UserIcon",
        "Hover",
        "Border",
        "Shadow",
        "ServerBorder",
        "NotificationBg",
        "NotificationBorder"
    }

    for _, key in ipairs(tKeys) do
        if themeConfig[key] and typeof(themeConfig[key]) == "Color3" then
            currentTheme[key] = themeConfig[key]
            currentThemeName = nil
        end
    end

    if themeConfig.Transparency then
        currentTransparency = themeConfig.Transparency
    end

    if themeConfig.WindowSize then
        if type(themeConfig.WindowSize) == "table" then
            local wx = themeConfig.WindowSize.X or themeConfig.WindowSize.x or 1
            local wy = themeConfig.WindowSize.Y or themeConfig.WindowSize.y or wx
            DiscordLib:SetWindowSize(wx, wy)
        else
            DiscordLib:SetWindowSize(themeConfig.WindowSize)
        end
    end

    for _, updateFunc in ipairs(ThemeUpdateConnections) do
        pcall(updateFunc)
    end

    if currentTheme.Accent and currentTheme.AccentGradient then
        local mainFrame = Discord:FindFirstChild(ENC.MainFrame)
        if mainFrame then
            for _, obj in ipairs(mainFrame:GetDescendants()) do
                if obj:IsA("UIGradient")
                    and obj.Parent
                    and obj.Parent.Name:find("SelectionBg") then
                    obj.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, currentTheme.Accent),
                        ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)
                    })
                end
            end
        end
    end
    if currentTheme.ServerBorder then
        local mainFrame = Discord:FindFirstChild(ENC.MainFrame)
        if mainFrame then
            for _, obj in ipairs(mainFrame:GetDescendants()) do
                if obj:IsA("UIStroke") and obj.Name == ENC.ServerIconBorder then
                    obj.Color = currentTheme.ServerBorder
                end
            end
        end
    end
end

function DiscordLib:SetMinimizeKey(e)
  if type(e)=="string"then e=Enum.KeyCode[e]end
  if not e or typeof(e)~="EnumItem"then return end
  if getgenv().ABC6261 then getgenv().ABC6261:Disconnect()end
  getgenv().ABC6261=UserInputService.InputBegan:Connect(function(t)
    if t.KeyCode==e and not t.GameProcessedEvent then
      if not getgenv().ABC3616 and not getgenv().ABC8281 then
        if getgenv().MinimizeButton and getgenv().MinimizeButton.Parent then
          local n=getgenv().MinimizeButton
          if getgenv().Abc4717 then
            local o=currentWindowSize or 1
            local i=math.floor(100*o)
            local s=math.floor(35*o)
            local r=not getgenv().IsMinimized
            local a=r and currentTheme.Text or currentTheme.Main
            local l=r and currentTheme.Main or currentTheme.Text
            TweenService:Create(n,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3=a}):Play()
            n.Text=r and"Hide"or"Show";n.TextColor3=l
            local c=1.05
            TweenService:Create(n,TweenInfo.new(0.15),{Size=UDim2.new(0,math.floor(i*c),0,math.floor(s*c))}):Play()
            task.wait(0.15)
            TweenService:Create(n,TweenInfo.new(0.15),{Size=UDim2.new(0,i,0,s)}):Play()
            if Discord then
              task.spawn(function()getgenv().Abc4717=false;task.wait(2);getgenv().Abc4717=true end)
              DiscordLib:MinimizeUI()
            end
          end
        else DiscordLib:MinimizeUI()end
      end
    end
  end)
  return getgenv().ABC6261
end
function DiscordLib:GetMinimizeKey()return getgenv().ABC6261 end
function DiscordLib:DisableMinimizeKey()
  if getgenv().ABC6261 then getgenv().ABC6261:Disconnect();getgenv().ABC6261=nil end
end

local function isMobile()
  return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled
end

if isMobile() then
  createMinimizeButton()
else
  DiscordLib:SetMinimizeKey(Enum.KeyCode.RightShift)
end

function DiscordLib:ExportSettings()
    local themeSnapshot = {}
    local themeKeys = {
        "Main",
        "Secondary",
        "Tertiary",
        "Accent",
        "AccentGradient",
        "Text",
        "TextMuted",
        "Userpad",
        "UserIcon",
        "Hover",
        "Border",
        "Shadow",
        "ServerBorder",
        "NotificationBg",
        "NotificationBorder"
    }

    for _, key in ipairs(themeKeys) do
        if currentTheme[key] and typeof(currentTheme[key]) == "Color3" then
            themeSnapshot[key] = currentTheme[key]
        end
    end

    local fontName = currentFont
    if typeof(currentFont) == "EnumItem" then
        fontName = currentFont.Name
    end

    return {
        windowSize = currentWindowSize,
        windowSizeX = currentWindowScaleX,
        windowSizeY = currentWindowScaleY,
        font = fontName,
        theme = themeSnapshot,
        themeName = type(currentThemeName) == "string" and currentThemeName or nil
    }
end

return DiscordLib