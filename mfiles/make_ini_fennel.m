%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Build a ROMS initial file from Levitus Data
%
%  Extrapole and interpole temperature and salinity from a
%  Climatology to get initial conditions for
%  ROMS (initial netcdf files) .
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
%  Data source : IRI/LDEO Climate Data Library (World Ocean Atlas 1998)
%    http://ingrid.ldgo.columbia.edu/
%    http://iridl.ldeo.columbia.edu/SOURCES/.NOAA/.NODC/.WOA98/
%
%  Pierrick Penven, IRD, 2005.
%  Olivier Aumont, IRD, 2006.
%  Patricio Marchesiello, IRD 2007
%  Christophe Eugene Raoul Menkes, IRD 2007
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
%%%%%%%%%%%%%%%%%%%%% USERS DEFINED VARIABLES %%%%%%%%%%%%%%%%%%%%%%%%
%
%  Title 
%
crocotools_param
%
%  Data climatologies file names:
%
DATADIR='/powerleader/user/ljt/DATASETS_CROCOTOOLS/'; %lwx
no3_month_data  = [DATADIR,'WOAPISCES/no3_seas.cdf'];
no3_ann_data   = [DATADIR,'WOAPISCES/no3_ann.cdf'];
po4_month_data  = [DATADIR,'WOAPISCES/po4_seas.cdf'];
po4_ann_data   = [DATADIR,'WOAPISCES/po4_ann.cdf'];
o2_month_data   = [DATADIR,'WOAPISCES/o2_seas.cdf'];
o2_ann_data    = [DATADIR,'WOAPISCES/o2_ann.cdf'];
sio3_month_data = [DATADIR,'WOAPISCES/sio3_seas.cdf'];
sio3_ann_data  = [DATADIR,'WOAPISCES/sio3_ann.cdf'];
dic_month_data  = [DATADIR,'WOAPISCES/dic_seas.cdf'];
dic_ann_data   = [DATADIR,'WOAPISCES/dic_ann.cdf'];
talk_month_data = [DATADIR,'WOAPISCES/talk_seas.cdf'];
talk_ann_data  = [DATADIR,'WOAPISCES/talk_ann.cdf'];
doc_month_data  = [DATADIR,'WOAPISCES/doc_seas.cdf'];
doc_ann_data   = [DATADIR,'WOAPISCES/doc_ann.cdf'];
fer_month_data  = [DATADIR,'WOAPISCES/fer_seas.cdf'];
fer_ann_data   = [DATADIR,'WOAPISCES/fer_ann.cdf'];
dust_month_data = [DATADIR,'WOAPISCES/dust_seas.cdf'];
dust_ann_data  = [DATADIR,'WOAPISCES/dust_ann.cdf'];
chlo_seas_data = [DATADIR,'SeaWifs/chla_seas.cdf'];
chlo_ann_data = [DATADIR,'SeaWifs/chla_ann.cdf'];
%
%
%%%%%%%%%%%%%%%%%%% END USERS DEFINED VARIABLES %%%%%%%%%%%%%%%%%%%%%%%
%
% Title
%
woa_cycle_bio=365.25;%wsc
if makeini
disp(' ')
disp([' Adding PISCES data into initial file: ',ininame])
%
% Initial file
%
add_ini_fennel(ininame,'w');
ininame
%
% Horizontal and vertical interp/extrapolations 
%
disp(' ')
disp(' Interpolations / extrapolations')
disp(' ')
disp('nitrate ...')
ext_tracers_ini(ininame,grdname,no3_month_data,no3_ann_data,...
             'nitrate','NO3','r',tini,vtransform,stretching,woa_cycle_bio);
disp(' ')
disp('phosphate ...')
ext_tracers_ini(ininame,grdname,po4_month_data,po4_ann_data,...
             'phosphate','PO4','r',tini,vtransform,stretching,woa_cycle_bio);
%disp(' ')
%disp('Silicate ...')
%ext_tracers_ini(ininame,grdname,sio3_month_data,sio3_ann_data,...
%             'silicate','Si','r',tini,vtransform,stretching);
disp(' ')
disp(' Oxygen ...')
ext_tracers_ini(ininame,grdname,o2_month_data,o2_ann_data,...
             'oxygen','oxygen','r',tini,vtransform,stretching,woa_cycle_bio);
%disp(' ')
%disp('Dissolved Inorganic Carbon ...')
%ext_tracers_ini(ininame,grdname,dic_month_data,dic_ann_data,...
%             'dic','DIC','r',tini,vtransform,stretching);

disp(' ')
disp('Total alkalinity ...')
ext_tracers_ini(ininame,grdname,talk_month_data,talk_ann_data,...
             'talk','alkalinity','r',tini,vtransform,stretching,woa_cycle_bio);
%disp(' ')
%disp('Dissolved Organic Carbon...')
%ext_tracers_ini(ininame,grdname,doc_month_data,doc_ann_data,...
%             'doc','DOC','r',tini,vtransform,stretching);

%disp(' ')
%disp('Iron ...')
%ext_tracers_ini(ininame,grdname,fer_month_data,fer_ann_data,...
%             'fer','FER','r',tini,vtransform,stretching);
%
disp(' ')
disp('chlorophyll ...')
%add_ini_chla(ininame,grdname,chlo_seas_data,woa_cycle_bio,Roa,vtransform,stretching);
add_ini_chla(ininame,grdname,chlo_seas_data,woa_cycle_bio,Roa);%wsc
disp(' ')
disp('NH4 ...')
add_ini_nh4(ininame);

disp(' ')
disp('phytoplankton ...')
add_ini_phyto(ininame);

disp(' ')
disp('zooplankton ...')
add_ini_zoop(ininame);

disp(' ')
disp('LdetritusN & SdetritusN ...')
add_ini_detritusN(ininame);

disp(' ')
disp('LdetritusC & SdetritusC ...')
add_ini_detritusC(ininame);

disp(' ')
disp('TIC ...')
add_ini_TIC(ininame);

disp('Complete!')


% Make a few plots
%

if makeplot==1
disp(' ')
disp(' Make a few plots...')
test_clim(ininame,grdname,'NO3',1,coastfileplot,vtransform,stretching)
figure
test_clim(ininame,grdname,'PO4',1,coastfileplot,vtransform,stretching)
figure
test_clim(ininame,grdname,'Si',1,coastfileplot,vtransform,stretching)
figure
test_clim(ininame,grdname,'O2',1,coastfileplot,vtransform,stretching)
figure
test_clim(ininame,grdname,'DIC',1,coastfileplot,vtransform,stretching)
figure
test_clim(ininame,grdname,'TALK',1,coastfileplot,vtransform,stretching)
figure
test_clim(ininame,grdname,'DOC',1,coastfileplot,vtransform,stretching)
figure
test_clim(ininame,grdname,'FER',1,coastfileplot,vtransform,stretching)
end

end %if makeini
%
% End
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
