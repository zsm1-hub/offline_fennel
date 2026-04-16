function add_bry_fennel(bryname,obc,time,time1,cycle,cycle1,clobber);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                 
% function add_bry_pisces(bryname,grdname,title,obc...            
%                         theta_s,theta_b,hc,N,...                
%                         time,cycle,clobber);                    
%                                                                 
%   This function create the header of a Netcdf climatology       
%   file.                                                         
%                                                                 
%   Input:                                                        
%                                                                 
%   bryname      Netcdf climatology file name (character string). 
%   obc          open boundaries flag (1=open , [S E N W]).       
%   time         time.(vector)                                    
%   cycle        Length (days) for cycling the climatology.(Real) 
%   clobber      Switch to allow or not writing over an existing  
%                file.(character string)                          
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
%  Pierrick Penven, IRD, 2005.                                    %
%  Olivier Aumont the master, IRD, 2006.                          %
%  Patricio Marchesiello, chief, IRD, 2007.                       %
%  Christophe Eugene Raoul Menkes, the slave, IRD, 2007.          %
%                                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' ')
disp([' Adding PISCES data into file : ',bryname])
disp(' ')
%
%  Redefine the boundary file
%
nc = netcdf(bryname,clobber);
result = redef(nc);
%
%  Create dimensions
%

nc('no3_time')  = length(time);
nc('po4_time')  = length(time);
nc('talk_time') = length(time);
nc('oxygen_time')   = length(time);
nc('chlo_time') = length(time1);
nc('nh4_time') = length(time);
nc('phyto_time') = length(time1);
nc('zoop_time') = length(time1);
nc('LdetritusN_time') = length(time);
nc('SdetritusN_time') = length(time);
nc('LdetritusC_time') = length(time);
nc('SdetritusC_time') = length(time);
nc('tic_time') = length(time);
nc('one') = 1;
%
%  Create variables and attributes
%

