import netCDF4 as nc
import pandas as pd
import numpy as np
import scipy.stats as stats
import os
import subprocess
from datetime import datetime
import time


def make_ini_zsm(rootdir='/leader/user/zsm/',
            cdl_path='/home/zsm/toy_offline/CDL/ini_fennel_ucla.cdl',
            clm_path='/leader/user/zsm/TWS2_L1_ucla_new/TWS_L1_his_201903_full.nc', 
            output_path='/sugon7/zsm/croco_tools_xmd1204/CROCO_FILES/TWS2/bio_TWS_L1_ini.nc',
            Is=None, Js=None, gauss=True, std=3.98942):
            
    command = 'ncgen ' + cdl_path + ' -o ' + output_path
    print(command)
    subprocess.call(command, shell=True)
    while not os.path.exists(output_path):
        time.sleep(1)
    ibio = nc.Dataset(output_path, 'a')
    clm = nc.Dataset(clm_path)
    
    ibio.Author = 'Siming'
    ibio.Created = datetime.now().isoformat()
    ibio.type = 'ROMS INI file'       
    ibio['ocean_time'].units = 'seconds since   2000-01-01 00:00:00'
    ibio['ocean_time'].calendar = 'gregorian_proleptic'
    ibio['ocean_time'].field = 'time, scalar, series'
    ibio.variables['ocean_time'][0] = 604713600
    ibio['Vtransform'][:] = 2
    ibio['Vstretching'][:] = 4
    ibio['theta_s'][:] = 6.0
    ibio['theta_b'][:] = 6.0    
    ibio['Tcline'][:] = 10.0
    ibio['hc'][:] = 2.0
    ### from clm
    ibio['zeta'][0,:,:]  = clm['zeta'][0,:,:]
    ibio['ubar'][0,:,:] = clm['ubar'][0,:,:]
    ibio['vbar'][0,:,:] = clm['vbar'][0,:,:]
    ibio['u'][0,:,:,:] = clm['u'][0,:,:,:]
    ibio['v'][0,:,:,:] = clm['v'][0,:,:,:]
    ibio['temp'][0,:,:,:] = clm['temp'][0,:,:,:]
    ibio['salt'][0,:,:,:] = clm['salt'][0,:,:,:]
    
    ibio.close()
if __name__ == '__main__':

    make_ini_zsm(rootdir='/leader/user/zsm/')
