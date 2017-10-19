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
		php "$f" "${rest[@]}" > "$outName"
		if [ $? -ne 0 ]; then
			rm "$outName"
		fi
	done
}

res_360p=( "Performance" 640 360 )
res_540p=( "Performance" 960 540 )
res_720p=( "Performance" 1280 720 )
res_900p=( "Quality" 1600 900 )
res_1080p=( "Quality" 1920 1080 )
res_1080p219=( "Quality" 2560 1080 )
res_1440p=( "Quality" 2560 1440 )
res_1440p219=( "Quality" 3440 1440 )
res_1800p=( "Quality" 3200 1800  )
res_2160p=( "Quality" 3840 2160  )
res_2160p219=( "Quality" 5120 2160 )
res_2880p=( "Enthusiast" 5120 2880 )
res_4320p=( "Enthusiast" 7680 4320 )
res_5760p=( "Enthusiast" 10240 5760 )

std_respack () {
	gameName=$1
	params=( "$@" )
	rest=( "${params[@]:1}" )
	
	#echo "std_respack $gameName"
	for arrg in "${rest[@]}"
	do
		resvarname="res_${arrg}[@]"
		if [ -v "$resvarname" ]; then
			resdata=( "${!resvarname}" )
			prefix="${resdata[0]}"
			subparams=( "${resdata[@]:1}" )
						
			inFolder="Source/$gameName"
			outFolder="${gameName}_${arrg}"
			if [ -n "$prefix" ]; then
				outFolder="$prefix/$outFolder"
			fi
			
			#width="${subparams[0]}"
			#height="${subparams[1]}"
			#echo "$arrg w: $width h: $height inFolder: $inFolder outFolder: $outFolder"
			build_dir "$inFolder" "$outFolder" "${subparams[@]}"
		else
			echo "$arrg resolution not defined, define it in build.sh"
			exit 1
		fi
	done
}

res16by9=( "360p" "540p" "720p" "900p" "1080p" "1440p" "1800p" "2160p" "2880p" "4320p" "5760p" )
res21by9=( "1080p219" "1440p219" "2160p219" )

std_respack "Bayonetta" "${res16by9[@]}"
std_respack "Bayonetta2" "${res16by9[@]}"
std_respack "BreathOfTheWild" "${res16by9[@]}" "${res21by9[@]}"
std_respack "CaptainToad" "${res16by9[@]}" "${res21by9[@]}"
std_respack "ColorSplash" "${res16by9[@]}"
std_respack "FistoftheNorthStar" "${res16by9[@]}"
std_respack "HyruleWarriors" "${res16by9[@]}"
std_respack "KirbyRainbowCurse" "${res16by9[@]}"
std_respack "MarioKart8" "${res16by9[@]}" "${res21by9[@]}"
std_respack "MarioTennis" "${res16by9[@]}"
std_respack "MightyNumber9" "${res16by9[@]}"
std_respack "PokkenTournament" "${res16by9[@]}"
std_respack "SonicLostWorld" "${res16by9[@]}" "${res21by9[@]}"
std_respack "Splatoon" "${res16by9[@]}" "${res21by9[@]}"
std_respack "SuperMario3DWorld" "${res16by9[@]}" "${res21by9[@]}"
std_respack "SuperSmashBros" "${res16by9[@]}"
std_respack "TropicalFreeze" "${res16by9[@]}" "${res21by9[@]}"
std_respack "TwilightPrincessHD" "${res16by9[@]}"
std_respack "WarriorsOrochi3" "${res16by9[@]}"
std_respack "WindWakerHD" "${res16by9[@]}" "${res21by9[@]}"
std_respack "Wonderful101" "${res16by9[@]}"
std_respack "WoollyWorld" "${res16by9[@]}" "${res21by9[@]}"
std_respack "XenobladeX" "${res16by9[@]}" "${res21by9[@]}"
