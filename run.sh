#!/bin/bash
url=http://nomads.ncep.noaa.gov/pub/data/nccf/com/blend/prod

# Downloads selected file. If it does not exist, it sleeps and tries again.
downloadFile(){
    remoteFile=$1
    outputFile=$2

    STATUS=$(curl -s --create-dirs -o $outputFile -w '%{http_code}' $remoteFile)

    if [ $STATUS -eq 404 ]; then
        echo $remoteFile
        echo "File not available yet... retrying in 60 seconds"
        sleep 60
        downloadFile $remoteFile $outputFile
    fi
    wait
}

for i in 24; do
    FHour=$i
    if [ $i -lt 10 ]; then
        FHour="0"$i
    fi

    echo "Checking if ${FHour} already exists" 
    if [ ! -f "data/nbm/blend.t01z.core.f001.co.grib2" ]; then
		echo "Downloading ${FHour}..."
		downloadFile "https://nomads.ncep.noaa.gov/pub/data/nccf/com/blend/prod/blend.20201122/01/core/blend.t01z.core.f001.co.grib2" "data/nbm/blend.t01z.core.f001.co.grib2"
		downloadFile "https://nomads.ncep.noaa.gov/pub/data/nccf/com/blend/prod/blend.20201122/01/core/blend.t01z.core.f001.co.grib2.idx" "data/nbm/blend.t01z.core.f001.co.grib2.idx"
		wait
    fi

    wait
done
