package com.journaldev.servlet.session;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletProducts
 */
@WebServlet("/ServletProducts")
public class ServletProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession sesion = request.getSession();
		
		if (sesion != null) {
			System.out.println("session::.."+sesion);

			String idProd = request.getParameter("id");
			String nombreProd = request.getParameter("name");
			String precioProd = request.getParameter("price");
			double precio = Double.parseDouble(precioProd);
			String areaProd = request.getParameter("area");

			System.out.println("Se registro el producto");
			System.out.println("Id: " + idProd);
			System.out.println("Nombre: " + nombreProd);
			System.out.println("Precio: " + precio);
			System.out.println("Area: " + areaProd);
		} else {
			System.out.println("la session del usuario no esta activa");
		}

	}

}
