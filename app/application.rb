class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    # Get all teams
    if req.path == '/teams' && req.get?
      teams = Team.all
      return [
        200, 
        { 'Content-Type' => 'application/json' }, 
        [ teams.to_json ]
      ]
    end


    # Get players from a specific team, given the team id
    if req.path.match('/players/') && req.get?
      teamId = req.path.split('/')[2]
      begin
        teamPlayers = Player.where("team_id=#{teamId}")
        return [200, {'Content-Type' => 'application/json'}, [teamPlayers.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Players from selected team not found"}.to_json]]
      end
    end


    # Create a new player
    if req.path == ('/players') && req.post?
      begin
        body = JSON.parse(req.body.read)
        player = Player.create(body)
        return [201, {'Content-Type' => 'application/json'}, [player.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Could not create player"}.to_json]]
      end
    end


    # Delete a player
    if req.path.match('/players/') && req.delete?
      playerId = req.path.split('/')[2]
      begin
        player = Player.find(playerId)
        player.destroy
        return [200, {'Content-Type' => 'application/json'}, [{message: "Player Destroyed"}.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Player not found"}.to_json]]
      end
    end



    res.finish
  end

end
