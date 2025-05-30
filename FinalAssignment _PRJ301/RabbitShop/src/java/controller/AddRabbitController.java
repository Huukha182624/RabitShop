/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user_rabbit.DAO;
import user_rabbit.RabbitDTO;

/**
 *
 * @author DELL'
 */
@WebServlet(name = "AddMobileController", urlPatterns = {"/AddRabbitController"})
public class AddRabbitController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String rabbitId = request.getParameter("rabbitId");
        String description = request.getParameter("description");
        String price_raw = request.getParameter("price");
        String img = request.getParameter("img");
        String rabbitName = request.getParameter("rabbitName");
        String yearOfProduction_raw = request.getParameter("yearOfProduction");
        String quantity_raw = request.getParameter("quantity");
        String notSale_raw = request.getParameter("notSale");
        boolean notSale = false;
        DAO dao = new DAO();
        try{
            float price = Float.parseFloat(price_raw);
            int yearOfProduction = Integer.parseInt(yearOfProduction_raw);
            int quantity = Integer.parseInt(quantity_raw);
            int check = Integer.parseInt(notSale_raw);
            if(check==1){
                notSale=true;
            }
            RabbitDTO m = dao.getRabbitById(rabbitId);
            if(m!=null){
                String loi = "This rabbit "+rabbitId+" is existed!!";
                request.setAttribute("loi", loi);
                request.getRequestDispatcher("addrabbit.jsp").forward(request, response);
            }else{
            RabbitDTO m1 = new RabbitDTO(rabbitId, description, price, rabbitName,img, yearOfProduction, quantity, notSale);
            dao.addNewRabbit(m1);
            String add = "This rabbit "+rabbitId+" is added into the database";
            request.setAttribute("add", add);
            request.getRequestDispatcher("staff.jsp").forward(request, response);
        }
        }catch(NumberFormatException e){
            System.out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
