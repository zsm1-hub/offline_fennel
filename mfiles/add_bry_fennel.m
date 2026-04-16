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
%nc('bry_time_bio')  = length(time);
% nc('bry_time')  = length(time);
% nc('PO4_time')  = length(time);
% nc('bry_time') = length(time);
% nc('bry_time')   = length(time);
% nc('bry_time') = length(time1);
% nc('bry_time') = length(time);
% nc('bry_time') = length(time1);
% nc('bry_time') = length(time1);
%nc('LdetritusN_time') = length(time);
%nc('SdetritusN_time') = length(time);
%nc('LdetritusC_time') = length(time);
%nc('SdetritusC_time') = length(time);
% nc('bry_time') = length(time);
%nc('one') = 1;
%
%  Create variables and attributes
%
%{
 nc{'bry_time'} = ncdouble('bry_time') ;
 nc{'bry_time'}.long_name = ncchar('time for TALK climatology');
 nc{'bry_time'}.long_name = 'time for TALK climatology';
 nc{'bry_time'}.units = ncchar('day since 1900-01-01 00:00:00');
 nc{'bry_time'}.units = 'day';
 nc{'bry_time'}.cycle_length = cycle;%
%} 
% nc{'bry_time'} = ncdouble('bry_time') ;
% nc{'bry_time'}.long_name = ncchar('time for NO3 climatology');
% nc{'bry_time'}.long_name = 'time for NO3 climatology';
% nc{'bry_time'}.units = ncchar('day since 1900-01-01 00:00:00');
% nc{'bry_time'}.units = 'day';
% nc{'bry_time'}.cycle_length = cycle;%

% nc{'po4_time'} = ncdouble('po4_time') ;
% nc{'po4_time'}.long_name = ncchar('time for PO4 climatology');
% nc{'po4_time'}.long_name = 'time for PO4 climatology';
% nc{'po4_time'}.units = ncchar('day since 1900-01-01 00:00:00');
% nc{'po4_time'}.units = 'day';
% nc{'po4_time'}.cycle_length = cycle;%

