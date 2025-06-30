local isDoingProgress = false

function Progbar(data, cb)
    if isDoingProgress then return end
    isDoingProgress = true

    local duration = data.duration or 5000
    local label = data.label or "Processing..."
    local canCancel = data.canCancel or false
    local useWhileDead = data.useWhileDead or false
    local controlDisables = data.controlDisables or {}

    if controlDisables.disableMovement then
        FreezeEntityPosition(PlayerPedId(), true)
    end

    if controlDisables.disableCombat then
        DisablePlayerFiring(PlayerId(), true)
    end

    SendNUIMessage({
        action = "start",
        label = label,
        time = duration
    })

    SetNuiFocus(false, false)

    CreateThread(function()
        local endTime = GetGameTimer() + duration
        while GetGameTimer() < endTime do
            Wait(0)

            if controlDisables.disableMovement then
                DisableControlAction(0, 21, true) -- sprint
                DisableControlAction(0, 22, true) -- jump
                DisableControlAction(0, 30, true) -- move left/right
                DisableControlAction(0, 31, true) -- move forward/back
            end

            if controlDisables.disableCarMovement then
                DisableControlAction(0, 59, true) -- steering
                DisableControlAction(0, 71, true) -- accelerate
                DisableControlAction(0, 72, true) -- brake
            end

            if controlDisables.disableCombat then
                DisableControlAction(0, 24, true) -- attack
                DisableControlAction(0, 25, true) -- aim
            end
        end

        if controlDisables.disableMovement then
            FreezeEntityPosition(PlayerPedId(), false)
        end

        SendNUIMessage({ action = "stop" })
        isDoingProgress = false
        if cb then cb() end
    end)
end

-- Export style
exports('Progbar', function(data, cb)
    Progbar(data, cb)
end)
