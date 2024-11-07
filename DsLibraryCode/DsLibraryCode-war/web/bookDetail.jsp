<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .nav {
            background-color: #2c3e50;
            padding: 10px 20px;
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        .nav ul li {
            margin: 5px 0;
        }
        .nav ul li a {
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .nav ul li a:hover {
            background-color: #34495e;
        }
        .book-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            margin: 40px auto;
            overflow: hidden;
        }
        .book-info {
            padding: 30px;
        }
        .book-cover {
            width: 100%;
            max-width: 400px;
            height: auto;
            display: block;
            margin: 0 auto 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
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
            border-radius: 8px;
            margin-top: 30px;
            font-size: 1.1em;
            line-height: 1.8;
        }
        @media (min-width: 768px) {
            .book-card {
                display: flex;
            }
            .book-cover {
                max-width: 400px;
                margin: 0;
                object-fit: cover;
                object-position: center;
            }
            .book-info {
                flex: 1;
            }
        }
    </style>
</head>
<body>
    <nav class="nav">
        <ul>
            <li><a href="#">????</a></li>
            <li><a href="user-servlet?action=viewProfile">????</a></li>  
            <li><a href="#">????</a></li>
            <li><a href="#">?????</a></li>
        </ul>
    </nav>

    <div class="book-card">
        <img src="${book.coverImage}" alt="${book.title} Cover" class="book-cover">
        <div class="book-info">
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
                <button class="btn btn-primary">Buy</button>
                <button class="btn btn-secondary">Borrow</button>
            </div>
            <div class="book-description">
                <h2>Book Description</h2>
                <p>${book.description}</p>
            </div>
        </div>
    </div>
    <a href="user-servlet?action=viewProfile">UserProfile</a>  
</body>
</html>