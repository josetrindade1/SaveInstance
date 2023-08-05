print("----- EXECUTED ------")
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local config = {
    ChangeSus = false,
    MaxSuspensionSize = 50,
    MinSuspensionSize = 0,
    MaxAccelerateForce = 0,
    MaxBrakeForce = 0,
    MaxSpeed = 0,
    ParkingBrakeForce = 0,
    ReverseMaxSpeed = 0,
    MAF = false,
    MBF = false,
    MS = false,
    PBF = false,
    RMS = false,
    InfFuel = false,
    God = false,
    AllOn = false
}
local Window  = Library.CreateLib("Emergency Hamburg V1.2", "Synapse")
local Tab = Window:NewTab("Car Configuration")
local Section = Tab:NewSection("Server Configuration")
Section:NewSlider("Max Speed", "The Maximum Speed Your Car Have", 10000, 0, function(s)
    config.MaxSpeed = s
end)
Section:NewToggle("Toggle Max Speed", "Toggle The Max Speed Of Your Car", function(state)
    config.MS = state
end)
Section:NewSlider("Parking Brake Force", "The Parking Brake Force Your Car Have", 10000, 0, function(s)
    config.ParkingBrakeForce = s
end)
Section:NewToggle("Toggle Parking Brake Force", "Toggle The Parking Brake Force Of Your Car", function(state)
    config.PBF = state
end)
Section:NewSlider("Reverse Speed", "The Maximun Reverse Speed Your Car Have", 10000, 0, function(s)
    config.ReverseMaxSpeed = s
end)
Section:NewToggle("Toggle Max Reverse Speed", "Toggle The Max Reverse Speed Of Your Car", function(state)
    config.RMS = state
end)
Section:NewSlider("Accelerate Force", "The Maximun Acelerate Force Your Car Have", 10000, 0, function(s)
    config.MaxAccelerateForce = s
end)
Section:NewToggle("Toggle Accelerate Force", "Toggle The Accelerate Force Of Your Car", function(state)
    config.MAF = state
end)
Section:NewSlider("Brake Force", "The Maximun Brake Force Your Car Have", 10000, 0, function(s)
    config.MaxBrakeForce = s
end)
Section:NewToggle("Toggle Brake Force", "Toggle The Brake Force Of Your Car", function(state)
    cofig.MBF = state
end)
Section:NewSlider("Max Suspension Size", "The Maximun Size That Your Suspension Can Go", 50, 0, function(s)
    config.MaxSuspensionSize = s
end)
Section:NewSlider("Min Suspension Size", "The Minimum Size That Your Suspension Can Go", 50, 0, function(s)
    config.MinSuspensionSize = s
end)
Section:NewToggle("Toggle Suspension Size", "Toggle If You Want To Change Your Suspension Size", function(state)
    config.ChangeSus = state
end)
Section:NewToggle("Toggle Infinite Fuel", "Toggle If You Want Infinite Fuel", function(state)
    config.InfFuel = state
end)
Section:NewToggle("Toggle God Mode", "Toggle God Mode In Your Car", function(state)
    config.God = state
end)
Section:NewToggle("Toggle Allways On", "Toggle If You Want For Your Car To Never Be Off", function(state)
    config.AllOn = state
end)
Section:NewButton("Fix Tire", "Fix Every Poped Tire", function()
    local vehicles = game.Workspace.Vehicles
    local car = vehicles:FindFirstChild(game.Players.LocalPlayer.Name)
    local Wheel = {"FL","FR","RL","RR"}
    for i = 1 , 4 do 
        local wheels = car.Wheels
        local wheel = wheels:FindFirstChild(Wheel[i])
        wheel.Size = Vector3.new(2.6,2.6,2.6)
        wheel.CustomPhysicalProperties = PhysicalProperties.new(0.1,0.7,0,1,1)
        if wheel ~= nil then
            for i , v in pairs(wheel.Parts:GetChildren()) do
                v.Transparency = 0
            end
        end
    end
end)
local Section2 = Tab:NewSection("Client Only Configuration")
Section2:NewColorPicker("Color Of Your Car (Client Only!)", "Change The Color Of Your Car In Your Client", Color3.fromRGB(255,255,255), function(color)
    local vehicles = game.Workspace.Vehicles
    local car = vehicles:FindFirstChild(game.Players.LocalPlayer.Name)
    car.Body.Body.Color = color
end)
Section2:NewColorPicker("Color Of Your Car Wheel Inside (Client Only!)", "Change The Color Of Your Car Wheel Inside In Your Client", Color3.fromRGB(255,255,255), function(color)
    local vehicles = game.Workspace.Vehicles
    local car = vehicles:FindFirstChild(game.Players.LocalPlayer.Name)
    local Wheel = {"FL","FR","RL","RR"}
    for i = 1 , 4 do 
        local wheels = car.Wheels
        local wheel = wheels:FindFirstChild(Wheel[i])
        if wheel ~= nil then
            wheel.Parts["Meshes/TestingCC_Circle.002"].Color = color
        end
    end
end)
Section2:NewColorPicker("Color Of Your Car Wheel Outside (Client Only!)", "Change The Color Of Your Car Wheel Outside In Your Client", Color3.fromRGB(255,255,255), function(color)
    local vehicles = game.Workspace.Vehicles
    local car = vehicles:FindFirstChild(game.Players.LocalPlayer.Name)
    local Wheel = {"FL","FR","RL","RR"}
    for i = 1 , 4 do 
        local wheels = car.Wheels
        local wheel = wheels:FindFirstChild(Wheel[i])
        if wheel ~= nil then
            wheel.Parts["Meshes/TestingCC_Circle.004"].Color = color
        end
    end
end)
local Tab = Window:NewTab("Robberies")
local Section = Tab:NewSection("Is it posible to steal?")
local bank = Section:NewLabel("Bank: true")
local jeweler = Section:NewLabel("Jeweler: true")
local Containergreen = Section:NewLabel("Green Container: true")
local Containeryellow = Section:NewLabel("Yellow Container: true")

