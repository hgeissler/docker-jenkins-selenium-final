# in your bashrc, zshrc or equivalent, call the script sh ~/docker-tutorial/set-date.sh
# ~/docker-tutorial/set-date.sh

# Get time from google server or some other reliable source
TIME_FROM_SERVER=$(curl -v --insecure --silent https://google.de/ 2>&1 | grep Date | sed -e 's/< Date: //');

# Set stored time
date +"%d%m%Y%H%M%S" -d "$TIME_FROM_SERVER";

echo "Time updated with success!";
