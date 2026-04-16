function add_o2(oafile,climfile,inifile,gridfile,seas_datafile,...
                 ann_datafile,cycle,makeoa,makeclim);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  function [longrd,latgrd,o2]=add_o2(climfile,gridfile,...
%                                       seas_datafile,ann_datafile,...
%                                       cycle);
%
%  pierrick 2001
%
%  Add oxygen (mMol 0 m-3) in a ROMS climatology file
%  take seasonal data for the upper levels and annual data for the
%  lower levels
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
%   output:
%
%    [longrd,latgrd,o2] : surface field to plot (as an illustration)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Read in the grid
%
nc=netcdf(gridfile,'nowrite');
hmax=max(max(nc{'h'}(:)));
close(nc)
%
% read in the datafiles 
%
nc=netcdf(seas_datafile,'nowrite');
t=nc{'T'}(:);
close(nc)

nc=netcdf(ann_datafile,'nowrite');
zo2=nc{'Z'}(:);
kmax=max(find(zo2<hmax))-1;
zo2=zo2(1:kmax);
close(nc)

%
% open the OA file  
% 
if (makeoa)
  disp('Add_oxygen: creating variables and attributes for the OA file')
  nc=netcdf(oafile,'write');
  redef(nc);
  nc('oxygen_time') = length(t);
  nc{'oxygen_time'} = ncdouble('oxygen_time') ;
  nc('Zoxygen') = length(zo2);
  nc{'Zoxygen'} = ncdouble('Zoxygen') ;
  nc{'oxygen'} = ncdouble('oxygen_time','Zoxygen','eta_rho','xi_rho') ;
%
  nc{'oxygen_time'}.long_name = ncchar('time for oxygen');
  nc{'oxygen_time'}.long_name = 'time for oxygen';
  nc{'oxygen_time'}.units = ncchar('day');
  nc{'oxygen_time'}.units = 'day';
  if cycle~=0
    nc{'oxygen_time'}.cycle_length = cycle;
  end
%
  nc{'Zoxygen'}.long_name = ncchar('Depth for O2');
  nc{'Zoxygen'}.long_name = 'Depth for O2';
  nc{'Zoxygen'}.units = ncchar('m');
  nc{'Zoxygen'}.units = 'm';
%
  nc{'oxygen'}.long_name = ncchar('Oxygen');
  nc{'oxygen'}.long_name = 'Oxygen';
  nc{'oxygen'}.units = ncchar('mMol O m-3');
  nc{'oxygen'}.units = 'mMol O m-3';
  nc{'oxygen'}.fields = ncchar('O2, scalar, series');
  nc{'oxygen'}.fields = 'O2, scalar, series';
%
  endef(nc);
%
% record deth and time and close
%
  nc{'oxygen_time'}(:)=(t-1.)*365.25/12.; % if time in month in the dataset !!!
  nc{'Zoxygen'}(:)=zo2;
  close(nc)
end
%
% Same thing for the Clim file
%
if (makeclim)
  disp('Add_oxygen: creating variables and attributes for the Climatology file')
%
% open the clim file  
% 
  nc=netcdf(climfile,'write');
  redef(nc);
  nc('oxygen_time') = length(t);
  nc{'oxygen_time'} = ncdouble('oxygen_time') ;
  nc{'oxygen'} = ncdouble('oxygen_time','s_rho','eta_rho','xi_rho') ;
%
  nc{'oxygen_time'}.long_name = ncchar('time for oxygen');
  nc{'oxygen_time'}.long_name = 'time for oxygen';
  nc{'oxygen_time'}.units = ncchar('day');
  nc{'oxygen_time'}.units = 'day';
  if cycle~=0
    nc{'oxygen_time'}.cycle_length = cycle;
  end
%
  nc{'oxygen'}.long_name = ncchar('oxygen');
  nc{'oxygen'}.long_name = 'oxygen';
  nc{'oxygen'}.units = ncchar('mMol O m-3');
  nc{'oxygen'}.units = 'mMol O m-3';
  nc{'oxygen'}.fields = ncchar('O2, scalar, series');
  nc{'oxygen'}.fields = 'O2, scalar, series';
%
  endef(nc);
%
% record the time and close
%
  nc{'oxygen_time'}(:)=(t-1.)*365.25/12.; % if time in month in the dataset !!!
  close(nc)
end
%
% Same thing for the Initial file
%
%disp('Add_no3: creating variables and attributes for the Initial file')
%
% open the clim file  
% 
%nc=netcdf(inifile,'write');
%redef(nc);
%nc{'NO3'} = ncdouble('time','s_rho','eta_rho','xi_rho') ;
%
%nc{'NO3'}.long_name = ncchar('Nitrate');
%nc{'NO3'}.long_name = 'Nitrate';
%nc{'NO3'}.units = ncchar('mMol N m-3');
%nc{'NO3'}.units = 'mMol N m-3';
%
%endef(nc);
%close(nc)

return

