class BowlingGame
	def initialize
		@rolls = []
		@current_roll = 0
		@frame_index = 0
	end

	def roll(pins)
		@rolls[@current_roll] = pins
		@current_roll += 1
	end

	def score
		score = 0
		frame_index = 0
		for i in 0..9
			if @rolls[frame_index] + @rolls[frame_index+1] == 10
				score += 10 + @rolls[frame_index+2]
				frame_index += 2
			else
				score += @rolls[frame_index] + @rolls[frame_index+1]
				frame_index += 2
			end
		end
		score
	end
end

class Frame
	def initialize(first_roll, second_roll=nil)
		@first_roll = first_roll
		@second_roll = second_roll
	end
end
