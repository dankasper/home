source_dir=$1
deploy_to=$2

cd $source_dir
./configure --prefix=$deploy_to --without-http_rewrite_module
make
make install
