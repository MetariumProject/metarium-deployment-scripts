start_script=$substrate_template_path'/target/release/node-template --base-path '$metarium_path'/chain-data --chain '$substrate_template_path'/metariumSpecRaw.json --port 30333 --ws-port 9944 --rpc-port 9933 --telemetry-url "wss://telemetry.polkadot.io/submit/ 0" --validator --rpc-methods Unsafe --name Metarium --pruning=archive'

echo "If you intend to run as a boot node, Press the ENTER key. Otherwise, please enter the bootnode url to connect to (eg, /ip4/<BOOT_NODE_IP_ADDRESS>/tcp/30333/p2p/<BOOT_NODE_PEER_ID>)."
read boot_node_url

if [ -z "$boot_node_url" ]
then
    exec_script=$start_script
else
    exec_script=$start_script' --bootnodes '$boot_node_url
fi

echo "Creating service daemon ..."
mkdir $metarium_path/service
cat << EOF > $metarium_path/service/metarium-substrate.service
[Unit]
Description=Metarium Substrate Daemon
After=syslog.target network.target remote-fs.target nss-lookup.target

[Service]
ExecStart=$exec_script
User=$current_user
Restart=always
LimitNOFILE=10240

[Install]
WantedBy=multi-user.target
EOF
sudo mv $metarium_path/service/metarium-substrate.service /lib/systemd/system/metarium-substrate.service
sudo rm -r $metarium_path/service
sudo systemctl daemon-reload && sudo systemctl enable metarium-substrate && sudo systemctl start metarium-substrate