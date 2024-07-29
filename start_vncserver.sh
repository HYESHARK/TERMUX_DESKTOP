#!/data/data/com.termux/files/usr/bin/bash

# Đảm bảo rằng Termux có quyền root
if [ "$(id -u)" -ne 0 ]; then
    echo "Script này cần quyền root. Vui lòng chạy lại với quyền root."
    exit 1
fi

# Khởi động Debian chroot
proot-distro login debian <<EOF
# Khởi động VNC Server
vncserver :1

# In thông tin kết nối VNC
echo "VNC Server đã được khởi động trên :1. Bạn có thể kết nối đến địa chỉ <IP>:5901"
EOF
