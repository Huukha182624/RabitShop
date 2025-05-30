/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user_rabbit.DAO;

@WebServlet(name = "DeleteController", urlPatterns = {"/DeleteController"})
public class DeleteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rabbitId = request.getParameter("rabbitId");

        if (rabbitId == null || rabbitId.trim().isEmpty()) {
            request.setAttribute("deleted", "Invalid rabbit ID!");
            request.getRequestDispatcher("staff.jsp").forward(request, response);
            return;
        }

        DAO dao = new DAO();
        boolean isDeleted = dao.deleteRabbit(rabbitId);

        if (isDeleted) {
            request.setAttribute("deleted", "Failed to delete Rabbit ID " + rabbitId + ". It may not exist.");
        } else {
            request.setAttribute("deleted", "Rabbit ID " + rabbitId + " has been deleted successfully!");
           
        }

        request.getRequestDispatcher("staff.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "DeleteController - Handles rabbit deletion requests.";
    }
}

//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>

//}
