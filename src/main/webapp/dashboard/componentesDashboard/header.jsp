<%@page import="Logica.Usuario"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Administraci�n</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="cssDashboard/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

        <!-- Validacion session-->
        <%
            HttpSession miSession = request.getSession();
            Usuario usuario = (Usuario) miSession.getAttribute("usuarioLogeado");

            if(usuario==null){
            response.sendRedirect("../loginNecesario.jsp");
            }
        %>


    </head>

