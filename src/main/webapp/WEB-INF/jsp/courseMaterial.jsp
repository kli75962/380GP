<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Materials</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        h2 {
            color: #2980b9;
            margin-top: 30px;
        }
        .download-section {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 30px;
        }
        .download-link {
            display: block;
            margin: 10px 0;
            padding: 8px 15px;
            background-color: #e1f0fa;
            border-left: 4px solid #3498db;
            text-decoration: none;
            color: #2c3e50;
            transition: all 0.3s;
        }
        .download-link:hover {
            background-color: #d0e7f7;
            transform: translateX(5px);
        }
        .comment-section {
            margin-top: 40px;
        }
        .comment-form {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 30px;
        }
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
            min-height: 100px;
        }
        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        button:hover {
            background-color: #2980b9;
        }
        .comment {
            border-left: 3px solid #3498db;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f8f9fa;
        }
        .comment-header {
            font-weight: bold;
            margin-bottom: 10px;
            color: #2c3e50;
        }
        .comment-meta {
            font-size: 0.9em;
            color: #7f8c8d;
            margin-bottom: 5px;
        }
        .role-teacher {
            color: #e74c3c;
        }
        .role-ta {
            color: #f39c12;
        }
        .role-student {
            color: #27ae60;
        }
    </style>
</head>
<body>
    <h1>Introduction to Web Development</h1>
    
    <div class="download-section">
        <h2>Lecture Notes</h2>
        <a href="/lectures/web-dev-part1.pdf" class="download-link">Lecture Notes - Part 1 (PDF)</a>
        <a href="/lectures/web-dev-part2.pdf" class="download-link">Lecture Notes - Part 2 (PDF)</a>
        <a href="/lectures/web-dev-slides.pptx" class="download-link">Slides Presentation (PPTX)</a>
        <a href="/lectures/web-dev-examples.zip" class="download-link">Supplementary Materials (ZIP)</a>
    </div>

    <div class="comment-section">
        <h2>Discussion</h2>
        
        <div class="comment-form">
            <h3>Post a Comment</h3>
            <textarea placeholder="Share your thoughts or ask a question..."></textarea>
            <div>
                <button type="button">Attach File</button>
                <button type="submit">Post Comment</button>
            </div>
        </div>

        <h3>Previous Comments</h3>
        
        <div class="comment">
            <div class="comment-header">
                <span class="role-teacher">Prof. Johnson (Instructor)</span>
            </div>
            <div class="comment-meta">Posted on March 15, 2024</div>
            <div class="comment-body">
                "Please review chapters 3-5 before next week's lecture. I've added some additional examples to the supplementary materials that will help with the upcoming assignment."
            </div>
        </div>

        <div class="comment">
            <div class="comment-header">
                <span class="role-student">Sarah M. (Student)</span>
            </div>
            <div class="comment-meta">Posted on March 18, 2024</div>
            <div class="comment-body">
                "Thank you for the materials! I found the diagram on page 12 particularly helpful for understanding the core concepts. Does anyone know if there will be a review session before the midterm?"
            </div>
        </div>

        <div class="comment">
            <div class="comment-header">
                <span class="role-ta">Alex Chen (TA)</span>
            </div>
            <div class="comment-meta">Posted on March 19, 2024</div>
            <div class="comment-body">
                "@Sarah Yes, we'll have a review session next Tuesday at 4pm in Room 204. I'll post the study guide by Friday."
            </div>
        </div>

        <div class="comment">
            <div class="comment-header">
                <span class="role-student">David K. (Student)</span>
            </div>
            <div class="comment-meta">Posted on March 22, 2024</div>
            <div class="comment-body">
                "I'm having trouble with the exercise on page 8. The solutions seem different from what I'm getting. Has anyone else worked through this yet?"
                <div><a href="#">problem_work.pdf</a></div>
            </div>
        </div>

        <div class="comment">
            <div class="comment-header">
                <span class="role-teacher">Prof. Johnson (Instructor)</span>
            </div>
            <div class="comment-meta">Posted on March 23, 2024</div>
            <div class="comment-body">
                "@David I see where the confusion is - check your assumption in step 2. I've uploaded a corrected version of the notes with more detailed explanations for that section."
            </div>
        </div>
    </div>
</body>
</html>