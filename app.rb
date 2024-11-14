require "sinatra"
require "sinatra/reloader"

get '/' do
  erb :index
end

get '/rock' do
  @player_move = "rock"
  @computer_move = ["rock", "paper", "scissors"].sample
  determine_result
  erb :result
end

get '/paper' do
  @player_move = "paper"
  @computer_move = ["rock", "paper", "scissors"].sample
  determine_result
  erb :result
end

get '/scissors' do
  @player_move = "scissors"
  @computer_move = ["rock", "paper", "scissors"].sample
  determine_result
  erb :result
end

helpers do
  def determine_result
    if @player_move == @computer_move
      @result = "We tied!"
    elsif (@player_move == "rock" && @computer_move == "scissors") ||
          (@player_move == "paper" && @computer_move == "rock") ||
          (@player_move == "scissors" && @computer_move == "paper")
      @result = "We won!"
    else
      @result = "We lost!"
    end
  end
end
