<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Information</title>
    <style>
        .header {
            position: sticky;
            top:0;
            background-color: #fff;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            padding: 10px 20px;
        }
        .header-content {
            position: sticky;
            top:0;
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
            position: sticky;
            top:0;
            width: 32px;
            height: 32px;
            margin-right: 10px;
        }
        .logo h1 {
            font-size: 18px;
            color: #333;
        }
        .search-bar {
            position: sticky;
            top:0;
            display: flex;
            align-items: center;
            background-color: #f0f2f5;
            border-radius: 20px;
            padding: 5px 15px;
        }
        .search-bar input {
            position: sticky;
            top:0;
            border: none;
            background: transparent;
            padding: 5px;
            width: 200px;
            font-size: 14px;
        }
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .nav {
            position: sticky;
            top:0;
            display: flex;
            gap: 20px;
        }
        .nav a {
            color: #666;
            text-decoration: none;
            font-size: 14px;
        }
        .book-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            margin: 40px auto;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }
        .book-info {
            padding: 30px;
            display: flex;
            flex-direction: row;
            gap: 30px;
        }
        .book-cover {
            width: 250px;
            height: auto;
            display: block;
            margin: 0;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            align-self: flex-start;
        }
        .book-details {
            flex: 1;
        }
        h1 {
            margin: 0 0 15px;
            color: #2c3e50;
            font-size: 2.5em;
        }
        .author {
            font-style: italic;
            color: #7f8c8d;
            margin-bottom: 25px;
            font-size: 1.2em;
        }
        .details {
            margin-bottom: 25px;
            font-size: 1.1em;
        }
        .details dt {
            font-weight: bold;
            margin-top: 15px;
        }
        .price-availability {
            background-color: #ecf0f1;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 25px;
            font-size: 1.2em;
        }
        .price {
            font-size: 1.4em;
            font-weight: bold;
            color: #e74c3c;
        }
        .availability {
            color: #27ae60;
            margin-top: 10px;
        }
        .buttons {
            display: flex;
            gap: 15px;
        }
        .btn {
            flex: 1;
            padding: 15px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
        }
        .btn-primary {
            background-color: #3498db;
            color: white;
        }
        .btn-secondary {
            background-color: #ecf0f1;
            color: #2c3e50;
        }
        .btn:hover {
            opacity: 0.9;
        }
        .book-description {
            background-color: #f9f9f9;
            padding: 25px;
            border-radius: 0 0 8px 8px;
            font-size: 1.1em;
            line-height: 1.8;
        }
        .comments-section {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
        }

        .comment {
            display: flex;
            padding: 20px;
            border-bottom: 1px solid #eee;
            margin-bottom: 20px;
        }

        .comment-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 15px;
        }

        .comment-content {
            flex: 1;
        }

        .comment-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .comment-user {
            font-weight: bold;
            color: #2c3e50;
        }

        .comment-meta {
            color: #7f8c8d;
            font-size: 0.9em;
        }

        .comment-text {
            color: #34495e;
            line-height: 1.6;
        }

        .comment-rating {
            color: #f39c12;
            margin-right: 10px;
        }

        .comment-helpful {
            color: #3498db;
            font-size: 0.9em;
            text-align: right;
            margin-top: 10px;
        }

        .star-rating {
            color: #f1c40f;
        }

        .location-badge {
            background-color: #f8f9fa;
            padding: 2px 8px;
            border-radius: 12px;
            font-size: 0.8em;
            color: #666;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="header-content">
            <div class="logo">
                <img src="https://via.placeholder.com/32" alt="????logo">
                <h1>G2 library</h1>
            </div>
            <div class="search-bar">
                <form action="book-servlet" method="get">
                    <input type="text" id="bookInfo" name="bookInfo" placeholder="Enter book title or author" required="false">
                    <input type="submit" value="Search">
                </form>
            </div>
            <nav class="nav">
                <a href="#">Home</a>
                <a href="user-servlet?action=viewProfile" class="nav-item">My Account</a> 
            </nav>
        </div>
    </header>

    <div class="book-card">
        <div class="book-info">
            <img src="${book.coverImage}" alt="${book.title} Cover" class="book-cover">
            <div class="book-details">
                <h1>${book.title}</h1>
            <p class="author">${book.author}</p>
            <dl class="details">
                <dt>Language:</dt>
                <dd>${book.language}</dd>
                <dt>Style:</dt>
                <dd>${book.genre}</dd>
                <dt>Published:</dt>
                <dd>${book.publishDate}</dd>
                </dl>
                <div class="price-availability">
                    <p class="price">Price: ${book.price}</p>
                    <p class="availability">Available: ${book.availableQuantity} copies</p>
                </div>
                <div class="buttons">
                    <form action="book-servlet" method="post">
                        <input type="hidden" name="action" value="buy">
                        <input type="hidden" name="bookId" value="${book.id}">
                        <button type="submit" class="btn btn-primary">Buy</button>
                    </form>
                
                    <!-- Borrow button with form -->
                    <form action="book-servlet" method="post">
                        <input type="hidden" name="action" value="borrow">
                        <input type="hidden" name="bookId" value="${book.id}">
                        <button type="submit" class="btn btn-secondary">Borrow</button> 
                    </form>
                </div>
            </div>
        </div>
        <div class="book-description">
            <h2>Book Description</h2>
                <p>${book.description}</p>
        </div>
    </div>
    <div class="comments-section">
        <h2>????</h2>
        <div class="comment">
            <img src="https://via.placeholder.com/50" alt="User Avatar" class="comment-avatar">
            <div class="comment-content">
                <div class="comment-header">
                    <div>
                        <span class="comment-user">???</span>
                        <span class="star-rating">?????</span>
                    </div>
                    <div class="comment-meta">
                        <span class="location-badge">??</span>
                        <span>2024-01-05 15:30</span>
                    </div>
                </div>
                <p class="comment-text">??????????????????????????????????????????????????????????????????????????????????????????</p>
                <div class="comment-helpful">741 ??</div>
            </div>
        </div>
</body>
</html>