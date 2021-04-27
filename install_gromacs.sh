#install nvidia driver & CUDA
lspci | grep -i NVIDIA
sudo yum install kernel kernel-tools kernel-headers kernel-devel
sudo reboot  
		
#reconnect ssh
sudo su
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
yum install dkms
CUDA_REPO_PKG=cuda-repo-rhel8-10.2.89-1.x86_64.rpm
wget https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/${CUDA_REPO_PKG} -O /tmp/${CUDA_REPO_PKG}
rpm -ivh /tmp/${CUDA_REPO_PKG}
rm -f /tmp/${CUDA_REPO_PKG}
yum install cuda-drivers
yum install cuda
nvidia-smi

#install tools
yum install gcc-gfortran redhat-rpm-config mpich-devel.x86_64 
mkdir /usr/bin/cmake
wget https://asiahpcgbb.blob.core.windows.net/gromacsonazure/cmake-3.19.7-Linux-x86_64.tar.gz
tar xfz cmake-3.19.7-Linux-x86_64.tar.gz
cd cmake-3.19.7-Linux-x86_64
cp -r ./* /usr/bin/cmake
echo 'export PATH=/usr/bin/cmake/bin:/usr/lib64/mpich/bin:$PATH' >> /etc/profile
source /etc/profile
export PATH_OF_MPICC = '/usr/lib64/mpich/bin/mpicc'
export PATH_OF_MPICXX = '/usr/lib64/mpich/bin/mpicxx'
gcc -v
g++ -v
gfortran -v
cmake --version

#install GROMACS
sudo su
cd /usr/local/
mkdir gromacs
cd gromacs/
wget https://asiahpcgbb.blob.core.windows.net/gromacsonazure/gromacs-2021.1.tar.gz
tar xfz gromacs-2021.1.tar.gz
cd gromacs-2021.1/
mkdir build
cd build/
#with MPI & GPU supported
cmake .. -DGMX_BUILD_OWN_FFTW=ON \
	-DREGRESSIONTEST_DOWNLOAD=OFF \
	-DBUILD_SHARED_LIBS=ON \
	-DCMAKE_C_COMPILER=$PATH_OF_MPICC \
	-DCMAKE_CXX_COMPILER=$PATH_OF_MPICXX \
	-DGMX_MPI=on \
	-DGMX_GPU=CUDA
make
make install
source /usr/local/gromacs/bin/GMXRC
echo 'export PATH=/usr/local/gromacs/gromacs-2021.1/build/bin:/usr/local/gromacs/bin:$PATH' >> /etc/profile
source /etc/profile
gmx_mpi --version
