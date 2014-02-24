performancemeter
================

Performance Meter for Corona SDK development

THIS IS WORK AND CODE CREATED BY LERG FOR CORONA SDK/ LUA USE. I DID NOT ADD ANYTHING TO THIS BUT TO UPDATE THE MODULE FOR GFX2. ALL CREDIT GOES TO LERG FOR CREATING THE ORIGINAL CODE.

To use, input the following in your main.lua file:

------------------------------
local performance = require('performance')
performance:newPerformanceMeter()
------------------------------

That's all! Now you will have the meter at the top of your screen on every scene. 


Readings are in order - FPS, Texture Memory in MB, Lua Memory in kB

Tapping on the meter will hide it from view, which I find a bit more convenient than actual garbage collection, as garbage collection in Corona is supposed to be much more efficient.
