<%-- 
    Document   : SerchBackup
    Created on : 2024?11?6?, 09:55:46
    Author     : asus
--%>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>??????</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }

        body {
            background-color: #f5f6f7;
        }

        .header {
            text-align: center;
            padding: 20px 0;
        }

        .logo {
            font-size: 24px;
            color: #333;
            font-weight: bold;
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

        .nav-item:hover {
            text-decoration: underline;
        }

        .search-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .search-bar {
            width: 100%;
            padding: 12px 20px;
            border: none;
            border-radius: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .main-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .section-title {
            font-size: 18px;
            font-weight: bold;
        }

        .change-btn {
            color: #1890ff;
            font-size: 14px;
            cursor: pointer;
        }

        .books-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .book-card {
            background: #fff;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
        }

        .book-cover {
            width: 120px;
            height: 160px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .book-title {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .book-author {
            font-size: 12px;
            color: #999;
        }

        .rankings {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .ranking-section {
            background: #fff;
            border-radius: 8px;
            padding: 20px;
        }

        .ranking-header {
            color: #ff6b6b;
            font-weight: bold;
            margin-bottom: 15px;
            font-size: 16px;
        }

        .ranking-list {
            list-style: none;
        }

        .ranking-item {
            display: flex;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #f0f0f0;
        }

        .ranking-number {
            font-size: 16px;
            font-weight: bold;
            color: #ff6b6b;
            margin-right: 10px;
            width: 24px;
        }

        .user-actions {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .user-actions a {
            color: #1890ff;
            text-decoration: none;
            margin-left: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- ??????????????? -->
    <div class="user-actions">
        <a href="#">?????</a>
        <a href="#">??</a>
    </div>

    <!-- ??? -->
    <nav class="nav">
        <a href="#" class="nav-item">????</a>
        <a href="user-servlet?action=viewProfile" class="nav-item">????</a>  <!-- ?????? -->
        <a href="#" class="nav-item">????</a>
        <a href="#" class="nav-item">?????</a>
    </nav>

    <!-- ?? -->
    <header class="header">
        <div class="logo">??????</div>
    </header>

    <!-- ??? -->
    <div class="search-container">
        <input type="search" class="search-bar" placeholder="??">
    </div>

    <!-- ??? -->
    <nav class="nav">
        <a href="#" class="nav-item">????</a>
        <a href="#" class="nav-item">???</a>
        <a href="#" class="nav-item">????</a>
        <a href="#" class="nav-item">????</a>
        <a href="#" class="nav-item">??</a>
    </nav>

    <!-- ????? -->
    <main class="main-content">
        <!-- ????? -->
        <div class="section-header">
            <h2 class="section-title">?????</h2>
            <span class="change-btn">???</span>
        </div>

        <div class="books-grid">
            <div class="book-card">
                <img src="/placeholder.svg?height=160&width=120" alt="??????" class="book-cover">
                <h3 class="book-title">??????????</h3>
                <p class="book-author">????</p>
            </div>
            <!-- ?????? -->
        </div>

        <!-- ????? -->
        <div class="rankings">
            <div class="ranking-section">
                <h3 class="ranking-header">TOP 50 / ???</h3>
                <ul class="ranking-list">
                    <li class="ranking-item">
                        <span class="ranking-number">1</span>
                        <div>
                            <div class="book-title">????</div>
                            <div class="book-author">????</div>
                        </div>
                    </li>
                    <!-- ?????? -->
                </ul>
            </div>
            <div class="ranking-section">
                <h3 class="ranking-header">TOP 50 / ???</h3>
                <ul class="ranking-list">
                    <li class="ranking-item">
                        <span class="ranking-number">1</span>
                        <div>
                            <div class="book-title">??</div>
                            <div class="book-author">??</div>
                        </div>
                    </li>
                    <!-- ?????? -->
                </ul>
            </div>
        </div>
    </main>
</body>
</html>
