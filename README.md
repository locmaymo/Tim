<p align="center"><a href="https://tim-vn.tech/" target="_blank"><img src="https://raw.githubusercontent.com/locmaymo/tim-vn.tech/test/public/image/logo-tim.png" width="200" alt="Logo"></a></p>



# Đề Tài Tốt Nghiệp: Website Tìm Kiếm Việc Làm

Đây là dự án đề tài tốt nghiệp - xây dựng một website tìm kiếm việc làm.

## Mô Tả

Website được xây dựng với mục tiêu cung cấp một nền tảng cho người tìm việc và nhà tuyển dụng. Có các tính năng chính sau:
- Đăng ký và đăng nhập cho ứng viên và nhà tuyển dụng.
- Tìm kiếm việc làm dựa trên mức lương, địa chỉ.
- Đăng tin tuyển dụng cho nhà tuyển dụng.
- Lưu trữ hồ sơ và thông tin cá nhân của người dùng.
- Công cụ tạo CV thu hút, nổi bật.
- Trợ lý AI thông minh giúp bạn lựa chọn nội dung.

## Cài đặt
### Hướng dẫn cài đặt và chạy project Laravel sau khi clone từ GitHub
0. <b>Lưu Lý:</b> tôi đã deploy sẵn trang web nên để tiết kiệm thời gian bạn có thể bỏ qua bước cài đặt. Và đến phần [Xem Website](#Xem-Website)
1. Cài Xampp
2. Cài Composer
3. Cài một IDE như PhpStorm hoặc VSCode

### Di chuyển vào thư mục project và chạy các lệnh
    composer install
    composer dumpautoload -o
Cấu hình tập tin .env
Sao chép từ tập tin mẫu .env.example sang .env

    cp .env.example .env
    
Tạo key cho ứng dụng

    php artisan key:generate
    
Chỉnh sửa các thông số cấu hình trong tập tin .env cho phù hợp môi trường (APP_, DB_, Mật khẩu DB) ví dụ [Link tới file .env mẫu](File_env_cua_toi)

Xóa và tạo lại cache

    php artisan config:clear
    php artisan config:cache
    
Tạo symbolic link giữa storage và public

    php artisan storage:link

Chạy Miragte tạo DB

    php artisan migrate

Chạy server development

    php artisan serve
    
Như vậy là đã sẵn sàng để chạy project Laravel sau khi clone từ GitHub.

## Dữ Liệu Mẫu Và Các Phần Khác

### Bạn có thể tự tạo tài khoản đăng bài với dữ liệu của bạn nếu không có thể dùng dữ liệu dưới đây.

<b>Lưu Lý:</b> tôi đã deploy sẵn trang web nên để tiết kiệm thời gian bạn có thể bỏ qua bước cài đặt. Và đến phần [Xem Website](#Xem-Website)

Để import dữ liệu mẫu, bạn có thể sử dụng file SQL sau: [Link tới file SQL](laravel.sql)

Một số tài khoản có sẵn trong dữ liệu mẫu để trải nghiệm:
- locmaymo@gmail.com|locloc11 (Tài khoản tuyển dụng đã đăng nhiều bài, đã thanh toán có nhiều ứng viên).
- tutoihoc@gmail.com|locloc11 (Tài khoản tuyển dụng chưa thanh toán gói nào).
- locmaymo12@gmail.com|jwiz@Nqt.K5P5W (Tài khoản ứng viên đã cập nhật đầy đủ thông tin, đã ứng tuyển nhiều vị trí).
- 5qgmrksb5w@laafd.com|5qgmrksb5w@laafd.com (Tài khoản ứng viên chưa cập nhật đầy đủ thông tin, chưa được nhà tuyển dụng duyệt).

Để thử chức năng thanh toán bạn cần sử dụng thẻ sau:
- Ngân hàng: NCB
- Số thẻ: 9704198526191432198
- Tên chủ thẻ:NGUYEN VAN A
- Ngày phát hành:07/15
- Mật khẩu OTP:123456

## Xem Website

### Bạn có thể xem website này trực tiếp tại đây: <a href="https://tim-vn.tech/" target="_blank">Tim-VN.Tech</a>

Các Tài khoản có sẵn trên web online:
- locmaymo@gmail.com|locloc11 (Tài khoản tuyển dụng đã đăng nhiều bài, đã thanh toán có nhiều ứng viên).
- rennguyen.ai@gmail.com|locloc11 (Tài Khoản tuyển dụng đã đăng bài, chưa thanh toán)
- locmaymo2@gmail.com|locloc11 (Tài khoản ứng viên mới chưa cập nhật thông tin)
- 1oeab8onmp@vjuum.com|locloc11 (Một tài khoản ứng viên khác)


