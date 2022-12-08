# check sudo
echo "Checking sudo permission ..."
if groups | grep "\<google-sudoers\>" &> /dev/null; then
    echo "Can be run as a google-sudoer."
else
    echo "$0 must be run by someone with a google-sudoer permission. "
    exit 2
fi