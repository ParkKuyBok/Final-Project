<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <title>중고나라</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- font awesome css -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">

    <style>
 
        .first{
            height: 10px;
            background-color: white;
            border: none;
            
        }
    </style>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class = "navbar navbar-inverse " >
        <div class = "container-fluid">
            <div class = "navbar-right">
                <ul class = "navbar navbar-nav navbar-right">
                <li><a href = "login">로그인</a></li><br>
                <li><a href = "">회원가입</a></li><br>
                <li><a href = "">ID/PW 찾기</a><br>
                 <form class="navbar-form">
                    <div class="input-group">
                        <input type="text" class="form-control">
                        <div class="input-group-btn">
                            <input type="submit" class="btn btn-default" value="검색">
                            <button type="submit" class="btn btn-default">
                                <i class="fas fa-search" style="font-size:2rem;"></i>
                            </button>
                        </div>
                    </div>
                </form>
                </ul>
            </div>
        </div>
    </nav>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <!-- 브랜드 영역 -->
            <div class="navbar-header">
                <!-- 햄버거 버튼 -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#my-menu">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">중고장터</a>
            </div>

            <!--접었다 펼쳤다 할 영역(Collapse-Area) -->
            <div class="collapse navbar-collapse" id="my-menu">
                <!-- 오른쪽 메뉴 영역 -->
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">공지</a></li>
                    <li><a href="#">상품</a></li>
                    <li>
                         <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            커뮤니티
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a href="#">요청게시판</a></li>
                            <li><a href="#">후기게시판</a></li>
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">신고게시판</a></li>
                        </ul>
                    </li>
                    <li><a href="#">이벤트</a></li>
                    <li><a href="#">문의하기</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
