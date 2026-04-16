function add_bry_fennel_Z(zbryname,grdname,obc,Z,time,cycle,time1,cycle1,clobber);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                 %
%   function add_bry_pisces_Z(zbryname,obc,...                    %
%                             Z,time,cycle,clobber);              %
%                                                                 %
%   This function create the header of a Netcdf climatology       %
%   file.                                                         %
%                                                                 %
%   Input:                                                        %
%                                                                 %
%   zbryname     Netcdf climatology file name (character string). %
%   obc          open boundaries flag (1=open , [S E N W]).       %
%   Z            Depth of vertical levels.(Vector)                %
%   time         time.(vector)                                    %
%   cycle        Length (days) for cycling the climatology.(Real) %
%   clobber      Switch to allow or not writing over an existing  %
%                file.(character string)                          %
%                                                                 %
%  Pierrick Penven, IRD, 2005.                                    %
%  Olivier Aumont the master, IRD, 2006.                          %
%  Patricio Marchesiello, chief, IRD, 2007.                       %
%  Christophe Eugene Raoul Menkes, the slave, IRD, 2007.          %
%                                                                 %
%  lwx. changed the northern boundary 'O2' to 'oxygen',also the   %
%       western boundary                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' ')
disp([' Adding PISCES data into file : ',zbryname])
disp(' ')
%
%  Create the boundary file
%

nc = netcdf(grdname, 'nowrite');
Lp=length(nc('xi_rho'));
Mp=length(nc('eta_rho'));
status=close(nc);
L=Lp-1;
M=Mp-1;
%
%  Create the boundary file
%
type = 'BOUNDARY Z (or OA) biol file' ; 
history = 'CROCOS' ;
nc = netcdf(zbryname,'clobber');
%result = redef(nc);
%
%  Create dimensions
%
nc('xi_u') = L;
nc('xi_rho') = Lp;
nc('eta_v') = M;
nc('eta_rho') = Mp;
nc('Z') = length(Z);
nc('NO3_time') = length(time);
nc('po4_time') = length(time);
nc('alkalinity_time') = length(time);
nc('oxygen_time') = length(time);
nc('bry_time') = length(time);
nc('one') = 1;
%
%  Create variables and attributes
%
%nc{'Z'} = ncdouble('Z') ;
%nc{'Z'}.long_name = ncchar('Depth');
%nc{'Z'}.long_name = 'Depth';
%nc{'Z'}.units = ncchar('m');
%nc{'Z'}.units = 'm';
% PISCES
nc{'ZNO3'} = ncdouble('Z') ;
nc{'ZNO3'}.long_name = ncchar('Depth');
nc{'ZNO3'}.long_name = 'Depth';
nc{'ZNO3'}.units = ncchar('m');
nc{'ZNO3'}.units = 'm';
nc{'Z'} = ncdouble('Z') ;
nc{'Z'}.long_name = ncchar('Depth');
nc{'Z'}.long_name = 'Depth';
nc{'Z'}.units = ncchar('m');
nc{'Z'}.units = 'm';
% brytime
nc{'bry_time'} = ncdouble('bry_time') ;
nc{'bry_time'}.long_name = ncchar('time for  climatology');
nc{'bry_time'}.long_name = 'time for climatology';
nc{'bry_time'}.units = ncchar('day');
nc{'bry_time'}.units = 'day';
nc{'bry_time'}.cycle_length = cycle;%
%
if obc(1)==1
%
%   Southern boundary
%
  nc{'NO3_south'} = ncdouble('NO3_time','Z','xi_rho') ;
  nc{'NO3_south'}.long_name = ncchar('southern boundary NO3');
  nc{'NO3_south'}.long_name = 'southern boundary NO3';
  nc{'NO3_south'}.units = ncchar('mMol N m-3');
  nc{'NO3_south'}.units = 'mMol N m-3';
%
  nc{'PO4_south'} = ncdouble('po4_time','Z','xi_rho') ;
  nc{'PO4_south'}.long_name = ncchar('southern boundary PO4');
  nc{'PO4_south'}.long_name = 'southern boundary PO4';
  nc{'PO4_south'}.units = ncchar('mMol N m-3');
  nc{'PO4_south'}.units = 'mMol N m-3';
