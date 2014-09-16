require_relative 'ping_pong.rb'


bruce = Player.new(
  "Bruce Leeds",
  ## shot chances stored as cumulative percentages
  { flat: 47, slice: 72, topspin: 97 },
  { flat: 8, slice: 45, topspin: 75 }
)

serena = Player.new(
  "Serena Williamson",
  { flat: 10, slice: 30, topspin: 96 },
  { flat: 65, slice: 5, topspin: 85 }
)

jean_claude = Player.new(
  "Jeane Claude Van Dime",
  { flat: 70, slice: 80, topspin: 95 },
  { flat: 9, slice: 25, topspin: 85 }
)

goku = Player.new(
  "Son Goku",
  { flat: 0, slice: 95, topspin: 95 },
  { flat: 90, slice: 20, topspin: 90 }
)

results = {
  bruce_serena: {
    bruce: 0,
    serena: 0
  },
  
  serena_jean: {
    serena: 0,
    jean: 0
  },
  
  jean_bruce: {
    jean: 0,
    bruce: 0
  },
  
  bruce_total: 0,
  serena_total: 0,
  jean_total: 0
}

goku_results = {
  bruce: {
    wins: 0,
    losses: 0
  },
  
  serena: {
    wins: 0,
    losses: 0
  },
  
  jean: {
    wins: 0,
    losses: 0
  }
}
#
# 100.times do
#   game = Game.new(bruce, serena)
#   game.play
#
#   if game.winner == bruce
#     results[:bruce_serena][:bruce] += 1
#     results[:bruce_total] += 1
#   elsif game.winner == serena
#     results[:bruce_serena][:serena] += 1
#     results[:serena_total] += 1
#   end
# end
#
# 100.times do
#   game = Game.new(serena, bruce)
#   game.play
#
#   if game.winner == bruce
#     results[:bruce_serena][:bruce] += 1
#     results[:bruce_total] += 1
#   elsif game.winner == serena
#     results[:bruce_serena][:serena] += 1
#     results[:serena_total] += 1
#   end
# end
#
# 100.times do
#   game = Game.new(serena, jean_claude)
#   game.play
#
#   if game.winner == serena
#     results[:serena_jean][:serena] += 1
#     results[:serena_total] += 1
#   elsif game.winner == jean_claude
#     results[:serena_jean][:jean] += 1
#     results[:jean_total] += 1
#   end
# end
#
# 100.times do
#   game = Game.new(jean_claude, serena)
#   game.play
#
#   if game.winner == serena
#     results[:serena_jean][:serena] += 1
#     results[:serena_total] += 1
#   elsif game.winner == jean_claude
#     results[:serena_jean][:jean] += 1
#     results[:jean_total] += 1
#   end
# end
#
# 100.times do
#   game = Game.new(jean_claude, bruce)
#   game.play
#
#   if game.winner == jean_claude
#     results[:jean_bruce][:jean] += 1
#     results[:jean_total] += 1
#   elsif game.winner == bruce
#     results[:jean_bruce][:bruce] += 1
#     results[:bruce_total] += 1
#   end
# end
#
# 100.times do
#   game = Game.new(bruce, jean_claude)
#   game.play
#
#   if game.winner == jean_claude
#     results[:jean_bruce][:jean] += 1
#     results[:jean_total] += 1
#   elsif game.winner == bruce
#     results[:jean_bruce][:bruce] += 1
#     results[:bruce_total] += 1
#   end
# end
#
# p results

100.times do
  game = Game.new(goku, bruce)
  game.play
  
  if game.winner == goku
    goku_results[:bruce][:wins] += 1
  else
    goku_results[:bruce][:losses] += 1
  end
end

100.times do
  game = Game.new(bruce, goku)
  game.play
  
  if game.winner == goku
    goku_results[:bruce][:wins] += 1
  else
    goku_results[:bruce][:losses] += 1
  end
end

100.times do
  game = Game.new(goku, serena)
  game.play
  
  if game.winner == goku
    goku_results[:serena][:wins] += 1
  else
    goku_results[:serena][:losses] += 1
  end
end

100.times do
  game = Game.new(serena, goku)
  game.play
  
  if game.winner == goku
    goku_results[:serena][:wins] += 1
  else
    goku_results[:serena][:losses] += 1
  end
end

100.times do
  game = Game.new(goku, jean_claude)
  game.play
  
  if game.winner == goku
    goku_results[:jean][:wins] += 1
  else
    goku_results[:jean][:losses] += 1
  end
end

100.times do
  game = Game.new(jean_claude, goku)
  game.play
  
  if game.winner == goku
    goku_results[:jean][:wins] += 1
  else
    goku_results[:jean][:losses] += 1
  end
end


p goku_results