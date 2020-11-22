#!/bin/bash
# README: https://rda.ucar.edu/datasets/ds083.2/software/wgrib2_install+.txt
apt-get update
apt-get install -y build-essential libaec-dev zlib1g-dev libcurl4-openssl-dev libboost-dev curl wget zip unzip bzip2 gfortran gcc g++ m4 csh netcdf-bin hdf4-tools hdf5-tools jasper libpng-dev ncl-ncarg libnetcdf-dev mpich

export CC=gcc
export FC=gfortran

cd /usr/local
sudo wget ftp://ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/wgrib2.tgz -O /usr/local/wgrib2.tgz
sudo tar -xzvf wgrib2.tgz

cd grib2
#Must do: sudo CC=gcc FC=gfortran make so sudo can see env variables
sudo CC=gcc FC=gfortran make