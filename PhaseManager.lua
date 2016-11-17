local logger = require("logger")
local TAG = "PhaseManager"
local Manager = {}

Manager.new = function()
    local manager = {}
    manager.phases = {}
    manager.currentPhaseName = ""
    manager.started = false
    function manager:registerPhase(key, action, isFinish, onComplete)
        --print(key, action, isFinish, onComplete)
        self.phases[key] = {
            key = key,
            action = action,
            isFinish = isFinish,
            onComplete = onComplete
        }
    end

    function manager:setCurrentPhase(key)
        self.currentPhaseName = key
    end

    function manager:removePhase(key)
        self.phases[key] = nil
    end

    function manager:getCurrentPhase()
        return self.phases[self.currentPhaseName]
    end   

    function manager:check()
        if not self.started then
            logger:error(TAG, "You must to start the phase manager before you check")
            return
        end
        local currentPhase = self:getCurrentPhase()

        if currentPhase.isFinish() then
            if currentPhase.onComplete then
                local nextPhase = currentPhase.onComplete()
                if nextPhase then
                    self:setCurrentPhase(nextPhase)
                    self:start()
                end
            end
        end

        return currentPhase
    end

    function manager:callAction(phase)
        local action = phase.action
        if type(action) == "table" then
            action[phase.key](action)
        elseif type(action) == "function" then
            action()
        else
            logger:error(TAG, "action must be function or table")
        end
    end

    function manager:start()
        manager.started = true
        --logger:error(TAG, "start phase %s", self.currentPhaseName)
        local currentPhase = self:getCurrentPhase()
        --print("action: ", currentPhase.action)
        if currentPhase.action then
            self:callAction(currentPhase)
        else
            logger:warn(TAG, "The phase miss action")
        end
    end

    return manager
end

return Manager