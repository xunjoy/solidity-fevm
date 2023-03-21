build: build_contract

build_contract:
	./bin/solc @zondax=${PWD}/node_modules/@zondax solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/Example.sol --output-dir ./build --overwrite --bin --hashes --opcodes --abi

################ DEPS ################

verify_solc:
	@[ ! -f ./bin/solc ] && echo "Please install solc using 'make install_solc_linux' or 'make install_solc_mac'" || true

install_solc_linux:
	wget https://github.com/ethereum/solidity/releases/download/v0.8.17/solc-static-linux
	mv solc-static-linux bin/solc
	chmod +x bin/solc

install_solc_win:
	@echo "No Windows. Only Linux."

install_solc_mac:
	wget https://github.com/ethereum/solidity/releases/download/v0.8.17/solc-macos
	mv solc-macos bin/solc
	chmod +x bin/solc

install-llvm-ci:
	echo 'deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main' | sudo tee /etc/apt/sources.list.d/llvm.list
	wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install clang-13 llvm-13-dev lld-13 libclang-13-dev ocl-icd-opencl-dev

install-opencl:
	sudo apt-get update
	sudo apt-get install ocl-icd-opencl-dev