%
nc{'talk_time'} = ncdouble('talk_time') ;
nc{'talk_time'}.long_name = ncchar('time for TALK climatology');
nc{'talk_time'}.long_name = 'time for TALK climatology';
nc{'talk_time'}.units = ncchar('day');
nc{'talk_time'}.units = 'day';
nc{'talk_time'}.cycle_length = cycle;%
%
nc{'no3_time'} = ncdouble('no3_time') ;
nc{'no3_time'}.long_name = ncchar('time for NO3 climatology')
nc{'no3_time'}.long_name = 'time for NO3 climatology';
nc{'no3_time'}.units = ncchar('day');
nc{'no3_time'}.units = 'day';
nc{'no3_time'}.cycle_length = cycle;%
%
nc{'po4_time'} = ncdouble('po4_time') ;
nc{'po4_time'}.long_name = ncchar('time for PO4 climatology');
nc{'po4_time'}.long_name = 'time for PO4 climatology';
nc{'po4_time'}.units = ncchar('day');
nc{'po4_time'}.units = 'day';
nc{'po4_time'}.cycle_length = cycle;%
%
nc{'oxygen_time'} = ncdouble('oxygen_time') ;
nc{'oxygen_time'}.long_name = ncchar('time for O2 climatology');
nc{'oxygen_time'}.long_name = 'time for O2 climatology';
nc{'oxygen_time'}.units = ncchar('day');
nc{'oxygen_time'}.units = 'day';
nc{'oxygen_time'}.cycle_length = cycle;%
%
nc{'chlo_time'} = ncdouble('chlo_time') ;
nc{'chlo_time'}.long_name = ncchar('time for chlorophyll climatology');
nc{'chlo_time'}.long_name = 'time for chlorophyll climatology';
nc{'chlo_time'}.units = ncchar('day');
nc{'chlo_time'}.units = 'day';
nc{'chlo_time'}.cycle_length = cycle;%
%
nc{'nh4_time'} = ncdouble('nh4_time') ;
nc{'nh4_time'}.long_name = ncchar('time for nh4 climatology');
nc{'nh4_time'}.long_name = 'time for nh4 climatology';
nc{'nh4_time'}.units = ncchar('day');
nc{'nh4_time'}.units = 'day';
nc{'nh4_time'}.cycle_length = cycle;%
%
nc{'phyto_time'} = ncdouble('phyto_time') ;
nc{'phyto_time'}.long_name = ncchar('time for phytoplankton climatology');
nc{'phyto_time'}.long_name = 'time for phytoplankton climatology';
nc{'phyto_time'}.units = ncchar('day');
nc{'phyto_time'}.units = 'day';
nc{'phyto_time'}.cycle_length = cycle;%
%
nc{'zoop_time'} = ncdouble('zoop_time') ;
nc{'zoop_time'}.long_name = ncchar('time for zooplankton climatology');
nc{'zoop_time'}.long_name = 'time for phytoplankton climatology';
nc{'zoop_time'}.units = ncchar('day');
nc{'zoop_time'}.units = 'day';
nc{'zoop_time'}.cycle_length = cycle;%
%
nc{'LdetritusN_time'} = ncdouble('LdetritusN_time') ;
nc{'LdetritusN_time'}.long_name = ncchar('time for LdetritusN climatology');
nc{'LdetritusN_time'}.long_name = 'time for LdetritusN climatology';
nc{'LdetritusN_time'}.units = ncchar('day');
nc{'LdetritusN_time'}.units = 'day';
nc{'LdetritusN_time'}.cycle_length = cycle;%
%
nc{'SdetritusN_time'} = ncdouble('SdetritusN_time') ;
nc{'SdetritusN_time'}.long_name = ncchar('time for SdetritusN climatology');
nc{'SdetritusN_time'}.long_name = 'time for SdetritusN climatology';
nc{'SdetritusN_time'}.units = ncchar('day');
nc{'SdetritusN_time'}.units = 'day';
nc{'SdetritusN_time'}.cycle_length = cycle;%
%
nc{'LdetritusC_time'} = ncdouble('LdetritusC_time') ;
nc{'LdetritusC_time'}.long_name = ncchar('time for LdetritusC climatology');
nc{'LdetritusC_time'}.long_name = 'time for LdetritusC climatology';
nc{'LdetritusC_time'}.units = ncchar('day');
nc{'LdetritusC_time'}.units = 'day';
nc{'LdetritusC_time'}.cycle_length = cycle;%
%
nc{'SdetritusC_time'} = ncdouble('SdetritusC_time') ;
nc{'SdetritusC_time'}.long_name = ncchar('time for SdetritusC climatology');
nc{'SdetritusC_time'}.long_name = 'time for SdetritusC climatology';
nc{'SdetritusC_time'}.units = ncchar('day');
nc{'SdetritusC_time'}.units = 'day';
nc{'SdetritusC_time'}.cycle_length = cycle;%
%
nc{'tic_time'} = ncdouble('tic_time') ;
nc{'tic_time'}.long_name = ncchar('time for Total inorganic carbon climatology');
nc{'tic_time'}.long_name = 'time for Total inorganic carbon climatology';
nc{'tic_time'}.units = ncchar('day');
nc{'tic_time'}.units = 'day';
nc{'tic_time'}.cycle_length = cycle;%


if obc(1)==1
%
%   Southern boundary
%
  nc{'NO3_south'} = ncdouble('no3_time','s_rho','xi_rho') ;
  nc{'NO3_south'}.long_name = ncchar('southern boundary NO3');
  nc{'NO3_south'}.long_name = 'southern boundary NO3';
  nc{'NO3_south'}.units = ncchar('mMol N m-3');
  nc{'NO3_south'}.units = 'mMol N m-3';
%
  nc{'PO4_south'} = ncdouble('po4_time','s_rho','xi_rho') ;
  nc{'PO4_south'}.long_name = ncchar('southern boundary PO4');
  nc{'PO4_south'}.long_name = 'southern boundary PO4';
  nc{'PO4_south'}.units = ncchar('mMol P m-3');
  nc{'PO4_south'}.units = 'mMol P m-3';
