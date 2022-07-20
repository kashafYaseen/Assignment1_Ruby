class LeaderBoardGame

	attr_reader :scores, :n, :player, :m, :rank, :reslt
#to initialize the values for that particaular player 
	def initialize (scores, n, player, m)
		@scores = scores.sort.reverse
		@n = n
		@player = player
		@m = m 
		@rank = [1]
		@reslt = []
	end 
#to calculate the rank of players by using given scores 
	def calculateRankOfPlayer
		for i in 1..n do
			#to check either having same score to give them same ranks 
			if (@scores[i-1] == @scores[i])
				@rank.push(@rank[i-1])
			else
				#if the scores are different then their ranks are also different
				if (i != n)
					@rank.push(@rank[(i-1)] + 1)
				end 
				
			end 
			 
		end
		puts "Score of Players : #{@scores}"
		puts "Rank of Players  : #{@rank}"

	end 
#assign rank to that particular player 
	def assignRankToPalyer(playerScore)
		for j in 0..n-1 do
			#to check either it belongs to that scores or not
			if (playerScore == @scores[j])
				return @rank[j]
			elsif (playerScore > @scores[j])

				return (1 + @rank[j])

			end 

		end 

		
		
	end 
#to calculate the rank of that particular player 
	def climbingLeaderBoard 
		calculateRankOfPlayer();

		for i in 0..m-1 do
			if (@player[i] > @scores[0])
				@reslt[i] = @rank[0]
				#p @rank.map{|num| num = num + 1}
				#puts "#{@rank}"
				#@scores.unshift(@player[i]) 
				#@rank.unshift(@reslt[i]) 
			elsif (@player[i] < @scores[n-1])
				@reslt[i] = @rank[n-1] + 1
				#@scores[n] = @player[i]
				#@rank[n] = @reslt[i]
			else 
				indx = assignRankToPalyer(@player[i])
				@reslt[i] = @rank[indx]
			end 

		end 

		puts "Resultant Array of Alice #{@reslt}"
	end 
end 

totalScores = [9, 100, 100, 50, 40, 40, 20, 10]
n = totalScores.length()
aliceGameScores = [5, 25, 40, 120]
m = aliceGameScores.length()
alice = LeaderBoardGame.new(totalScores, n, aliceGameScores, m)
puts "Score of Alice : #{aliceGameScores}"
alice.climbingLeaderBoard()
