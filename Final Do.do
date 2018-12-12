gen ESE=1 if RegionCode==1
replace ESE=0 if RegionCode!=1
gen Pacific=1 if RegionCode==2
replace Pacific=0 if RegionCode!=2
gen Mountain=1 if RegionCode==3
replace Mountain=0 if RegionCode!=3
gen NewEngland=1 if RegionCode==4
replace NewEngland=0 if RegionCode!=4
gen SouthAtlantic=1 if RegionCode==5
replace SouthAtlantic=0 if RegionCode!=5
gen ENC=1 if RegionCode==6
replace ENC=0 if RegionCode!=6
gen WSC=1 if RegionCode==7
replace WSC=0 if RegionCode!=7
gen WNC=1 if RegionCode==8
replace WNC=0 if RegionCode!=8
gen MidAtlantic=1 if RegionCode==9
replace MidAtlantic=0 if RegionCode!=9

reg Score PercentAA PercentAsian PercentHisp
reg Score PercentAA PercentAsian PercentHisp BachelorPlus 
reg Score PercentAA PercentAsian PercentHisp BachelorPlus MedAge
 reg Score PercentAA PercentAsian PercentHisp BachelorPlus MedAge ESE Mountain NewEngland SouthAtlantic ENC WSC WNC MidAtlantic 
sum Score PercentAA PercentAsian PercentHisp BachelorPlus MedAge
tab RegionCode
tab RegionCode, sum(Score)

twoway (scatter Score PercentAA ) (lfit Score PercentAA)
twoway (scatter Score PercentAA ) (lfit Score PercentAA) if std_score <3.423764

reg Score PercentAA PercentAsian PercentHisp
reg Score PercentAA PercentAsian PercentHisp BachelorPlus 
reg Score PercentAA PercentAsian PercentHisp BachelorPlus MedAge
reg Score PercentAA PercentAsian PercentHisp BachelorPlus MedAge ESE Mountain NewEngland SouthAtlantic ENC WSC WNC MidAtlantic

vif
estat hettest
estat imtest
predict r, residual
predict leverage, leverage
sum leverage
hist std_score, normal
pnorm r
sktest r
