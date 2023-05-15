MEASURING THE INPUT RANK IN GLOBAL SUPPLY NETWORKS

Replication material to compute the Input Rank using the WIOD 2016 release input-output tables

Data source:
Timmer, M. P., Dietzenbacher, E., Los, B., Stehrer, R. and de Vries, G. J. (2015), "An Illustrated User Guide to the World Input–Output Database: the Case of Global Automotive Production" , Review of International Economics., 23: 575–605
https://www.rug.nl/ggdc/valuechain/wiod/wiod-2016-release

Data_preparation folder:
- 'InputRankWIOD_Data_Preparation.do', STATA do-file that contains each step to obtain 'WIOD_clean.csv' and 'wiod_alphak.csv'.
- 'WIOD_SEA_Nov16.xlsx' contains socio economic accounts.
- 'wiod_compensation_employees_2014_cou_ind.dta'
- 'wiod_compensation_employees_2014_cou.dta'
- 'wiod_compensation_employees_2014.dta'
- 'wiod_inputs_cost.dta'
- 'Industry_wiod.dta' contains the list of industries in WIOD table.
- 'correspondence_industry_RNr.dta'
- 'WIOT2014_October16_ROW.dta': world Input-output tables (WIOTs) data in current prices, denoted in millions of US dollars.

Input_Rank_calculation folder:
- 'WIOD_clean.csv', cleaned version of 'WIOT2014_October16_ROW.dta'
- 'WIODclean.mat' contains 'WIOD_clean.csv' data, ready to be loaded into MATLAB.
- 'wiod_alphak.csv' contains information on sector-specific input shares. Each coefficient is calculated by diving the cost of a sector k's intermediate inputs by the total cost of all its inputs.
- 'wiodalphak.mat' contains wiod_alphak.csv' data, ready to be loaded into MATLAB.
- 'Country.mat' contains the list of countries in WIOD table.
- 'Industry.mat' contains the list of industries in WIOD table.
- 'computeInputRank_WIOD.m': MATLAB script that contains the code to compute the Input Rank.

