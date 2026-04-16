function add_ini_nh4(inifile);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  function add_ini_nh4(inifile);
%
%  
% 
nc=netcdf(inifile,'write');
time= nc{'ocean_time'}(:);
tlen=length(time);
for l=1:tlen
  disp(['time index: ',num2str(l),' of total: ',num2str(tlen)])
  nc{'NH4'}(l,:,:,:)=0.1;
end
close(nc);
return