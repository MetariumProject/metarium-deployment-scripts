echo "Installing Rust dependencies ..."
sudo apt update -y && sudo apt install --assume-yes git clang curl libssl-dev llvm libudev-dev make protobuf-compiler
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup default stable
rustup update
rustup update nightly
rustup target add wasm32-unknown-unknown --toolchain nightly