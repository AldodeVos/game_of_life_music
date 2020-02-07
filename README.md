Generative music game

It uses the basic rules of Conway's game of life for the blocks and I've added rules for how these blocks should produce sounds.

Conway's game of life has rules for each block/cell in an inifit grid:

If number of neighbours <= 1 { die }
If number of neighbours == 3 { become/stay alive }
If number of neighbours >= 4 { die } (with 2 neighbours nothing happens)
My rules for the music:

Blocks that are neighbours of eachother form groups
Groups take on the colour of its lowest member
For each time a colour becomes visible and it wasn't already, play the note that's associated with that colour
I've made very many variations on the rules, but they all had their musical problems.
These rules have their limitations too of course, but... well, you can try it yourself! I think they work great. http://www.aldodevos.nl/hidden_game_of_music/
