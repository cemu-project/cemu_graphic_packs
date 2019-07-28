# Top half of the Guardian weapon is drawed with Scout shader while the bottom half is Skywatcher shader.

# Generally color is between 0-1 which is then multiplied by brightness (So Guardian can turn on/off)
# Guardian 50 (changing), Ancient armor 20, Ancient bow about 11
# Exception: Ancient sword, shield (20.0, 3.0, 1.0) use un-normalized color, with brightness being 1.0
# Equals to (1.0, 0.15, 0.05) with brightness 20

# Game control color & brightness with a uniform, so they can vary between objects (and through time) drawn with the same shader. It's hard to do this in Gfx pack.
# In theory You can add if condition to check for game's uniform value so you can change the color of a specific object without affecting others.

# Try converting custom color from gamma encoded to linear (color/255)^2.2 if it look slightly off in game.
