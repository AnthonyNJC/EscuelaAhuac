<!--  <html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <link rel="stylesheet" href="style_login.css">

    <title>Acceder</title>

  </head>-->
<%@include file="componentes/header.jsp" %>
<link rel="stylesheet" href="assets/css/style_login.css">
  <%@include file="componentes/menuBar.jsp" %>
    <body>
        <div class="wrapper">
            <form action="dashboard/index.jsp" method="POST">
                <h1>Login</h1>
                <div class="input-box">
                    <input type="text" placeholder="Usuario" required>
                    <box-icon type='solid' name='user'></box-icon>
                </div>
                <div class="input-box">
                    <input type="password" placeholder="Contraseña" required>
                    <box-icon name='lock-alt' type='solid' ></box-icon>
                </div>
                <div class="remenber-forgot">
                    <label><input type="checkbox">Recordar</label>
                    <a href="#">Olvidaste tu contraseña?</a>
                </div>
                <button type="submit" class="btn">Ingresar</button>
            </form>
        </div>
    </body>
</html>
