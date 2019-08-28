<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    #container {
        padding: 250px 0 0 0;
        border-top: 1px solid #e8e9ed;
    }

    #content.admin {
        width: 788px;
        padding: 0 95px 60px;
    }

    #content {
        width: 883px;
        margin: 0 auto;
        padding: 0 0 60px 95px;
    }

    .login fieldset {
        width: 400px;
    }

    #header {
        color: white;
        background-color: black;
        position: relative;
        height: 100%;
        width: 100%;
        border-bottom: 1px solid white;
    }

    #header>h1 {
        margin: 0;
        padding: 0;
    }

    body {
        margin: 0;
    }
</style>

<body>
    <div id="header">
        <h1>판다 쇼핑몰 센터</h1>

    </div>
    <div id="container">
        <div id="content" class="admin">
            <div class="loginArea">
                <h1>판다 관리자 로그인</h1>
                <div class="login">
                    <form action="login" method="POST">
                        <fieldset>
                            <legend>로그인</legend>
                            <label class="ePlaceholder">
                                <span id="label_id" class="pos" style="display: block;">상점아이디</span>
                                <input type="text" name="id" class="text">
                            </label>
                            <label class=" ePlaceholder">
                                <span id="label_pw" class="pos" style="display: block;">비밀번호</span>
                                <input type="password" name="pw" class="text">
                            </label>
                            <p>
                                <input type="submit" value="로그인">
                            </p>
                        </fieldset>
                    </form>
                </div>
            </div>

        </div>

    </div>
</body>
</html>