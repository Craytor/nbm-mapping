import pygrib
import matplotlib.pyplot as plt
import matplotlib.colors as colors
from mpl_toolkits.basemap import Basemap
from mpl_toolkits.basemap import shiftgrid
import numpy as np

def M_to_IN(m):
    return m * 39.3701

plt.figure(figsize=(12,8))

grbs = pygrib.open('data/test/blend.t03z.core.f015.co.grib2')

# selects 51:Total snowfall:m (accum):lambert:surface:level 0:fcst time 10-11 hrs (accum):from 202011220300
grb = grbs.select()[64]
data = M_to_IN(grb.values)

lat,lon = grb.latlons()

m = Basemap(projection='merc',lat_ts=10,llcrnrlon=lon.min(), urcrnrlon=lon.max(),llcrnrlat=lat.min(),urcrnrlat=lat.max(), resolution='l')
 
x, y = m(lon,lat)

qpfcontours = ('#BFBFBF', '#6E6E6E', '#83D5FF', '#460097', '#FF0086', '#FF7CC5', '#85F2F5', '#66BBCE')
clevs = [0.1, 1, 2.0, 6.0, 10.0, 12.00, 18.00, 24.00]
 
cs = m.contourf(x,y,data,clevs,colors=qpfcontours,zorder=4, extend='max')

m.drawstates()
m.bluemarble()
m.drawcoastlines()
m.drawcountries()
 
plt.colorbar(cs,orientation='vertical',ticks=clevs)
plt.title('Snowfall over 1 hr') # Set the name of the variable to plot
plt.savefig('test.png') # Set the output file name