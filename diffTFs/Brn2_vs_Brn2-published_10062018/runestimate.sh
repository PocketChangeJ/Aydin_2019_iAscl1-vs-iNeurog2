# iAscl1 
readdb_A="Mazzoni EB+48hrDox(iAscl1.V5) Brn2 Ainv15(iAscl1.V5);bowtie_unique"
# iNgn2
readdb_N="Wernig MEF(+d2_lv.iAscl1.Brn2.Myt1l+Dox) Brn2 C57BL6;1;bowtie_unique"

# iAscl1
echo "Brn2 iAscl1_peaks"
java -cp ../seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "$readdb_A" --peaks Brn2_peaks.ordered
# iNgn2
echo "Brn2 iNgn2_peaks"
java -cp ../seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "$readdb_N" --peaks Brn2_peaks.ordered

