<%-- 
    Document   : checkin
    Created on : 26 Jul 2024, 14:52:34
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form id="checkInForm" action="checkIn" 
      class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" onsubmit="return validatePhoneNumber()">
    <div class="input-group">
        <input type="tel" class="form-control bg-light border-0 small" placeholder="Nhập số điện thoại"
               aria-label="Phone Number" aria-describedby="basic-addon2" name="phoneNumber" id="phoneNumber" 
               pattern="(0|\+84)[3|5|7|8|9][0-9]{8}" inputmode="numeric" required>
        <div class="input-group-append">
            <button class="btn btn-primary" type="submit">
                <i class="fas fa-search fa-sm"></i>
            </button>
        </div>
    </div>
</form>
<script>
    function showError(message) {
        Swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: message
        });
    }

    function showSuccess(message, redirectUrl) {
        Swal.fire({
            icon: 'success',
            title: 'Thành công',
            text: message,
            confirmButtonText: 'OK'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = redirectUrl;
            }
        });
    }
</script>