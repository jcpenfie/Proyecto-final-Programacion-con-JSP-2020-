<%@page import="Clases.Metodos"%>
<%@page import="java.util.Scanner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../../css/styleJuego.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script><%//Para los iconos%>
        <title>Fantasía</title>
    </head>
    <body>
        <br>
        <%!
            int mensaje = 0;
            int posX = 0;
            int posY = 0;
            int cont = 8;
            int alto = (int) (Math.random() * 5 + 3);
            int ancho = (int) (Math.random() * 5 + 3);
            int veneno = (int) (Math.random() * 2 + 1);
            int rocksI = (int) (Math.random() * alto + 1);// generacion de rocas
            int rocksJ = (int) (Math.random() * ancho + 1);// generacion de rocas
            int contR = 0; //Para saber cuantas veces a ido a las rocas
            int contC = 0; //Para saber cuantas veces a ido a la casa
        %>

        <div class="box2">
            <%
                switch (mensaje) {
                    case 0:
                        out.print("<br><div class=\"mensaje\"><span>De alguna forma que desconocemos has acabado en un planeta descoonocido con una 🧬 (muestra de ADN) en la mano.</span></div><br>");
                        break;
                    case 1:
                        out.print("<br><div class=\"mensaje\"><span>Una fuerza desconocida hace que muevas el brazo tan fuerte que la 🧬 (muestra de ADN) sale disparado,</span></div><br>");
                        break;
                    case 2:
                        out.print("<br><div class=\"mensaje\"><span>Confuso empiezas a buscarlo:</span></div><br>");
                        break;
                    case 3:
                        out.print("<br><div class=\"mensaje\"><span>Confuso empiezas a buscarlo:</span></div>");
                        out.print("<h1>Movimientos: " + (mensaje - 3) + "</h1>");
                        out.print("<table><tr>");
                        out.print("<td><img src=\"../../../img/fantasia/corRigDow.png\" width=\"64\" height=\"64\"></td>");
                        for (int i = 0; i < ancho; i++) {
                            out.print("<td><img src=\"../../../img/fantasia/dow.png\" width=\"64\" height=\"64\"></td>");
                        }
                        out.print("<td><img src=\"../../../img/fantasia/corLefDow.png\" width=\"64\" height=\"64\"></td>");
                        out.print("</tr></table>");
                        out.print("<table><tr>");
                        for (int i = 0; i < alto; i++) {
                            out.print("<td><img src=\"../../../img/fantasia/rig.png\" width=\"64\" height=\"64\"></td>");
                            for (int j = 0; j < ancho; j++) {
                                if (!(i == posY && j == posX)) {
                                    if ((i == alto - 1 && j == ancho - 1)) {//casa
                                        out.print("<td><a href=\"fantasia.jsp?i=" + i + "&j=" + (j - 1) + "&opc=h\" class=\"btn btn-primary\"><img src=\"../../../img/fantasia/house.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == (alto / 2) && j == (ancho / 2 + 1)) || (i == (alto / 2 - 1) && j == (ancho / 2))) {//flores azules
                                        out.print("<td><a href=\"fantasia.jsp?i=" + i + "&j=" + j + "&opc=f\" class=\"btn btn-primary\"><img src=\"../../../img/fantasia/flowers.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == alto / 2 + 1 && j == ancho / 2 - 1)) {
                                        out.print("<td><a href=\"fantasia.jsp?i=" + i + "&j=" + j + "&opc=f\" class=\"btn btn-primary\"><img src=\"../../../img/fantasia/flowers2.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == (rocksI - 3) && j == rocksJ) || (i == rocksI && j == (rocksJ + 4))) {//roca1
                                        out.print("<td><a href=\"fantasia.jsp?i=" + i + "&j=" + j + "&opc=r\" class=\"btn btn-primary\"><img src=\"../../../img/fantasia/rock1.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == rocksI && j == rocksJ)) {//roca2
                                        out.print("<td><a href=\"fantasia.jsp?i=" + i + "&j=" + j + "&opc=r\" class=\"btn btn-primary\"><img src=\"../../../img/fantasia/rock1.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else {
                                        out.print("<td><a href=\"fantasia.jsp?i=" + i + "&j=" + j + "&opc=c\" class=\"btn btn-primary\"><img src=\"../../../img/fantasia/floor.png\" width=\"64\" height=\"64\"></a></td>");
                                    }

                                } else {
                                    out.print("<td><img src=\"../../../img/fantasia/face.png\" width=\"64\" height=\"64\"></td>");
                                }
                            }
                            out.print("<td><img src=\"../../../img/fantasia/lef.png\" width=\"64\" height=\"64\"></td>");
                            out.print("</tr>");
                            cont--;
                        }
                        out.print("</table>");
                        out.print("<table><tr>");
                        out.print("<td><img src=\"../../../img/fantasia/corRigTop.png\" width=\"64\" height=\"64\"></td>");
                        for (int i = 0; i < ancho; i++) {
                            out.print("<td><img src=\"../../../img/fantasia/top.png\" width=\"64\" height=\"64\"></td>");
                        }
                        out.print("<td><img src=\"../../../img/fantasia/corLefTop.png\" width=\"64\" height=\"64\"></td>");
                        out.print("</tr></table>");
                        break;

                    default:
                        String opc = request.getParameter("opc");
                        switch (opc) {
                            case "h":
                                if (mensaje > 5 && contC > 0) {
                                    out.print("<br><div class=\"mensaje\"><span>No entiendes como pero al volver a mirar estába aquí la 🧬</span></div>");
                                    out.print("<br><a href=\"guardarPuntos.jsp?p=" + mensaje + "&an=" + ancho + "&al=" + alto + "\"><div class=\"btn4\"> <i class=\"fas fa-file-download\"></i> &nbsp; Guardar Puntuación</div></a><br>");
                                } else {
                                    contC++;
                                    out.print("<br><div class=\"mensaje\"><span>Estabas fuera de <b>tu nave</b> cuando pasó</span></div>");
                                }
                                break;
                            case "f":
                                out.print("<br><div class=\"mensaje\"><span>Este planeta tiene 🎩 de colores en vez de 🌼🌷. Buscas y no está</span></div>");
                                break;
                            case "r":

                                switch (contR) {
                                    case 4:
                                        out.print("<br><div class=\"mensaje\"><span>Vuelves a mirar bien 👀 y estaba aquí la 🧬</span></div>");
                                        out.print("<br><a href=\"guardarPuntos.jsp?p=" + mensaje + "&an=" + ancho + "&al=" + alto + "\"><div class=\"btn\"> <i class=\"fas fa-file-download\"></i> &nbsp; Guardar Puntuación</div></a>");
                                        break;
                                    default:
                                        contR++;
                                        out.print("<br><div class=\"mensaje\"><span>¿Le preguntas al unicornio, en serio 🤦‍♂️?</span></div>");
                                        break;
                                }
                                break;
                            default:
                                out.print("<br><div class=\"mensaje\"><span>Este planeta plano está un poco vacío</span></div>");
                                break;
                        }
                        out.print("<h1>Movimientos: " + (mensaje - 3) + "</h1>");
                        out.print("<table><tr>");
                        out.print("<td><img src=\"../../../img/fantasia/corRigDow.png\" width=\"64\" height=\"64\"></td>");
                        for (int i = 0; i < ancho; i++) {
                            out.print("<td><img src=\"../../../img/fantasia/dow.png\" width=\"64\" height=\"64\"></td>");
                        }
                        out.print("<td><img src=\"../../../img/fantasia/corLefDow.png\" width=\"64\" height=\"64\"></td>");
                        out.print("</tr></table>");
                        int j2 = Integer.parseInt(request.getParameter("j"));
                        int i2 = Integer.valueOf(request.getParameter("i"));
                        //int i2 = 0;
                        //out.print(i2 + " " + " " + j2);
                        out.print("<table><tr>");
                        for (int i = 0; i < alto; i++) {
                            out.print("<td><img src=\"../../../img/fantasia/rig.png\" width=\"64\" height=\"64\"></td>");;
                            for (int j = 0; j < ancho; j++) {
                                if (!(i == i2 && j == j2)) {
                                    if ((i == alto - 1 && j == ancho - 1)) {//casa
                                        out.print("<td><a href=\"fantasia.jsp?i=" + i + "&j=" + (j - 1) + "&opc=h\" class=\"btn btn-primary\"><img src=\"../../../img/fantasia/house.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == (alto / 2) && j == (ancho / 2 + 1)) || (i == (alto / 2 - 1) && j == (ancho / 2))) {//flores azules
                                        out.print("<td><a href=\"fantasia.jsp?i=" + i + "&j=" + j + "&opc=f\" class=\"btn btn-primary\"><img src=\"../../../img/fantasia/flowers.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == alto / 2 + 1 && j == ancho / 2 - 1)) {
                                        out.print("<td><a href=\"fantasia.jsp?i=" + i + "&j=" + j + "&opc=f\" class=\"btn btn-primary\"><img src=\"../../../img/fantasia/flowers2.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == (rocksI - 3) && j == rocksJ) || (i == rocksI && j == (rocksJ + 4))) {//roca1
                                        out.print("<td><a href=\"fantasia.jsp?i=" + i + "&j=" + j + "&opc=r\" class=\"btn btn-primary\"><img src=\"../../../img/fantasia/rock1.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == rocksI && j == rocksJ)) {//roca2
                                        out.print("<td><a href=\"fantasia.jsp?i=" + i + "&j=" + j + "&opc=r\" class=\"btn btn-primary\"><img src=\"../../../img/fantasia/rock1.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else {
                                        out.print("<td><a href=\"fantasia.jsp?i=" + i + "&j=" + j + "&opc=c\" class=\"btn btn-primary\"><img src=\"../../../img/fantasia/floor.png\" width=\"64\" height=\"64\"></a></td>");
                                    }

                                } else {
                                    out.print("<td><img src=\"../../../img/fantasia/face.png\" width=\"64\" height=\"64\"></td>");
                                }
                            }
                            out.print("<td><img src=\"../../../img/fantasia/lef.png\" width=\"64\" height=\"64\"></td>");
                            out.print("</tr>");
                            cont--;
                        }
                        out.print("</table>");
                        out.print("<table><tr>");
                        out.print("<td><img src=\"../../../img/fantasia/corRigTop.png\" width=\"64\" height=\"64\"></td>");
                        for (int i = 0; i < ancho; i++) {
                            out.print("<td><img src=\"../../../img/fantasia/top.png\" width=\"64\" height=\"64\"></td>");
                        }
                        out.print("<td><img src=\"../../../img/fantasia/corLefTop.png\" width=\"64\" height=\"64\"></td>");
                        out.print("</tr></table>");
                        break;

                }
            %>
        </div>
        <script>
            function actualizar() {
                location.reload(true);
            <%mensaje++;%>
            }
            //Función para actualizar cada 4 segundos(4000 milisegundos)
            <%if (mensaje > 0 && mensaje < 4) {%>
            setInterval("actualizar()", 4000);
            <%}%>
        </script>
    </body>
</html>
