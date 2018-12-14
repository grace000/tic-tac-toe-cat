require "tic_tac_toe_rules"

describe Rules do
    describe "#winner?" do
        it "should return true if a set of player markings STRAIGHT--match a winning combo" do
            result = Rules.new()

            player_stats = [0,1,2]
            call = result.winner?(player_stats)
            expect(call).to eq(true)
        end

        it "should return true if a different set of markings STRAIGHT--match a winning combo" do
            result = Rules.new()
            
            expect(result.winner?([3,4,5])).to eq(true)
            expect(result.winner?([6,7,8])).to eq(true)
            expect(result.winner?([0,3,6])).to eq(true)
            expect(result.winner?([1,4,7])).to eq(true)
            expect(result.winner?([2,5,8])).to eq(true)
        end

        it "should return true if a set of markings BOX-match a winning combo" do
            result = Rules.new()

            player_stats = [7,6,8]
            call = result.winner?(player_stats)
            expect(call).to eq(true)
        end

        it "should return true if a different set of markings BOX-match a winning combo" do
            result = Rules.new()

            expect(result.winner?([3,5,4])).to eq(true)
            expect(result.winner?([8,6,7])).to eq(true)
            expect(result.winner?([3,6,0])).to eq(true)
            expect(result.winner?([4,7,1])).to eq(true)
            expect(result.winner?([2,8,5])).to eq(true)
        end

        it "should return true if a set of markings CONTAIN a winning combo" do
            result = Rules.new()

            expect(result.winner?([7,6,3,0])).to eq(true)
            expect(result.winner?([1,4,7,2])).to eq(true)
            expect(result.winner?([0,6,3,4])).to eq(true)
            expect(result.winner?([8,4,3,0])).to eq(true)
        end

        it "should return false if a set of markings does not contain at least 3 marks" do
            result = Rules.new()

            expect(result.winner?([0,4])).to eq(false)
            expect(result.winner?([0])).to eq(false)
        end
    end 
    
    describe "#draw?" do
        it "returns false if the board is empty" do 
            board = Board.new
            result = Rules.new

            expect(result.draw?(board)).to eq(false)
        end

        it "returns true if the board is full" do
            board = Board.new
            result = Rules.new
            
            board.move(0)
            board.move(1)
            board.move(2)
            board.move(3)
            board.move(4)
            board.move(5)
            board.move(6)
            board.move(7)
            board.move(8)

            expect(result.draw?(board)).to eq(true)
        end

        it "returns false if the board is not full" do
            board = Board.new
            result = Rules.new

            board.move(4)
            board.move(5)
            board.move(6)
            board.move(7)
            board.move(8)

            expect(result.draw?(board)).to eq(false)
        end
    end 
    
end