%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Build a ROMS boundary file
%
%  Extrapole and interpole temperature and salinity from a
%  climatology to get boundary conditions for
%  ROMS (boundary netcdf file) .
%  Get the velocities and sea surface elevation via a 
%  geostrophic computation.
%
%  Data input format (netcdf):
%     temperature(T, Z, Y, X)
%     T : time [Months]
%     Z : Depth [m]
%     Y : Latitude [degree north]
%     X : Longitude [degree east]
%
%  Data source : IRI/LDEO climate Data Library (World Ocean Atlas 1998)
%    http://ingrid.ldgo.columbia.edu/
%    http://iridl.ldeo.columbia.edu/SOURCES/.NOAA/.NODC/.WOA98/
% 
%  Further Information:  
%  http://www.brest.ird.fr/Roms_tools/
%  
%  This file is part of ROMSTOOLS
%
%  ROMSTOOLS is free software; you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published
%  by the Free Software Foundation; either version 2 of the License,
%  or (at your option) any later version.
%
%  ROMSTOOLS is distributed in the hope that it will be useful, but
%  WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
%
%  You should have received a copy of the GNU General Public License
%  along with this program; if not, write to the Free Software
%  Foundation, Inc., 59 Temple Place, Suite 330, Boston,
%  MA  02111-1307  USA
%
%  Copyright (c) 2005-2006 by Pierrick Penven 
%  e-mail:Pierrick.Penven@ird.fr  
%
%  Updated    1-Sep-2006 by Pierrick Penven
%  Pierrick Penven, IRD, 2005.                                    %
%  Olivier Aumont the master, IRD, 2006.                          %
%  Patricio Marchesiello, chief, IRD, 2007.                       %
%  Christophe Eugene Raoul Menkes, the slave, IRD, 2007.          %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  WARNING !!!!!! THIS ASSUMES THAT THE TIME FOR PISCES INITIAL.
%  IS THE SAME AS THE CLIM T AND S. ELSE, CHANGE THE PROGRAM
%
clear all
close all
%%%%%%%%%%%%%%%%%%%%% USERS DEFINED VARIABLES %%%%%%%%%%%%%%%%%%%%%%%%
%
% Common parameters
%
crocotools_param  %lwx

%
% Set times and cycles: monthly climatology for all data
%
woa_cycle_bio=365.25;    %wsc
woa_time_bio=(15.2188:30.4375:350.0313);%wsc
time=woa_time_bio;             % time 
cycle=woa_cycle_bio;           % cycle 
SeaWifs_time=time;
SeaWifs_cycle=cycle;
%
%  Data climatologies file names:
%
DATADIR='/powerleader/user/ljt/DATASETS_CROCOTOOLS/'; %lwx
no3_seas_data  = [DATADIR,'WOAPISCES/no3_seas.cdf'];
no3_ann_data   = [DATADIR,'WOAPISCES/no3_ann.cdf'];
po4_seas_data  = [DATADIR,'WOAPISCES/po4_seas.cdf'];
po4_ann_data   = [DATADIR,'WOAPISCES/po4_ann.cdf'];
o2_seas_data   = [DATADIR,'WOAPISCES/o2_seas.cdf'];
o2_ann_data    = [DATADIR,'WOAPISCES/o2_ann.cdf'];
sio3_seas_data = [DATADIR,'WOAPISCES/sio3_seas.cdf'];
sio3_ann_data  = [DATADIR,'WOAPISCES/sio3_ann.cdf'];
dic_seas_data  = [DATADIR,'WOAPISCES/dic_seas.cdf'];
dic_ann_data   = [DATADIR,'WOAPISCES/dic_ann.cdf'];
talk_seas_data = [DATADIR,'WOAPISCES/talk_seas.cdf'];
talk_ann_data  = [DATADIR,'WOAPISCES/talk_ann.cdf'];
doc_seas_data  = [DATADIR,'WOAPISCES/doc_seas.cdf'];
doc_ann_data   = [DATADIR,'WOAPISCES/doc_ann.cdf'];
fer_seas_data  = [DATADIR,'WOAPISCES/fer_seas.cdf'];
fer_ann_data   = [DATADIR,'WOAPISCES/fer_ann.cdf'];
dust_seas_data = [DATADIR,'WOAPISCES/dust_seas.cdf'];
dust_ann_data  = [DATADIR,'WOAPISCES/dust_ann.cdf'];
chlo_seas_data = [DATADIR,'SeaWifs/chla_seas.cdf'];
chlo_ann_data = [DATADIR,'SeaWifs/chla_ann.cdf'];
%
%
%%%%%%%%%%%%%%%%%%% END USERS DEFINED VARIABLES %%%%%%%%%%%%%%%%%%%%%%%
%
% Title
%
disp(' ')
disp([' Making the file: ',bryname])
disp([' Adding the PISCES variables'])
disp(' ')
disp([' Title: ',CROCO_title])
%
% Read in the grid
%
disp(' ')
disp(' Read in the grid...')
nc=netcdf(grdname);
lon=nc{'lon_rho'}(:);
lat=nc{'lat_rho'}(:);
Lp=length(nc('xi_rho'));
Mp=length(nc('eta_rho'));
hmax=max(max(nc{'h'}(:)));
result=close(nc);
%
% Redefine the boundary file
%
%nc=netcdf(bryname);
%time=nc{'bry_time'}(:);
%result=close(nc);
if (makebry)
  disp(' ')
  disp(' Redefine the boundary file...')
  add_bry_fennel(bryname,obc,time,SeaWifs_time,cycle,SeaWifs_cycle,'write');
