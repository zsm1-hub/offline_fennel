function add_chla_bry(bryfile,gridfile,seas_datafile,cycle,Roa,obcndx,transform,stretch);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  function add_chla(climfile,gridfile,seas_datafile,cycle);
%
%  Add chlorophyll (mg C) in a ROMS climatology file.
%  take seasonal data for the surface levels and extrapole 
%  using Morel and Berthon (1989) parameterization for the
%  lower levels. warning ! the unit is (micro mole/l) in the
%  dataset.
%  ref:  Morel and Berthon, Surface pigments, algal biomass
%        profiles, and potential production of the euphotic layer:
%        Relationships reinvestigated in view of remote-sensing 
%        applications. Limnol. Oceanogr., 34, 1989, 1545-1562.
%
%  input:
%    
%    climfile      : roms climatology file to process (netcdf)
%    gridfile      : roms grid file (netcdf)
%    seas_datafile : regular longitude - latitude - z seasonal data 
%                    file used for the upper levels  (netcdf)
%    ann_datafile  : regular longitude - latitude - z annual data 
%                    file used for the lower levels  (netcdf)
%    cycle         : time length (days) of climatology cycle (ex:360 for
%                    annual cycle) - 0 if no cycle.
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
%  Copyright (c) 2001-2006 by Pierrick Penven 
%  e-mail:Pierrick.Penven@ird.fr  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
disp('Add_chla: creating variable and attribute')
default=NaN;
%
% read in the datafile 
%
ncseas=netcdf(seas_datafile);
x=ncseas{'X'}(:);
y=ncseas{'Y'}(:);
t=ncseas{'T'}(:);
tlen=length(t);
%
% open the grid file  
% 
ng=netcdf(gridfile);
lon=ng{'lon_rho'}(:);
%lon(lon<0)=lon(lon<0)+360;
lat=ng{'lat_rho'}(:);
h=ng{'h'}(:);
close(ng);

[M,L]=size(lon);
dl=2.;
minlon=min(min(lon))-dl;
maxlon=max(max(lon))+dl;
minlat=min(min(lat))-dl;
maxlat=max(max(lat))+dl;
imin=max(find(x<=minlon));
imax=min(find(x>=maxlon));
jmin=max(find(y<=minlat));
jmax=min(find(y>=maxlat));
x=x(imin:imax);
y=y(jmin:jmax);
%

nc=netcdf(bryfile,'write');
theta_s = nc{'theta_s'}(:);
theta_b =  nc{'theta_b'}(:);
Tcline  =  nc{'Tcline'}(:);
N =  length(nc('s_rho'));
vtransform = nc{'Vtransform'}(:); % lwx
if ~exist('vtransform')
    vtransform=1; %Old Vtransform
    disp([' NO VTRANSFORM parameter found'])
    disp([' USE VTRANSFORM default value vtransform = 1'])
end

realtime=nc{'bry_time'}(:);%wsc
rtime=realtime+datenum(1900,1,1);%wsc
% Get the missing values
%
missval=ncseas{'chlorophyll'}.missing_value(:);
%
% loop on time
%
%for l=1:tlen
%disp(['time index: ',num2str(l),' of total: ',num2str(tlen)])
for i=1:length(rtime) % lwx,for -> parfor
  month=datestr(rtime(i),'mm');
  disp(['Current progress: ',num2str(i),' of ',num2str(length(rtime)), ...
	' ; month: ',month,' ; boundary :',num2str(obcndx)])
  mmm=str2num(month);
  if mmm>=1 & mmm<=3 %t=1.5
    l=1;
  elseif mmm>=4 & mmm<=6 %t=4.5
    l=2;
  elseif mmm>=7 & mmm<=9 %t=7.5
    l=3;
  elseif mmm>=10 & mmm<=12 %t=10.5
    l=4;
  end
%
% extrapole the annual dataset on the horizontal roms grid
%
  %disp('Add_chla: horizontal interpolation of surface data')
  surfchla=squeeze(ncseas{'chlorophyll'}(l,jmin:jmax,imin:imax));
  surfchla=get_missing_val(x,y,surfchla,missval,Roa,default);
  surfchlaroms=interp2(x,y,surfchla,lon,lat);
%
% extrapole the chlorophyll on the vertical
%
  zroms=zlevs(h,0.*h,theta_s,theta_b,Tcline,N,'r',vtransform); %lwx added var 'vtransform'
  %disp(['Add_chla: vertical ',...
  %'extrapolation of chlorophyll'])
  chlaroms=extr_chlo(surfchlaroms,zroms);
if obcndx==2
   nc{'chlol_east'}(i,:,:)=chlaroms(:,:,L); % lwx, all chlorophyll located at east
end
end

close(nc);
close(ncseas);

return
