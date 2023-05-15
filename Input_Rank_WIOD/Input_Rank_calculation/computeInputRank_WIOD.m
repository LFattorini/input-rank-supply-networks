%% Load data

load Country
load Industry
load WIODclean.mat
load wiodalphak.mat

%% Compute Input Rank

% The G matrix (column stochastic) defines output at the sectoral level of the economy. 
% Each g_hk coefficient represents the share of intermediate inputs of
% sector h out of all intermediate inputs used in the production of sector k's output.

U = WIODclean{1:2464, 5:end};
G = U./repmat(sum(U,1), size(U,1), 1);
G(isnan(G)) = 0;

% I is the identity matrix

I = eye(size(G,1));

% Matrix A contains information on sector-specific input shares. 
% Each coefficient is calculated by diving the cost of a sector k's intermediate inputs
% by the total cost of all its inputs.

a = wiodalphak{:, 3};
v=0.5+zeros(56,1);
b=vertcat(a,v);
A = diag(b);
A(isnan(A)) = 0.5;

% R is a matrix that contains, for each output sector k, the Input Rank of a supplier
% of an input of sector h.

R = (I-A*G')^-1;


%% Export Input Ranks from matrix R into a table

n = length(Industry);

CountryIn = repmat(Country, n, 1);
IndustryIn = repmat(Industry, n, 1);

CountryOut = repelem(Country, n);
IndustryOut = repelem(Industry, n);

InputRank = R(:);

T = table(CountryIn, IndustryIn, CountryOut, IndustryOut, InputRank);

writetable(T, 'WIODInputRank', 'Delimiter', ';') 
