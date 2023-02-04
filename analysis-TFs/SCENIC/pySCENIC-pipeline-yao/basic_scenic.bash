# Generate the loom file used in pySCENIC
python pre_scenic.py

## The database
database_dir=/media/yao/Yao/Projects/databases/SCENIC_databases/human/
tfs=$database_dir/hs_hgnc_tfs.txt
feather=$database_dir/new/hg38_10kbp_up_10kbp_down_full_tx_v10_clust.genes_vs_motifs.rankings.feather
tbl=$database_dir/new/motifs-v10nr_clust-nr.hgnc-m0.001-o0.0.tbl

# The analysis space
scenic_dir=/media/yao/Yao/Projects/Project_antler/2_skin_regeneration_analysis/analyses_v4/5_tf_analyses/scenic/stages_d0-2-5_Fibroblast/scenic/
input_loom=$scenic_dir/antler_skin_fibroblast_scenic.loom

#1 grn
pyscenic grn $input_loom $tfs \
--num_workers 20 \
--output $scenic_dir/adj.csv \
--method grnboost2 \

#2-3 cistarget
pyscenic ctx $scenic_dir/adj.csv $feather \
--annotations_fname $tbl \
--expression_mtx_fname $input_loom  \
--mode "dask_multiprocessing" \
--output $scenic_dir/reg.csv \
--num_workers 20  \
--mask_dropouts

#4 AUCell
pyscenic aucell $input_loom $scenic_dir/reg.csv \
--output $scenic_dir/out_SCENIC.loom \
--num_workers 20







