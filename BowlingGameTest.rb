require('./TestCase.rb')
require('./BowlingGame.rb')

class BowlingGameTest < TestCase
	def setup
		@game = BowlingGame.new
	end

	def test_roll_all_zeroes
		roll_many(20, 0)
		assert_equal(0, @game.score)
	end

	def test_roll_one
		roll_many(20, 1)
		assert_equal(20, @game.score)
	end

	def roll_many(rolls, pins)
		for i in 1..rolls
			@game.roll(pins)
		end
	end
end


b = BowlingGameTest.new
b.run_tests