#install nvidia driver & CUDA
lspci | grep -i NVIDIA
sudo yum install -y kernel kernel-tools kernel-headers kernel-devel
sudo reboot  
#reconnect ssh after several seconds
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo yum install -y dkms
CUDA_REPO_PKG=cuda-repo-rhel8-10.2.89-1.x86_64.rpm
wget https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/${CUDA_REPO_PKG} -O /tmp/${CUDA_REPO_PKG}
sudo rpm -ivh /tmp/${CUDA_REPO_PKG}
rm -f /tmp/${CUDA_REPO_PKG}
sudo yum install -y cuda-drivers
sudo yum install -y cuda-11-2
nvidia-smi
 
#install tools
module load mpi/openmpi
sudo mkdir /usr/bin/cmake
wget https://github.com/Kitware/CMake/releases/download/v3.19.7/cmake-3.19.7-Linux-x86_64.tar.gz
tar xfz cmake-3.19.7-Linux-x86_64.tar.gz
cd cmake-3.19.7-Linux-x86_64
sudo cp -r ./* /usr/bin/cmake
echo 'export PATH=/usr/bin/cmake/bin:/opt/openmpi-4.0.5/bin:/usr/local/cuda-11.2/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
export PATH_OF_MPICC='/opt/openmpi-4.0.5/bin/mpicc'
export PATH_OF_MPICXX='/opt/openmpi-4.0.5/bin/mpicxx'
 
#Check version info
gcc -v
g++ -v
gfortran -v
mpicc -v
cmake --version