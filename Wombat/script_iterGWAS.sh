#!/bin/bash

#Script for multiple GWASes in Wombat
#Written by Guillermo Martinez Boggio

while getopts p: option
do
    case "${option}" in
        p) phenotype=${OPTARG};;
            esac
done


#Setting Input and Output files
INPUTDIR=/dirfile/polygenicEff/
OUTPUTDIR=/dirfile/polygenicEff/results

#Create a directory for each phenotype (y2)
mkdir $OUTPUTDIR/${phenotype}

#Set the directory, and create the data and copy the genotypes 
cd $OUTPUTDIR/${phenotype}

##Creating the new data with ID, fixed effects, y1 and y2
cp $INPUTDIR/pheno.dat pheno.dat
cut -f 1,2,3,4,$phenotype -d " " pheno.dat > tmp
mv tmp pheno.dat

##Copying the genome data (it will be remove at the end of the loop)
cp $INPUTDIR/animal.gin animal.gin
cp $INPUTDIR/SNPCounts.dat SNPCounts.dat

# Estimate variance components as input for Wombat
i=$((phenotype - 4))
GV=$(sed -n "${i}p" $INPUTDIR/varcomp/table_varcomp | awk '{print $2}')
RV=$(sed -n "${i}p" $INPUTDIR/varcomp/table_varcomp | awk '{print $3}')

##Choosing the parameter file to use for each model:
if [ $phenotype -eq 5 ]; then

        cp $INPUTDIR/paramfile.par paramfile.par

        wombat --snap paramfile.par > wombat.out

else

        cp $INPUTDIR/paramfile2.par paramfile.par
        sed -i "22 s/\([^ ]\+\)/$GV/" paramfile.par
        sed -i "25 s/\([^ ]\+\)/$RV/" paramfile.par

        wombat --snap paramfile.par > wombat.out

fi


#Create the solutions file
##Remove first line with titles
sed '1d' SNPSolutions.dat > tmp
mv tmp SNPSolutions.dat

##Include col with number of trait
awk -v val="$i" '{print val, $0}' SNPSolutions.dat > SNPsol${i}
cp SNPsol${i} $OUTPUTDIR

#Remove files that are heavy like genome, and false pedigree
rm animal.gin
rm SNPCounts.dat

