MEASURING THE INPUT RANK IN GLOBAL SUPPLY NETWORKS

Replication material to compute the Input Rank using the U.S. 2002 input-output tables

Data source:
https://www.bea.gov/industry/benchmark-input-output-data

Data_preparation folder:
- ‘IODirectRequireDetail.csv’ contains Commodity by Industry Direct Requirements after Redefinitions, 2002 Benchmark, at the detailed level.  Direct Requirements includes estimates of the inputs for each commodity that are directly required by an industry to produce one dollar of output. Sourced from the Bureau of Economic Analysis (BEA).
- ‘Data_preparation_IO_US_BEA_2002.do’, STATA do-file that contains each step to obtain ‘IODirectRequireDetail_clean.csv’ and ‘alpha_k.csv’.

Input_Rank_calculation folder:
- ‘IODirectRequireDetail_clean.csv’, cleaned version of ‘IODirectRequireDetail.csv’.
- ‘alpha_k.csv’ contains information on sector-specific input shares. Each coefficient is calculated by diving the cost of a sector k's intermediate inputs by the total cost of all its inputs.
- 'alphak.mat’ contains ‘alpha_k.csv’ data, ready to be loaded into MATLAB.
- 'data.mat' contains ‘IODirectRequireDetail_clean.csv’ data, ready to be loaded into MATLAB.
- ‘computeInputRank_US_BEA.m’: MATLAB script that contains the code to compute the Input Rank.

Input_Rank_results folder:
- ‘US_BEA_InputRank.txt’: Input Rank results for each industry pair.
