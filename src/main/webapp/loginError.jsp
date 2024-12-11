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
        <form action="SVLogin" method="POST">
            <h1>Login</h1>
            <!-- Caja de texto con el mensaje de error -->
            <div style="color: red; font-weight: bold; text-align: center; margin-bottom: 10px;">
                Usuario o contraseña incorrectos. Intente de nuevo.
            </div>
            <div class="input-box">
                <input type="text" placeholder="Usuario" name="usuario" id='user' required>
                <box-icon type='solid' name='user'></box-icon>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Contraseña" name="contrasenia" id="contrasenia" required>
                <box-icon name='lock-alt' type='solid' ></box-icon>
            </div>
            <div class="remenber-forgot">
                <label><input type="checkbox">Recordar</label>
            </div>
            <button type="submit" class="btn">Ingresar</button>
        </form>
    </div>
</body>
</html>
