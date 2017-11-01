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
			if is_spare?(frame_index)
				score += score_spare(frame_index)
				frame_index += 2
			elsif is_strike?(frame_index)
				score += score_strike(frame_index)
				frame_index += 1
			else
				score += score_normal(frame_index)
				frame_index += 2
			end
		end
		score
	end

	def is_spare?(frame_index)
		@rolls[frame_index] + @rolls[frame_index+1] == 10
	end

	def is_strike?(frame_index)
		@rolls[frame_index] == 10
	end

	def score_normal(frame_index)
		@rolls[frame_index] + @rolls[frame_index+1]
	end

	def score_spare(frame_index)
		10 + @rolls[frame_index+2]
	end

	def score_strike(frame_index)
		10 + @rolls[frame_index+1] + @rolls[frame_index+2]
	end
end

class Frame
	def initialize(first_roll, second_roll=nil)
		@first_roll = first_roll
		@second_roll = second_roll
	end
end
