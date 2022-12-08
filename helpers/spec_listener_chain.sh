# chain spec
echo "Please enter the path to the raw spec json file"
read spec_file_path
if [ -z "$spec_file_path" ]
then
    echo "raw spec json file can not be empty."
    exit 2
else
    sudo cp $spec_file_path $metarium_path/src/metariumSpecRaw.json
fi
