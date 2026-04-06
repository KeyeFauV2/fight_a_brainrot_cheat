local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local leaderstats = LocalPlayer:WaitForChild("leaderstats")
local saphireValue = leaderstats:WaitForChild("Saphire")

local ServerRemote = ReplicatedStorage:WaitForChild("RemoteFunction"):WaitForChild("Server")
local StartFightRemote = ServerRemote:WaitForChild("StartFightRequestClientToServer")
local AbilityRemote = ServerRemote:WaitForChild("AbilityFireRequest")
local EndFightRemote = ServerRemote:WaitForChild("EndFightRequestClientToServer")
local GetPetRemote = ServerRemote:WaitForChild("Pet"):WaitForChild("GetPet")
local BuyWandRemote = ServerRemote:WaitForChild("BuyNewBaguette")

local Window = Rayfield:CreateWindow({
    Name = "Fight a Brainrot Cheat ",
    Icon = 0,
    LoadingTitle = "Loading Fight a Brainrot Cheat...",
    LoadingSubtitle = "V1.6 RELEASE",
    ShowText = "Fight a Brainrot",
    Theme = "DarkBlue",

    ToggleUIKeybind = "K",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "FAB"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },

    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

local Tab = Window:CreateTab("Main", 4483362458)
local VersionLabel = Tab:CreateLabel(
   "Version : V1.6 RELEASE",
    "info",
    Color3.fromRGB(255, 255, 255),
    false
)
local function notify(title, content)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = 6.5,
        Image = "info",
    })
end



local Label = Tab:CreateLabel(
    "Real Saphire Count : " .. tostring(saphireValue.Value),
    "coins",
    Color3.fromRGB(255, 255, 255),
    false
)

local function update_saphire()
    Label:Set("Real Saphire Count : " .. tostring(saphireValue.Value))
end

update_saphire()

saphireValue:GetPropertyChangedSignal("Value"):Connect(function()
    update_saphire()
end)


Tab:CreateSection("Auto Money")

local is_auto_money = false

Tab:CreateButton({
    Name = "Enable Auto Money",
    Callback = function()
        if is_auto_money then
            notify("Info", "Auto Money is already enabled")
            return
        end

        is_auto_money = true
        notify("Info", "Auto Money Enabled")

        task.spawn(function()
            while is_auto_money do
                StartFightRemote:InvokeServer()
                task.wait(0.1)

                AbilityRemote:InvokeServer()
                task.wait(0.1)

                EndFightRemote:InvokeServer()
                task.wait(0.15)
            end
        end)
    end,
})

Tab:CreateButton({
    Name = "Disable Auto Money",
    Callback = function()
        is_auto_money = false
        EndFightRemote:InvokeServer()
        notify("Info", "Auto Money Disabled")
    end,
})



Tab:CreateSection("Auto Win (bad, can't bypass stamina), WIP")

local is_auto_win = false

Tab:CreateButton({
    Name = "Enable Auto Win (WIP)",
    Callback = function()
        if is_auto_win then
            notify("Info", "Auto Win is already enabled")
            return
        end

        is_auto_win = true
        notify("Info", "Auto Win Enabled, WIP")

        task.spawn(function()
            while is_auto_win do
                StartFightRemote:InvokeServer()
                task.wait(0.1)

                AbilityRemote:InvokeServer()
                task.wait(0.1)
            end
        end)
    end,
})

Tab:CreateButton({
    Name = "Disable Auto Win",
    Callback = function()
        is_auto_win = false
        EndFightRemote:InvokeServer()
        notify("Info", "Auto Win Disabled")
    end,
})



Tab:CreateSection("Auto Pet")

local is_auto_pet = false

Tab:CreateButton({
    Name = "Enable Auto Pet",
    Callback = function()
        if is_auto_pet then
            notify("Info", "Auto Pet is already enabled")
            return
        end

        is_auto_pet = true
        notify("Info", "Auto Pet Enabled")

        task.spawn(function()
            while is_auto_pet do
                GetPetRemote:InvokeServer(1)
                task.wait(0.5)
            end
        end)
    end,
})

Tab:CreateButton({
    Name = "Disable Auto Pet",
    Callback = function()
        is_auto_pet = false
        notify("Info", "Auto Pet Disabled")
    end,
})


Tab:CreateSection("Buy Wand")

local wand_arg = {""}

local wand_list = {
    "Tornado (140)",
    "Hammer Down ! (2.8K)",
    "Water (150K)",
    "Kamehameha (3.5M)",
    "Poison (6M)",
    "Shadow Disk (30M)",
    "Saint Water Spell (120M)",
    "Fire Circle (220M)",
    "Gilgamesh (400M)",
    "Water Knife (5B)",
    "Kayle Ult (8B)",
    "Dark Knife (15B)"
}

Tab:CreateDropdown({
    Name = "Buy Wand",
    Options = wand_list,
    CurrentOption = {"Tornado (140)"},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Options)
        local selected = Options

        if typeof(Options) == "table" then
            selected = Options[1]
        end

        local index = table.find(wand_list, selected)

        if index then
            wand_arg[1] = string.format("b_%02d", index)
            print("Selected wand:", selected, "| Arg:", wand_arg[1])
        else
            wand_arg[1] = ""
            warn("Wand not found")
        end
    end,
})

-- Valeur par défaut
wand_arg[1] = "b_01"

Tab:CreateButton({
    Name = "Buy Selected Wand",
    Callback = function()
        if wand_arg[1] == "" then
            notify("Error", "No wand selected")
            return
        end

        BuyWandRemote:InvokeServer(unpack(wand_arg))
        notify("Info", "Bought Wand: " .. tostring(wand_arg[1]))
    end,
})


-- START: StartFightRemote:InvokeServer()
-- ABILITY: AbilityRemote:InvokeServer()
-- END: EndFightRemote:InvokeServer()
-- loadstring(game:HttpGet('https://raw.githubusercontent.com/KeyeFauV2/fight_a_brainrot_cheat/refs/heads/main/script.lua'))()
