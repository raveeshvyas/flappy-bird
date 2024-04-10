StateMachine = Class{}

function StateMachine:init(states, initialState)
    self.states = states
    self.currState = self.states[initialState]()
end

function StateMachine:change(newState, params)
    self.currState = self.states[newState](params)
end

function StateMachine:update(dt)
    self.currState:update(dt)
end

function StateMachine:render()
    self.currState:render()
end
