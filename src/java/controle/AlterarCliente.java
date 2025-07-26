/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDAO;

/**
 *
 * @author Administrador
 */
public class AlterarCliente extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarCliente</title>");            
            out.println("</head>");
            out.println("<body>");
             try {
                String op = request.getParameter("op");
                int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("nome");
                Date data_nascimento = (Date) Date.valueOf(request.getParameter("data_nascimento"));
                String cpf = request.getParameter("cpf");
                String rg = request.getParameter("rg");
                String telefone = request.getParameter("telefone");
                String email = request.getParameter("email");
                String cep = request.getParameter("cep");
                String endereco = request.getParameter("endereco");
                String sexo = request.getParameter("sexo");
                if (!nome.isEmpty() && !cpf.isEmpty()) {
                    Cliente c = new Cliente();
                    ClienteDAO cDAO = new ClienteDAO();
                    c.setId(id);
                    c.setNome(nome);
                    c.setData_nascimento(data_nascimento);
                    c.setCpf(cpf);
                    c.setRg(rg);
                    c.setTelefone(telefone);
                    c.setEmail(email);
                    c.setCep(cep);
                    c.setEndereco(endereco);
                    c.setSexo(sexo);
                    cDAO.alterar(c);
                     if (op.equals("d")) {
                        response.sendRedirect("listar_cliente_dentista.jsp");
                    }else {
                        response.sendRedirect("listar_cliente.jsp");
                    }
                } else {
                    out.print("Algum campo obrigatório não foi preenchido!");
                }
            } catch (Exception e) {
                out.print("Erro:" + e);
            }
            out.println("</body>");
            out.println("</html>");
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
