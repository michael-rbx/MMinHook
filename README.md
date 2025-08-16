# MMinHook
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Lightweight Minimalistic Metamethod Hooking Library for Roblox

## Features
- supports [__index](https://www.lua.org/pil/13.4.1.html) metamethod hooking
- supports [__namecall](https://chat.openai.com/?prompt=what%20does%20__namecall%20mean) metamethod hooking
- Requires minimal code to use
- Hooks can easily be destroyed, enabled/disabled individually or in bulk
- Easily check if hooks are active

## Executor Requirement
- [getrawmetatable](https://duckys-playground.gitbook.io/wave/functions/table#get-raw-metatable)
- [setreadonly](https://duckys-playground.gitbook.io/wave/functions/table#set-read-only)
- [newcclosure](https://duckys-playground.gitbook.io/wave/functions/hooking#new-c-closure)
- [getnamecallmethod](https://duckys-playground.gitbook.io/wave/functions/miscellaneous#get-namecall-method)

## Example scripts
- [example one](examples/example1.lua) for [Aimbot-Arena](https://www.roblox.com/games/92205345102577/Aimbot-Arena)
