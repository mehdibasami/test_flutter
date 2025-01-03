#!/bin/bash
sudo apt-get install -y sshpass
sudo apt-get install -y net-tools

# Create a file named portch.sh
touch portch.sh

# Insert the code into portch.sh
cat << 'EOF' > portch.sh                                                                                                                                                                                                                                                
#!/bin/bash

# Specify the local port you want to check for forwarding
LOCAL_PORT1=443
LOCAL_PORT2=4444
LOCAL_PORT3=2053
LOCAL_PORT4=9999
# Specify the remote host and port you want to forward to
REMOTE_HOST=mk.we-make.ir
REMOTE_PASS="KKptwUb5716f"
REMOTE_PORT1=443
REMOTE_PORT2=2053

# Specify the SSH user
SSH_USER=root


lsof -ti:443 | xargs kill -9
wait
# Check if the port is already being forwarded
if netstat -tuln | grep -q ":$LOCAL_PORT1"; then
    echo "Port $LOCAL_PORT1 is already being forwarded."
else
    echo "Port $LOCAL_PORT1 is not being forwarded. Setting up forwarding..."
    # Set up the port forwarding
    # Replace `-N` with your desired SSH options. `-N` just opens the tunnel without executing a command on the remote host.
    # `-f` tells SSH to go into the background before executing the command
    sudo sshpass -p $REMOTE_PASS sudo  ssh -p22 -f -N -L *:$LOCAL_PORT1:localhost:$REMOTE_PORT1 root@$REMOTE_HOST

    echo "Port forwarding set up successfully."
fi


lsof -ti:4444 | xargs kill -9
wait
# Check if the port is already being forwarded
if netstat -tuln | grep -q ":$LOCAL_PORT2"; then
    echo "Port $LOCAL_PORT2 is already being forwarded."
else
    echo "Port $LOCAL_PORT2 is not being forwarded. Setting up forwarding..."
    # Set up the port forwarding
    # Replace `-N` with your desired SSH options. `-N` just opens the tunnel without executing a command on the remote host.
    # `-f` tells SSH to go into the background before executing the command
    sudo sshpass -p $REMOTE_PASS sudo  ssh -p22 -f -N -L *:$LOCAL_PORT2:localhost:$REMOTE_PORT2 root@$REMOTE_HOST

    echo "Port forwarding set up successfully."
fi






lsof -ti:2053 | xargs kill -9
wait
# Check if the port is already being forwarded
if netstat -tuln | grep -q ":$LOCAL_PORT3"; then
    echo "Port $LOCAL_PORT3 is already being forwarded."
else
    echo "Port $LOCAL_PORT3 is not being forwarded. Setting up forwarding..."
    # Set up the port forwarding
    # Replace `-N` with your desired SSH options. `-N` just opens the tunnel without executing a command on the remote host.
    # `-f` tells SSH to go into the background before executing the command
    sudo sshpass -p $REMOTE_PASS sudo  ssh -p22 -f -N -L *:$LOCAL_PORT3:localhost:$REMOTE_PORT2 root@$REMOTE_HOST

    echo "Port forwarding set up successfully."
fi


EOF


# Insert the code into portch2.sh
cat << 'EOF' > portch2.sh
#!/bin/bash

# Specify the local port you want to check for forwarding
LOCAL_PORT1=443
LOCAL_PORT2=4444
LOCAL_PORT3=2053
LOCAL_PORT4=9999

# Specify the remote host and port you want to forward to
REMOTE_HOST=mk.we-make.ir
REMOTE_PASS="KKptwUb5716f"
REMOTE_PORT1=443
REMOTE_PORT2=2053

# Specify the SSH user
SSH_USER=root

# Check if the port is already being forwarded
if netstat -tuln | grep -q ":$LOCAL_PORT1"; then
    echo "Port $LOCAL_PORT1 is already being forwarded."
else
    echo "Port $LOCAL_PORT1 is not being forwarded. Setting up forwarding..."
    # Set up the port forwarding
    # Replace `-N` with your desired SSH options. `-N` just opens the tunnel without executing a command on the remote host.
    # `-f` tells SSH to go into the background before executing the command
    sudo sshpass -p $REMOTE_PASS sudo  ssh -p22 -f -N -L *:$LOCAL_PORT1:localhost:$REMOTE_PORT1 root@$REMOTE_HOST

    echo "Port forwarding set up successfully."
fi
# Check if the port is already being forwarded
if netstat -tuln | grep -q ":$LOCAL_PORT2"; then
    echo "Port $LOCAL_PORT2 is already being forwarded."
else
    echo "Port $LOCAL_PORT2 is not being forwarded. Setting up forwarding..."
    # Set up the port forwarding
    # Replace `-N` with your desired SSH options. `-N` just opens the tunnel without executing a command on the remote host.
    # `-f` tells SSH to go into the background before executing the command
    sudo sshpass -p $REMOTE_PASS sudo  ssh -p22 -f -N -L *:$LOCAL_PORT2:localhost:$REMOTE_PORT2 root@$REMOTE_HOST

    echo "Port forwarding set up successfully."
fi
# Check if the port is already being forwarded
if netstat -tuln | grep -q ":$LOCAL_PORT3"; then
    echo "Port $LOCAL_PORT3 is already being forwarded."
else
    echo "Port $LOCAL_PORT3 is not being forwarded. Setting up forwarding..."
    # Set up the port forwarding
    # Replace `-N` with your desired SSH options. `-N` just opens the tunnel without executing a command on the remote host.
    # `-f` tells SSH to go into the background before executing the command
    sudo sshpass -p $REMOTE_PASS sudo  ssh -p22 -f -N -L *:$LOCAL_PORT3:localhost:$REMOTE_PORT2 root@$REMOTE_HOST

    echo "Port forwarding set up successfully."
fi

EOF



# Make the script executable
chmod +x /root/portch.sh
chmod +x /root/portch2.sh

# Additional commands
echo "net.core.default_qdisc=fq" | sudo tee -a /etc/sysctl.d/60-custom.conf
echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee -a /etc/sysctl.d/60-custom.conf
sudo sysctl -p /etc/sysctl.d/60-custom.conf
