# chain spec
echo "Please enter the path to the raw spec json file (press ENTER to use default file)"
read spec_file_path
if [ -z "$spec_file_path" ]
then
    echo "Using default spec file."
else
    sudo mv $spec_file_path $substrate_template_path/metariumSpecRaw.json
fi
