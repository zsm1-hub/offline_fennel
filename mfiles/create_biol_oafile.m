function create_biol_oafile(oaname,grdname,title,...
                         time,cycle,clobber,transform,stretch);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' ')
disp([' Creating the file : ',oaname])
disp(' ')
%
%  Read the grid file
%
nc = netcdf(grdname, 'nowrite');
h=nc{'h'}(:);
maskr=nc{'mask_rho'}(:);
Lp=length(nc('xi_rho'));
Mp=length(nc('eta_rho'));
lon=nc{'lon_rho'}(:,:);
lat=nc{'lat_rho'}(:,:);
status=close(nc);

L=Lp-1;
M=Mp-1;
%
%  Create the climatology file
%
type = 'CLIMATOLOGY Z file' ;
history = 'ROMS' ;
nc = netcdf(oaname,clobber);
result = redef(nc);
%
%  Create dimensions
%
nc('xi_u') = L;
nc('xi_v') = Lp;
nc('xi_rho') = Lp;
nc('eta_u') = Mp;
nc('eta_v') = M;
nc('eta_rho') = Mp;
nc('tclm_time') = length(time);
nc('one') = 1;
%
%  Create variables
%
nc{'lon_rho'}=ncdouble('eta_rho','xi_rho');
nc{'lat_rho'}=ncdouble('eta_rho','xi_rho');
nc{'tclm_time'} = ncdouble('tclm_time') ;
%
%  Create attributes
%
nc{'tclm_time'}.long_name = ncchar('time for temperature climatology');
nc{'tclm_time'}.long_name = 'time for temperature climatology';
nc{'tclm_time'}.units = ncchar('day');
nc{'tclm_time'}.units = 'day';
nc{'tclm_time'}.cycle_length = cycle;
%
%
% Create global attributes
%
nc.title = ncchar(title);
nc.title = title;
nc.date = ncchar(date);
nc.date = date;
nc.grd_file = ncchar(grdname);
nc.grd_file = grdname;
nc.type = ncchar(type);
nc.type = type;
nc.history = ncchar(history);
nc.history = history;
%
% Leave define mode
%
result = endef(nc);
%
% Compute S coordinates
% Write variables
%
nc{'tclm_time'}(:) =  time;
nc{'lon_rho'}(:,:) =lon;
nc{'lat_rho'}(:,:) =lat;
close(nc)
return