%  add_bry_fennel(bryname,obc,time,woa_time,cycle,woa_cycle,'write');
end
%
% Redefine the boundary file in Z-coordinates
%
if (makeZbry)
  disp(' ')
  disp(' Redefine the boundary Z-file...')
%
% get Z
%
  nc=netcdf(no3_ann_data);
  Z=nc{'Z'}(:);
  kmax=max(find(Z<hmax))-1;
  Z=Z(1:kmax);
  close(nc)
  add_bry_fennel_Z(biolZbryname,grdname,obc,Z,time,cycle,SeaWifs_time,SeaWifs_cycle,'write');
  disp(' ')
  disp(' Horizontal extrapolations')
%
% Loop on the lateral boundaries 
%
  for obcndx=1:4
    if obc(obcndx)==1
      if obcndx==1
        disp(' Processing southern boundary...')
	suffix='_south';
      elseif obcndx==2
        disp(' Processing eastern boundary...')
	suffix='_east';
      elseif obcndx==3
        disp(' Processing northern boundary...')
	suffix='_north';
      elseif obcndx==4
        disp(' Processing western boundary...')
	suffix='_west';
      end
      disp('  Nitrate...')
      bry_interp_fennel(biolZbryname,lon,lat,no3_seas_data,no3_ann_data,...
               'nitrate',['NO3',suffix],obcndx,Roa);        
      disp('  Phosphate...')
      bry_interp_fennel(biolZbryname,lon,lat,po4_seas_data,po4_ann_data,...
               'phosphate',['PO4',suffix],obcndx,Roa);              
      disp('  Oxygen...')
      bry_interp_fennel(biolZbryname,lon,lat,o2_seas_data,o2_ann_data,...
               'oxygen',['oxygen',suffix],obcndx,Roa);             
      disp('  Total Alkalinity...')
      bry_interp_fennel(biolZbryname,lon,lat,talk_seas_data,talk_ann_data,...
               'talk',['alkalinity',suffix],obcndx,Roa);  
    end
  end
end
%
% Vertical interpolations 
%
if (makebry)
  disp(' ')
  disp(' Vertical interpolations')
%
% Loop on the lateral boundaries 
%
  for obcndx=1:4
    if obc(obcndx)==1
      if obcndx==1
        disp(' Processing southern boundary...')
	suffix='_south';
      elseif obcndx==2
        disp(' Processing eastern boundary...')
	suffix='_east';
      elseif obcndx==3
        disp(' Processing northern boundary...')
	suffix='_north';
      elseif obcndx==4
        disp(' Processing western boundary...')
	suffix='_west';
      end
      disp(' ')
      disp('  Nitrate...')
 
     % vinterp_bry(bryname,grdname,biolZbryname,['NO3',suffix],obcndx,vtransform,stretching);
      vinterp_bry_wsc(bryname,grdname,biolZbryname,['NO3',suffix],obcndx);
      disp(' ')
      disp('  Phosphate...')
     %vinterp_bry(bryname,grdname,biolZbryname,['PO4',suffix],obcndx,vtransform,stretching);
      vinterp_bry_wsc(bryname,grdname,biolZbryname,['PO4',suffix],obcndx);
      disp(' ')
      disp('  Oxygen ...')
     % vinterp_bry(bryname,grdname,biolZbryname,['oxygen',suffix],obcndx,vtransform,stretching);
      vinterp_bry_wsc(bryname,grdname,biolZbryname,['oxygen',suffix],obcndx);
      disp(' ')
      disp('  Total Alkalinity...')
     % vinterp_bry(bryname,grdname,biolZbryname,['TALK',suffix],obcndx,vtransform,stretching);
      vinterp_bry_wsc(bryname,grdname,biolZbryname,['alkalinity',suffix],obcndx);
      disp(' ')
      disp('  chlorophyll...')
      add_chla_bry(bryname,grdname,chlo_seas_data,SeaWifs_cycle,Roa,obcndx,vtransform,stretching);
    end
  end


   nc=netcdf(bryname,'write');
   if obc(2)==1
   nc{'phyt_east'}(:,:,:) = 0.5*nc{'chlo_east'}(:,:,:) ; %lwx,case :600*1200 grid resolution
   nc{'zoop_east'}(:,:,:) = 0.2*nc{'chlo_east'}(:,:,:);
   end
   close(nc)

end
disp('Complete!')

%
% Make a few plots
%
if makeplot==1
disp(' ')
disp(' Make a few plots...')
test_bry(bryname,grdname,'NO3',1,obc)
figure
test_bry(bryname,grdname,'PO4',1,obc)
figure
test_bry(bryname,grdname,'Si',1,obc)
figure
test_bry(bryname,grdname,'O2',1,obc)
figure
test_bry(bryname,grdname,'DIC',6,obc)
figure
test_bry(bryname,grdname,'TALK',6,obc)
figure
test_bry(bryname,grdname,'DOC',6,obc)
figure
test_bry(bryname,grdname,'FER',6,obc)
end
%
% End
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
