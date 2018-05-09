require "pry"

def game_hash 
  {
    :home => {
      :team_name =>"Brooklyn Nets",
      :colors =>["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0 ,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30 ,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11 ,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1 ,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        },
      },
    },
    :away => {
      :team_name =>"Charlotte Hornets",
      :colors =>["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
         "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
  
end

def num_points_scored(player_name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, player_data|
      return player_data[:points] if player == player_name
    end
  end
end


def shoe_size(player_name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, player_data|
      return player_data[:shoe] if player == player_name
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, team_data|
    return team_data[:colors] if team_data[:team_name]== team_name
  end
end

def team_names
  names = []
  game_hash.each { |team, team_data| names << team_data[:team_name] }
  names
end


def player_numbers(team_name)
  numbers = [ ]
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each {|player, player_data| numbers << player_data[:number]}
    end
  end
  numbers.sort
end

def player_stats(player_name)
  new_hash = { }
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, player_data|
      player_data.each {|key, value| new_hash[key] = value} if player == player_name
    end
  end
  new_hash
end

def big_shoe_rebounds 
  largest_shoe_size = 0 
  largest_shoe_rebounds = 0 
  
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, player_data|
      if largest_shoe_size = 0 || player_data[:shoe] > largest_shoe_size
        largest_shoe_size = player_data[:shoe]
        largest_shoe_rebounds = player_data[:rebounds]
      end
    end
  end
  largest_shoe_rebounds
end

def most_points_scored
  highest_score = 0
  high_score_player = 0

  game_hash.each do |team, team_data|

    team_data[:players].each do |player, player_data|

      if highest_score == 0 || player_data[:points] > highest_score
        highest_score = player_data[:points]
        high_score_player = player
      end
    end
  end
  high_score_player
end

def winning_team
  counter = { }
  game_hash.each do |team, team_data|
    counter[team_data[:team_name]] = 0
    team_data[:players].each do |player_name, player_data|
      counter[team_data[:team_name]] += player_data[:points]
    end
  end
  
  if counter["Brooklyn Nets"] > counter["Charlotte Hornets"] 
    return "Brooklyn Nets"
  else
    "Charlotte Hornets"
  end
end

