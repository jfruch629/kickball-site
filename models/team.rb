require_relative "./team_data"

class Team
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def players(team_name)
    players = []
    TeamData::ROLL_CALL[:"#{team_name}"].each do |position, player|
      players << player
    end
    players
  end
end
