#A Simple Game of Ping-Pong

**To run the test games, clone the repo, navigate to the folder and type:**
<code>ruby test_games.rb</code>

After writing out the game logic, I began testing by pairing each player off and having them play 100 games each. Each player served 50 times, and the results were stored in a hash which recorded both matchup-specific data and  win totals:

##100 games per match-up

###Set 1
Bruce vs. Serena: 68 (wins) to 32 (wins)
Serena vs. Jean Claude: 39 to 61
Jean Claude vs. Bruce:  80 to 20
Bruce's Total: 88,
Serena's Total: 71 
Jean Claude's Total: 141

###Set 2
Bruce vs. Serena: 73 to 27
Serena vs. Jean Claude: 48 to 54
Jean Claude vs. Bruce: 62 to 18
Bruce's Total: 91
Serena's Total: 73 
Jean Claude's Total: 136

###Set 3
Bruce vs. Serena: 73 to 27 
Serena vs. Jean Claude: 28 to 72 
Jean Claude vs. Bruce: 75 to 25
Bruce's Total: 98 
Serena's Total: 55
Jean Claude's Total: 147

I could definitely see a pattern emerging, but I doubled my sample size
just to be certain.

##200 games per match-up

Bruce's Total: 181, Serena's Total: 129, Jean Claude's Total: 290

Bruce's Total: 178, Serena's Total: 140, Jean Claude's Total: 282

Bruce's Total: 192, Serena's Total: 136, Jean Claude's Total: 272

#Analysis

Jean Claude emerged as the clear front-runner, with Bruce at second accruing around 100 fewer wins each iteration of the larger data set, and Serena trailing behind him.

Serena's basic fault was obvious: her favorite shot is the topsin, which Bruce and Jean Claude will both return *most* of the time. Bruce also loses out to Jean Claude because his favorite shot is the flat, which is Jean Claude's favorite **to return**.

I think Jean Claude's greatest strength, though, is in his return rates. He focuses stat allocation on flats and topspins while mostly ignoring the slice, which is apparently an unpopular shot anyway. 

#Enter Son Goku

With all this in mind I went about making my own custom player to trounce the competition. I named him Goku because his power level is *just that high*. In fact, in 200 matches with each player, he **didn't lose once**.

vs. Bruce
	wins: 200
	losses: 0
vs. Serena
	wins: 200
	losses: 0
vs. Jean Claude
	wins: 200
	losses: 0

In most of these games, the opponent only got between 4 and 8 points. Why is that? Let's take a look at Goku's stats.

	Probability of hitting shot type:
		0% flat
		95% slice
		0% topspin
		5% unreturnable
	Probability of returning a shot of type:
		90% flat
		20% slice
		90% topspin

First of all, Goku only hits slices. Only Serena breaks even returning these, while all players have above-average return percentages for the other two shot types. The slice is by far the best shot in the game.

Goku's return ratings are based on Van Damme's; he has a 90% chance to return the two most popular hits, but he still gets the possibility of hitting a slice. It may be possible to mix-max his stats by completely ignoring the slice, but that would just be silly.