local Tab = Window:NewTab("Others")
local Section = Tab:NewSection("Others")
Section:NewKeybind("Toggle UI", "Toggle UI", Enum.KeyCode.Delete, function()
	Library:ToggleUI()
end)
game:GetService('RunService').Heartbeat:connect(function()
    local roubberies = workspace.Robberies
    local bankR = roubberies:FindFirstChild("BankRobbery")
    local jewelerR = roubberies:FindFirstChild("JewelerRobbery")
    local container = roubberies:FindFirstChild("ContainerRobberies")
    if container ~= nil then
        local green = nil
        local yellow = nil
        
        for i , v in pairs(container:GetChildren()) do
            if v:FindFirstChild("Base") ~= nil then
                if v.Base.Color == Color3.fromRGB(182,138,42) then
                    yellow = v
                else
                    green = v
                end
            end
        end
        if green ~= nil and yellow ~= nil then
            local barri1 = green:FindFirstChild("Barricade")
            local barri2 = yellow:FindFirstChild("Barricade")
            if barri1 ~= nil and barri2 ~= nil then
                local value1 = false
                local value2 = false
                if barri1.WoodPlanks.Transparency == 1 then
                    value1 = true
                end
                if barri2.WoodPlanks.Transparency == 1 then
                    value2 = true
                end
                Containergreen:UpdateLabel("Green Container: "..tostring(value1))
                Containeryellow:UpdateLabel("Yellow Container: "..tostring(value2))
            end
        end
    end
    spawn(function()
        task.wait(1)
        if jewelerR ~= nil then
            local value = false
            for i , v in pairs(jewelerR.Robbables:GetDescendants()) do
                if v.Name == "Jewelry" and v.Transparency == 0 then
                    value = true
                    break;
                end
                task.wait(0.001)
            end
            jeweler:UpdateLabel("jeweler: "..tostring(value))
        end
    end)
    if bankR ~= nil then
        local light = bankR:FindFirstChild("LightGreen")
        if light ~= nil then
            local value = light.Light.Enabled
            bank:UpdateLabel("Bank: "..tostring(value))
        end
    end
    local vehicles = game.Workspace.Vehicles
    local car = vehicles:FindFirstChild(game.Players.LocalPlayer.Name)
    local suspension = {"SpringFL","SpringFR","SpringRL","SpringRR"}
    local Wheel = {"FL","FR","RL","RR"}
    if car ~= nil then
        if config.MS then
            car:SetAttribute("MaxSpeed", config.MaxSpeed)
        end
        if config.PBF then
            car:SetAttribute("ParkingBrakeForce", config.ParkingBrakeForce)
        end
        if config.RMS then
            car:SetAttribute("ReverseMaxSpeed", config.ReverseMaxSpeed)
        end
        if config.MAF then
            car:SetAttribute("MaxAccelerateForce", config.MaxAccelerateForce)
        end
        if config.MBF then
            car:SetAttribute("MaxBrakeForce", config.MaxBrakeForce)
        end
        if config.AllOn then
            car:SetAttribute("IsOn", true)
        end
        if config.God then
            car:SetAttribute("CurrentHealth", 1)
        end
        if config.InfFuel then
            car:SetAttribute("CurrentFuel", 100)
        end
        if config.ChangeSus then
            for i = 1 , 4 do
                local DriveSeat = car:FindFirstChild("DriveSeat")
                if DriveSeat ~= nil then
                    local sus = DriveSeat:FindFirstChild(suspension[i])
                    if sus ~= nil then
                        sus.LimitsEnabled = true
                        sus.MaxLength = tonumber(config.MaxSuspensionSize) / 5
                        sus.MinLength = tonumber(config.MinSuspensionSize) / 5
                        car.Body.Body.CanCollide = false
                    end
                end
            end
        else
            for i = 1 , 4 do
                local DriveSeat = car:FindFirstChild("DriveSeat")
                if DriveSeat ~= nil then
                    local sus = DriveSeat:FindFirstChild(suspension[i])
                    if sus ~= nil then
                        sus.LimitsEnabled = false
                        sus.MaxLength = 5
                        sus.MinLength = 0
                        car.Body.Body.CanCollide = true
                    end
                end
            end
        end
        for i = 1 , 4 do 
            local wheels = car.Wheels
            local wheel = wheels:FindFirstChild(Wheel[i])
            if wheel ~= nil then
                for i,v in pairs(wheel.Parts:GetChildren()) do
                    v.DoubleSided = true
                end
            end
        end
    end
end)
