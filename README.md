# MMinHook
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Lightweight Minimalistic Metamethod Hooking Library for Roblox

###### Docs included in the [library](MMinHook.lua)

## Features
- supports [__index](https://www.lua.org/pil/13.4.1.html) hooking
- supports [__namecall](https://chat.openai.com/?prompt=what%20does%20__namecall%20mean) hooking
- Requires minimal code to use
- Easily check if hooks are active
- Hooks can easily be destroyed, enabled/disabled individually or in bulk

## Executor Requirements
- [getrawmetatable](https://duckys-playground.gitbook.io/wave/functions/table#get-raw-metatable)
- [setreadonly](https://duckys-playground.gitbook.io/wave/functions/table#set-read-only)
- [newcclosure](https://duckys-playground.gitbook.io/wave/functions/hooking#new-c-closure)
- [getnamecallmethod](https://duckys-playground.gitbook.io/wave/functions/miscellaneous#get-namecall-method)

## Getting Started
```lua
local mmin_hook = loadstring(game:HttpGet("https://raw.githubusercontent.com/michael-rbx/MMinHook/refs/heads/main/MMinHook.lua"))()
mmin_hook:init()
```

## Example Scripts
- [example one](examples/example1.lua) for [Aimbot-Arena](https://www.roblox.com/games/92205345102577/Aimbot-Arena)
  - rapid fire
  - no recoil
  - no spread
