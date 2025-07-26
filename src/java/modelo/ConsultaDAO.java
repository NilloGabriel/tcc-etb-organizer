/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class ConsultaDAO extends DataBaseDAO {

    public void inserir(Consulta c) throws Exception {
        String sql = "INSERT INTO consulta (data_consulta, hora_consulta, id_cliente, id_dentista, id_servico,id_funcionario)VALUES(?,?,?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDate(1, (Date) c.getData_consulta());
        pstm.setTime(2, c.getHora_consulta());
        pstm.setInt(3, c.getCliente().getId());
        pstm.setInt(4, c.getDentista().getId());
        pstm.setInt(5, c.getServicos().getId());
        pstm.setInt(6, c.getFuncionario().getId());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Consulta> listar() throws Exception {
        ArrayList<Consulta> lista = new ArrayList<Consulta>();
        String sql = "SELECT * FROM consulta";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Consulta c = new Consulta();
            c.setId(rs.getInt("id"));
            c.setData_consulta(rs.getDate("data_consulta"));
            c.setHora_consulta(rs.getTime("hora_consulta"));
            c.setValor_consulta(rs.getDouble("valor_consulta"));
            c.setStatus_consulta(rs.getString("status_consulta"));
            c.setPagou(rs.getDate("pagou"));
            c.setTipo_pagamento(rs.getString("tipo_pagamento"));
            ClienteDAO cDAO = new ClienteDAO();
            DentistaDAO dDAO = new DentistaDAO();
            FuncionarioDAO fDAO = new FuncionarioDAO();
            ServicosDAO sDAO = new ServicosDAO();

            c.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            c.setDentista(dDAO.carregarPorId(rs.getInt("id_dentista")));
            c.setServicos(sDAO.carregarPorId(rs.getInt("id_servico")));
            c.setFuncionario(fDAO.carregarPorId(rs.getInt("id_funcionario")));
            lista.add(c);
        }
        this.desconectar();
        return lista;
    }
    public ArrayList<Consulta> lista_horarios() throws Exception {
        ArrayList<Consulta> lista_horarios = new ArrayList<Consulta>();
        String sql = "SELECT id, data_consulta, hora_consulta, id_dentista FROM consulta";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Consulta c = new Consulta();
            c.setData_consulta(rs.getDate("data_consulta"));
            c.setHora_consulta(rs.getTime("hora_consulta"));
            c.setHora_consulta(rs.getTime("hora_consulta"));
            
            DentistaDAO dDAO = new DentistaDAO();
            c.setDentista(dDAO.carregarPorId(rs.getInt("id_dentista")));
            lista_horarios.add(c);
        }
        this.desconectar();
        return lista_horarios;
    }

    public Consulta carregarPorId(int id) throws Exception {
        Consulta c = new Consulta();
        String sql = "SELECT * FROM consulta WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setData_consulta(rs.getDate("data_consulta"));
            c.setHora_consulta(rs.getTime("hora_consulta"));
            c.setValor_consulta(rs.getDouble("valor_consulta"));
            c.setStatus_consulta(rs.getString("status_consulta"));
            c.setPagou(rs.getDate("pagou"));
            c.setTipo_pagamento(rs.getString("tipo_pagamento"));

            ClienteDAO cDAO = new ClienteDAO();
            DentistaDAO dDAO = new DentistaDAO();
            FuncionarioDAO fDAO = new FuncionarioDAO();
            ServicosDAO sDAO = new ServicosDAO();

            c.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            c.setDentista(dDAO.carregarPorId(rs.getInt("id_dentista")));
            c.setServicos(sDAO.carregarPorId(rs.getInt("id_servico")));
            c.setFuncionario(fDAO.carregarPorId(rs.getInt("id_funcionario")));
        }
        this.desconectar();
        return c;
    }

    public void alterar(Consulta c) throws Exception {
        String sql = "UPDATE consulta SET data_consulta=?, hora_consulta=?, id_dentista=?  WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDate(1, (Date) c.getData_consulta());
        pstm.setTime(2, c.getHora_consulta());
        pstm.setInt(3, c.getDentista().getId());
        //pstm.setInt(4, c.getServicos().getId());
        pstm.setInt(4, c.getId());
        pstm.execute();
        this.desconectar();
    }

    public void registrarDataValorPagamentoTipo(Consulta consulta) throws Exception {
        String sql = "UPDATE consulta SET valor_consulta=?,tipo_pagamento=?, pagou= now() WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1, consulta.getValor_consulta());
        pstm.setString(2, consulta.getTipo_pagamento());
        pstm.setInt(3, consulta.getId());
        pstm.execute();
        this.desconectar();
    }

    public void registrarStatus(Consulta consulta) throws Exception {
        String sql = "UPDATE consulta SET status_consulta=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, consulta.getStatus_consulta());
        pstm.setInt(2, consulta.getId());
        pstm.execute();
        this.desconectar();
    }
    
    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM consulta WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

}
