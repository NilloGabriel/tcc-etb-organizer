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
import modelo.Dentista;
import modelo.DentistaDAO;
import modelo.Perfil;

/**
 *
 * @author Administrador
 */
public class InserirDentista extends HttpServlet {

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
            out.println("<title>Servlet InserirDentista</title>");
            out.println("</head>");
            out.println("<body>");
            try {
                String op = request.getParameter("op");
                String nome = request.getParameter("nome");
                Date data_nascimento = (Date) Date.valueOf(request.getParameter("data_nascimento"));
                String cpf = request.getParameter("cpf");
                String rg = request.getParameter("rg");
                String cfo = request.getParameter("cfo");
                String telefone = request.getParameter("telefone");
                String email = request.getParameter("email");
                String endereco = request.getParameter("endereco");
                String cep = request.getParameter("cep");
                String sexo = request.getParameter("sexo");
                String login = request.getParameter("login");
                String senha = request.getParameter("senha");
                int id_perfil = Integer.parseInt(request.getParameter("perfil"));

                if (!nome.isEmpty() && !cpf.isEmpty()) {
                    Dentista d = new Dentista();
                    DentistaDAO dDAO = new DentistaDAO();
                    d.setNome(nome);
                    d.setData_nascimento(data_nascimento);
                    d.setCpf(cpf);
                    d.setRg(rg);
                    d.setCfo(cfo);
                    d.setTelefone(telefone);
                    d.setEmail(email);
                    d.setEndereco(endereco);
                    d.setCep(cep);
                    d.setSexo(sexo);
                    d.setLogin(login);
                    d.setSenha(senha);
                    Perfil p = new Perfil();
                    p.setId(id_perfil);
                    d.setPerfil(p);
                    dDAO.inserir(d);
                    if (op.equals("d")) {
                        response.sendRedirect("listar_dentista_dentista.jsp");
                    }else {
                        response.sendRedirect("listar_dentista.jsp");
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