%
%
  nc{'oxygen_south'} = ncdouble('oxygen_time','Z','xi_rho') ;
  nc{'oxygen_south'}.long_name = ncchar('southern boundary O2');
  nc{'oxygen_south'}.long_name = 'southern boundary O2';
  nc{'oxygen_south'}.units = ncchar('mMol N m-3');
  nc{'oxygen_south'}.units = 'mMol N m-3';
%
  nc{'DIC_south'} = ncdouble('dic_time','Z','xi_rho') ;
  nc{'DIC_south'}.long_name = ncchar('southern boundary DIC');
  nc{'DIC_south'}.long_name = 'southern boundary DIC';
  nc{'DIC_south'}.units = ncchar('mMol N m-3');
  nc{'DIC_south'}.units = 'mMol N m-3';
%
  nc{'alkalinity_south'} = ncdouble('alkalinity_time','Z','xi_rho') ;
  nc{'alkalinity_south'}.long_name = ncchar('southern boundary alkalinity');
  nc{'alkalinity_south'}.long_name = 'southern boundary alkalinity';
  nc{'alkalinity_south'}.units = ncchar('mMol N m-3');
  nc{'alkalinity_south'}.units = 'mMol N m-3';
%
  nc{'DOC_south'} = ncdouble('doc_time','Z','xi_rho') ;
  nc{'DOC_south'}.long_name = ncchar('southern boundary DOC');
  nc{'DOC_south'}.long_name = 'southern boundary DOC';
  nc{'DOC_south'}.units = ncchar('mMol N m-3');
  nc{'DOC_south'}.units = 'mMol N m-3';
%
  nc{'FER_south'} = ncdouble('fer_time','Z','xi_rho') ;
  nc{'FER_south'}.long_name = ncchar('southern boundary Iron');
  nc{'FER_south'}.long_name = 'southern boundary Iron';
  nc{'FER_south'}.units = ncchar('mMol N m-3');
  nc{'FER_south'}.units = 'mMol N m-3';
end
%
if obc(2)==1
%
%   Eastern boundary
%
  nc{'NO3_east'} = ncdouble('NO3_time','Z','eta_rho') ;
  nc{'NO3_east'}.long_name = ncchar('eastern boundary NO3');
  nc{'NO3_east'}.long_name = 'eastern boundary NO3';
  nc{'NO3_east'}.units = ncchar('mMol N m-3');
  nc{'NO3_east'}.units = 'mMol N m-3';
%
  nc{'PO4_east'} = ncdouble('po4_time','Z','eta_rho') ;
  nc{'PO4_east'}.long_name = ncchar('eastern boundary PO4');
  nc{'PO4_east'}.long_name = 'eastern boundary PO4';
  nc{'PO4_east'}.units = ncchar('mMol N m-3');
  nc{'PO4_east'}.units = 'mMol N m-3';

%
  nc{'oxygen_east'} = ncdouble('oxygen_time','Z','eta_rho') ;
  nc{'oxygen_east'}.long_name = ncchar('eastern boundary O2');
  nc{'oxygen_east'}.long_name = 'eastern boundary O2';
  nc{'oxygen_east'}.units = ncchar('mMol O m-3');
  nc{'oxygen_east'}.units = 'mMol O m-3';
%
  nc{'DIC_east'} = ncdouble('dic_time','Z','eta_rho') ;
  nc{'DIC_east'}.long_name = ncchar('eastern boundary DIC');
  nc{'DIC_east'}.long_name = 'eastern boundary DIC';
  nc{'DIC_east'}.units = ncchar('mMol N m-3');
  nc{'DIC_east'}.units = 'mMol N m-3';
%
  nc{'alkalinity_east'} = ncdouble('alkalinity_time','Z','eta_rho') ;
  nc{'alkalinity_east'}.long_name = ncchar('eastern boundary alkalinity');
  nc{'alkalinity_east'}.long_name = 'eastern boundary alkalinity';
  nc{'alkalinity_east'}.units = ncchar('mMol N m-3');
  nc{'alkalinity_east'}.units = 'mMol N m-3';
%
  nc{'chlo_east'} = ncdouble('chlo_time','Z','eta_rho') ;
  nc{'chlo_east'}.long_name = ncchar('eastern boundary chlorophyll');
  nc{'chlo_east'}.long_name = 'eastern boundary chlorophyll';
  nc{'chlo_east'}.units = ncchar('mMol chlo m-3');
  nc{'chlo_east'}.units = 'mMol chlo m-3';
