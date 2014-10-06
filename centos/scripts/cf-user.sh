#!/bin/bash

# Setup cfuser user with no-password-required sudoer privileges
groupadd cfuser
useradd cfuser -g cfuser -G wheel
echo "cfuser"|passwd --stdin cfuser
echo "cfuser        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/cfuser
echo 'Defaults !secure_path' >> /etc/sudoers.d/cfuser
echo 'Defaults    env_keep += "SSH_AUTH_SOCK"' >> /etc/sudoers.d/cfuser
chmod 0440 /etc/sudoers.d/cfuser

# Setup autologin for cfuser
cat <<END > /etc/gdm/custom.conf
[daemon]
AutomaticLoginEnable=true
AutomaticLogin=cfuser
END
