module Play
    def make_move(tile)
        @selected_tiles.append(tile.name)
        p @selected_tiles
        tile.value = @symbol
    end
end

class Tile 
    attr_accessor :name, :value
    def initialize(name, value)
        @name = name
        @value = value
    end
end

class Player
    include Play
    attr_reader :name, :symbol, :selected_tiles, :rounds
    @@rounds = 1

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
        @selected_tiles = []
    end

    def take_turn
        puts "#{self.name}, which tile you choose (1, 2, etc.)?"
        input = 10
        until input < 10
            input = Integer(gets.chomp) rescue retry
        end
        tile = $spaces[input]
        if tile.value == "-"
            self.make_move(tile)
        else
            puts "Invalid selection, please try again\n"
            self.take_turn
        end
        @@rounds += 1
    end
end


puts "Enter your name"
name = gets.chomp
puts "Enter your symbol of choice"
symbol = gets.chomp

$player1 = Player.new(name, symbol)

if $player1.symbol == "X" || $player1.symbol == "x"
    $player2 = Player.new("robo", "O")
else
    $player2 = Player.new("robo", "X")
end

$space1 = Tile.new(1, "-")
$space2 = Tile.new(2, "-")
$space3 = Tile.new(3, "-")
$space4 = Tile.new(4, "-")
$space5 = Tile.new(5, "-")
$space6 = Tile.new(6, "-")
$space7 = Tile.new(7, "-")
$space8 = Tile.new(8, "-")
$space9 = Tile.new(9, "-")
$spaces = {1 => $space1, 2 => $space2, 3 => $space3, 4 => $space4, 5 => $space5, 6 => $space6, 7 => $space7, 8 => $space8, 9 => $space9}

$COMBINATIONS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

def play_game
    i = 0
    victory = false
    0.upto(8) do |i|
        if Player.class_variable_get(:@@rounds).odd?
            $player1.take_turn
        else
            $player2.take_turn
        end
        $COMBINATIONS.each do |j|
            player1_win = $player1.selected_tiles & j
            player2_win = $player2.selected_tiles & j
            if player1_win.length == 3 || player2_win.length == 3
                victory = true
                if Player.class_variable_get(:@@rounds).even?
                    puts "Congradulations #{$player1.name}!"
                else   
                    puts "Congradulations #{$player2.name}!"
                end
                break
            end
        end
        $board = "| #{$space1.value} | #{$space2.value} | #{$space3.value} |\n| #{$space4.value} | #{$space5.value} | #{$space6.value} |\n| #{$space7.value} | #{$space8.value} | #{$space9.value} |\n"
        print $board
        if victory == true
            break
        end
        i += 1
    end  
end

play_game
