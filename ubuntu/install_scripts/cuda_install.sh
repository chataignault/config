#!/bin/bash

# References : 

# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local

# https://docs.nvidia.com/cuda/cuda-installation-guide-linux/

install_cuda_compiler()  {
	if command -v nvcc &> /dev/null; then
		echo "CUDA compiler (nvcc) already installed"
		nvcc --version
	else
		# including nvcc
		sudo apt install nvidia-cuda-toolkit
		echo $(which nvcc)
		nvcc --version
	fi
}

if command -v gcc &> /dev/null; then
	# build basics installed
	echo $(gcc --version)

	# search for a GPU
	if lspci | grep -i nvidia &> /dev/null; then

		# check for existing kernels
		if lsmod | grep nvidia &> /dev/null; then
			# try loading to kernel
			sudo modprobe nvidia
		else
			# install default driver for computation
			sudo ubuntu-drivers --gpgpu list
			sudo ubuntu-drivers --gpgpu install
			sudo modprobe nvidia
			# reboot and confirm MOK enrollment
			echo "Reboot and check nvidia-smi command is available"
			echo "If not, check modprobe command"
		fi
		
		install_cuda_compiler
		
		if ! [ command -v nvidia-smi ] &> /dev/null; then
			# should be installed by the driver
			echo "nvidia-smi not currently available"
		fi
	else
		echo "No CUDA-enabled GPU detected"
	fi
else
	echo "GCC not installed, included in build-essential"
fi

