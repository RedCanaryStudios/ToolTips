# ToolTips

Usage:

```lua
local ToolTips = require(script.ToolTips)

local prototype = ToolTips.NewPrototype()
prototype.Title = "TOOLTIP"
prototype.Description = [[
  Test
  Test
]]

local TT = ToolTips.CreateToolTip(prototype)

ToolTips.SetToolTip(TT)
ToolTips.SetVisible(true)
```

![example](https://cdn.discordapp.com/attachments/798800023613210646/827019493678907442/G9whCdknaO.gif)  

API:

Module.NewPrototype(tbl \[optional]) `Creates a new prototype. Returns a prototype object.`  

Module.CreateToolTip(prototypeObj) `Creates a ToolTip object. Returns the ToolTip object.`  

Module.SetToolTip(ToolTipObj) `Sets tooltip to given tooltip.`  

Module.SetVisible(bool) `Sets visibility of the ToolTip.`


prototypeObj.Title `Title of ToolTip`  

prototypeObj.Description `Description of ToolTip`  

prototypeObj:CreateToolTip() `Equivalent to Module.CreateToolTip(prototypeObj)`  


ToolTipObj:Set() `Equivalent to Module.SetToolTip(ToolTipObj)` 