%
end
%
if obc(3)==1
%
%   Northern boundary
%
  nc{'NO3_north'} = ncdouble('NO3_time','Z','xi_rho') ;
  nc{'NO3_north'}.long_name = ncchar('northern boundary NO3');
  nc{'NO3_north'}.long_name = 'northern boundary NO3';
  nc{'NO3_north'}.units = ncchar('mMol N m-3');
  nc{'NO3_north'}.units = 'mMol N m-3';
%
  nc{'PO4_north'} = ncdouble('po4_time','Z','xi_rho') ;
  nc{'PO4_north'}.long_name = ncchar('northern boundary PO4');
  nc{'PO4_north'}.long_name = 'northern boundary PO4';
  nc{'PO4_north'}.units = ncchar('mMol N m-3');
  nc{'PO4_north'}.units = 'mMol N m-3';
%
  nc{'Si_north'} = ncdouble('si_time','Z','xi_rho') ;
  nc{'Si_north'}.long_name = ncchar('northern boundary Si');
  nc{'Si_north'}.long_name = 'northern boundary Si';
  nc{'Si_north'}.units = ncchar('mMol N m-3');
  nc{'Si_north'}.units = 'mMol N m-3';
%
  nc{'oxygen_north'} = ncdouble('oxygen_time','Z','xi_rho') ;
  nc{'oxygen_north'}.long_name = ncchar('northern boundary O2');
  nc{'oxygen_north'}.long_name = 'northern boundary O2';
  nc{'oxygen_north'}.units = ncchar('mMol N m-3');
  nc{'oxygen_north'}.units = 'mMol N m-3';
%
  nc{'DIC_north'} = ncdouble('dic_time','Z','xi_rho') ;
  nc{'DIC_north'}.long_name = ncchar('northern boundary DIC');
  nc{'DIC_north'}.long_name = 'northern boundary DIC';
  nc{'DIC_north'}.units = ncchar('mMol N m-3');
  nc{'DIC_north'}.units = 'mMol N m-3';
%
  nc{'alkalinity_north'} = ncdouble('alkalinity_time','Z','xi_rho') ;
  nc{'alkalinity_north'}.long_name = ncchar('northern boundary alkalinity');
  nc{'alkalinity_north'}.long_name = 'northern boundary alkalinity';
  nc{'alkalinity_north'}.units = ncchar('mMol N m-3');
  nc{'alkalinity_north'}.units = 'mMol N m-3';
%
  nc{'DOC_north'} = ncdouble('doc_time','Z','xi_rho') ;
  nc{'DOC_north'}.long_name = ncchar('northern boundary DOC');
  nc{'DOC_north'}.long_name = 'northern boundary DOC';
  nc{'DOC_north'}.units = ncchar('mMol N m-3');
  nc{'DOC_north'}.units = 'mMol N m-3';
%
  nc{'FER_north'} = ncdouble('fer_time','Z','xi_rho') ;
  nc{'FER_north'}.long_name = ncchar('northern boundary Iron');
  nc{'FER_north'}.long_name = 'northern boundary Iron';
  nc{'FER_north'}.units = ncchar('mMol N m-3');
  nc{'FER_north'}.units = 'mMol N m-3';
%
end
%
if obc(4)==1
%
%   Western boundary
%
  nc{'NO3_west'} = ncdouble('NO3_time','Z','eta_rho') ;
  nc{'NO3_west'}.long_name = ncchar('western boundary NO3');
  nc{'NO3_west'}.long_name = 'western boundary NO3';
  nc{'NO3_west'}.units = ncchar('mMol N m-3');
  nc{'NO3_west'}.units = 'mMol N m-3';
%
  nc{'PO4_west'} = ncdouble('po4_time','Z','eta_rho') ;
  nc{'PO4_west'}.long_name = ncchar('western boundary PO4');
  nc{'PO4_west'}.long_name = 'western boundary PO4';
  nc{'PO4_west'}.units = ncchar('mMol N m-3');
  nc{'PO4_west'}.units = 'mMol N m-3';
