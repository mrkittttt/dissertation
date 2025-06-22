kubectl create namespace storagenfs
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
helm repo update
helm install nfs-subdir-external-provisioner \
nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
--set nfs.server=192.168.137.51 \
--set nfs.path=/storage \
--set storageClass.onDelete=true \
-n storagenfs 
