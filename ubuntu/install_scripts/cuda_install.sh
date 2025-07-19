#!/bin/bash

# References : 

# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local

# https://docs.nvidia.com/cuda/cuda-installation-guide-linux/

install_cuda_toolkit_sdk() {
	wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin

	sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600

	wget https://developer.download.nvidia.com/compute/cuda/12.9.0/local_installers/cuda-repo-ubuntu2204-12-9-local_12.9.0-575.51.03-1_amd64.deb

	sudo dpkg -i cuda-repo-ubuntu2204-12-9-local_12.9.0-575.51.03-1_amd64.deb

	# update public GPG keys 
	sudo cp /var/cuda-repo-ubuntu2204-12-9-local/cuda-*-keyring.gpg /usr/share/keyrings/

	sudo apt-get updatesudo apt-get -y install cuda-toolkit-12-9
}

install_cuda_compiler()  {
	# including nvcc
	sudo apt install nvidia-cuda-toolkit
	echo $(which nvcc)
	nvcc --version
}

if command -v gcc &> /dev/null; then
	# build basics installed
	echo $(gcc --version)

	if lspci | grep -i nvidia &> /dev/null; then
		# GPU detected

		# check for existing kernels
		if lsmod | grep nvidia &> /dev/null; then
			# try loading to kernel
			sudo modprobe nvidia
		else
			# install default driver for computation
			sudo ubuntu-drivers --gpgpu list
			sudo ubuntu drivers --gpgpu install
			sudo modprobe nvidia
			# reboot and confirm MOK enrollment 
		fi
		
		install_cuda_toolkit_sdk

		install_cuda_compiler

		if ! [ command -v nvidia-smi ] &> /dev/null; then
			# should be installed by the driver
		fi
	else
		echo "No CUDA-enabled GPU detected"
	fi
else
	echo "GCC not installed"
fi

