This is based on an extreme simplification of the fps++ mod by Xalphenos; it 
drops dynamic FPS to prevent graphics judder. The Rajkosto "best fence" method
is also included for performance and stability. Judder was easily noticeable
when Link paraglides; the caveat is that the user must pick a target FPS that 
they can maintain.

It improves over previous static mods in that it allows ANY value as a
static fps target and it includes the stamina fix. Now it also features a fix
for the physics of arrow projectiles.

To use it simply grab one of the provided versions or edit one with these
changes: a) rules.txt frequency and name b) divide 30 by the target FPS c) use
the result of that calculation and the target fps in patches.txt. 

This readme was derived from a static <?=$argv[1] ?>FPS mod. Additional FPS targets
and discussion are at https://forum.cemu.info/showthread.php/421. If you do 
know how to use build.sh at Slashie's repo, it supports arbitrary targets.

    epigramx
