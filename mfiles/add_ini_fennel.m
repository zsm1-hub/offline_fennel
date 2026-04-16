function add_ini_fennel(inifile,clobber)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (c) 2000 IRD                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                 %
%                                                                 %
%  function nc=add_ini_pisces(inifile,clobber)                    %
%                                                                 %
%   This function create the header of a Netcdf climatology       %
%   file.                                                         %
%                                                                 %
%   Input:                                                        %
%                                                                 %
%   inifile      Netcdf initial file name (character string).     %
%   clobber      Switch to allow or not writing over an existing  %
%                file.(character string)                          %
%                                                                 %
%   Output                                                        %
%                                                                 %
%   nc       Output netcdf object.                                %
%                                                                 %
%   Pierrick Penven, IRD, 2005.                                   %
%   Olivier Aumont, IRD, 2006.                                    %
%   Patricio Marchesiello, IRD 2007                               %
%   Christophe Eugene Raoul Menkes, IRD 2007                      %
%                                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' ')
disp([' Adding PISCES data in file : ',inifile])
%
%  Create the initial file
%
nc = netcdf(inifile,clobber);
%result = redef(nc);%wsc

%
%  Create variables
%
% the added variables need to have the same dimensions as the old ones
nc{'NO3'} = ncdouble('time','s_rho','eta_rho','xi_rho') ;
nc{'PO4'} = ncdouble('time','s_rho','eta_rho','xi_rho') ;
nc{'oxygen'} = ncdouble('time','s_rho','eta_rho','xi_rho') ;
nc{'alkalinity'} = ncdouble('time','s_rho','eta_rho','xi_rho') ;
nc{'chlorophyll'}=ncdouble('time','s_rho','eta_rho','xi_rho');
nc{'NH4'}=ncdouble('time','s_rho','eta_rho','xi_rho');
nc{'phytoplankton'}=ncdouble('time','s_rho','eta_rho','xi_rho');
nc{'zooplankton'}=ncdouble('time','s_rho','eta_rho','xi_rho');
nc{'LdetritusN'}=ncdouble('time','s_rho','eta_rho','xi_rho');
nc{'SdetritusN'}=ncdouble('time','s_rho','eta_rho','xi_rho');
%
nc{'LdetritusC'}=ncdouble('time','s_rho','eta_rho','xi_rho');
nc{'SdetritusC'}=ncdouble('time','s_rho','eta_rho','xi_rho');
nc{'TIC'}=ncdouble('time','s_rho','eta_rho','xi_rho');


%
%  Create attributes
%
nc{'NO3'}.long_name = ncchar('nitrate concentrate');
nc{'NO3'}.long_name = 'nitrate concentrate';
nc{'NO3'}.units = ncchar('mMol N m-3');
nc{'NO3'}.units = 'mMol N m-3';
%
%
nc{'PO4'}.long_name = ncchar('phosphate concentration');
nc{'PO4'}.long_name = 'phosphate concentration';
nc{'PO4'}.units = ncchar('mMol P m-3');
nc{'PO4'}.units = 'mMol P m-3';
%
nc{'oxygen'}.long_name = ncchar('phosphate concentration');
nc{'oxygen'}.long_name = 'phosphate concentration';
nc{'oxygen'}.units = ncchar('mMol O m-3');
nc{'oxygen'}.units = 'mMol O m-3';
%
%
nc{'alkalinity'}.long_name = ncchar('total alkalinity');
nc{'alkalinity'}.long_name = 'total alkalinity';
nc{'alkalinity'}.units = ncchar('mMol C m-3');
nc{'alkalinity'}.units = 'mMol C m-3';
%
%
nc{'chlorophyll'}.long_name = ncchar('chlorophyll concentrate');
nc{'chlorophyll'}.long_name = 'chlorophyll concentrate';
nc{'chlorophyll'}.units = ncchar('mgC m-3');
nc{'chlorophyll'}.units = 'mgC m-3';
%
nc{'NH4'}.long_name = ncchar('NH4');
nc{'NH4'}.long_name = 'NH4';
nc{'NH4'}.units = ncchar('mMol N m-3');
nc{'NH4'}.units = 'mMol N m-3';
%
%
nc{'phytoplankton'}.long_name = ncchar('phytoplankton concentrate');
nc{'phytoplankton'}.long_name = 'phytoplankton concentrate';
nc{'phytoplankton'}.units = ncchar('mMol N m-3');
nc{'phytoplankton'}.units = 'mMol N m-3';
%
%
nc{'zooplankton'}.long_name = ncchar('zooplankton concentrate');
nc{'zooplankton'}.long_name = 'zooplankton concentrate';
nc{'zooplankton'}.units = ncchar('mMol N m-3');
nc{'zooplankton'}.units = 'mMol N m-3';
%
%
nc{'LdetritusN'}.long_name = ncchar('large fraction nitrogen detritus concentration');
nc{'LdetritusN'}.long_name = 'large fraction nitrogen detritus concentration';
nc{'LdetritusN'}.units = ncchar('mMol N m-3');
nc{'LdetritusN'}.units = 'mMol N m-3';
%
%
nc{'SdetritusN'}.long_name = ncchar('small fraction nitrogen detritus concentration');
nc{'SdetritusN'}.long_name = 'small fraction nitrogen detritus concentration';
nc{'SdetritusN'}.units = ncchar('mMol N m-3');
nc{'SdetritusN'}.units = 'mMol N m-3';
%
%
nc{'LdetritusC'}.long_name = ncchar('large fraction carbon detritus concentration');
nc{'LdetritusC'}.long_name = 'large fraction carbon detritus concentration';
nc{'LdetritusC'}.units = ncchar('mMol C m-3');
nc{'LdetritusC'}.units = 'mMol C m-3';
%
%
nc{'SdetritusC'}.long_name = ncchar('small fraction carbon detritus concentration');
nc{'SdetritusC'}.long_name = 'small fraction carbon detritus concentration';
nc{'SdetritusC'}.units = ncchar('mMol C m-3');
nc{'SdetritusC'}.units = 'mMol C m-3';
%
%
nc{'TIC'}.long_name = ncchar('total inorganic carbon');
nc{'TIC'}.long_name = 'total inorganic carbon';
nc{'TIC'}.units = ncchar('mMol C m-3');
nc{'TIC'}.units = 'mMol C m-3';
%
%
%
% Leave define mode
%
result = endef(nc);
%
% Write variables
%
nc{'NO3'}(:)  =  0;
nc{'PO4'}(:)  =  0;
nc{'oxygen'}(:)   =  0;
nc{'alkalinity'}(:) =  0;
nc{'chlorophyll'}(:) = 0;
nc{'NH4'}(:) = 0;
nc{'phytoplankton'}(:) = 0;
nc{'zooplankton'}(:) = 0;
nc{'LdetritusN'}(:) = 0;
nc{'SdetritusN'}(:) = 0;
nc{'LdetritusC'}(:) = 0;
nc{'SdetritusC'}(:) = 0;
nc{'TIC'}(:) = 0;
%
% Synchronize on disk
%
close(nc);
return


