
clear all
import delimited "IODirectRequireDetail.csv", delimiter(";") varnames(nonames) asfloat clear

gen id=_n
drop if id==1
drop id 
destring v5, replace

* These are commodities that are inputs to other industries, but never outputs (SPECIAL INDUSTRIES)
drop if v1=="S00300" | v1=="S00401" | v1=="S00402" | v1=="S00900"

* These four commodities are:
* S00300 Noncomparable imports
* S00401 Scrap
* S00402 Used and Secondhand goods
* S00900 Rest of the World Adjustment

* These are not industries:
drop if  v1=="V00300"|v1=="V00200"
* These are VALUE ADDED:
* V00200 Taxes on production and imports, less subsidies
* V00300 Gross operating surplus
* V00100 Compensation of employees

* There are negative values or values greater than 1
drop if v1=="S00600" |v1=="S00201" | v1=="524100" 
drop if v3=="S00600" |v3=="S00201" | v3=="524100" 


drop if  v1=="T008"

* T008 Total Industry Output
* T001 Total Intermediate Use

drop if  v1=="814000"
drop if  v3=="814000"
*Exclusion of Private households ('814000')

bys  v1: gen n=_n==1
count if n
drop n

bys  v3: gen n=_n==1
count if n
drop n


bys v3: gen l_k=v5 if v1=="V00100"
sort l_k
sort v3
bysort v3 (l_k): replace l_k = l_k[1] if missing(l_k)

bys v3: gen ii_k=v5 if v1=="T001"
sort ii_k
sort v3
bysort v3 (ii_k): replace ii_k = ii_k[1] if missing(ii_k)

bys v3: gen alpha_k=ii_k/(ii_k+l_k)
drop if v1=="T001"

bys  v1: gen n=_n==1
count if n
drop n

bys  v3: gen n=_n==1
count if n
drop n

preserve

drop v1 v2 v4 v5 l_k ii_k
collapse alpha_k, by(v3)

sum alpha_k

export delimited using "alpha_k.csv", delimiter(";") novarnames replace

restore


drop if  v1=="V00100"
drop l_k ii_k alpha_k

export delimited using "IODirectRequireDetail_clean.csv", delimiter(";") novarnames replace

