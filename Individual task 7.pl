fly(bat).
fly(baterfly).
insect(bat).
place(Animal):-sea(Animal);sky(Animal);ground(Animal).

play:-place(Animal),
