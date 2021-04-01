local ToolTips = {}

-- USER SETTINGS

--[[
    Instructions:
        Create a frame and name is "ToolTip". 
        The frame must be parented to this module.
        Design the frame to be whatever you want it to look like.
        Put 3 textboxes inside with the following names:
           
           Title;
           Description;
        
        Again, design these to what you want it to look like.
        
        ToolTips REQUIRES the RobloxObject dependency. 
]]


-- Script

local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local screen = workspace.CurrentCamera

local RBXObject = require(script.RobloxObject)
local newObject = RBXObject.newobject
local objType = RBXObject.objType

local TTUI = Instance.new("ScreenGui")
TTUI.IgnoreGuiInset = true
TTUI.Parent = game.Players.LocalPlayer.PlayerGui

local ToolTip = script.ToolTip

local currentConnection

ToolTips.NewPrototype = function(t)
    assert(t.Title and t.Description, "Provided ToolTip attributes are not sufficient (Title or Description is missing).")
    
    local description = {
        Title = t.Title;
        Description = t.Description;
        
        CreateToolTip = function(self)
            return ToolTips.CreateToolTip(self)
        end;
    }
    
    return newObject(description, nil, "ToolTipPrototype")
end

ToolTips.CreateToolTip = function(prototype)
    assert(objType(prototype) == "ToolTipPrototype", "The given object is not a prototype.")
    
    local TT = {
        prototype = prototype;
        
        SetVisible = function(self)
            ToolTips.SetToolTip(self)
        end;
    }
    
    return newObject(TT, nil, "ToolTip")
end

ToolTips.SetToolTip = function(TT)
    assert(objType(TT) == "ToolTip", "The given object is not a ToolTip.")
    
    ToolTip.Title.Text = TT.prototype.Title
    ToolTip.Description.Text = TT.prototype.Description
end

ToolTips.SetVisible = function(bool)
    ToolTip.Parent = (bool and TTUI or script)
    
    if bool then
        currentConnection = RS.RenderStepped:Connect(function()
            
            ToolTip.AnchorPoint = Vector2.new()
            
            if screen.ViewportSize.X - ToolTip.AbsoluteSize.X < ToolTip.AbsolutePosition.X - ToolTip.AbsoluteSize.X/3 then
                ToolTip.AnchorPoint += Vector2.new(ToolTip.AbsoluteSize.X, 0)
            end
            
            if screen.ViewportSize.Y - ToolTip.AbsoluteSize.Y < ToolTip.AbsolutePosition.Y - ToolTip.AbsoluteSize.Y/3 then
                ToolTip.AnchorPoint += Vector2.new(0, ToolTip.AbsoluteSize.Y)
            end
            
            ToolTip.Position = UDim2.fromOffset(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y)
        end)
        return
    elseif currentConnection then
        currentConnection:Disconnect()
    end
end


return ToolTips