%
  nc{'Si_west'} = ncdouble('si_time','Z','eta_rho') ;
  nc{'Si_west'}.long_name = ncchar('western boundary Si');
  nc{'Si_west'}.long_name = 'western boundary Si';
  nc{'Si_west'}.units = ncchar('mMol N m-3');
  nc{'Si_west'}.units = 'mMol N m-3';
%
  nc{'oxygen_west'} = ncdouble('oxygen_time','Z','eta_rho') ;
  nc{'oxygen_west'}.long_name = ncchar('western boundary O2');
  nc{'oxygen_west'}.long_name = 'western boundary O2';
  nc{'oxygen_west'}.units = ncchar('mMol N m-3');
  nc{'oxygen_west'}.units = 'mMol N m-3';
%
  nc{'DIC_west'} = ncdouble('dic_time','Z','eta_rho') ;
  nc{'DIC_west'}.long_name = ncchar('western boundary DIC');
  nc{'DIC_west'}.long_name = 'western boundary DIC';
  nc{'DIC_west'}.units = ncchar('mMol N m-3');
  nc{'DIC_west'}.units = 'mMol N m-3';
%
  nc{'alkalinity_west'} = ncdouble('alkalinity_time','Z','eta_rho') ;
  nc{'alkalinity_west'}.long_name = ncchar('western boundary alkalinity');
  nc{'alkalinity_west'}.long_name = 'western boundary alkalinity';
  nc{'alkalinity_west'}.units = ncchar('mMol N m-3');
  nc{'alkalinity_west'}.units = 'mMol N m-3';
%
  nc{'DOC_west'} = ncdouble('doc_time','Z','eta_rho') ;
  nc{'DOC_west'}.long_name = ncchar('western boundary DOC');
  nc{'DOC_west'}.long_name = 'western boundary DOC';
  nc{'DOC_west'}.units = ncchar('mMol N m-3');
  nc{'DOC_west'}.units = 'mMol N m-3';
%
  nc{'FER_west'} = ncdouble('fer_time','Z','eta_rho') ;
  nc{'FER_west'}.long_name = ncchar('western boundary Iron');
  nc{'FER_west'}.long_name = 'western boundary Iron';
  nc{'FER_west'}.units = ncchar('mMol N m-3');
  nc{'FER_west'}.units = 'mMol N m-3';
%
end
%
% Leave define mode
%
%result = endef(nc);
close(nc);
%
% Write variables
%

nc=netcdf(zbryname,clobber);

nc{'ZNO3'}(:)= Z;
nc{'Z'}(:)=Z;
nc{'bry_time'}(:) = time;
nc('NO3_time') = time;
nc('po4_time') = time;
nc('alkalinity_time') = time;
nc('oxygen_time') = time;

if obc(1)==1
  nc{'NO3_south'}(:)  =  0;
  nc{'PO4_south'}(:)  =  0;
  nc{'Si_south'}(:) =  0;
  nc{'oxygen_south'}(:)   =  0;
  nc{'DIC_south'}(:)  =  0;
  nc{'alkalinity_south'}(:) =  0;
  nc{'DOC_south'}(:)  =  0;
  nc{'FER_south'}(:)  =  0;
end 
if obc(2)==1 
  nc{'NO3_east'}(:)  =  0;
  nc{'PO4_east'}(:)  =  0;
  nc{'oxygen_east'}(:)   =  0;
  nc{'alkalinity_east'}(:) =  0;
end 
if obc(3)==1 
  nc{'NO3_north'}(:)  =  0;
  nc{'PO4_north'}(:)  =  0;
  nc{'Si_north'}(:) =  0;
  nc{'oxygen_north'}(:)   =  0;
  nc{'DIC_north'}(:)  =  0;
  nc{'alkalinity_north'}(:) =  0;
  nc{'DOC_north'}(:)  =  0;
  nc{'FER_north'}(:)  =  0;
end 
if obc(4)==1 
  nc{'NO3_west'}(:)  =  0;
  nc{'PO4_west'}(:)  =  0;
  nc{'Si_west'}(:) =  0;
  nc{'oxygen_west'}(:)   =  0;
  nc{'DIC_west'}(:)  =  0;
  nc{'TALK_west'}(:) =  0;
  nc{'DOC_west'}(:)  =  0;
  nc{'FER_west'}(:)  =  0;
end 
close(nc);
return


