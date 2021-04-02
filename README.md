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
