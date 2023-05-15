
clear all

* Socio Economic Accounts Release 2016 from http://www.wiod.org/database/seas16
import excel "WIOD_SEA_Nov16.xlsx", sheet("DATA") firstrow clear

destring E F G H I J K L M N O P Q R S, replace force

* Variable 'COMP' stands for 'Compensation of employees' 
keep if variable=="COMP"

* Keep 2014 'COMP'
keep country description code S
rename S l_ck

rename country Country
rename code IndustryCode

save "wiod_compensation_employees_2014_cou_ind.dta", replace

*--------

import excel "WIOD_SEA_Nov16.xlsx", sheet("DATA") firstrow clear

destring E F G H I J K L M N O P Q R S, replace force

* Variable 'II' stands for 'intermediate inputs'
keep if variable=="II"

* Keep 2014 'II'
keep country description code S
rename S ii_ck

rename country Country
rename code IndustryCode

merge 1:1 IndustryCode Country using "wiod_compensation_employees_2014_cou_ind.dta", keep(1 3) nogen

gen tot_cost_input_ck=ii_ck+l_ck
sort Country IndustryCode

save "wiod_inputs_cost.dta", replace

*-------------------------------------------------------------------------------
*							  Intermediate input shares 
*-------------------------------------------------------------------------------

* alpha_k is the cost on intermediate inputs on sector k on the total cost on all inputs on sector k
gen alpha_k=ii_ck/tot_cost_input_ck

keep Country IndustryCode alpha_k
sort Country IndustryCode

export delimited using "wiod_alphak.csv", replace

*-------------------------------------------------------------------------------
*							  Clean WIOD table
*-------------------------------------------------------------------------------


use "WIOT2014_October16_ROW.dta", clear

*drop if Country=="ROW"
*drop vROW1 vROW2 vROW3 vROW4 vROW5 vROW6 vROW7 vROW8 vROW9 vROW10 vROW11 vROW12 vROW13 vROW14 vROW15 vROW16 vROW17 vROW18 vROW19 vROW20 vROW21 vROW22 vROW23 vROW24 vROW25 vROW26 vROW27 vROW28 vROW29 vROW30 vROW31 vROW32 vROW33 vROW34 vROW35 vROW36 vROW37 vROW38 vROW39 vROW40 vROW41 vROW42 vROW43 vROW44 vROW45 vROW46 vROW47 vROW48 vROW49 vROW50 vROW51 vROW52 vROW53 vROW54 vROW55 vROW56 vAUS57 vAUS58 vAUS59 vAUS60 vAUS61 vAUT57 vAUT58 vAUT59 vAUT60 vAUT61 vBEL57 vBEL58 vBEL59 vBEL60 vBEL61 vBGR57 vBGR58 vBGR59 vBGR60 vBGR61 vBRA57 vBRA58 vBRA59 vBRA60 vBRA61 vCAN57 vCAN58 vCAN59 vCAN60 vCAN61 vCHE57 vCHE58 vCHE59 vCHE60 vCHE61 vCHN57 vCHN58 vCHN59 vCHN60 vCHN61 vCYP57 vCYP58 vCYP59 vCYP60 vCYP61 vCZE57 vCZE58 vCZE59 vCZE60 vCZE61 vDEU57 vDEU58 vDEU59 vDEU60 vDEU61 vDNK57 vDNK58 vDNK59 vDNK60 vDNK61 vESP57 vESP58 vESP59 vESP60 vESP61 vEST57 vEST58 vEST59 vEST60 vEST61 vFIN57 vFIN58 vFIN59 vFIN60 vFIN61 vFRA57 vFRA58 vFRA59 vFRA60 vFRA61 vGBR57 vGBR58 vGBR59 vGBR60 vGBR61 vGRC57 vGRC58 vGRC59 vGRC60 vGRC61 vHRV57 vHRV58 vHRV59 vHRV60 vHRV61 vHUN57 vHUN58 vHUN59 vHUN60 vHUN61 vIDN57 vIDN58 vIDN59 vIDN60 vIDN61 vIND57 vIND58 vIND59 vIND60 vIND61 vIRL57 vIRL58 vIRL59 vIRL60 vIRL61 vITA57 vITA58 vITA59 vITA60 vITA61 vJPN57 vJPN58 vJPN59 vJPN60 vJPN61 vKOR57 vKOR58 vKOR59 vKOR60 vKOR61 vLTU57 vLTU58 vLTU59 vLTU60 vLTU61 vLUX57 vLUX58 vLUX59 vLUX60 vLUX61 vLVA57 vLVA58 vLVA59 vLVA60 vLVA61 vMEX57 vMEX58 vMEX59 vMEX60 vMEX61 vMLT57 vMLT58 vMLT59 vMLT60 vMLT61 vNLD57 vNLD58 vNLD59 vNLD60 vNLD61 vNOR57 vNOR58 vNOR59 vNOR60 vNOR61 vPOL57 vPOL58 vPOL59 vPOL60 vPOL61 vPRT57 vPRT58 vPRT59 vPRT60 vPRT61 vROU57 vROU58 vROU59 vROU60 vROU61 vRUS57 vRUS58 vRUS59 vRUS60 vRUS61 vSVK57 vSVK58 vSVK59 vSVK60 vSVK61 vSVN57 vSVN58 vSVN59 vSVN60 vSVN61 vSWE57 vSWE58 vSWE59 vSWE60 vSWE61 vTUR57 vTUR58 vTUR59 vTUR60 vTUR61 vTWN57 vTWN58 vTWN59 vTWN60 vTWN61 vUSA57 vUSA58 vUSA59 vUSA60 vUSA61 vROW57 vROW58 vROW59 vROW60 vROW61 TOT