%
  nc{'oxygen_south'} = ncdouble('oxygen_time','s_rho','xi_rho') ;
  nc{'oxygen_south'}.long_name = ncchar('southern boundary O2');
  nc{'oxygen_south'}.long_name = 'southern boundary O2';
  nc{'oxygen_south'}.units = ncchar('mMol O m-3');
  nc{'oxygen_south'}.units = 'mMol O m-3';
%
  nc{'TALK_south'} = ncdouble('talk_time','s_rho','xi_rho') ;
  nc{'TALK_south'}.long_name = ncchar('southern boundary TALK');
  nc{'TALK_south'}.long_name = 'southern boundary TALK';
  nc{'TALK_south'}.units = ncchar('mMol C m-3');
  nc{'TALK_south'}.units = 'mMol C m-3';
%
  nc{'chlorophyll_south'} = ncdouble('chlorophyll_time','s_rho','xi_rho') ;
  nc{'chlorophyll_south'}.long_name = ncchar('southern boundary chlorophyll');
  nc{'chlorophyll_south'}.long_name = 'southern boundary chlorophyll';
  nc{'chlorophyll_south'}.units = ncchar('mMol chlo m-3');
  nc{'chlorophyll_south'}.units = 'mMol chlo m-3';
%
  nc{'NH4_south'} = ncdouble('nh4_time','s_rho','xi_rho') ;
  nc{'NH4_south'}.long_name = ncchar('southern boundary NH4');
  nc{'NH4_south'}.long_name = 'southern boundary NH4';
  nc{'NH4_south'}.units = ncchar('mMol N m-3');
  nc{'NH4_south'}.units = 'mMol N m-3';
%
  nc{'phytoplankton_south'} = ncdouble('phytoplankton_time','s_rho','xi_rho') ;
  nc{'phytoplankton_south'}.long_name = ncchar('southern boundary phytoplankton');
  nc{'phytoplankton_south'}.long_name = 'southern boundary phytoplankton';
  nc{'phytoplankton_south'}.units = ncchar('mMol N m-3');
  nc{'phytoplankton_south'}.units = 'mMol N m-3';
%
  nc{'zooplankton_south'} = ncdouble('zooplankton_time','s_rho','xi_rho') ;
  nc{'zooplankton_south'}.long_name = ncchar('southern boundary zooplankton');
  nc{'zooplankton_south'}.long_name = 'southern boundary zooplankton';
  nc{'zooplankton_south'}.units = ncchar('mMol N m-3');
  nc{'zooplankton_south'}.units = 'mMol N m-3';
%
  nc{'LdetritusN_south'} = ncdouble('LdetritusN_time','s_rho','xi_rho') ;
  nc{'LdetritusN_south'}.long_name = ncchar('southern boundary LdetritusN');
  nc{'LdetritusN_south'}.long_name = 'southern boundary LdetritusN';
  nc{'LdetritusN_south'}.units = ncchar('mMol N m-3');
  nc{'LdetritusN_south'}.units = 'mMol N m-3';
%
  nc{'SdetritusN_south'} = ncdouble('SdetritusN_time','s_rho','xi_rho') ;
  nc{'SdetritusN_south'}.long_name = ncchar('southern boundary SdetritusN');
  nc{'SdetritusN_south'}.long_name = 'southern boundary SdetritusN';
  nc{'SdetritusN_south'}.units = ncchar('mMol N m-3');
  nc{'SdetritusN_south'}.units = 'mMol N m-3';
%
  nc{'LdetritusC_south'} = ncdouble('LdetritusC_time','s_rho','xi_rho') ;
  nc{'LdetritusC_south'}.long_name = ncchar('southern boundary LdetritusC');
  nc{'LdetritusC_south'}.long_name = 'southern boundary LdetritusC';
  nc{'LdetritusC_south'}.units = ncchar('mMol C m-3');
  nc{'LdetritusC_south'}.units = 'mMol C m-3';
