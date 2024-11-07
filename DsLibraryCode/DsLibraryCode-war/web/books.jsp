<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>微信读书 - 分类导航</title>
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
        .header {
            background-color: #fff;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            padding: 10px 20px;
        }
        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            display: flex;
            align-items: center;
        }
        .logo img {
            width: 32px;
            height: 32px;
            margin-right: 10px;
        }
        .logo h1 {
            font-size: 18px;
            color: #333;
        }
        .search-bar {
            display: flex;
            align-items: center;
            background-color: #f0f2f5;
            border-radius: 20px;
            padding: 5px 15px;
        }
        .search-bar input {
            border: none;
            background: transparent;
            padding: 5px;
            width: 200px;
            font-size: 14px;
        }
        .nav {
            display: flex;
            gap: 20px;
        }
        .nav a {
            color: #666;
            text-decoration: none;
            font-size: 14px;
        }
        .main-content {
            max-width: 1200px;
            margin: 20px auto;
            display: flex;
            gap: 20px;
        }
        .sidebar {
            width: 200px;
            background-color: #fff;
            border-radius: 4px;
            position: sticky;
            top: 20px;
            align-self: flex-start;
        }
        .sidebar h2 {
            font-size: 18px;
            padding: 15px;
            border-bottom: 1px solid #f0f2f5;
        }
        .sidebar ul {
            list-style-type: none;
        }
        .sidebar li {
            border-bottom: 1px solid #f0f2f5;
        }
        .sidebar li:last-child {
            border-bottom: none;
        }
        .sidebar a {
            color: #666;
            text-decoration: none;
            font-size: 14px;
            display: block;
            padding: 15px;
            transition: background-color 0.3s;
        }
        .sidebar a:hover, .sidebar a.active {
            background-color: #f0f2f5;
            color: #1890ff;
        }
        .book-list {
            flex: 1;
            background-color: #fff;
            padding: 20px;
            border-radius: 4px;
        }
        .book-item {
            display: flex;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #f0f2f5;
        }
        .book-rank {
            font-size: 24px;
            font-weight: bold;
            color: #1890ff;
            margin-right: 20px;
            width: 30px;
        }
        .book-cover {
            width: 100px;
            height: 150px;
            object-fit: cover;
            margin-right: 20px;
        }
        .book-info h3 {
            font-size: 18px;
            margin-bottom: 5px;
        }
        .book-author {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .book-description {
            font-size: 14px;
            color: #333;
            margin-bottom: 10px;
        }
        .book-stats {
            font-size: 12px;
            color: #999;
        }
        @media (max-width: 768px) {
            .main-content {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                position: static;
            }
        }
    </style>
</head>
<body>

    <header class="header">
        <div class="header-content">
            <div class="logo">
                <img src="https://via.placeholder.com/32" alt="微信读书logo">
                <h1>微信读书</h1>
            </div>
            <div class="search-bar">
                <form action="book-servlet" method="get">
                    <input type="text" id="bookInfo" name="bookInfo" placeholder="Enter book title or author" required="false">
                    <input type="submit" value="Search">
                </form>
            </div>
            <nav class="nav">
                <a href="#">首页</a>
                <a href="#">传书到手机</a>
                <a href="#">墨水屏版</a>
                <a href="#">手机版</a>
                <a href="#">登录</a>
            </nav>
        </div>
    </header>

    <main class="main-content">
        <!-- 左侧分类导航 -->
        <aside class="sidebar">
            <h2>图书分类</h2>
            <ul>
                <li><a href="#" class="active">全部</a></li>
                <li><a href="#">科幻</a></li>
                <li><a href="#">历史</a></li>
                <li><a href="#">诗歌</a></li>
                <li><a href="#">工具书</a></li>
                <li><a href="#">小说</a></li>
                <li><a href="#">传记</a></li>
                <li><a href="#">经济</a></li>
                <li><a href="#">心理学</a></li>
            </ul>
        </aside>

        <!-- 书籍展示区 -->
        <section class="book-list">
            <h2>图书列表</h2>

            <c:forEach var="book" items="${books}">
                <div class="book-item">
                    <!-- Book ID -->
                    <div class="book-rank">${book.id}</div>

                    <!-- Book Cover -->
                    <a href="book-servlet?action=view&id=${book.id}">
                        <img src="${book.coverImage}" alt="${book.title} Cover" class="book-cover">
                    </a>

                    <!-- Book Info -->
                    <div class="book-info">
                        <h3>${book.title}</h3>
                        <p class="book-author">${book.author}</p>
                        <p class="book-description">${book.description}</p>
                    </div>
                </div>
            </c:forEach>

        </section>
    </main>
<a href="user-servlet?action=viewProfile">UserProfile</a>
</body>
</html>