drop vAUS57 vAUS58 vAUS59 vAUS60 vAUS61 vAUT57 vAUT58 vAUT59 vAUT60 vAUT61 vBEL57 vBEL58 vBEL59 vBEL60 vBEL61 vBGR57 vBGR58 vBGR59 vBGR60 vBGR61 vBRA57 vBRA58 vBRA59 vBRA60 vBRA61 vCAN57 vCAN58 vCAN59 vCAN60 vCAN61 vCHE57 vCHE58 vCHE59 vCHE60 vCHE61 vCHN57 vCHN58 vCHN59 vCHN60 vCHN61 vCYP57 vCYP58 vCYP59 vCYP60 vCYP61 vCZE57 vCZE58 vCZE59 vCZE60 vCZE61 vDEU57 vDEU58 vDEU59 vDEU60 vDEU61 vDNK57 vDNK58 vDNK59 vDNK60 vDNK61 vESP57 vESP58 vESP59 vESP60 vESP61 vEST57 vEST58 vEST59 vEST60 vEST61 vFIN57 vFIN58 vFIN59 vFIN60 vFIN61 vFRA57 vFRA58 vFRA59 vFRA60 vFRA61 vGBR57 vGBR58 vGBR59 vGBR60 vGBR61 vGRC57 vGRC58 vGRC59 vGRC60 vGRC61 vHRV57 vHRV58 vHRV59 vHRV60 vHRV61 vHUN57 vHUN58 vHUN59 vHUN60 vHUN61 vIDN57 vIDN58 vIDN59 vIDN60 vIDN61 vIND57 vIND58 vIND59 vIND60 vIND61 vIRL57 vIRL58 vIRL59 vIRL60 vIRL61 vITA57 vITA58 vITA59 vITA60 vITA61 vJPN57 vJPN58 vJPN59 vJPN60 vJPN61 vKOR57 vKOR58 vKOR59 vKOR60 vKOR61 vLTU57 vLTU58 vLTU59 vLTU60 vLTU61 vLUX57 vLUX58 vLUX59 vLUX60 vLUX61 vLVA57 vLVA58 vLVA59 vLVA60 vLVA61 vMEX57 vMEX58 vMEX59 vMEX60 vMEX61 vMLT57 vMLT58 vMLT59 vMLT60 vMLT61 vNLD57 vNLD58 vNLD59 vNLD60 vNLD61 vNOR57 vNOR58 vNOR59 vNOR60 vNOR61 vPOL57 vPOL58 vPOL59 vPOL60 vPOL61 vPRT57 vPRT58 vPRT59 vPRT60 vPRT61 vROU57 vROU58 vROU59 vROU60 vROU61 vRUS57 vRUS58 vRUS59 vRUS60 vRUS61 vSVK57 vSVK58 vSVK59 vSVK60 vSVK61 vSVN57 vSVN58 vSVN59 vSVN60 vSVN61 vSWE57 vSWE58 vSWE59 vSWE60 vSWE61 vTUR57 vTUR58 vTUR59 vTUR60 vTUR61 vTWN57 vTWN58 vTWN59 vTWN60 vTWN61 vUSA57 vUSA58 vUSA59 vUSA60 vUSA61 vROW57 vROW58 vROW59 vROW60 vROW61 TOT
drop Year 

export delimited using "WIOD_clean", replace



*-------------------------------------------------------------------------------
*							  Import Input Rank results 
*-------------------------------------------------------------------------------


import delimited "WIODInputRank.txt", delimiter(";") encoding(ISO-8859-1) clear
sum inputrank
rename industryin IndustryCode
merge m:1 IndustryCode using Industry_wiod.dta, keep(1 3) nogen
rename IndustryCode industryin
rename IndustryDescription IndustryDescription_in
rename industryout IndustryCode
merge m:1 IndustryCode using Industry_wiod.dta, keep(1 3) nogen
rename IndustryCode industryout
rename IndustryDescription IndustryDescription_out
sort countryout industryout countryin industryin

order IndustryDescription_in, before(countryout)