%
  nc{'SdetritusC_south'} = ncdouble('SdetritusC_time','s_rho','xi_rho') ;
  nc{'SdetritusC_south'}.long_name = ncchar('southern boundary LdetritusC');
  nc{'SdetritusC_south'}.long_name = 'southern boundary LdetritusC';
  nc{'SdetritusC_south'}.units = ncchar('mMol C m-3');
  nc{'SdetritusC_south'}.units = 'mMol C m-3';
%
  nc{'TIC_south'} = ncdouble('TIC_time','s_rho','xi_rho') ;
  nc{'TIC_south'}.long_name = ncchar('southern boundary TIC');
  nc{'TIC_south'}.long_name = 'southern boundary TIC';
  nc{'TIC_south'}.units = ncchar('mMol C m-3');
  nc{'TIC_south'}.units = 'mMol C m-3';
%

end
%
if obc(2)==1
%
%   Eastern boundary
%
  nc{'NO3_east'} = ncdouble('no3_time','s_rho','eta_rho') ;
  nc{'NO3_east'}.long_name = ncchar('eastern boundary NO3');
  nc{'NO3_east'}.long_name = 'eastern boundary NO3';
  nc{'NO3_east'}.units = ncchar('mMol N m-3');
  nc{'NO3_east'}.units = 'mMol N m-3';
%
  nc{'PO4_east'} = ncdouble('po4_time','s_rho','eta_rho') ;
  nc{'PO4_east'}.long_name = ncchar('eastern boundary PO4');
  nc{'PO4_east'}.long_name = 'eastern boundary PO4';
  nc{'PO4_east'}.units = ncchar('mMol P m-3');
  nc{'PO4_east'}.units = 'mMol P m-3';
%
 
  nc{'oxygen_east'} = ncdouble('oxygen_time','s_rho','eta_rho') ;
  nc{'oxygen_east'}.long_name = ncchar('eastern boundary O2');
  nc{'oxygen_east'}.long_name = 'eastern boundary O2';
  nc{'oxygen_east'}.units = ncchar('mMol O m-3');
  nc{'oxygen_east'}.units = 'mMol O m-3';
%

  nc{'TALK_east'} = ncdouble('talk_time','s_rho','eta_rho') ;
  nc{'TALK_east'}.long_name = ncchar('eastern boundary TALK');
  nc{'TALK_east'}.long_name = 'eastern boundary TALK';
  nc{'TALK_east'}.units = ncchar('mMol C m-3');
  nc{'TALK_east'}.units = 'mMol C m-3';
%
  nc{'chlorophyll_east'} = ncdouble('chlo_time','s_rho','eta_rho') ;
  nc{'chlorophyll_east'}.long_name = ncchar('east boundary chlorophyll');
  nc{'chlorophyll_east'}.long_name = 'east boundary chlorophyll';
  nc{'chlorophyll_east'}.units = ncchar('mMol chlo m-3');
  nc{'chlorophyll_east'}.units = 'mMol chlo m-3';
%
  nc{'NH4_east'} = ncdouble('nh4_time','s_rho','eta_rho') ;
  nc{'NH4_east'}.long_name = ncchar('east boundary NH4');
  nc{'NH4_east'}.long_name = 'east boundary NH4';
  nc{'NH4_east'}.units = ncchar('mMol N m-3');
  nc{'NH4_east'}.units = 'mMol N m-3';
%
  nc{'phytoplankton_east'} = ncdouble('phyto_time','s_rho','eta_rho') ;
  nc{'phytoplankton_east'}.long_name = ncchar('east boundary phytoplankton');
  nc{'phytoplankton_east'}.long_name = 'east boundary phytoplankton';
  nc{'phytoplankton_east'}.units = ncchar('mMol N m-3');
  nc{'phytoplankton_east'}.units = 'mMol N m-3';
