#Data sources:
#	https://resources.aertslab.org/cistarget
#	https://github.com/aertslab/pySCENIC

# human new database:
wget -c https://resources.aertslab.org/cistarget/databases/homo_sapiens/hg38/refseq_r80/mc_v10_clust/gene_based/hg38_10kbp_up_10kbp_down_full_tx_v10_clust.genes_vs_motifs.rankings.feather
wget -c https://github.com/aertslab/pySCENIC/blob/master/resources/hs_hgnc_tfs.txt
wget -c https://resources.aertslab.org/cistarget/motif2tf/motifs-v10nr_clust-nr.hgnc-m0.001-o0.0.tbl

# mouse new database:
wget -c https://resources.aertslab.org/cistarget/databases/mus_musculus/mm10/refseq_r80/mc_v10_clust/gene_based/mm10_10kbp_up_10kbp_down_full_tx_v10_clust.genes_vs_motifs.rankings.feather
wget -c https://github.com/aertslab/pySCENIC/blob/master/resources/mm_mgi_tfs.txt
wget -c https://resources.aertslab.org/cistarget/motif2tf/motifs-v10nr_clust-nr.mgi-m0.001-o0.0.tbl

# drosophila new datanase:
wget -c https://resources.aertslab.org/cistarget/databases/drosophila_melanogaster/dm6/flybase_r6.02/mc_v10_clust/gene_based/dm6_v10_clust.genes_vs_motifs.rankings.feather
wget -c https://github.com/aertslab/pySCENIC/blob/master/resources/allTFs_dmel.txt
wget -c https://resources.aertslab.org/cistarget/motif2tf/motifs-v10nr_clust-nr.flybase-m0.001-o0.0.tbl
