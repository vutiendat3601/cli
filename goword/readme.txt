## Điều kiện tiên quyết:
- Docker, Git đã được cài đặt trên máy

## Cài đặt:
  0. Pull
    - Clone repo và chuyển thử mục làm việc đến repo:
      git clone https://github.com/vutiendat3601/cli.git
      cd ./cli/goword
  1. Build
    - Đối với Windows:
      + Mở Command Line (Terminal, Command Prompt) với quyền quản trị
      + Chạy file install.bat:
        ./install.bat

    - Đối với Linux (có cài bash):
      + Mở Command Line (Terminal)
      + Chạy file install.sh với sudo:
        sudo ./install.sh

  2. Cấu hình
    - Mở file docker-compose.yml:
      + Tại phần environment của ## goword-api, có thể thay đổi các biến MAIL_HOST, MAIL_PORT, MAIL_USER, MAIL_PASS
        để cấu hình mail server sử dụng cho các tính năng liên quan đến mail (Ở đây đang sử dụng mail server của Google - Google App Password)
      
  3. Deploy
    - Tại thư mục cli/goword, chạy lệnh:
      docker compose up -d
    - đợi khoảng 5 phút và mở link http://localhost
    - Tài khoản Admin mặc định:
      Username: admin@datvu.tech
      Password: 123456Aa@