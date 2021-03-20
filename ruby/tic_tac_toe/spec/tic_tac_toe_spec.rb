require './lib/tic_tac_toe.rb'

$player1 = Player.new('Steven', 'X')
$player2 = Player.new('Lauren', 'O')

describe "#play_game" do
    it "check that top row is a win" do
        $space1
    end

    it "returns the sum of more than two numbers" do
        calculator = Calculator.new
        expect(calculator.add(2, 5, 7)).to eql(14)
    end
end
describe "#subtract" do
    it "returns the subtraction of two numbers" do
        calculator = Calculator.new
        expect(calculator.subtract(5, 2)).to eql(3)
    end
end
describe "#multiply" do
    it "returns the multiplication of two numbers" do
        calculator = Calculator.new
        expect(calculator.multiply(5, 2)).to eql(10)
    end
end
describe "#divide" do
    it "returns the division of two numbers" do
        calculator = Calculator.new
        expect(calculator.add(5, 2)).to eql(2.5)
    end
end
