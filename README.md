# NBM-MAPPING
A repository dedicated to working with the National Blend of Models.

### Requirements
This is tested and works with Ubuntu 20.04 (LTS) x64.

### Getting Started
* Run `wgrib-install.sh` to install wgrib2 and necessary dependencies.
* Install `pygrib` using `pip3` (you should be using `python3`). More: https://github.com/jswhit/pygrib/issues/115
* Install `matplotlib` basemaps:
  ```
  sudo apt-get install libgeos-3.5.0
  sudo apt-get install libgeos-dev
  pip install https://github.com/matplotlib/basemap/archive/master.zip
  ```

  https://stackoverflow.com/questions/40374441/python-basemap-module-impossible-to-import