% nc{'bry_time'} = ncdouble('bry_time') ;
% nc{'bry_time'}.long_name = ncchar('time for O2 climatology');
% nc{'bry_time'}.long_name = 'time for O2 climatology';
% nc{'bry_time'}.units = ncchar('day since 1900-01-01 00:00:00');
% nc{'bry_time'}.units = 'day';
% nc{'bry_time'}.cycle_length = cycle;%
% 
% nc{'bry_time'} = ncdouble('bry_time') ;
% nc{'bry_time'}.long_name = ncchar('time for chlorophyll climatology');
% nc{'bry_time'}.long_name = 'time for chlorophyll climatology';
% nc{'bry_time'}.units = ncchar('day since 1900-01-01 00:00:00');
% nc{'bry_time'}.units = 'day';
% nc{'bry_time'}.cycle_length = cycle;%
%
% nc{'bry_time'} = ncdouble('bry_time') ;
% nc{'bry_time'}.long_name = ncchar('time for nh4 climatology');
% nc{'bry_time'}.long_name = 'time for nh4 climatology';
% nc{'bry_time'}.units = ncchar('day since 1900-01-01 00:00:00');
% nc{'bry_time'}.units = 'day';
% nc{'bry_time'}.cycle_length = cycle;%
% %
% nc{'bry_time'} = ncdouble('bry_time') ;
% nc{'bry_time'}.long_name = ncchar('time for phytoplankton climatology');
% nc{'bry_time'}.long_name = 'time for phytoplankton climatology';
% nc{'bry_time'}.units = ncchar('day since 1900-01-01 00:00:00');
% nc{'bry_time'}.units = 'day';
% nc{'bry_time'}.cycle_length = cycle;%
% %
% nc{'bry_time'} = ncdouble('bry_time') ;
% nc{'bry_time'}.long_name = ncchar('time for zooplankton climatology');
% nc{'bry_time'}.long_name = 'time for phytoplankton climatology';
% nc{'bry_time'}.units = ncchar('day since 1900-01-01 00:00:00');
% nc{'bry_time'}.units = 'day';
% nc{'bry_time'}.cycle_length = cycle;%
%
%nc{'LdetritusN_time'} = ncdouble('LdetritusN_time') ;
%nc{'LdetritusN_time'}.long_name = ncchar('time for LdetritusN climatology');
%nc{'LdetritusN_time'}.long_name = 'time for LdetritusN climatology';
%nc{'LdetritusN_time'}.units = ncchar('day');
%nc{'LdetritusN_time'}.units = 'day';
%nc{'LdetritusN_time'}.cycle_length = cycle;%
%
%nc{'SdetritusN_time'} = ncdouble('SdetritusN_time') ;
%nc{'SdetritusN_time'}.long_name = ncchar('time for SdetritusN climatology');
%nc{'SdetritusN_time'}.long_name = 'time for SdetritusN climatology';
%nc{'SdetritusN_time'}.units = ncchar('day');
%nc{'SdetritusN_time'}.units = 'day';
%nc{'SdetritusN_time'}.cycle_length = cycle;%
%
%nc{'LdetritusC_time'} = ncdouble('LdetritusC_time') ;
%nc{'LdetritusC_time'}.long_name = ncchar('time for LdetritusC climatology');
%nc{'LdetritusC_time'}.long_name = 'time for LdetritusC climatology';
%nc{'LdetritusC_time'}.units = ncchar('day');
%nc{'LdetritusC_time'}.units = 'day';
%nc{'LdetritusC_time'}.cycle_length = cycle;%
%
%nc{'SdetritusC_time'} = ncdouble('SdetritusC_time') ;
%nc{'SdetritusC_time'}.long_name = ncchar('time for SdetritusC climatology');
%nc{'SdetritusC_time'}.long_name = 'time for SdetritusC climatology';
%nc{'SdetritusC_time'}.units = ncchar('day');
%nc{'SdetritusC_time'}.units = 'day';
%nc{'SdetritusC_time'}.cycle_length = cycle;%
%
% nc{'bry_time'} = ncdouble('bry_time') ;
% nc{'bry_time'}.long_name = ncchar('time for Total inorganic carbon climatology');
% nc{'bry_time'}.long_name = 'time for Total inorganic carbon climatology';
% nc{'bry_time'}.units = ncchar('day since 1900-01-01 00:00:00');
% nc{'bry_time'}.units = 'day';
% nc{'bry_time'}.cycle_length = cycle;%


if obc(1)==1
%
%   Southern boundary
%
%  nc{'NO3_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'NO3_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'NO3_south'}.long_name = ncchar('southern boundary NO3');
  nc{'NO3_south'}.long_name = 'southern boundary NO3';
  nc{'NO3_south'}.units = ncchar('mMol N m-3');
  nc{'NO3_south'}.units = 'mMol N m-3';
