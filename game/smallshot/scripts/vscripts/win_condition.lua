-- Compares a specific team's kill count to the set win condition
function CheckWin(team, killCount)
	-- Hold the value for how many players are in the game.
	local players = PlayerResource:GetPlayerCount()
	-- If there are more than 4 players.
	if players > 4 then
		-- Then the win condition for the game is set at 30.
		WIN_CONDITION_KILLCOUNT = 30
	-- If there are 4 or less players in the game.
	else
		-- Then the win condition is set at 25.
		WIN_CONDITION_KILLCOUNT = 25
	end
	-- Comapres the team's kill count to the set win condition.
  	if killCount >= WIN_CONDITION_KILLCOUNT then
  		-- If the killing team has surpassed the kill condition, set them as winners.
    	GameRules:SetGameWinner(team)
  	end
end
