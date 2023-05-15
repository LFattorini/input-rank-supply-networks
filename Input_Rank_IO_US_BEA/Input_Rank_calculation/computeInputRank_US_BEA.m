%% Load data

load data.mat
load alphak.mat

%% Compute Input Rank

% The G matrix (column stochastic) defines output at the sectoral level of the economy. 
% Each g_hk coefficient represents the share of intermediate inputs of
% sector h out of all intermediate inputs used in the production of sector k's output.

% List of industries with no repetitions and an index vector.
[sectors, idx] = unique(IO_input);
sectorNames = IO_input_name(idx);

% G matrix creation from IO US BEA data 2002 'IODirectRequireDetail_clean.csv', dim 422x422 sectors.

 U = zeros(numel(sectors));
 
    for i = 1:numel(IO_input)
        U(strcmp(IO_input{i}, sectors), strcmp(IO_output{i}, sectors)) = coeff(i);
    end
  G = U./repmat(sum(U,1), size(U,1), 1);
  G(isnan(G)) = 0;
    
% I is the identity matrix

I = eye(size(G,1));

% Matrix A contains information on sector-specific input shares. 
% Each coefficient is calculated by diving the cost of a sector k's intermediate inputs
% by the total cost of all its inputs.

a = alphak{:, 2};
A = diag(a);
A(isnan(A)) = 0.5;

% R is a matrix that contains, for each output sector k, the Input Rank of a supplier
% of an input of sector h.

R = (I-A*G')^-1;


%% Export Input Ranks from matrix R into a table

n = length(sectors);

IndustryInput = repmat(sectors, n, 1);
IndustryInputName = repmat(sectorNames, n, 1);

IndustryOutput = repelem(sectors, n, 1);
IndustryOutputName = repelem(sectorNames, n, 1);

InputRank = R(:);

T = table(IndustryInput, IndustryInputName, IndustryOutput, IndustryOutputName, InputRank);

writetable(T, 'US_BEA_InputRank', 'Delimiter', ';') 
