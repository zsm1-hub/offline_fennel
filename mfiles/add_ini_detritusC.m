function add_ini_detritusC(inifile);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  function add_ini_detritus(inifile);
%
%  Add zooplancton (mMol N m-3) in a ROMS climatology file.
%  take the chlorophyll (mg C) from the initial file and
%  multiply by the ratio chlorophyll / phytoplancton derived
%  from previous simulations (Gruber et al., 2005)
%
%  detritus = 0.04;

%  input:
%    
%    inifile      : roms initial file to process (netcdf)
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
%  Updated in 2005 by Patrick Marchesiello
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
disp('Add_ini_Detritus: creating variable and attribute')
%
% open the initial file  
% 
nc=netcdf(inifile,'write');
time= nc{'ocean_time'}(:);
tlen=length(time);
%
% loop on time
%
for l=1:tlen
  disp(['time index: ',num2str(l),' of total: ',num2str(tlen)])
  nc{'LdetritusC'}(l,:,:,:)=0.15;
  nc{'SdetritusC'}(l,:,:,:)=0.3;
end
close(nc);
return
