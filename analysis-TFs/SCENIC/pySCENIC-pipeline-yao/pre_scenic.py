import os
from pathlib import Path
import numpy as np
import loompy as lp
import anndata as ad

h5ad_path = "/media/yao/Yao/Projects/Project_antler/2_skin_regeneration_analysis/analyses_v4/3_cluster/stages_d0-2-5_subcluster/Fibroblast/integrate_antler_skin_Fibroblast.h5ad"
scenic_dir = "/media/yao/Yao/Projects/Project_antler/2_skin_regeneration_analysis/analyses_v4/5_tf_analyses/scenic/stages_d0-2-5_Fibroblast/scenic"
f_scenic_loom_path = os.path.join(scenic_dir, "antler_skin_fibroblast_scenic.loom")
Path(scenic_dir).mkdir(parents=True, exist_ok=True)

adata = ad.read_h5ad(filename=h5ad_path)
adata.X = adata.layers["matrix"].copy().A
print(adata)

# create basic row and column attributes for the loom file:
row_attrs = {
    "Gene": np.array(adata.var_names) ,
}
col_attrs = {
    "CellID": np.array(adata.obs_names) ,
    "nGene": np.array( np.sum(adata.X.transpose()>0 , axis=0)).flatten() ,
    "nUMI": np.array( np.sum(adata.X.transpose() , axis=0)).flatten() ,
}
lp.create(f_scenic_loom_path, adata.X.transpose(), row_attrs, col_attrs)
