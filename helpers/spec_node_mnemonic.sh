# mnemonic
read -s -p "Please enter your mnemonic (without the double quotes) : " mnemonic
cd $substrate_template_path
echo "Configuring aura ..."
./target/release/node-template key insert --base-path $metarium_path/chain-data --chain metariumSpecRaw.json --scheme Sr25519 --suri "$mnemonic" --key-type aura
echo "Configuring gran ..."
./target/release/node-template key insert --base-path $metarium_path/chain-data --chain metariumSpecRaw.json --scheme Ed25519 --suri "$mnemonic" --key-type gran
