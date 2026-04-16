%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Extrapole and interpole biology data and write in climatology file
%
%  Data source : IRI/LDEO Climate Data Library (World Ocean Atlas 1998)
%    http://ingrid.ldgo.columbia.edu/
%    http://iridl.ldeo.columbia.edu/SOURCES/.NOAA/.NODC/.WOA2001/
%
%  Pierrick Penven, IRD, 2005.
%  Olivier Aumont the master, IRD, 2006.
%  Patricio Marchesiello, chief, IRD, 2007.
%  Christophe Eugene Raoul Menkes, the slave, IRD, 2007.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
%%%%%%%%%%%%%%%%%%%%% USERS DEFINED VARIABLES %%%%%%%%%%%%%%%%%%%%%%%%
%
%  Switches for selecting what to process (1=ON)
%
romstools_param_tws
%
% Climatology files
%
DATADIR='/export/home/wangj/Roms_tools/';
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
chlo_ann_data  = [DATADIR,'SeaWifs/chla_ann.cdf'];

%
cycle=woa_cycle;
%gc
NO3min=1;
%gc
%
if (makeclim)
  disp(' ')
  disp(' Create the climatology file...')
  create_biol_oafile(bioloaname,grdname,ROMS_title,...
                  woa_time,woa_cycle,'clobber',vtransform,stretching);
end
%%%%%%%%%%%%%%%%%%% END USERS DEFINED VARIABLES %%%%%%%%%%%%%%%%%%%%%%%
%
% Add variables in the files
%
add_no3(bioloaname,clmname,ininame,grdname,no3_seas_data,...
        no3_ann_data,cycle,makeoa,makeclim)


add_po4(bioloaname,clmname,ininame,grdname,po4_seas_data,...
        po4_ann_data,cycle,makeoa,makeclim)


add_o2(bioloaname,clmname,ininame,grdname,o2_seas_data,...
        o2_ann_data,cycle,makeoa,makeclim)

add_talk(bioloaname,clmname,ininame,grdname,talk_seas_data,...
        talk_ann_data,cycle,makeoa,makeclim)


break

%add_doc(bioloaname,clmname,ininame,grdname,doc_seas_data,...
%       doc_ann_data,cycle,makeoa,makeclim)
            
%add_fer(bioloaname,clmname,ininame,grdname,fer_seas_data,...
%       fer_ann_data,cycle,makeoa,makeclim)

%add_nh4(clmname,ininame,grdname,woa_time,woa_cycle,makeoa,makeclim)

%add_phyto(clmname,ininame,grdname,woa_time,woa_cycle,makeoa,makeclim)

%add_zoop(clmname,ininame,grdname,woa_time,woa_cycle,makeoa,makeclim)

%add_detritusN(clmname,ininame,grdname,woa_time,woa_cycle,makeoa,makeclim)

%add_detritusC(clmname,ininame,grdname,woa_time,woa_cycle,makeoa,makeclim)

%add_TIC(clmname,ininame,grdname,woa_time,woa_cycle,makeoa,makeclim)

%
% Horizontal extrapolation of NO3
%
if (makeoa)
  ext_tracers(bioloaname,no3_seas_data,no3_ann_data,...
              'nitrate','NO3','no3_time','Zno3',Roa);

  ext_tracers(bioloaname,po4_seas_data,po4_ann_data,...
              'phosphate','PO4','po4_time','Zpo4',Roa);

%  ext_tracers(bioloaname,sio3_seas_data,sio3_ann_data,...
%              'silicate','Si','si_time','Zsi',Roa);

  ext_tracers(bioloaname,o2_seas_data,o2_ann_data,...
              'oxygen','oxygen','oxygen_time','Zoxygen',Roa);

%  ext_tracers(bioloaname,dic_seas_data,dic_ann_data,...
%             'dic','DIC','dic_time','Zdic',Roa);

  ext_tracers(bioloaname,talk_seas_data,talk_ann_data,...
              'talk','TALK','talk_time','Ztalk',Roa);

%  ext_tracers(bioloaname,doc_seas_data,doc_ann_data,...
%             'doc','DOC','doc_time','Zdoc',Roa);

%  ext_tracers(bioloaname,fer_seas_data,fer_ann_data,...
%             'fer','FER','fer_time','Zfer',Roa);
end
%
% Vertical interpolations 
%
if (makeclim)
  disp(' ')
  disp(' Vertical interpolations')
  disp(' ')
  disp(' NO3...')
  vinterp_clm(clmname,grdname,bioloaname,'NO3','no3_time','Zno3',0,'r',vtransform,stretching);
%
%  PO4
%
  disp(' ')
  disp(' Vertical interpolations')
  disp(' ')
  disp(' PO4...')
  vinterp_clm(clmname,grdname,bioloaname,'PO4','po4_time','Zpo4',0,'r',vtransform,stretching);
 %
 %  Si
 %
%  disp(' ')
%  disp(' Vertical interpolations')
%  disp(' ')
%  disp(' Si...')
%  vinterp_clm(clmname,grdname,bioloaname,'Si','si_time','Zsi',0,'r',vtransform,stretching);
%
%  oxygen
%
  disp(' ')
  disp(' Vertical interpolations')
  disp(' ')
  disp(' oxygen...')
  vinterp_clm(clmname,grdname,bioloaname,'oxygen','oxygen_time','Zoxygen',0,'r',vtransform,stretching);

%
% DIC 
%
%  disp(' ')
%  disp(' Vertical interpolations')
%  disp(' ')
%  disp(' DIC...')
%  vinterp_clm(clmname,grdname,bioloaname,'DIC','dic_time','Zdic',0,'r',vtransform,stretching);
%
% TALK
%
  disp(' ')
  disp(' Vertical interpolations')
  disp(' ')
  disp(' TALK...')
%  vinterp_clm(clmname,grdname,bioloaname,'TALK','talk_time','Ztalk',0,'r',vtransform,stretching);

%
% DOC
%
%  disp(' ')
%  disp(' Vertical interpolations')
%  disp(' ')
%  disp(' DOC...')
%  vinterp_clm(clmname,grdname,bioloaname,'DOC','doc_time','Zdoc',0,'r',vtransform,stretching);
%
% FER
%
%  disp(' ')
%  disp(' Vertical interpolations')
%  disp(' ')
%  disp(' FER...')
%  vinterp_clm(clmname,grdname,bioloaname,'FER','fer_time','Zfer',0,'r',vtransform,stretching);
end


if (makeplot)
disp(' ')
disp(' Make a few plots...')
test_clim(clmname,grdname,'NO3',1,coastfileplot,vtransform,stretching)
figure
test_clim(clmname,grdname,'PO4',1,coastfileplot,vtransform,stretching)
figure
test_clim(clmname,grdname,'Si',1,coastfileplot,vtransform,stretching)
figure
test_clim(clmname,grdname,'O2',1,coastfileplot,vtransform,stretching)
figure
test_clim(clmname,grdname,'DIC',1,coastfileplot,vtransform,stretching)
figure
test_clim(clmname,grdname,'TALK',1,coastfileplot,vtransform,stretching)
figure
test_clim(clmname,grdname,'DOC',1,coastfileplot,vtransform,stretching)
figure
test_clim(clmname,grdname,'FER',1,coastfileplot,vtransform,stretching)
end
%
% End
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

