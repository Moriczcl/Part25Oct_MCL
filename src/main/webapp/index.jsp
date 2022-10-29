<%@page import="com.emergentes.modelo.Tarea"%>
<%@page import="com.emergentes.modelo.GestorTareas"%>
<%
    if(session.getAttribute("agenda")==null){
        GestorTareas objeto1=new GestorTareas();
        
        objeto1.insertarTarea(new Tarea(1,"Reunion con estudiantes de la carrera","Alta"));
        objeto1.insertarTarea(new Tarea(2,"Estudiar para el examen de estadistica","Alta"));
        objeto1.insertarTarea(new Tarea(1,"Partido de futbol","Baja"));
        
        session.setAttribute("agenda",objeto1);
    }
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP - Tareas</title>
    </head>
    <body>
        <center>
            <fieldset style="background-color:Beige;border:6px groove #ccc;width:350px">
                <h1>Lista de Tareas</h1><!-- comment -->
            </fieldset>
            <fieldset style="background-color:Beige;border:6px groove #ccc;width:350px">
        <a href="Controlador?op=nuevo">Nueva Tarea</a>
            </fieldset>
            <fieldset style="background-color:Beige;border:6px groove #ccc;width:350px">
        <table border="1">
            <tr>
                <th>ID</th>
                <th>TAREA</th><!-- comment -->
                <th>PRIORIDAD</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.tarea}</td><!-- comment -->
                    <td>${item.prioridad}</td><!-- comment -->
                    <td><a href="Controlador?op=modificar&id=${item.id}">Modificar</a></td><!-- comment -->
                    <td><a href="Controlador?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
            </fieldset>
      </center>   
    </body>
   
</html>