%
  nc{'zooplankton_east'} = ncdouble('zoop_time','s_rho','eta_rho') ;
  nc{'zooplankton_east'}.long_name = ncchar('east boundary zooplankton');
  nc{'zooplankton_east'}.long_name = 'east boundary zooplankton';
  nc{'zooplankton_east'}.units = ncchar('mMol N m-3');
  nc{'zooplankton_east'}.units = 'mMol N m-3';
%
  nc{'LdetritusN_east'} = ncdouble('LdetritusN_time','s_rho','eta_rho') ;
  nc{'LdetritusN_east'}.long_name = ncchar('east boundary LdetritusN');
  nc{'LdetritusN_east'}.long_name = 'east boundary LdetritusN';
  nc{'LdetritusN_east'}.units = ncchar('mMol N m-3');
  nc{'LdetritusN_east'}.units = 'mMol N m-3';
%
  nc{'SdetritusN_east'} = ncdouble('SdetritusN_time','s_rho','eta_rho') ;
  nc{'SdetritusN_east'}.long_name = ncchar('east boundary SdetritusN');
  nc{'SdetritusN_east'}.long_name = 'east boundary SdetritusN';
  nc{'SdetritusN_east'}.units = ncchar('mMol N m-3');
  nc{'SdetritusN_east'}.units = 'mMol N m-3';
%
  nc{'LdetritusC_east'} = ncdouble('LdetritusC_time','s_rho','eta_rho') ;
  nc{'LdetritusC_east'}.long_name = ncchar('east boundary LdetritusC');
  nc{'LdetritusC_east'}.long_name = 'east boundary LdetritusC';
  nc{'LdetritusC_east'}.units = ncchar('mMol C m-3');
  nc{'LdetritusC_east'}.units = 'mMol C m-3';
%
  nc{'SdetritusC_east'} = ncdouble('SdetritusC_time','s_rho','eta_rho') ;
  nc{'SdetritusC_east'}.long_name = ncchar('east boundary LdetritusC');
  nc{'SdetritusC_east'}.long_name = 'east boundary LdetritusC';
  nc{'SdetritusC_east'}.units = ncchar('mMol C m-3');
  nc{'SdetritusC_east'}.units = 'mMol C m-3';
%
  nc{'TIC_east'} = ncdouble('tic_time','s_rho','eta_rho') ;
  nc{'TIC_east'}.long_name = ncchar('east boundary TIC');
  nc{'TIC_east'}.long_name = 'east boundary TIC';
  nc{'TIC_east'}.units = ncchar('mMol C m-3');
  nc{'TIC_east'}.units = 'mMol C m-3';
%
end
%
if obc(3)==1
%
%   Northern boundary
%
  nc{'NO3_north'} = ncdouble('no3_time','s_rho','xi_rho') ;
  nc{'NO3_north'}.long_name = ncchar('northern boundary NO3');
  nc{'NO3_north'}.long_name = 'northern boundary NO3';
  nc{'NO3_north'}.units = ncchar('mMol N m-3');
  nc{'NO3_north'}.units = 'mMol N m-3';
%
  nc{'PO4_north'} = ncdouble('po4_time','s_rho','xi_rho') ;
  nc{'PO4_north'}.long_name = ncchar('northern boundary PO4');
  nc{'PO4_north'}.long_name = 'northern boundary PO4';
  nc{'PO4_north'}.units = ncchar('mMol N m-3');
  nc{'PO4_north'}.units = 'mMol N m-3';
%

%
  nc{'O2_north'} = ncdouble('o2_time','s_rho','xi_rho') ;
  nc{'O2_north'}.long_name = ncchar('northern boundary O2');
  nc{'O2_north'}.long_name = 'northern boundary O2';
  nc{'O2_north'}.units = ncchar('mMol N m-3');
  nc{'O2_north'}.units = 'mMol N m-3';

%
  nc{'TALK_north'} = ncdouble('talk_time','s_rho','xi_rho') ;
  nc{'TALK_north'}.long_name = ncchar('northern boundary TALK');
  nc{'TALK_north'}.long_name = 'northern boundary TALK';
  nc{'TALK_north'}.units = ncchar('mMol N m-3');
  nc{'TALK_north'}.units = 'mMol N m-3';
