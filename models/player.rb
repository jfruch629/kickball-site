require_relative "./team_data"

class Player
  attr_reader :name, :position, :team_name

  def initialize(name, position, team_name)
    @name = name
    @position = position
    @team_name = team_name
  end

  def self.all
    data = TeamData::ROLL_CALL
    all_players = []
    data.each do |team, roster|
      roster.each do |position, player|
        all_players << Player.new(player, position.to_s, team.to_s)
      end
    end
    all_players
  end
end
