local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Fight a Brainrot Cheat V0.1",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading Fight a Brainrot Cheat...",
   LoadingSubtitle = ";)",
   ShowText = "Fight a Brainrot", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "FAB"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Auto Money")
local is_auto_money = false
local Button = Tab:CreateButton({
   Name = "Enable Auto Money",
   Callback = function()
   -- The function that takes place when the button is pressed
   is_auto_money = true
   Rayfield:Notify({
      Title = "Info",
      Content = "Auto Money Enabled",
      Duration = 6.5,
      Image = "info",
   })
   while is_auto_money == true do 
         game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):WaitForChild("Server"):WaitForChild("StartFightRequestClientToServer"):InvokeServer()
         wait(0.1)
         game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):WaitForChild("Server"):WaitForChild("AbilityFireRequest"):InvokeServer()
         wait(0.1)
         game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):WaitForChild("Server"):WaitForChild("EndFightRequestClientToServer"):InvokeServer()
   end
   end,
})
local Button = Tab:CreateButton({
   Name = "Disable Auto Money",
   Callback = function()
   -- The function that takes place when the button is pressed
   Rayfield:Notify({
      Title = "Info",
      Content = "Auto Money Disable",
      Duration = 6.5,
      Image = "info",
   })
   is_auto_money = false
   game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):WaitForChild("Server"):WaitForChild("EndFightRequestClientToServer"):InvokeServer()
   end,
})
-- 

local Section = Tab:CreateSection("Auto Win (bad, can't bypass stamina), WIP")
local is_auto_win = false
local Button = Tab:CreateButton({
   Name = "Enable Auto Win (WIP)",
   Callback = function()
      -- The function that takes place when the button is pressed
      is_auto_win = true
      Rayfield:Notify({
         Title = "Info",
         Content = "Auto Win Enabled, WIP",
         Duration = 6.5,
         Image = "info",
      })
      while is_auto_win do
         game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):WaitForChild("Server"):WaitForChild("StartFightRequestClientToServer"):InvokeServer()
         wait(0.1)
         game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):WaitForChild("Server"):WaitForChild("AbilityFireRequest"):InvokeServer()
      end
   end,
})

local Button = Tab:CreateButton({
   Name = "Disable Auto Win",
   Callback = function()
   -- The function that takes place when the button is pressed
   Rayfield:Notify({
      Title = "Info",
      Content = "Auto Win Disable",
      Duration = 6.5,
      Image = "info",
   })
   is_auto_win = false
   game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):WaitForChild("Server"):WaitForChild("EndFightRequestClientToServer"):InvokeServer()
   end,
})

local Section = Tab:CreateSection("Auto Pet")
local is_auto_pet = false
local Button = Tab:CreateButton({
   Name = "Enable Auto Pet",
   Callback = function()
      -- The function that takes place when the button is pressed
      is_auto_pet = true
      Rayfield:Notify({
         Title = "Info",
         Content = "Auto Pet Enabled",
         Duration = 6.5,
         Image = "info",
      })
      while is_auto_pet do
        local args = {
	        1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):WaitForChild("Server"):WaitForChild("Pet"):WaitForChild("GetPet"):InvokeServer(unpack(args))
        wait(1)
      end
   end,
})

local Button = Tab:CreateButton({
   Name = "Disable Auto Pet",
   Callback = function()
   -- The function that takes place when the button is pressed
   Rayfield:Notify({
      Title = "Info",
      Content = "Auto Pet Disable",
      Duration = 6.5,
      Image = "info",
   })
   is_auto_pet = false
   end,
})

-- START: game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):WaitForChild("Server"):WaitForChild("StartFightRequestClientToServer"):InvokeServer()
-- ABILITY: game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):WaitForChild("Server"):WaitForChild("AbilityFireRequest"):InvokeServer()
-- END: game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):WaitForChild("Server"):WaitForChild("EndFightRequestClientToServer"):InvokeServer()
-- loadstring(game:HttpGet('https://raw.githubusercontent.com/KeyeFauV2/fight_a_brainrot_cheat/refs/heads/main/script.lua'))()
