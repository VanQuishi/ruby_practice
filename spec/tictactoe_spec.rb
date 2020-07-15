require './tictactoe.rb'

describe Player do
    describe "#draw" do
        it "returns the status of marking a cell successfully" do
            user = Player.new('X')
            expect(user.draw('X', 1)).to eq(true)
        end

        it "returns the status of failing to mark a cell" do
            user = Player.new('X')
            user.draw('X', 1)
            expect(user.draw('X', 1)).to eq(false)
        end
    end

    describe "#check" do
        it "returns true for a win" do
            user = Player.new('X')
            user.draw('X', 0)
            user.draw('X', 1)
            user.draw('X', 2)
            expect(user.check()).to eq(true)
        end

        it "returns false for no win" do
            user = Player.new('X')
            user.draw('X', 1)
            user.draw('X', 4)
            user.draw('X', 3)
            expect(user.check()).to eq(false)
        end
    end

    
end