%

%
end
%
if obc(4)==1
%
%   Western boundary
%
  nc{'NO3_west'} = ncdouble('no3_time','s_rho','eta_rho') ;
  nc{'NO3_west'}.long_name = ncchar('western boundary NO3');
  nc{'NO3_west'}.long_name = 'western boundary NO3';
  nc{'NO3_west'}.units = ncchar('mMol N m-3');
  nc{'NO3_west'}.units = 'mMol N m-3';
%
  nc{'PO4_west'} = ncdouble('po4_time','s_rho','eta_rho') ;
  nc{'PO4_west'}.long_name = ncchar('western boundary PO4');
  nc{'PO4_west'}.long_name = 'western boundary PO4';
  nc{'PO4_west'}.units = ncchar('mMol N m-3');
  nc{'PO4_west'}.units = 'mMol N m-3';
%

%
  nc{'O2_west'} = ncdouble('o2_time','s_rho','eta_rho') ;
  nc{'O2_west'}.long_name = ncchar('western boundary O2');
  nc{'O2_west'}.long_name = 'western boundary O2';
  nc{'O2_west'}.units = ncchar('mMol N m-3');
  nc{'O2_west'}.units = 'mMol N m-3';
%

%
  nc{'TALK_west'} = ncdouble('talk_time','s_rho','eta_rho') ;
  nc{'TALK_west'}.long_name = ncchar('western boundary TALK');
  nc{'TALK_west'}.long_name = 'western boundary TALK';
  nc{'TALK_west'}.units = ncchar('mMol N m-3');
  nc{'TALK_west'}.units = 'mMol N m-3';
%

%
end
%
% Leave define mode
%
result = endef(nc);
%
% Write variables
%
nc{'no3_time'}(:) = time;
nc{'po4_time'}(:) = time;
nc{'talk_time'}(:) = time;
nc{'oxygen_time'}(:) = time;
nc{'chlo_time'}(:) = time1;
nc{'nh4_time'}(:) = time;
nc{'phyto_time'}(:) = time1;
nc{'zoop_time'}(:) = time1;
nc{'LdetritusN_time'}(:) = time;
nc{'SdetritusN_time'}(:) = time;
nc{'LdetritusC_time'}(:) = time;
nc{'SdetritusC_time'}(:) = time;
nc{'tic_time'}(:) = time;

if obc(1)==1
  nc{'NO3_south'}(:)  =  0;
  nc{'PO4_south'}(:)  =  0;
  nc{'oxygen_south'}(:)   =  0;
  nc{'TALK_south'}(:) =  0;
end 
if obc(2)==1
  nc{'NO3_east'}(:)  =  0;
  nc{'PO4_east'}(:)  =  0;
  nc{'oxygen_east'}(:)   =  0;
  nc{'TALK_east'}(:) =  0;
  nc{'chlorophyll_east'}(:) = 0;
  nc{'NH4_east'}(:) = 0.1;
  nc{'phytoplankton_east'}(:) = 0;
  nc{'zooplankton_east'}(:) = 0;
  nc{'LdetritusN_east'}(:) = 0.02;
  nc{'SdetritusN_east'}(:) = 0.04;
  nc{'LdetritusC_east'}(:) = 0.15;
  nc{'SdetritusC_east'}(:) = 0.3;
  nc{'TIC_east'}(:) = 1988.5;

end 
if obc(3)==1
  nc{'NO3_north'}(:)  =  0;
  nc{'PO4_north'}(:)  =  0;
  nc{'Si_north'}(:) =  0;
  nc{'oxgen_north'}(:)   =  0;
  nc{'TALK_north'}(:) =  0;
end 
if obc(4)==1
  nc{'NO3_west'}(:)  =  0;
  nc{'PO4_west'}(:)  =  0;
  nc{'oxygen_west'}(:)   =  0;
  nc{'TALK_west'}(:) =  0;
end 
close(nc)
return

