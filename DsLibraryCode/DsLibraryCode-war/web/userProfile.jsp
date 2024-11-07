<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>微信读书 - 我的账户</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'PingFang SC', 'Hiragino Sans GB', 'Microsoft YaHei', 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .user-info {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .user-info-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .user-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-right: 20px;
        }
        .user-details h2 {
            font-size: 24px;
            margin-bottom: 5px;
        }
        .user-details p {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }
        .user-activity {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .activity-item {
            background-color: #f9f9f9;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
        }
        .activity-item h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .activity-item p {
            font-size: 14px;
            color: #666;
        }
        .book-section {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .book-section h2 {
            font-size: 20px;
            margin-bottom: 15px;
        }
        .book-list {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        .book-item {
            width: calc(20% - 12px);
            text-align: center;
        }
        .book-cover {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 5px;
        }
        .book-title {
            font-size: 14px;
            color: #333;
        }
        .add-book {
            width: calc(20% - 12px);
            height: 150px;
            background-color: #f0f2f5;
            border-radius: 4px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 36px;
            color: #999;
            cursor: pointer;
        }
        .nav {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 20px 0;
            padding: 10px 0;
            background-color: #2c3e50;
            color: white;
        }

        .nav-item {
            color: #fff;
            text-decoration: none;
            font-size: 14px;
        }
        @media (max-width: 768px) {
            .book-item, .add-book {
                width: calc(33.33% - 10px);
            }
        }
        @media (max-width: 480px) {
            .book-item, .add-book {
                width: calc(50% - 7.5px);
            }
        }
    </style>
</head>
<body>
    <!-- 导航栏 -->
    <nav class="nav">
        <a href="#" class="nav-item">返回首页</a>
        <a href="user-servlet?action=viewProfile" class="nav-item">我的账户</a>  <!-- 用户个人信息 -->
        <a href="#" class="nav-item">我的书架</a>
        <a href="#" class="nav-item">我的购物车</a>
    </nav>
    <div class="container">
        <section class="user-info">
            <div class="user-info-header">
                <img src="https://via.placeholder.com/80" alt="用户头像" class="user-avatar">
                <div class="user-details">
                    <h2>${user.userName}</h2>
                    <p>账户余额: ${user.balance}</p>
                    <p>电子邮箱: ${user.email}</p>
                </div>
            </div>
        </section>

        <section class="user-activity">
            <h2>最近动态</h2>
            <div class="activity-item">
                <h3>《三体》评价</h3>
                <p>评分: 5星</p>
                <p>评论: 这是一部非常精彩的科幻小说，让人深思人类文明的未来。</p>
            </div>
            <div class="activity-item">
                <h3>《百年孤独》评价</h3>
                <p>评分: 4星</p>
                <p>评论: 魔幻现实主义的代表作，情节复杂但引人入胜。</p>
            </div>
        </section>

        <section class="book-section">
            <h2>已借阅的书籍</h2>
            <div class="book-list">
                <c:forEach var="rentedBook" items="${rentedBooks}">
                    <div class="book-item">
                        <img src="https://via.placeholder.com/150" alt="书籍封面" class="book-cover">
                        <p class="book-title">${rentedBook.title}</p>
                    </div>
                </c:forEach>
                <div class="add-book">+</div>
            </div>
        </section>

        <section class="book-section">
            <h2>已购买的书籍</h2>
            <div class="book-list">
                <c:forEach var="purchasedBook" items="${purchasedBooks}">
                    <div class="book-item">
                        <img src=""https://via.placeholder.com/150"" alt="书籍封面" class="book-cover">
                        <p class="book-title">${purchasedBook.title}</p>
                    </div>
                </c:forEach>
                <div class="add-book">+</div>
            </div>
        </section>
    </div>
<li><a href="LogoutServlet">Logout</a></li>
</body>
</html>

