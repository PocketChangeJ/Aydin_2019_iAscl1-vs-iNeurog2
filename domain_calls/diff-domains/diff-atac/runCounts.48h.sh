#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=50:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=22gb

cd ~/group/projects/es/iAscl1_iNgn2/domain_calls/diff-domains/diff-atac

cat ../../ATACseq_domains/ascl1_domains/ascl1_domains_eb.p0.05.bed ../../ATACseq_domains/ascl1_domains/ascl1_domains_ia48h.p0.05.bed ../../ATACseq_domains/ngn2_and_chimera_domains/ngn2_and_chimera_domains_in48h.p0.05.bed |grep -v chrM | grep -v chrUn >tmp2.bed

bedtools sort -i tmp2.bed >sort2.bed
bedtools merge -d 100 -i sort2.bed >eb_ia48h_in48h.merge.bed
rm tmp2.bed sort2.bed

perl ~/Tools/bed2regions.pl eb_ia48h_in48h.merge.bed >eb_ia48h_in48h.merge.reg
java -Xmx20G org.seqcode.deepseq.utils.RegionTagCounts --species "Mus musculus;mm10" --reg eb_ia48h_in48h.merge.reg --design 48h.design --out eb_ia48h_in48h.merge

