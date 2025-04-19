this file is documenting all the data about a character that can be changed.
fell free to use this document to help make your own character mods
document made by googlebonker

The addresses listed are Wii U addresses.
The exact address in cemu changes from update to update
but in 2.4 is 1B77A5C8 and in other versions will be near that address

1C38E5C8                       AAAAAAAA AAAAAAAA
1C38E5D0     AAAAAAAA AAAAAAAA AAAAAAAA AAAAAAAA
1C38E5E0     AAAAAAAA AAAAAAAA AAAAAAAA AAAAAAAA
1C38E5F0     AAAAAAAA AAAAAAAA AAAAAAAA AAAAAAAA
1C38E600     AAAAAAAA AAAAAAAA AAAABBCC DDDDEEEE
1C38E610     FFFFGGHH IIJJKKKK LLLLMMMM NNNNOOOO
1C38E620     PPPPQQQQ RRRRSSSS TTTTUUUU VVVVWWWW
1C38E630     XXXXXXXX YYYYYYYY ZZZZZZZZ AAAAAAAA
1C38E640     BBCCDDEE FFFFFFFF GGGGHHHH IIIIJJJJ
1C38E650     KKKKLLLL MMMMNNNN OOOOPPPP QQQQRRRR
1C38E660     SSSSTTTT UUUUVVVV WWWWXXXX YYYYZZZZ
1C38E670     AAAABBBB CCCCDDDD EEEEFFFF GGGGHHHH
1C38E680     IIIIJJJJ KKKKLLLL MMMMNNNN OOOOPPPP
1C38E690     QQQQRRRR SSSSTTTT UUUUVVVV WWWWXXXX
1C38E6A0     YYYYZZZZ AAAABBBB CCCCDDDD EEEEFFFF
1C38E6B0     GGGGHHHH IIIIJJJJ KKKKLLLL MMMMNNNN
1C38E6C0     OOOOPPPP QQQQRRRR SSSSTTTT UUUUVVVV
1C38E6D0     WWWWXXXX YYYYZZZZ AAAABBBB CCCCDDDD
1C38E6E0     EEEEFFFF GGGGHHHH IIIIJJJJ KKKKLLLL
1C38E6F0     MMNNOOPP QQQQRRSS TTUUVVWW XXYYZZAA
1C38E700     BBCCDDEE FFGGHHII JJKKLLMM NNOOPPQQ
1C38E710     RRRRSSSS TTTTUUUU VVVVWWWW XXXXYYYY
1C38E720     ZZZZAAAA BBBBCCCC DDDDEEEE FFFFGGG
1C38E730     HHHHIIII JJJJKKKK LLLLLLLL


