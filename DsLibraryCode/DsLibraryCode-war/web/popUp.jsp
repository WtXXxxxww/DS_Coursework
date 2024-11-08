<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            /* 添加弹窗的样式 */
            .modal {
                display: none; /* 默认隐藏 */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }
            .modal-content {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                text-align: center;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }
            .close-btn {
                background-color: #3498db;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 15px;
            }
        </style>
    </head>
    <body>
        <!-- 弹窗 HTML 结构 -->
        <div id="messageModal" class="modal">
            <div class="modal-content">
                <p id="messageText"></p>
                <button class="close-btn" onclick="closeModal()">Close</button>
            </div>
        </div>

        <script>
            // 获取 URL 参数中的 message 值
            function getQueryParam(param) {
                let urlParams = new URLSearchParams(window.location.search);
                return urlParams.get(param);
            }

            // 显示弹窗
            function showModal(message) {
                document.getElementById("messageText").textContent = message;
                document.getElementById("messageModal").style.display = "flex";
            }

            // 关闭弹窗并返回原页面
            function closeModal() {
                document.getElementById("messageModal").style.display = "none";
                // 移除 URL 中的 message 参数并刷新页面
                let url = new URL(window.location.href);
                url.searchParams.delete("message");
                window.history.replaceState({}, document.title, url);
                window.location.reload(); // 刷新页面
            }

            // 检查是否有 message 参数，并显示相应的弹窗
            let message = getQueryParam("message");
            if (message) {
                showModal(message);
            }
        </script>
    </body>
</html>
