# offline_fennel
1. need VRX's toy_offline [https://github.com/vrx-/toy_offline]
2. need COAWST-OIL version [https://github.com/kthyng/COAWST-ROMS-OIL]
3. need some rountine by siming to convert ucla-roms data 

ncgen xxx.cdl -o empty_shell_ini.nc
fill with his initial time hydro data

using croco_tool_xmd1204/Preprocessing/biology/make_ini_fennel.m to add fennel