1C38E5C8
A     Avatar name
B     A 67th unusable character slot. The game always puts "00" after your avatar's name, 	but the next slot (CC) that would be used for "00" is used to count the characters in 	your avatar's name. Anything besides "00" in this space will crash your game and 	cause it to reload.
C     Avatar name character count. This automatically readjusts if you try to change it.
D     Base Face
E     Hair > Style
F     Hair > Special (Hair > Specials only go with the corresponding Hair > Style. If you 	mismatch these, the game will crash and cause it to reload. 00 is always off.)
G     Skin > Moles
H     Skin > Freckles
I     Skin > Cheeks
J     Skin > Scars
K     Make up > Face Paint
L     Eyes > Pupils
M     Body Gender (01 male, 02 female)
N     ????
O     Voice
P     Skin > Color
Q     Makeup > Lips
R     Makeup > Eye Shadow
S     Eyes > Color 1 (iris)
T     Eyes > Color 2 (pupil)
U     Hair > Roots Color
V     Hair > Tips Color
W     ????
X     Height
Y     Breast Depth (only works on female bodies) (maximum is 400000000. Setting this 	value to FF800001 or higher will cause your character's breasts to disappear)
Z     Breast Height (only works on female bodies) (maximum is 400000000. Setting
this  value to FF800001 or higher will cause your character's breasts to disappear)

1C38E63C
A     Breast Width (only works on female bodies) (maximum is 400000000. Setting this 	value to FF800001 or higher will cause your character's breasts to disappear)
B     Protagonist presence (WARNING! Glitchy!)
C     Something about a Skell?
D     Character level
E     ????
F     Character experience on the level
G     Ranged Weapon
H     Ranged Weapon Trait 1
I     Ranged Weapon Trait 2
J     Ranged Weapon Trait 3
K     Ranged Weapon Augment 1
L     Ranged Weapon Augment 2
M     Ranged Weapon Augment 3
N     Melee Weapon
O     Melee Weapon Trait 1
P     Melee Weapon Trait 2
Q     Melee Weapon Trait 3
R     Melee Weapon Augment 1
S     Melee Weapon Augment 2
T     Melee Weapon Augment 3
U     Body Armor
V     Body Armor Trait 1
W     Body Armor Trait 2
X     Body Armor Trait 3
Y     Body Armor Augment 1
Z     Body Armor Augment 2

1C38E670
A     Body Armor Augment 3
B     Head Armor
C     Head Armor Trait 1
D     Head Armor Trait 2
E     Head Armor Trait 3
F     Head Armor Augment 1
G     Head Armor Augment 2
H     Head Armor Augment 3
I     Arm Armor R
J     Arm Armor R Trait 1
K     Arm Armor R Trait 2
L     Arm Armor R Trait 3
M     Arm Armor R Augment 1
N     Arm Armor R Augment 2
O     Arm Armor R Augment 3
P     Arm Armor L
Q     Arm Armor L Trait 1
R     Arm Armor L Trait 2
S     Arm Armor L Trait 3
T     Arm Armor L Augment 1
U     Arm Armor L Augment 2
V     Arm Armor L Augment 3
W     Leg Armor
X     Leg Armor Trait 1
Y     Leg Armor Trait 2
Z     Leg Armor Trait 3

1C38E6A4
A     Leg Armor Augment 1
B     Leg Armor Augment 2
C     Leg Armor Augment 3
D     Body Fashion
E     Body Fashion Trait 1
F     Body Fashion Trait 2
G     Body Fashion Trait 3
H     Body Fashion Augment 1
I     Body Fashion Augment 2
J     Body Fashion Augment 3
K     Head Fashion
L     Head Fashion Trait 1
M     Head Fashion Trait 2
N     Head Fashion Trait 3
O     Head Fashion Augment 1
P     Head Fashion Augment 2
Q     Head Fashion Augment 3
R     Arm Fashion R
S     Arm Fashion R Trait 1
T     Arm Fashion R Trait 2
U     Arm Fashion R Trait 3
V     Arm Fashion R Augment 1
W     Arm Fashion R Augment 2
X     Arm Fashion R Augment 3
Y     Arm Fashion L
Z     Arm Fashion L Trait 1

1C38E6D8
A     Arm Fashion L Trait 2
B     Arm Fashion L Trait 3
C     Arm Fashion L Augment 1
D     Arm Fashion L Augment 2
E     Arm Fashion L Augment 3
F     Leg Fashion
G     Leg Fashion Trait 1
H     Leg Fashion Trait 2
I     Leg Fashion Trait 3
J     Leg Fashion Augment 1
K     Leg Fashion Augment 2
L     Leg Fashion Augment 3
M     Class (invalid Classes will crash the game and cause it to reload)
N     ????
O     Class Level
P     ????
Q     Class experience on the level
R     Arts Palette Slot 4
S     Arts Palette Slot 4 Art Level
T     Arts Palette Slot 3
U     Arts Palette Slot 3 Art Level
V     Arts Palette Slot 2
W     Arts Palette Slot 2 Art Level
X     Arts Palette Slot 1
Y     Arts Palette Slot 1 Art Level
Z     Arts Palette Slot 8

1C38E703
A     Arts Palette Slot 8 Art Level
B     Arts Palette Slot 7
C     Arts Palette Slot 7 Art Level
D     Arts Palette Slot 6
E     Arts Palette Slot 6 Art Level
F     Arts Palette Slot 5
G     Arts Palette Slot 5 Art Level
H     Assigned Skills Slot 1
I     Assigned Skills Slot 1 Skill Level
J     Assigned Skills Slot 2
K     Assigned Skills Slot 2 Skill Level
L     Assigned Skills Slot 3
M     Assigned Skills Slot 3 Skill Level
N     Assigned Skills Slot 4
O     Assigned Skills Slot 4 Skill Level
P     Assigned Skills Slot 5
Q     Assigned Skills Slot 5 Skill Level
R     Soul Voice Custom Voice 1 Category
S     Soul Voice Custom Voice 2 Category
T     Soul Voice Custom Voice 3 Category
U     Soul Voice Custom Voice 4 Category
V     Soul Voice 1
W     Soul Voice 2
X     Soul Voice 3
Y     Soul Voice 4
Z     Soul Voice 5

1C38E722
A     Soul Voice 6
B     Soul Voice 8
C     Soul Voice 7
D     Soul Voice 9
E     Soul Voice 10
F     Soul Voice 11
G     Soul Voice 12
H     Soul Voice 13
I     Soul Voice 14
J     Soul Voice 15
K     Soul Voice 16
L     Former HP tracker?

ASCII Table
A 41 61 a
B 42 62 b
C 43 63 c
D 44 64 d
E 45 65 e
F 46 66 f
G 47 67 g
H 48 68 h
I 49 69 i
J 4A 6A j
K 4B 6B k
L 4C 6C l
M 4D 6D m
N 4E 6E n
O 4F 6F o
P 50 70 p
Q 51 71 q
R 52 72 r
S 53 73 s
T 54 74 t
U 55 75 u
V 56 76 v
W 57 77 w
X 58 78 x
Y 59 79 y
Z 5A 7A z
! 21 CF ?
. 2E 2C ,
space 20
