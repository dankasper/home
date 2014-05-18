source_dir=$1
deploy_to=$2

cd $source_dir
tar -C $deploy_to -xzf go1.2.linux-amd64.tar.gz
