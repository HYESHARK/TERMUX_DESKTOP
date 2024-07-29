#!/data/data/com.termux/files/usr/bin/bash

# Cài đặt các công cụ cần thiết
pkg update
pkg upgrade
pkg install -y proot-distro busybox

# Cài đặt Debian chroot
proot-distro install debian

# Khởi động Debian chroot
proot-distro login debian <<EOF
# Cập nhật hệ thống Debian
apt update
apt upgrade -y

# Cài đặt các gói cần thiết
apt install -y sudo wget tar

# Thiết lập và cấu hình BusyBox
busybox --install -s /data/data/com.termux/files/usr/bin

# Cài đặt X11 và VNC Server
apt install -y xfce4 xfce4-goodies tightvncserver

# Cấu hình VNC Server
echo '#!/bin/bash
xrdb \$HOME/.Xresources
startxfce4 &' > ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

# Khởi động VNC Server để thiết lập mật khẩu
vncserver
vncserver -kill :1
EOF

echo "Chroot Debian đã được thiết lập thành công. Bạn có thể khởi động chroot Debian với: proot-distro login debian"
