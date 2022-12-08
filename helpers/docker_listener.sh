source ../helpers/spec_listener_peer.sh

start_script='docker run -it -p 9944:9944 -p 9933:9933 -p 9615:9615 -p 30333:30333 -v '$metarium_path'/chain-data:/chain-data -v '$metarium_path'/src/metariumSpecRaw.json:/mspec/metariumSpecRaw.json metarium/substrate:linux-10min-64b --base-path /chain-data --chain ./mspec/metariumSpecRaw.json --validator --port 30333 --ws-port 9944 --rpc-port 9933 --telemetry-url "wss://telemetry.polkadot.io/submit/ 0" --rpc-methods Unsafe --name Metarium'

if [ -z "$boot_node_url" ]
then
    docker_script=$start_script
else
    docker_script=$start_script' --bootnodes '$boot_node_url
fi


printf "\n\nYou can now run your listener using the following docker command :\n\n\n$docker_script\n\n\n"