%
%  nc{'PO4_south'} = ncdouble('po4_time','s_rho','xi_rho') ;
  nc{'PO4_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'PO4_south'}.long_name = ncchar('southern boundary PO4');
  nc{'PO4_south'}.long_name = 'southern boundary PO4';
  nc{'PO4_south'}.units = ncchar('mMol P m-3');
  nc{'PO4_south'}.units = 'mMol P m-3';
%
%  nc{'oxygen_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'oxygen_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'oxygen_south'}.long_name = ncchar('southern boundary O2');
  nc{'oxygen_south'}.long_name = 'southern boundary O2';
  nc{'oxygen_south'}.units = ncchar('mMol O m-3');
  nc{'oxygen_south'}.units = 'mMol O m-3';
%
%  nc{'TALK_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'alkalinity_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'alkalinity_south'}.long_name = ncchar('southern boundary alkalinity');
  nc{'alkalinity_south'}.long_name = 'southern boundary alkalinity';
  nc{'alkalinity_south'}.units = ncchar('mMol C m-3');
  nc{'alkalinity_south'}.units = 'mMol C m-3';
%
%  nc{'chlorophyll_south'} = ncdouble('chlorophyll_time','s_rho','xi_rho') ;
  nc{'chlo_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'chlo_south'}.long_name = ncchar('southern boundary chlorophyll');
  nc{'chlo_south'}.long_name = 'southern boundary chlorophyll';
  nc{'chlo_south'}.units = ncchar('mMol chlo m-3');
  nc{'chlo_south'}.units = 'mMol chlo m-3';
%
%  nc{'NH4_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'NH4_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'NH4_south'}.long_name = ncchar('southern boundary NH4');
  nc{'NH4_south'}.long_name = 'southern boundary NH4';
  nc{'NH4_south'}.units = ncchar('mMol N m-3');
  nc{'NH4_south'}.units = 'mMol N m-3';
%
%  nc{'phytoplankton_south'} = ncdouble('phytoplankton_time','s_rho','xi_rho') ;
  nc{'phyt_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'phyt_south'}.long_name = ncchar('southern boundary phytoplankton');
  nc{'phyt_south'}.long_name = 'southern boundary phytoplankton';
  nc{'phyt_south'}.units = ncchar('mMol N m-3');
  nc{'phyt_south'}.units = 'mMol N m-3';
%
%  nc{'zooplankton_south'} = ncdouble('zooplankton_time','s_rho','xi_rho') ;
  nc{'zoop_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'zoop_south'}.long_name = ncchar('southern boundary zooplankton');
  nc{'zoop_south'}.long_name = 'southern boundary zooplankton';
  nc{'zoop_south'}.units = ncchar('mMol N m-3');
  nc{'zoop_south'}.units = 'mMol N m-3';
%
%  nc{'LDeN_south'} = ncdouble('LdetritusN_time','s_rho','xi_rho') ;
  nc{'LDeN_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'LDeN_south'}.long_name = ncchar('southern boundary LdetritusN');
  nc{'LDeN_south'}.long_name = 'southern boundary LdetritusN';
  nc{'LDeN_south'}.units = ncchar('mMol N m-3');
  nc{'LDeN_south'}.units = 'mMol N m-3';
%
%  nc{'SDeN_south'} = ncdouble('SdetritusN_time','s_rho','xi_rho') ;
  nc{'SDeN_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'SDeN_south'}.long_name = ncchar('southern boundary SdetritusN');
  nc{'SDeN_south'}.long_name = 'southern boundary SdetritusN';
  nc{'SDeN_south'}.units = ncchar('mMol N m-3');
  nc{'SDeN_south'}.units = 'mMol N m-3';
%
%  nc{'LDeC_south'} = ncdouble('LdetritusC_time','s_rho','xi_rho') ;
  nc{'LDeC_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'LDeC_south'}.long_name = ncchar('southern boundary LdetritusC');
  nc{'LDeC_south'}.long_name = 'southern boundary LdetritusC';
  nc{'LDeC_south'}.units = ncchar('mMol C m-3');
  nc{'LDeC_south'}.units = 'mMol C m-3';
%
%  nc{'SDeC_south'} = ncdouble('SdetritusC_time','s_rho','xi_rho') ;
  nc{'SDeC_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'SDeC_south'}.long_name = ncchar('southern boundary LdetritusC');
  nc{'SDeC_south'}.long_name = 'southern boundary LdetritusC';
  nc{'SDeC_south'}.units = ncchar('mMol C m-3');
  nc{'SDeC_south'}.units = 'mMol C m-3';
%
%  nc{'TIC_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'TIC_south'} = ncdouble('bry_time','s_rho','xi_rho') ;
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
  nc{'NO3_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'NO3_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'NO3_east'}.long_name = ncchar('eastern boundary NO3');
  nc{'NO3_east'}.long_name = 'eastern boundary NO3';
  nc{'NO3_east'}.units = ncchar('mMol N m-3');
  nc{'NO3_east'}.units = 'mMol N m-3';
%
  nc{'PO4_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'PO4_east'} = ncdouble('po4_time','s_rho','eta_rho') ;
  nc{'PO4_east'}.long_name = ncchar('eastern boundary PO4');
  nc{'PO4_east'}.long_name = 'eastern boundary PO4';
  nc{'PO4_east'}.units = ncchar('mMol P m-3');
  nc{'PO4_east'}.units = 'mMol P m-3';
%
  nc{'oxygen_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'oxygen_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'oxygen_east'}.long_name = ncchar('eastern boundary O2');
  nc{'oxygen_east'}.long_name = 'eastern boundary O2';
  nc{'oxygen_east'}.units = ncchar('mMol O m-3');
  nc{'oxygen_east'}.units = 'mMol O m-3';
%

  nc{'alkalinity_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'TALK_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'alkalinity_east'}.long_name = ncchar('eastern boundary TALK');
  nc{'alkalinity_east'}.long_name = 'eastern boundary TALK';
  nc{'alkalinity_east'}.units = ncchar('mMol C m-3');
  nc{'TALK_east'}.units = 'mMol C m-3';
%
  nc{'chlo_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'chlorophyll_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'chlo_east'}.long_name = ncchar('east boundary chlorophyll');
  nc{'chlo_east'}.long_name = 'east boundary chlorophyll';
  nc{'chlo_east'}.units = ncchar('mMol chlo m-3');
  nc{'chlo_east'}.units = 'mMol chlo m-3';
%
  nc{'NH4_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'NH4_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'NH4_east'}.long_name = ncchar('east boundary NH4');
  nc{'NH4_east'}.long_name = 'east boundary NH4';
  nc{'NH4_east'}.units = ncchar('mMol N m-3');
  nc{'NH4_east'}.units = 'mMol N m-3';
%
  nc{'phyt_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'phytoplankton_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'phyt_east'}.long_name = ncchar('east boundary phytoplankton');
  nc{'phyt_east'}.long_name = 'east boundary phytoplankton';
  nc{'phyt_east'}.units = ncchar('mMol N m-3');
  nc{'phyt_east'}.units = 'mMol N m-3';
%
  nc{'zoop_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'zooplankton_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'zoop_east'}.long_name = ncchar('east boundary zooplankton');
  nc{'zoop_east'}.long_name = 'east boundary zooplankton';
  nc{'zoop_east'}.units = ncchar('mMol N m-3');
  nc{'zoop_east'}.units = 'mMol N m-3';
%
  nc{'LDeN_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'LDeN_east'} = ncdouble('LdetritusN_time','s_rho','eta_rho') ;
  nc{'LDeN_east'}.long_name = ncchar('east boundary LdetritusN');
  nc{'LDeN_east'}.long_name = 'east boundary LdetritusN';
  nc{'LDeN_east'}.units = ncchar('mMol N m-3');
  nc{'LDeN_east'}.units = 'mMol N m-3';
%
  nc{'SDeN_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'SDeN_east'} = ncdouble('SdetritusN_time','s_rho','eta_rho') ;
  nc{'SDeN_east'}.long_name = ncchar('east boundary SdetritusN');
  nc{'SDeN_east'}.long_name = 'east boundary SdetritusN';
  nc{'SDeN_east'}.units = ncchar('mMol N m-3');
  nc{'SDeN_east'}.units = 'mMol N m-3';
%
  nc{'LDeC_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'LDeC_east'} = ncdouble('LdetritusC_time','s_rho','eta_rho') ;
  nc{'LDeC_east'}.long_name = ncchar('east boundary LdetritusC');
  nc{'LDeC_east'}.long_name = 'east boundary LdetritusC';
  nc{'LDeC_east'}.units = ncchar('mMol C m-3');
  nc{'LDeC_east'}.units = 'mMol C m-3';
%
  nc{'SDeC_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'SDeC_east'} = ncdouble('SdetritusC_time','s_rho','eta_rho') ;
  nc{'SDeC_east'}.long_name = ncchar('east boundary LdetritusC');
  nc{'SDeC_east'}.long_name = 'east boundary LdetritusC';
  nc{'SDeC_east'}.units = ncchar('mMol C m-3');
  nc{'SDeC_east'}.units = 'mMol C m-3';
%
  nc{'TIC_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'TIC_east'} = ncdouble('bry_time','s_rho','eta_rho') ;
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
  nc{'NO3_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
%  nc{'NO3_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'NO3_north'}.long_name = ncchar('northern boundary NO3');
  nc{'NO3_north'}.long_name = 'northern boundary NO3';
  nc{'NO3_north'}.units = ncchar('mMol N m-3');
  nc{'NO3_north'}.units = 'mMol N m-3';
%
  nc{'PO4_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
%  nc{'PO4_north'} = ncdouble('po4_time','s_rho','xi_rho') ;
  nc{'PO4_north'}.long_name = ncchar('northern boundary PO4');
  nc{'PO4_north'}.long_name = 'northern boundary PO4';
  nc{'PO4_north'}.units = ncchar('mMol N m-3');
  nc{'PO4_north'}.units = 'mMol N m-3';
%

%
  nc{'oxygen_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
%  nc{'O2_north'} = ncdouble('o2_time','s_rho','xi_rho') ;
  nc{'oxygen_north'}.long_name = ncchar('northern boundary O2');
  nc{'oxygen_north'}.long_name = 'northern boundary O2';
  nc{'oxygen_north'}.units = ncchar('mMol N m-3');
  nc{'oxygen_north'}.units = 'mMol N m-3';

%
  nc{'alkalinity_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
%  nc{'TALK_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'alkalinity_north'}.long_name = ncchar('northern boundary TALK');
  nc{'alkalinity_north'}.long_name = 'northern boundary TALK';
  nc{'alkalinity_north'}.units = ncchar('mMol N m-3');
  nc{'alkalinity_north'}.units = 'mMol N m-3';
%
  nc{'chlo_north'} = ncdouble('bry_time','s_rho','xi_rho') ;   %cyp eta_rho --> xi_rho
  nc{'chlo_north'}.long_name = ncchar('northern boundary chlorophyll');
  nc{'chlo_north'}.long_name = 'northern boundary chlorophyll';
  nc{'chlo_north'}.units = ncchar('mMol chlo m-3');
  nc{'chlo_north'}.units = 'mMol chlo m-3';
%
  nc{'NH4_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'NH4_north'}.long_name = ncchar('northern boundary NH4');
  nc{'NH4_north'}.long_name = 'northern boundary NH4';
  nc{'NH4_north'}.units = ncchar('mMol N m-3');
  nc{'NH4_north'}.units = 'mMol N m-3';
%
  nc{'phyt_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'phyt_north'}.long_name = ncchar('northern boundary phytoplankton');
  nc{'phyt_north'}.long_name = 'northern boundary phytoplankton';
  nc{'phyt_north'}.units = ncchar('mMol N m-3');
  nc{'phyt_north'}.units = 'mMol N m-3';
%
  nc{'zoop_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'zoop_north'}.long_name = ncchar('northern boundary zooplankton');
  nc{'zoop_north'}.long_name = 'northern boundary zooplankton';
  nc{'zoop_north'}.units = ncchar('mMol N m-3');
  nc{'zoop_north'}.units = 'mMol N m-3';
%
  nc{'LDeN_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'LDeN_north'}.long_name = ncchar('northern boundary LdetritusN');
  nc{'LDeN_north'}.long_name = 'northern boundary LdetritusN';
  nc{'LDeN_north'}.units = ncchar('mMol N m-3');
  nc{'LDeN_north'}.units = 'mMol N m-3';
%
  nc{'SDeN_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'SDeN_north'}.long_name = ncchar('northern boundary SdetritusN');
  nc{'SDeN_north'}.long_name = 'northern boundary SdetritusN';
  nc{'SDeN_north'}.units = ncchar('mMol N m-3');
  nc{'SDeN_north'}.units = 'mMol N m-3';
%
  nc{'LDeC_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'LDeC_north'}.long_name = ncchar('northern boundary LdetritusC');
  nc{'LDeC_north'}.long_name = 'northern boundary LdetritusC';
  nc{'LDeC_north'}.units = ncchar('mMol C m-3');
  nc{'LDeC_north'}.units = 'mMol C m-3';
%
  nc{'SDeC_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'SDeC_north'}.long_name = ncchar('northern boundary LdetritusC');
  nc{'SDeC_north'}.long_name = 'northern boundary LdetritusC';
  nc{'SDeC_north'}.units = ncchar('mMol C m-3');
  nc{'SDeC_north'}.units = 'mMol C m-3';
%
  nc{'TIC_north'} = ncdouble('bry_time','s_rho','xi_rho') ;
  nc{'TIC_north'}.long_name = ncchar('northern boundary TIC');
  nc{'TIC_north'}.long_name = 'northern boundary TIC';
  nc{'TIC_north'}.units = ncchar('mMol C m-3');
  nc{'TIC_north'}.units = 'mMol C m-3';
%
end
%
if obc(4)==1
%
%   Western boundary
%
  nc{'NO3_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'NO3_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'NO3_west'}.long_name = ncchar('western boundary NO3');
  nc{'NO3_west'}.long_name = 'western boundary NO3';
  nc{'NO3_west'}.units = ncchar('mMol N m-3');
  nc{'NO3_west'}.units = 'mMol N m-3';
%
  nc{'PO4_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'PO4_west'} = ncdouble('po4_time','s_rho','eta_rho') ;
  nc{'PO4_west'}.long_name = ncchar('western boundary PO4');
  nc{'PO4_west'}.long_name = 'western boundary PO4';
  nc{'PO4_west'}.units = ncchar('mMol N m-3');
  nc{'PO4_west'}.units = 'mMol N m-3';
%

%
  nc{'oxygen_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'O2_west'} = ncdouble('o2_time','s_rho','eta_rho') ;
  nc{'oxygen_west'}.long_name = ncchar('western boundary O2');
  nc{'oxygen_west'}.long_name = 'western boundary O2';
  nc{'oxygen_west'}.units = ncchar('mMol N m-3');
  nc{'oxygen_west'}.units = 'mMol N m-3';
%

  nc{'alkalinity_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
%  nc{'TALK_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'alkalinity_west'}.long_name = ncchar('western boundary TALK');
  nc{'alkalinity_west'}.long_name = 'western boundary TALK';
  nc{'alkalinity_west'}.units = ncchar('mMol N m-3');
  nc{'alkalinity_west'}.units = 'mMol N m-3';
%
  nc{'chlo_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'chlo_west'}.long_name = ncchar('western boundary chlorophyll');
  nc{'chlo_west'}.long_name = 'western boundary chlorophyll';
  nc{'chlo_west'}.units = ncchar('mMol chlo m-3');
  nc{'chlo_west'}.units = 'mMol chlo m-3';
%
  nc{'NH4_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'NH4_west'}.long_name = ncchar('western boundary NH4');
  nc{'NH4_west'}.long_name = 'western boundary NH4';
  nc{'NH4_west'}.units = ncchar('mMol N m-3');
  nc{'NH4_west'}.units = 'mMol N m-3';
%
  nc{'phyt_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'phyt_west'}.long_name = ncchar('western boundary phytoplankton');
  nc{'phyt_west'}.long_name = 'western boundary phytoplankton';
  nc{'phyt_west'}.units = ncchar('mMol N m-3');
  nc{'phyt_west'}.units = 'mMol N m-3';
%
  nc{'zoop_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'zoop_west'}.long_name = ncchar('western boundary zooplankton');
  nc{'zoop_west'}.long_name = 'western boundary zooplankton';
  nc{'zoop_west'}.units = ncchar('mMol N m-3');
  nc{'zoop_west'}.units = 'mMol N m-3';
%
  nc{'LDeN_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'LDeN_west'}.long_name = ncchar('western boundary LdetritusN');
  nc{'LDeN_west'}.long_name = 'western boundary LdetritusN';
  nc{'LDeN_west'}.units = ncchar('mMol N m-3');
  nc{'LDeN_west'}.units = 'mMol N m-3';
%
  nc{'SDeN_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'SDeN_west'}.long_name = ncchar('western boundary SdetritusN');
  nc{'SDeN_west'}.long_name = 'western boundary SdetritusN';
  nc{'SDeN_west'}.units = ncchar('mMol N m-3');
  nc{'SDeN_west'}.units = 'mMol N m-3';
%
  nc{'LDeC_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'LDeC_west'}.long_name = ncchar('western boundary LdetritusC');
  nc{'LDeC_west'}.long_name = 'western boundary LdetritusC';
  nc{'LDeC_west'}.units = ncchar('mMol C m-3');
  nc{'LDeC_west'}.units = 'mMol C m-3';
%
  nc{'SDeC_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'SDeC_west'}.long_name = ncchar('western boundary LdetritusC');
  nc{'SDeC_west'}.long_name = 'western boundary LdetritusC';
  nc{'SDeC_west'}.units = ncchar('mMol C m-3');
  nc{'SDeC_west'}.units = 'mMol C m-3';
%
  nc{'TIC_west'} = ncdouble('bry_time','s_rho','eta_rho') ;
  nc{'TIC_west'}.long_name = ncchar('western boundary TIC');
  nc{'TIC_west'}.long_name = 'western boundary TIC';
  nc{'TIC_west'}.units = ncchar('mMol C m-3');
  nc{'TIC_west'}.units = 'mMol C m-3';
%
end
%
% Leave define mode
%
result = endef(nc);
%
% Write variables
%
% nc{'bry_time'}(:) = time;
%nc{'po4_time'}(:) = time;
% nc{'bry_time'}(:) = time;
% nc{'bry_time'}(:) = time;
% nc{'bry_time'}(:) = time1;
% nc{'bry_time'}(:) = time;
% nc{'bry_time'}(:) = time1;
% nc{'bry_time'}(:) = time1;
%nc{'LdetritusN_time'}(:) = time;
%nc{'SdetritusN_time'}(:) = time;
%nc{'LdetritusC_time'}(:) = time;
%nc{'SdetritusC_time'}(:) = time;
% nc{'bry_time'}(:) = time;

if obc(1)==1
  nc{'NO3_south'}(:)  =  0;
  nc{'PO4_south'}(:)  =  0;
  nc{'oxygen_south'}(:)   =  0;
  nc{'alkalinity_south'}(:) =  0;
  nc{'chlo_south'}(:) = 0;
  nc{'NH4_south'}(:) = 0.1;
  nc{'phyt_south'}(:) = 0;
  nc{'zoop_south'}(:) = 0;
  nc{'LDeN_south'}(:) = 0.02;
  nc{'SDeN_south'}(:) = 0.04;
  nc{'LDeC_south'}(:) = 0.15;
  nc{'SDeC_south'}(:) = 0.3;
  nc{'TIC_south'}(:) = 1988.5;
end 
if obc(2)==1
  nc{'NO3_east'}(:)  =  0;
  nc{'PO4_east'}(:)  =  0;
  nc{'oxygen_east'}(:)   =  0;
  nc{'alkalinity_east'}(:) =  0;
  nc{'chlo_east'}(:) = 0;
  nc{'NH4_east'}(:) = 0.1;
  nc{'phyt_east'}(:) = 0;
  nc{'zoop_east'}(:) = 0;
  nc{'LDeN_east'}(:) = 0.02;
  nc{'SDeN_east'}(:) = 0.04;
  nc{'LDeC_east'}(:) = 0.15;
  nc{'SDeC_east'}(:) = 0.3;
  nc{'TIC_seast'}(:) = 1988.5;

end 
if obc(3)==1
  nc{'NO3_north'}(:)  =  0;
  nc{'PO4_north'}(:)  =  0;
  nc{'Si_north'}(:) =  0;
  nc{'oxgen_north'}(:)   =  0;
  nc{'alkalinity_north'}(:) =  0;
  nc{'chlo_north'}(:) = 0;
  nc{'NH4_north'}(:) = 0.1;
  nc{'phyt_north'}(:) = 0;
  nc{'zoop_north'}(:) = 0;
  nc{'LDeN_north'}(:) = 0.02;
  nc{'SDeN_north'}(:) = 0.04;
  nc{'LDeC_north'}(:) = 0.15;
  nc{'SDeC_north'}(:) = 0.3;
  nc{'TIC_north'}(:) = 1988.5;
end 
if obc(4)==1
  nc{'NO3_west'}(:)  =  0;
  nc{'PO4_west'}(:)  =  0;
  nc{'oxygen_west'}(:)   =  0;
  nc{'alkalinity_west'}(:) =  0;
  nc{'chlo_west'}(:) = 0;
  nc{'NH4_west'}(:) = 0.1;
  nc{'phyt_west'}(:) = 0;
  nc{'zoop_west'}(:) = 0;
  nc{'LDeN_west'}(:) = 0.02;
  nc{'SDeN_west'}(:) = 0.04;
  nc{'LDeC_west'}(:) = 0.15;
  nc{'SDeC_west'}(:) = 0.3;
  nc{'TIC_west'}(:) = 1988.5;
  
end 
close(nc)
return

