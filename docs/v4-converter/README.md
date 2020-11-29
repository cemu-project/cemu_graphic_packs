#### Script to convert graphic packs from version 3 to version 4 (and make shaders Vulkan compatible)
These scripts can be used to convert graphic packs that contain old shaders that were only meant for OpenGL to shaders that are cross-compatible with both of Cemu's render API's. The script isn't meant for speed or ease-of-use, so read the instructions below if you are planning on doing anything with it.

#### Setup
First of all, install [Node.js](https://nodejs.org) (use the current version). Then, I would suggest you download a zipped version of the [graphic pack repository code](https://github.com/ActualMandM/cemu_graphic_packs/archive/master.zip). Extract it somewhere logical, because you'll use this as your working directory.
After that, you need to [download the latest glslang](https://github.com/KhronosGroup/glslang/releases) and put the `glslangValidator.exe` and `spirv-remap.exe` from that zip's `bin` folder into that working directory you made above. The final step here is to copy the `convert-packs.js` and the `verify-graphicPacks.js` into that same working directory. Here's a screenshot of what it should look like at this point:
![working directory](https://i.imgur.com/B2CLjFy.png).

### The process of converting graphic packs
Before doing anything, there's a few things that should be explained. Let's start with the use-cases for each script.
 - The `convert-packs.js` is used to convert the graphic packs to OpenGL. It only uses the available information out of the shader code to predict what these shaders are expected to be in Vulkan and OpenGL if they were made by Cemu. It follows some strict rules that Cemu uses to replicate Cemu's own shaders. However, in rare cases it can be the case that not all of the information is kept intact by the graphic pack authors for this script to replicate it perfectly.
 - The `verify-graphicPacks.js` script is used to verify the converted shaders's replication with the actual V4 shaders from Cemu itself. The person who converts the graphic packs will need to make a large shader dump from Cemu, put it in the working directory. If it finds any mistakes in the replication method it'll dump those shaders to the `manual` folder so that you can check the difference between what the shader is supposed to be and what the converted pack was. That way you can correct it's mistakes.

##### First, use convert-packs.js
So, basically, you'll first want to open the convert-packs.js script and scroll to the bottom. It has two configuration options you'll want to edit, the `filterFolderNames` and the `verboseOutput` (which you should probably ignore) variables. Add the prefix of your game's folder name, for example "BreathOfTheWild", since all of the graphic pack folders that are related to that game use "BreathOfTheWild_GraphicPackName" etc. It'll then ignore all of the graphic packs in those folders.

Now that you've set it all up, you can open up a command console in that folder and run the script using `node convert-packs.js`. It'll then start doing it's chaotic thing where it shows a bunch of information. Just make sure that there's no "error while compiling this shader" shenanigans. The rest of the warnings can mostly be ignored. Then, wait for it to finish executing (hopefully without any errors from the script itself). If there was an error in the shaders themselves, it should output them in an `error` folder in your working directory.

If there's an error in any of the shaders, you'll have to debug the shader. Maybe it was the shader itself being wrong or it doing something funky with it's lines that should really be fixed in the shader itself. If you think that the shader doesn't do anything weird, please report it to me via the [Github issue](https://github.com/ActualMandM/cemu_graphic_packs/issues/408) or via Cemu's Discord in the gfx-packs channel.

If nothing errored (hurray), you'll now have all of the converted graphic packs in a new folder called `graphicPacks` inside your working directory! See the next two steps with how to continue.

##### Optionally, use verify-graphicPacks.js
As I've explained in the overview above, this isn't strictly necessary. However, it's highly recommended for games that have many and a lot of edited shaders though!

The first thing you'll need to make it a shader dump using Cemu 1.16.0 or any newer Cemu version, since you want to match the replicated shaders with the real shaders. This shader dump is easily generated if you already had a big existing shader cache, since you can just enable the shader dump option under Cemu's Debug->Dump menu and load the game with the cache. While loading it'll dump all of the shaders. Otherwise you'll have to try and get as many shaders dumped as you can until you can get the amount of unverified shaders to an acceptable level (this script will make a summary of the shaders that weren't ported correctly at the end).
After you've created a decent dump, move your `dump` folder to your working directory. Make sure that the shaders will be located in `/working_space/dump/shaders/`. After that, you can run the script using `node.js verify-graphicPacks.js`. Make sure that you ran the previous script and the converted packs are still in your `graphicPacks` folder.

Hopefully you're now satisfied by the amount of shaders that were verified (there's a change that some shaders are just not being used anymore in recent versions and therefor aren't able to be verified). If there was an invalid shader it'll be outputted to the `manual` folder in your graphic pack repository. Then you can keep them side-by-side to compare them, or use something like [Meld](https://meldmerge.org/) to see the exact difference between them. After you manually edited them you want to replace the invalid shader with your manually corrected shader in the `graphicPacks` folder. After all of that, let's go to the next step.

##### Add the packs
_Just as a small notice for people who want to upload these converted packs to the [community graphic pack repository](https://github.com/ActualMandM/cemu_graphic_packs), it's very appreciated if you were to use pull requests before merging them directly into the main branch to prevent breaking people their graphic packs and us needing to revert changes and such. Also, please keep it to one game per pull request._

Once you've got a set of fully (verified and) converted shaders, you should be able to use the graphic packs from `graphicPacks` in your own Cemu folder! Would probably not hurt checking them with the game themselves obviously!

If you're gonna contribute to community graphic packs you should just be able to go to your git folder and paste the files from the `graphicPacks` folder in there since it doesn't remove or create files. Just overwrite any existing files. Then, you can start to make a pull request or commit. When making the description of those, please include whether you used the verify-graphicPacks.js script to verify the converted packs, and if yes, which shaders were unverified in the summary and which were invalid (you shouldn't really have any of these ofcourse).

-----
### Please report any issues with this script via this [Github issue](https://github.com/ActualMandM/cemu_graphic_packs/issues/408) or via Cemu's Discord server in the #gfx-packs channel.
