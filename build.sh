#!/bin/bash
baseOutDir=$1
if [ -n "$baseOutDir" ]; then
	if [ ! -d "$baseOutDir" ]; then
		echo "Making base output directory $baseOutDir"
		mkdir "$baseOutDir"
	fi
fi

build_dir () {
	srcDir=$1
	dstDir=$2
	if [ -n "$baseOutDir" ]; then
		dstDir="$baseOutDir/$dstDir"
	fi

	params=( "$@" )
	rest=( "${params[@]:2}" )

	if [ ! -d "$dstDir" ]; then
		echo "Making output directory $dstDir"
		mkdir -p "$dstDir"
	else
		rm "$dstDir"/*.txt
	fi

	for f in "$srcDir"/*.txt
	do
		filename=`basename $f`
		outName="$dstDir/$filename"
		echo "Building $f to $outName with params ${rest[@]}"
		php "$f" ${rest[*]} > "$outName"
		if [ $? -ne 0 ]; then
			rm "$outName"
		fi
	done
}

build_dir "Source/Bayonetta" "Enthusiast/Bayonetta_2880p" 5120 2880
build_dir "Source/Bayonetta" "Enthusiast/Bayonetta_4320p" 7680 4320
build_dir "Source/Bayonetta" "Enthusiast/Bayonetta_5760p" 10240 5760
build_dir "Source/Bayonetta" "Performance/Bayonetta_360p" 640 360
build_dir "Source/Bayonetta" "Performance/Bayonetta_540p" 960 540
build_dir "Source/Bayonetta" "Quality/Bayonetta_1080p" 1920 1080
build_dir "Source/Bayonetta" "Quality/Bayonetta_1440p" 2560 1440
build_dir "Source/Bayonetta" "Quality/Bayonetta_1800p" 3200 1800
build_dir "Source/Bayonetta" "Quality/Bayonetta_2160p" 3840 2160
build_dir "Source/Bayonetta" "Quality/Bayonetta_900p" 1600 900
build_dir "Source/Bayonetta2" "Enthusiast/Bayonetta2_2880p" 5120 2880
build_dir "Source/Bayonetta2" "Enthusiast/Bayonetta2_4320p" 7680 4320
build_dir "Source/Bayonetta2" "Enthusiast/Bayonetta2_5760p" 10240 5760
build_dir "Source/Bayonetta2" "Performance/Bayonetta2_360p" 640 360
build_dir "Source/Bayonetta2" "Performance/Bayonetta2_540p" 960 540
build_dir "Source/Bayonetta2" "Quality/Bayonetta2_1080p" 1920 1080
build_dir "Source/Bayonetta2" "Quality/Bayonetta2_1440p" 2560 1440
build_dir "Source/Bayonetta2" "Quality/Bayonetta2_1800p" 3200 1800
build_dir "Source/Bayonetta2" "Quality/Bayonetta2_2160p" 3840 2160
build_dir "Source/Bayonetta2" "Quality/Bayonetta2_900p" 1600 900
build_dir "Source/BreathOfTheWild" "Enthusiast/BreathOfTheWild_2880p" 5120 2880
build_dir "Source/BreathOfTheWild" "Enthusiast/BreathOfTheWild_4320p" 7680 4320
build_dir "Source/BreathOfTheWild" "Enthusiast/BreathOfTheWild_5760p" 10240 5760
build_dir "Source/BreathOfTheWild" "Performance/BreathOfTheWild_360p" 640 360
build_dir "Source/BreathOfTheWild" "Performance/BreathOfTheWild_540p" 960 540
build_dir "Source/BreathOfTheWild" "Quality/BreathOfTheWild_1080p" 1920 1080
build_dir "Source/BreathOfTheWild" "Quality/BreathOfTheWild_1080pUW" 2560 1080
build_dir "Source/BreathOfTheWild" "Quality/BreathOfTheWild_1440p" 2560 1440
build_dir "Source/BreathOfTheWild" "Quality/BreathOfTheWild_1440pUW" 3440 1440
build_dir "Source/BreathOfTheWild" "Quality/BreathOfTheWild_1800p" 3200 1800
build_dir "Source/BreathOfTheWild" "Quality/BreathOfTheWild_2160p" 3840 2160
build_dir "Source/BreathOfTheWild" "Quality/BreathOfTheWild_2160pUW" 5120 2160
build_dir "Source/BreathOfTheWild" "Quality/BreathOfTheWild_900p" 1600 900
build_dir "Source/CaptainToad" "Enthusiast/CaptainToad_2880p" 5120 2880
build_dir "Source/CaptainToad" "Enthusiast/CaptainToad_4320p" 7680 4320
build_dir "Source/CaptainToad" "Enthusiast/CaptainToad_5760p" 10240 5760
build_dir "Source/CaptainToad" "Performance/CaptainToad_360p" 640 360
build_dir "Source/CaptainToad" "Performance/CaptainToad_540p" 960 540
build_dir "Source/CaptainToad" "Quality/CaptainToad_1080p" 1920 1080
build_dir "Source/CaptainToad" "Quality/CaptainToad_1080pUW" 2560 1080
build_dir "Source/CaptainToad" "Quality/CaptainToad_1440p" 2560 1440
build_dir "Source/CaptainToad" "Quality/CaptainToad_1440pUW" 3440 1440
build_dir "Source/CaptainToad" "Quality/CaptainToad_1800p" 3200 1800
build_dir "Source/CaptainToad" "Quality/CaptainToad_2160p" 3840 2160
build_dir "Source/CaptainToad" "Quality/CaptainToad_2160pUW" 5120 2160
build_dir "Source/CaptainToad" "Quality/CaptainToad_900p" 1600 900
build_dir "Source/HyruleWarriors" "Enthusiast/HyruleWarriors_2880p" 5120 2880
build_dir "Source/HyruleWarriors" "Enthusiast/HyruleWarriors_4320p" 7680 4320
build_dir "Source/HyruleWarriors" "Enthusiast/HyruleWarriors_5760p" 10240 5760
build_dir "Source/HyruleWarriors" "Performance/HyruleWarriors_360p" 640 360
build_dir "Source/HyruleWarriors" "Performance/HyruleWarriors_540p" 960 540
build_dir "Source/HyruleWarriors" "Quality/HyruleWarriors_1080p" 1920 1080
build_dir "Source/HyruleWarriors" "Quality/HyruleWarriors_1080pUW" 2560 1080
build_dir "Source/HyruleWarriors" "Quality/HyruleWarriors_1440p" 2560 1440
build_dir "Source/HyruleWarriors" "Quality/HyruleWarriors_1440pUW" 3440 1440
build_dir "Source/HyruleWarriors" "Quality/HyruleWarriors_1800p" 3200 1800
build_dir "Source/HyruleWarriors" "Quality/HyruleWarriors_2160p" 3840 2160
build_dir "Source/HyruleWarriors" "Quality/HyruleWarriors_2160pUW" 5120 2160
build_dir "Source/HyruleWarriors" "Quality/HyruleWarriors_900p" 1600 900
build_dir "Source/MarioKart8" "Enthusiast/MarioKart8_2880p" 5120 2880
build_dir "Source/MarioKart8" "Enthusiast/MarioKart8_4320p" 7680 4320
build_dir "Source/MarioKart8" "Enthusiast/MarioKart8_5760p" 10240 5760
build_dir "Source/MarioKart8" "Performance/MarioKart8_360p" 640 360
build_dir "Source/MarioKart8" "Performance/MarioKart8_540p" 960 540
build_dir "Source/MarioKart8" "Quality/MarioKart8_1080p" 1920 1080
build_dir "Source/MarioKart8" "Quality/MarioKart8_1080pUW" 2560 1080
build_dir "Source/MarioKart8" "Quality/MarioKart8_1440p" 2560 1440
build_dir "Source/MarioKart8" "Quality/MarioKart8_1440pUW" 3440 1440
build_dir "Source/MarioKart8" "Quality/MarioKart8_1800p" 3200 1800
build_dir "Source/MarioKart8" "Quality/MarioKart8_2160p" 3840 2160
build_dir "Source/MarioKart8" "Quality/MarioKart8_2160pUW" 5120 2160
build_dir "Source/MarioKart8" "Quality/MarioKart8_900p" 1600 900
build_dir "Source/Splatoon" "Enthusiast/Splatoon_2880p" 5120 2880
build_dir "Source/Splatoon" "Enthusiast/Splatoon_4320p" 7680 4320
build_dir "Source/Splatoon" "Enthusiast/Splatoon_5760p" 10240 5760
build_dir "Source/Splatoon" "Performance/Splatoon_360p" 640 360
build_dir "Source/Splatoon" "Performance/Splatoon_540p" 960 540
build_dir "Source/Splatoon" "Quality/Splatoon_1080p" 1920 1080
build_dir "Source/Splatoon" "Quality/Splatoon_1080pUW" 2560 1080
build_dir "Source/Splatoon" "Quality/Splatoon_1440p" 2560 1440
build_dir "Source/Splatoon" "Quality/Splatoon_1440pUW" 3440 1440
build_dir "Source/Splatoon" "Quality/Splatoon_1800p" 3200 1800
build_dir "Source/Splatoon" "Quality/Splatoon_2160p" 3840 2160
build_dir "Source/Splatoon" "Quality/Splatoon_2160pUW" 5120 2160
build_dir "Source/Splatoon" "Quality/Splatoon_900p" 1600 900
build_dir "Source/SuperMario3DWorld" "Enthusiast/SuperMario3DWorld_2880p" 5120 2880
build_dir "Source/SuperMario3DWorld" "Enthusiast/SuperMario3DWorld_4320p" 7680 4320
build_dir "Source/SuperMario3DWorld" "Enthusiast/SuperMario3DWorld_5760p" 10240 5760
build_dir "Source/SuperMario3DWorld" "Performance/SuperMario3DWorld_360p" 640 360
build_dir "Source/SuperMario3DWorld" "Performance/SuperMario3DWorld_540p" 960 540
build_dir "Source/SuperMario3DWorld" "Quality/SuperMario3DWorld_1080p" 1920 1080
build_dir "Source/SuperMario3DWorld" "Quality/SuperMario3DWorld_1080pUW" 2560 1080
build_dir "Source/SuperMario3DWorld" "Quality/SuperMario3DWorld_1440p" 2560 1440
build_dir "Source/SuperMario3DWorld" "Quality/SuperMario3DWorld_1440pUW" 3440 1440
build_dir "Source/SuperMario3DWorld" "Quality/SuperMario3DWorld_1800p" 3200 1800
build_dir "Source/SuperMario3DWorld" "Quality/SuperMario3DWorld_2160p" 3840 2160
build_dir "Source/SuperMario3DWorld" "Quality/SuperMario3DWorld_2160pUW" 5120 2160
build_dir "Source/SuperMario3DWorld" "Quality/SuperMario3DWorld_900p" 1600 900
