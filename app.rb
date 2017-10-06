require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  erb :index
end

get "/teams" do
  @teams = []

  TeamData::ROLL_CALL.each_key do |team_name|
    @teams << Team.new(team_name)
  end
  erb :teams
end

get "/teams/:team_name" do
  @team_name = params[:team_name]
  @players = []

  TeamData::ROLL_CALL[:"#{@team_name}"].each_key do |position, name|
    @players << Player.new(TeamData::ROLL_CALL[:"#{@team_name}"][position], position, @team_name)
  end
  erb :team_name
end

get "/positions" do
  erb :positions
end

get "/positions/:position" do
  @position = params[:position]
  @all_positions = ["Catcher", "Pitcher", "1st Base", "2nd Base", "3rd Base", "Shortstop",
     "Right Field", "Center Field", "Left Field"]
     erb :players_in_position
end
