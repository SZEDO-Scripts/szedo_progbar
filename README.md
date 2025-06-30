# szedo_progbar 🚀

A simple, modern progress bar script for FiveM clients, featuring configurable duration, label, and control disabling during progress. This script uses NUI for smooth progress bar display and allows easy integration via exports or events.

---

## Features ✨

- Displays a clean progress bar using NUI ⏳
- Configurable duration and label text 🕒📝
- Optionally disables player controls (movement, combat, vehicle control) during progress 🚫🎮
- Supports callback function after progress completes ✅
- Can be triggered via exports 🔄

---

## Installation 🛠️

1. Place the `szedo_progbar` folder inside your server's `resources` directory. 📁
2. Add the following line to your `server.cfg` or equivalent startup file:  
3. Make sure the NUI files (HTML, CSS, JS) are included inside the resource and properly configured. 🖥️

---

## Usage 🎮

### Triggering via Export 📢

```lua
exports['szedo_progbar']:Progbar({
    duration = 3000,
    label = "Working...",
    controlDisables = {
        disableMovement = true,
        disableCombat = true,
    }
})
